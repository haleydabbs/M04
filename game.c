#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "myLib.h"
#include "FinalGameSprites.h"
#include "game.h"
#include "collisionMap.h"

// Initialize the game
void initGame() {

    // Set up sprite sheet
    DMANow(3, FinalGameSpritesTiles, &CHARBLOCK[4], FinalGameSpritesTilesLen/2);
    DMANow(3, FinalGameSpritesPal, SPRITEPALETTE, FinalGameSpritesPalLen/2);

    // Hide the sprites
    hideSprites();

    // Initialize player sprite
    player.width = 32;
    player.height = 32;
    player.worldRow = MAPHEIGHT - player.height - 16;
    player.worldCol = (SCREENWIDTH/2) - (player.width/2) + hOff;
    player.aniCounter = 0;
    player.aniState = 0;
    player.cvel = 2;
    player.rvel = 0;

    // Init counter gem sprite
    gem.width = 8;
    gem.height = 8;
    gem.worldRow = 8;
    gem.worldCol = 8;
    gem.active = 1;
    gem.OAMpos = 1;

    // Initialize gems that need to be collected
    for (int i = 0; i < GEMCOUNT; i++) {
        initGems(&gems[i], i);
    }

    // Initialize screen offsets
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;

}

// Helper function to init gems
void initGems(GEM* g, int i) {

    g->OAMpos = 2 + i;
    g->width = 8;
    g->height = 8;
    g->worldCol = (10 * i) + 200;
    g->worldRow = MAPHEIGHT - 16 - g->height;
    g->active = 1;

}

// Update the game
void updateGame() {

    // Update player sprite
    updatePlayer();

    // Update gems
    // Update gems for player to collect on screen
    for (int i = 0; i < (GEMCOUNT); i++) {
        updateGems(&gems[i]);
    }

}

// Helper to update player
void updatePlayer() {

    if (BUTTON_HELD(BUTTON_LEFT)) {
        if ( (player.worldCol > 0)
        && (collisionMapBitmap[OFFSET(player.worldCol - player.cvel, player.worldRow, MAPWIDTH)])
        && (collisionMapBitmap[OFFSET(player.worldCol - player.cvel, player.worldRow + player.height - 1, MAPWIDTH)])) {
            
            player.worldCol -= player.cvel;
            
            if ((hOff > 0) && (player.screenCol < 120)) {
               
                hOff -= player.cvel;

            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol< SCREENWIDTH
        && (collisionMapBitmap[OFFSET(player.worldCol + player.width - 1 + player.cvel, player.worldRow, MAPWIDTH)])
        && (collisionMapBitmap[OFFSET(player.worldCol + player.width - 1 + player.cvel, player.worldRow + player.height - 1, MAPWIDTH)])) {
            
            player.worldCol += player.cvel;

            if ((hOff < (MAPWIDTH - SCREENWIDTH)) && (player.screenCol > 120)) {
                
                hOff += player.cvel;

            }
        }
    }

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;    

}

// Helper to update the gems
void updateGems(GEM* g) {

    g->screenCol = g->worldCol - hOff;
    g->screenRow = g->worldRow - vOff;

    shadowOAM[g->OAMpos].attr0 = (ROWMASK & g->screenRow) | ATTR0_SQUARE;
    shadowOAM[g->OAMpos].attr1 = (COLMASK & g->screenCol) | ATTR1_TINY;
    shadowOAM[g->OAMpos].attr2 = ATTR2_TILEID(8, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}

// Draw sprites
void drawGame() {

    // Call helper to draw player
    drawPlayer();

    // Call the helper that draws the gem
    drawGem();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    // Update offset registers
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

}

// Helper to draw the player sprite
void drawPlayer() {

    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}

// Helper to draw gem counter sprite
void drawGem() {

    shadowOAM[gem.OAMpos].attr0 = (ROWMASK & gem.worldRow) | ATTR0_SQUARE;
    shadowOAM[gem.OAMpos].attr1 = (COLMASK & gem.worldCol) | ATTR1_TINY;
    shadowOAM[gem.OAMpos].attr2 = ATTR2_TILEID(8, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}
