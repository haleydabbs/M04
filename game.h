// Structs
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
    int aniFrame;
    int rvel_FP;
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
    int aniFrame;
    int cvel;
    int direction;

} WOLF;

// Variables

// Constants
# define GEMCOUNT 4
# define LIFECOUNT 3
# define MAPWIDTH 256
# define MAPHEIGHT 512
# define FP_GRAVITY_ACCEL 500
# define FP_SCALING_FACTOR 1024
# define RVEL_MAX 6
# define RVEL_MAX_FP (RVEL_MAX * 1024)
# define GAMEBAR_BLOCK_COUNT 8
# define WOLF_COUNT 2

// Offset
int hOff;
int vOff;

// Counters
int gemsRemaining;
int livesRemaining;

// Struct inits
PLAYER player;
GEM gems[GEMCOUNT];
GAMEBAR blocks[GAMEBAR_BLOCK_COUNT];
WOLF wolves[WOLF_COUNT];

// Player state enum

// Functions

void initGame();
void initGems(GEM*, int);
void initWolves(WOLF*, int);

void updateGame();
void updatePlayer();
void updateGems(GEM*);
void updateWolves(WOLF*);

void drawGame();
void drawPlayer();