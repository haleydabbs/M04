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

    //Initialize player sprite
    player.width = 32;
    player.height = 32;
    player.worldRow = MAPHEIGHT - player.height - 16;
    player.worldCol = (SCREENWIDTH/2) - (player.width/2) + hOff;
    player.aniCounter = 0;
    player.aniState = 0;
    player.cvel = 2;
    player.rvel = 0;

    // Initialize screen offsets
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;

}

// Update the game
void updateGame() {

    // Update player sprite
    updatePlayer();

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

// Draw sprites
void drawGame() {

    // Call helper to draw player
    drawPlayer();

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