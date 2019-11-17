# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"

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
# 3 "main.c" 2
# 1 "game.h" 1

typedef struct {

    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int aniFrame;
    int rvel;
    int cvel;

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
# 41 "game.h"
int hOff;
int vOff;


int gemsRemaining;
int livesRemaining;


PLAYER player;
GEM gems[4];
GEM gem;




void initGame();
void initGems(GEM*, int);

void updateGame();
void updatePlayer();
void updateGems(GEM*);

void drawGame();
void drawPlayer();
void drawGem();
# 4 "main.c" 2
# 1 "startBG.h" 1
# 22 "startBG.h"
extern const unsigned short startBGTiles[896];


extern const unsigned short startBGMap[1024];


extern const unsigned short startBGPal[256];
# 5 "main.c" 2
# 1 "gameBG.h" 1
# 22 "gameBG.h"
extern const unsigned short gameBGTiles[896];


extern const unsigned short gameBGMap[1024];


extern const unsigned short gameBGPal[256];
# 6 "main.c" 2
# 1 "pauseBG.h" 1
# 22 "pauseBG.h"
extern const unsigned short pauseBGTiles[928];


extern const unsigned short pauseBGMap[1024];


extern const unsigned short pauseBGPal[256];
# 7 "main.c" 2
# 1 "loseBG.h" 1
# 22 "loseBG.h"
extern const unsigned short loseBGTiles[864];


extern const unsigned short loseBGMap[1024];


extern const unsigned short loseBGPal[256];
# 8 "main.c" 2
# 1 "winBG.h" 1
# 22 "winBG.h"
extern const unsigned short winBGTiles[848];


extern const unsigned short winBGMap[1024];


extern const unsigned short winBGPal[256];
# 9 "main.c" 2
# 1 "platformsBG.h" 1
# 22 "platformsBG.h"
extern const unsigned short platformsBGTiles[32];


extern const unsigned short platformsBGMap[2048];


extern const unsigned short platformsBGPal[256];
# 10 "main.c" 2
# 1 "InstructionsBG.h" 1
# 22 "InstructionsBG.h"
extern const unsigned short InstructionsBGTiles[1056];


extern const unsigned short InstructionsBGMap[1024];


extern const unsigned short InstructionsBGPal[256];
# 11 "main.c" 2


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


enum { START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

int main() {


    initialize();

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





    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((6)<<8) | (0<<14);


    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((14)<<8) | (2<<14);
    DMANow(3, platformsBGTiles, &((charblock *)0x6000000)[1], 64 / 2);
    DMANow(3, platformsBGMap, &((screenblock *)0x6000000)[14], 4096 / 2);


    (*(volatile unsigned short*)0x400000C) = ((2)<<2) | ((20)<<8) | (0<<14);
    DMANow(3, gameBGTiles, &((charblock *)0x6000000)[2], 1792 / 2);
    DMANow(3, gameBGMap, &((screenblock *)0x6000000)[20], 2048 / 2);


    (*(unsigned short *)0x4000000) = 0 | (1<<12);


    DMANow(3, platformsBGPal, ((unsigned short *)0x5000000), 256);

    goToStart();

}


void goToStart() {


    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(unsigned short *)0x4000000) &= ~((1<<12));

    DMANow(3, startBGTiles, &((charblock *)0x6000000)[0], 1792 / 2);
    DMANow(3, startBGMap, &((screenblock *)0x6000000)[6], 2048 / 2);

    state = START;

}


void start() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<8));


        initGame();
        goToGame();

    }

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {


        goToInstructions();

    }

}


void goToInstructions() {


    DMANow(3, InstructionsBGTiles, &((charblock *)0x6000000)[0], 2112 / 2);
    DMANow(3, InstructionsBGMap, &((screenblock *)0x6000000)[6], 2048 / 2);

    state = INSTRUCTIONS;

}


void instructions() {

    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {

        goToStart();

    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<8));


        initGame();
        goToGame();

    }

}


void goToGame() {


    (*(unsigned short *)0x4000000) |= (1<<9) | (1<<10) | (1<<12);
    state = GAME;

}


void game() {


    updateGame();
    drawGame();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToPause();

    } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToWin();

    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<9));
        goToLose();

    }

}


void goToPause() {



    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, pauseBGTiles, &((charblock *)0x6000000)[0], 1856 / 2);
    DMANow(3, pauseBGMap, &((screenblock *)0x6000000)[6], 2048 / 2);

    state = PAUSE;

}


void pause() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {


        (*(unsigned short *)0x4000000) &= ~((1<<8));
        goToGame();

    }

}


void goToWin() {


    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, winBGTiles, &((charblock *)0x6000000)[0], 1696 / 2);
    DMANow(3, winBGMap, &((screenblock *)0x6000000)[6], 2048 / 2);

    state = WIN;

}


void win() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {



        goToStart();

    }

}


void goToLose() {


    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(unsigned short *)0x4000000) &= ~((1<<12));


    DMANow(3, loseBGTiles, &((charblock *)0x6000000)[0], 1728 / 2);
    DMANow(3, loseBGMap, &((screenblock *)0x6000000)[6], 2048 / 2);

    state = LOSE;

}


void lose() {


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {



        goToStart();

    }

}
