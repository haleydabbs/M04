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

    // Setting up BG registers and

    // DMA-ing BG files
    // BG0 - Start / Instructions / Win / Lose State BGs
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(6) | BG_SIZE_SMALL;

    // BG1 - Game platforms
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(14) | BG_SIZE_TALL;
    DMANow(3, platformsBGTiles, &CHARBLOCK[1], platformsBGTilesLen / 2);
    DMANow(3, platformsBGMap, &SCREENBLOCK[14], platformsBGMapLen / 2);

    // BG2 - Game farther BG
    REG_BG2CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL;
    DMANow(3, gameBGTiles, &CHARBLOCK[2], gameBGTilesLen / 2);
    DMANow(3, gameBGMap, &SCREENBLOCK[20], gameBGMapLen / 2);

    // Display Control Register
    REG_DISPCTL = MODE0 | SPRITE_ENABLE;

    // Loading BG palette
    DMANow(3, platformsBGPal, PALETTE, 256);

    goToStart();

}

// Sets up start state
void goToStart() {

    // Load start BG tiles
    REG_DISPCTL |= BG0_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    DMANow(3, startBGTiles, &CHARBLOCK[0], startBGTilesLen / 2);
    DMANow(3, startBGMap, &SCREENBLOCK[6], startBGMapLen / 2);

    state = START;

}

// Runs every frame of start state
void start() {

    // Start button pressed, start the game
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear the BG0 bit to turn off start BG
        REG_DISPCTL &= ~(BG0_ENABLE);

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
    DMANow(3, InstructionsBGTiles, &CHARBLOCK[0], InstructionsBGTilesLen / 2);
    DMANow(3, InstructionsBGMap, &SCREENBLOCK[6], InstructionsBGMapLen / 2);

    state = INSTRUCTIONS;

}

// Runs every frame of instructions
void instructions() {

    if (BUTTON_PRESSED(BUTTON_SELECT)) {

        goToStart();

    }
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear the BG0 bit to turn off instructions BG
        REG_DISPCTL &= ~(BG0_ENABLE);

        // Initialize game, then move to game state
        initGame();
        goToGame();

    }

}

// Sets up game state
void goToGame() {

    // Loading start BG tiles in BG 1
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

    } else if (BUTTON_PRESSED(BUTTON_A)) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToWin();

    } else if (BUTTON_PRESSED(BUTTON_B)) {

        // Clear BG1_Enable bit
        REG_DISPCTL &= ~(BG1_ENABLE);
        goToLose();

    }

}

// Sets up pause state
void goToPause() {

    // Set up BG0 for pause screen
    // Switch to pause BG, and un-enable sprites
    REG_DISPCTL |= BG0_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading lose BG tiles
    DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen / 2);
    DMANow(3, pauseBGMap, &SCREENBLOCK[6], pauseBGMapLen / 2);

    state = PAUSE;

}

// Runs every frame of pause
void pause() {

    // Start button pressed, return to game
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG0 bit
        REG_DISPCTL &= ~(BG0_ENABLE);
        goToGame();

    } 

}

// Sets up win state
void goToWin() {

    // Enable BG3 for win screen
    REG_DISPCTL |= BG0_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading win BG tiles
    DMANow(3, winBGTiles, &CHARBLOCK[0], winBGTilesLen / 2);
    DMANow(3, winBGMap, &SCREENBLOCK[6], winBGMapLen / 2);

    state = WIN;

}

// Runs every frame of win
void win() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG3 bit
        // REG_DISPCTL &= ~(BG3_ENABLE);
        goToStart();

    }

}

// Sets up lose state
void goToLose() {

    // Enable BG0 for lose screen
    REG_DISPCTL |= BG0_ENABLE;
    REG_DISPCTL &= ~(SPRITE_ENABLE);

    // Loading lose BG tiles
    DMANow(3, loseBGTiles, &CHARBLOCK[0], loseBGTilesLen / 2);
    DMANow(3, loseBGMap, &SCREENBLOCK[6], loseBGMapLen / 2);

    state = LOSE;

}

// Runs every grame of lose
void lose() {

    // Start button pressed, go to start
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Clear BG3 bit
        // REG_DISPCTL &= ~(BG3_ENABLE);
        goToStart();

    }

}