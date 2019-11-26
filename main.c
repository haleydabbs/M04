// UPDATES
// Since M02, I have added jump and gravity physics, as well as a collision map and enemies.
// When you collect gems, a gem counter on the bottom left increments. If you collide with
// the wolves, your life icons decrement. 0 lives will take you to the lose screen. To win
// collect all of the gems and return to the statue at the start of the game.
// CONTROLS
// - start screen - start goes to game, select goes to instructions
// - instructions screen - start goes to game, select returns to start
// - game screen - navigate using up, left, and right. pressing start pauses the game
// - pause screen - press start to return to the game
// - win screen - press start to return to start screen
// - lose screen - press start to return to start screen
// TODO
// - Mechanics - Jumping) So far I haven't added an upward collision detection while jumping. This is because spacing
//               the map out and moving around actually seems a lot easier without it. There are some instances
//               where the player can jump up through platforms, but I have yet to decide if this is a bad thing.
//               The biggest con to having no upward collision detection is that in some instances, the player will
//               be prevented from moving left or right if inside of a block.
//               Boss battle) Once the final gem is retrieved and the player returns to the boss, the boss will begin to
//               move left or right towards the player's column position. Jumping on top of the boss decrements a boss life,
//               getting hit from the side decrements a player life. Defeating the boss reveals the door that if the player
//               walks through - they win!
// - Graphics - Need to add a parallax background (thinking a looping trees background) and sprite
//              animations for the wolves and for the player. I also want to add some sprites that instruct
//              the player at certain points in the game. Ex: 'collect the gems', 'return to statue', 'a door has appeared'
// - Sound - Need to add sounds. Want 1) a sound for picking up gems, 2) a sound for decrementing a life
//           3) a background song that loops for general gameplay, 4) a background song that loops for
//           the boss battle, 5) a sound for a successful attack on the boss (landing on its head)

// Make files
#include "myLib.h"
#include "game.h"
#include "startBG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "loseBG.h"
#include "winBG.h"
#include "platformsBG.h"
#include "InstructionsBG.h"

// Function prototypes
void initialize();
// State functions
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();

// Variables
unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

// Offsets for menu screens
int vOff_1;
int hOff_1;

// Game states
enum { START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

int main() {

    // Set up the game
    initialize();

    while(1) {

        // Update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        // State switch
        switch (state) {

            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;

        }

    }

    return 0;

}

// Set up the game 
void initialize() {

    // BG1 - Game platforms
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(6) | BG_SIZE_TALL;
    DMANow(3, platformsBGTiles, &CHARBLOCK[0], platformsBGTilesLen / 2);
    DMANow(3, platformsBGMap, &SCREENBLOCK[6], platformsBGMapLen / 2);

    // BG2 - Parallax BG, win/lose/pause/instructions/start screen BG
    REG_BG2CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL;

    // Display Control Register
    REG_DISPCTL = MODE0 | SPRITE_ENABLE;

    // Loading BG palette
    DMANow(3, InstructionsBGPal, PALETTE, 256);

    // Initialize vOff and hOff for the menu screens
    vOff_1 = 0;
    hOff_1 = 0;

    goToStart();

}

// Sets up start state
void goToStart() {

    // Load start BG tiles
    REG_DISPCTL |= BG2_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    DMANow(3, startBGTiles, &CHARBLOCK[1], startBGTilesLen / 2);
    DMANow(3, startBGMap, &SCREENBLOCK[20], startBGMapLen / 2);

    REG_BG2HOFF = hOff_1;
    REG_BG2VOFF = vOff_1;

    state = START;

}

// Runs every frame of start state
void start() {

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Initialize game, then move to game state
        initGame();
        goToGame();

    }
    // If select pressed, go to instructions
    if (BUTTON_PRESSED(BUTTON_SELECT)) {

        // Move to Instructions
        goToInstructions();

    }

}

// Sets up instructions
void goToInstructions() {

    // Loading instructions BG tiles
    DMANow(3, InstructionsBGTiles, &CHARBLOCK[1], InstructionsBGTilesLen / 2);
    DMANow(3, InstructionsBGMap, &SCREENBLOCK[20], InstructionsBGMapLen / 2);

    state = INSTRUCTIONS;

}

// Runs every frame of instructions
void instructions() {

    if (BUTTON_PRESSED(BUTTON_SELECT)) {

        goToStart();

    }
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Initialize game, then move to game state
        initGame();
        goToGame();

    }

}

// Sets up game state
void goToGame() {

    // Loading start BG tiles in BG 1
    DMANow(3, gameBGTiles, &CHARBLOCK[1], gameBGTilesLen / 2);
    DMANow(3, gameBGMap, &SCREENBLOCK[20], gameBGMapLen / 2);

    REG_DISPCTL |= BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
    state = GAME;

}

// Runs every frame of game
void game() {

    // Update sprite positions in game, draw sprites, wait for vblank, and copy shadow OAM into OAM
    updateGame();
    drawGame();

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        
        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToPause();

    } else if (statue.attack) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToWin();

    } else if (livesRemaining == 0) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToLose();

    }

}

// Sets up pause state
void goToPause() {

    // Set up BG for pause screen
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading lose BG tiles
    DMANow(3, pauseBGTiles, &CHARBLOCK[1], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[20], pauseBGMapLen / 2);

    REG_BG2HOFF = hOff_1;
    REG_BG2VOFF = vOff_1;

    state = PAUSE;

}

// Runs every frame of pause
void pause() {

    // Start button pressed, return to game
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToGame();

    } 

}

// Sets up win state
void goToWin() {

    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading win BG tiles
    DMANow(3, winBGTiles, &CHARBLOCK[1], winBGTilesLen / 2);
    DMANow(3, winBGMap, &SCREENBLOCK[20], winBGMapLen / 2);

    REG_BG2HOFF = hOff_1;
    REG_BG2VOFF = vOff_1;

    state = WIN;

}

// Runs every frame of win
void win() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToStart();

    }

}

// Sets up lose state
void goToLose() {

    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading lose BG tiles
    DMANow(3, loseBGTiles, &CHARBLOCK[1], loseBGTilesLen / 2);
    DMANow(3, loseBGMap, &SCREENBLOCK[20], loseBGMapLen / 2);

    REG_BG2HOFF = hOff_1;
    REG_BG2VOFF = vOff_1;

    state = LOSE;

}

// Runs every grame of lose
void lose() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        goToStart();

    }

}