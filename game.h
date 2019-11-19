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
    int colliding;

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

} STATUE;

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
GEM gemCounterIcon;
GAMEBAR blocks[GAMEBAR_BLOCK_COUNT];
WOLF wolves[WOLF_COUNT];
GEMNUM gemNum;
HEART hearts[LIFECOUNT];
STATUE statue;

// Player state enum

// Functions

void initGame();
void initGems(GEM*, int);
void initWolves(WOLF*, int);
void initHearts(HEART*, int);

void updateGame();
void updatePlayer();
void updateGems(GEM*);
void updateWolves(WOLF*);
void updateHearts(HEART*);
void updateState();

void drawGame();
void drawPlayer();
void drawGemCounterIcon();
void drawGemNum();
void drawStatue();