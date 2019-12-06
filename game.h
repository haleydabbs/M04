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
int statueLivesRemaining;
int gameState;

// Struct inits
PLAYER player;
GEM gems[GEMCOUNT];
GEM gemCounterIcon;
GAMEBAR blocks[GAMEBAR_BLOCK_COUNT];
WOLF wolves[WOLF_COUNT];
GEMNUM gemNum;
HEART hearts[LIFECOUNT];
STATUE statue;
TEXTBUBBLE textBubble;

// Player state enum
enum{PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE, PLAYERDOWN};

// Wolf state enum
enum{WOLFLEFT, WOLFRIGHT};

// Game state enum
enum{PLAY, CUTSCENE1, CUTSCENE2, BOSSBATTLE, MUSICTRANSITION1, CUTSCENE3, END};

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
void updateStatue();
void animatePlayer();
void updateText();

void drawGame();
void drawPlayer();
void drawGemCounterIcon();
void drawGemNum();
void drawStatue();