// Structs
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

// Variables

// Constants
# define GEMCOUNT 4
# define LIFECOUNT 3
# define MAPWIDTH 256
# define MAPHEIGHT 512

// Offset
int hOff;
int vOff;

// Counters
int gemsRemaining;
int livesRemaining;

// Struct inits
PLAYER player;
GEM gems[GEMCOUNT];
GEM gem;

// Player state enum

// Functions
void initGame();
void initGems(GEM*, int);

void updateGame();
void updatePlayer();
void updateGems(GEM*);

void drawGame();
void drawPlayer();
void drawGem();