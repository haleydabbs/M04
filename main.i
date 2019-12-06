# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 31 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();
# 181 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 192 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 232 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 329 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

typedef struct
{
 int row;
 int col;
 int rdel;
 int cdel;
 int size;
 u16 color;
 int AI_STATE;
} MOVOBJ;
# 32 "main.c" 2
# 1 "game.h" 1

typedef struct {

    int worldRow;
    int worldCol;
    int worldRow_FP;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int aniFrame;
    int numFrames;
    int rvel_FP;
    int rvel;
    int cvel;
    int jumping;
    int cheatOn;

} PLAYER;

typedef struct {

    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int active;
    int OAMpos;

} GEM;

typedef struct {

    int worldRow;
    int worldCol;
    int width;
    int height;
    int OAMpos;

} GAMEBAR;

typedef struct {

    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int active;
    int OAMpos;
    int aniCounter;
    int aniState;
    int prevAniState;
    int numFrames;
    int aniFrame;
    int cvel;
    int direction;
    int colliding;
    int aniDelay;

} WOLF;

typedef struct {

    int worldRow;
    int worldCol;
    int width;
    int height;
    int OAMpos;

} GEMNUM;

typedef struct {

    int worldRow;
    int worldCol;
    int width;
    int height;
    int OAMpos;
    int active;

} HEART;

typedef struct {

    int width;
    int height;
    int OAMpos;
    int active;
    int worldCol;
    int screenCol;
    int worldRow;
    int screenRow;
    int cvel;
    int rvel;
    int aniState;
    int attack;
    int colliding;
    int palRow;
    int direction;

} STATUE;

typedef struct {

    int width;
    int height;
    int OAMpos;
    int active;
    int worldCol;
    int worldRow;
    int spriteSheetrow;

} TEXTBUBBLE;
# 138 "game.h"
int hOff;
int vOff;


int gemsRemaining;
int livesRemaining;
int statueLivesRemaining;
int gameState;


PLAYER player;
GEM gems[4];
GEM gemCounterIcon;
GAMEBAR blocks[8];
WOLF wolves[2];
GEMNUM gemNum;
HEART hearts[3];
STATUE statue;
TEXTBUBBLE textBubble;


enum{PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE, PLAYERDOWN};


enum{WOLFLEFT, WOLFRIGHT};


enum{PLAY, CUTSCENE1, CUTSCENE2, BOSSBATTLE, MUSICTRANSITION1, CUTSCENE3, END};



void initGame();
void initGems(GEM*, int);
void initWolves(WOLF*, int);
void initHearts(HEART*, int);

void updateGame();
void updatePlayer();
void updateGems(GEM*);
void updateWolves(WOLF*);
void updateHearts(HEART*);
void updateStatue();
void animatePlayer();
void updateText();

void drawGame();
void drawPlayer();
void drawGemCounterIcon();
void drawGemNum();
void drawStatue();
# 33 "main.c" 2
# 1 "startBG.h" 1
# 22 "startBG.h"
extern const unsigned short startBGTiles[7808];


extern const unsigned short startBGMap[1024];


extern const unsigned short startBGPal[256];
# 34 "main.c" 2
# 1 "gameBG.h" 1
# 22 "gameBG.h"
extern const unsigned short gameBGTiles[10048];


extern const unsigned short gameBGMap[1024];


extern const unsigned short gameBGPal[256];
# 35 "main.c" 2
# 1 "pauseBG.h" 1
# 22 "pauseBG.h"
extern const unsigned short pauseBGTiles[3248];


extern const unsigned short pauseBGMap[1024];


extern const unsigned short pauseBGPal[256];
# 36 "main.c" 2
# 1 "loseBG.h" 1
# 22 "loseBG.h"
extern const unsigned short loseBGTiles[3056];


extern const unsigned short loseBGMap[1024];


extern const unsigned short loseBGPal[256];
# 37 "main.c" 2
# 1 "winBG.h" 1
# 22 "winBG.h"
extern const unsigned short winBGTiles[1696];


extern const unsigned short winBGMap[1024];


extern const unsigned short winBGPal[256];
# 38 "main.c" 2
# 1 "platformsBG.h" 1
# 22 "platformsBG.h"
extern const unsigned short platformsBGTiles[2048];


extern const unsigned short platformsBGMap[2048];


extern const unsigned short platformsBGPal[256];
# 39 "main.c" 2
# 1 "InstructionsBG.h" 1
# 22 "InstructionsBG.h"
extern const unsigned short InstructionsBGTiles[2128];


extern const unsigned short InstructionsBGMap[1024];


extern const unsigned short InstructionsBGPal[256];
# 40 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 41 "main.c" 2
# 1 "GameSongLooping.h" 1
# 20 "GameSongLooping.h"
extern const unsigned char GameSongLooping[1114106];
# 42 "main.c" 2
# 1 "StartSoundLooping.h" 1
# 20 "StartSoundLooping.h"
extern const unsigned char StartSoundLooping[977472];
# 43 "main.c" 2


void initialize();

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


unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];


int vOff_1;
int hOff_1;


enum { START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

int main() {


    initialize();


    playSoundA(StartSoundLooping, 977472, 11025, 1);

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {


    setupSounds();
    setupInterrupts();


    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((6)<<8) | (2<<14);
    DMANow(3, platformsBGTiles, &((charblock *)0x6000000)[0], 4096 / 2);
    DMANow(3, platformsBGMap, &((screenblock *)0x6000000)[6], 4096 / 2);


    (*(volatile unsigned short*)0x400000C) = ((1)<<2) | ((20)<<8) | (0<<14);


    (*(unsigned short *)0x4000000) = 0 | (1<<12);


    DMANow(3, loseBGPal, ((unsigned short *)0x5000000), 256);


    vOff_1 = 0;
    hOff_1 = 0;

    goToStart();

}


void goToStart() {


    (*(unsigned short *)0x4000000) |= (1<<10);
    (*(unsigned short *)0x4000000) &= ~((1<<12));

    DMANow(3, startBGTiles, &((charblock *)0x6000000)[1], 15616 / 2);
    DMANow(3, startBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    (*(volatile unsigned short *)0x04000018) = hOff_1;
    (*(volatile unsigned short *)0x0400001A) = vOff_1;

    state = START;

}


void start() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        stopSound();
        playSoundA(GameSongLooping, 1114106, 11025, 1);


        initGame();
        goToGame();

    }

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {


        goToInstructions();

    }

}


void goToInstructions() {


    DMANow(3, InstructionsBGTiles, &((charblock *)0x6000000)[1], 4256 / 2);
    DMANow(3, InstructionsBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    state = INSTRUCTIONS;

}


void instructions() {

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {

        goToStart();

    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        stopSound();
        playSoundA(GameSongLooping, 1114106, 11025, 1);


        initGame();
        goToGame();

    }

}


void goToGame() {



    DMANow(3, gameBGTiles, &((charblock *)0x6000000)[1], 20096 / 2);
    DMANow(3, gameBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    (*(unsigned short *)0x4000000) |= (1<<9) | (1<<10) | (1<<12);
    state = GAME;

}


void game() {


    updateGame();
    drawGame();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        pauseSound();


        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToPause();

    } else if (gameState == END) {


        stopSound();
        playSoundA(StartSoundLooping, 977472, 11025, 1);


        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToWin();

    } else if (livesRemaining == 0) {


        stopSound();
        playSoundA(StartSoundLooping, 977472, 11025, 1);



        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToLose();

    }

}


void goToPause() {


    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, pauseBGTiles, &((charblock *)0x6000000)[1], 6496 / 2);
    DMANow(3, pauseBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    (*(volatile unsigned short *)0x04000018) = hOff_1;
    (*(volatile unsigned short *)0x0400001A) = vOff_1;

    state = PAUSE;

}


void pause() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        unpauseSound();
        goToGame();

    }

}


void goToWin() {

    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, winBGTiles, &((charblock *)0x6000000)[1], 3392 / 2);
    DMANow(3, winBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    (*(volatile unsigned short *)0x04000018) = hOff_1;
    (*(volatile unsigned short *)0x0400001A) = vOff_1;

    state = WIN;

}


void win() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToStart();

    }

}


void goToLose() {

    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, loseBGTiles, &((charblock *)0x6000000)[1], 6112 / 2);
    DMANow(3, loseBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);

    (*(volatile unsigned short *)0x04000018) = hOff_1;
    (*(volatile unsigned short *)0x0400001A) = vOff_1;

    state = LOSE;

}


void lose() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        goToStart();

    }

}
