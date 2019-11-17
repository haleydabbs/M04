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

// Variables

// Constants
# define GEMCOUNT 5
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

// Player state enum

// Functions
void initGame();

void updateGame();
void updatePlayer();

void drawGame();
void drawPlayer();