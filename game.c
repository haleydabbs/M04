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
    player.worldRow_FP = player.worldRow * FP_SCALING_FACTOR;
    player.worldCol = (SCREENWIDTH/2) - (player.width/2) + hOff;
    player.aniCounter = 0;
    player.aniState = 0;
    player.cvel = 2;
    player.rvel = 0;
    player.rvel_FP = 0;

    // Initialize gems that need to be collected
    for (int i = 0; i < GEMCOUNT; i++) {
        initGems(&gems[i], i);
    }

    // Initialize the wolves
    for (int i = 0; i < WOLF_COUNT; i++) {
        initWolves(&wolves[i], i);
    }

    // Initialize screen offsets
    vOff = MAPHEIGHT - SCREENHEIGHT;
    hOff = 0;

}

// Helper function to init gems
void initGems(GEM* g, int i) {

    g->OAMpos = 1 + i;
    g->width = 8;
    g->height = 8;

    // Setting positions for individual gems here
    if (i == 0) {

        g->worldCol = 104;
        g->worldRow = 104;

    } else if (i == 1) {

        g->worldCol = 240;
        g->worldRow = 176;

    } else if (i == 2) {

        g->worldCol = 128;
        g->worldRow = 56;

    } else if (i == 3) {

        g->worldCol = 16;
        g->worldRow = 256;

    }
    
    g->active = 1;

}

// Helper to initialize wolf enemies
void initWolves(WOLF* w, int i) {

    w->active = 1;
    w->OAMpos = 5 + i;
    w->width = 32;
    w->height = 32;
    w->cvel = 1;
    w->direction = 1;

    if (i == 0) {

        w->worldCol = 16;
        w->worldRow = 32;

    } else if (i == 1) {

        w->worldCol = 96;
        w->worldRow = 152;

    }

}

// Update the game
void updateGame() {

    // Update player sprite
    updatePlayer();

    // Update gems for player to collect on screen
    for (int i = 0; i < GEMCOUNT; i++) {
        updateGems(&gems[i]);
    }

    // Update wolf enemies
    for (int i = 0; i < WOLF_COUNT; i++) {
        updateWolves(&wolves[i]);
    }

}

// Helper to update player
void updatePlayer() {

    // Convert worldrow_FP into int format for use in collision detection
    player.worldRow = player.worldRow_FP / FP_SCALING_FACTOR;
    player.rvel = player.rvel_FP / FP_SCALING_FACTOR;

    // Moving left logic
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if ( (player.worldCol + 8 > 0)
        && (collisionMapBitmap[OFFSET(player.worldCol + 8 - player.cvel, player.worldRow, MAPWIDTH)])
        && (collisionMapBitmap[OFFSET(player.worldCol + 8 - player.cvel, player.worldRow + player.height - 1, MAPWIDTH)])) {
            
            player.worldCol -= player.cvel;
            
            if ((hOff > 0) && (player.screenCol < 120)) {
               
                hOff -= player.cvel;

            }
        }
    }

    // Moving right logic
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + 8 < SCREENWIDTH
        && (collisionMapBitmap[OFFSET(player.worldCol + player.width - 9 + player.cvel, player.worldRow, MAPWIDTH)])
        && (collisionMapBitmap[OFFSET(player.worldCol + player.width - 9 + player.cvel, player.worldRow + player.height - 1, MAPWIDTH)])) {
            
            player.worldCol += player.cvel;

            if ((hOff < (MAPWIDTH - SCREENWIDTH)) && (player.screenCol > 120)) {
                
                hOff += player.cvel;

            }
        }
    }

    // ----- GRAVITY LOGIC ----- Welcome to my nightmare

    // Check for collision with item on bottom to see if we need to accelerate downwards
    if (player.rvel >= 0)
    {

        // Attempting some complex vertical movement
        if ((vOff > 0) && (player.screenRow + 16 < 60)) { 
            vOff -= player.rvel;
        }

        if ((player.rvel == 0) && (player.screenRow + 16 < 80) && (vOff > 0)) {
            vOff--;
        }
        
        if ((vOff < MAPHEIGHT - SCREENHEIGHT) && (player.screenRow + 16 > 100)) {
            vOff += player.rvel;
        }

        if ((vOff < MAPHEIGHT - SCREENHEIGHT) && (player.screenRow + 16 > 80) && (player.rvel == 0)) {
            vOff++;
        }

        // Reset vOff to max value if we go past it
        if (vOff > MAPHEIGHT - SCREENHEIGHT) {
             vOff = MAPHEIGHT - SCREENHEIGHT;
        }
        // Reset vOff to min value if we go past it
        if (vOff < 0) {
            vOff = 0;
        }

        // If you're standing on the ground check for jump input
        if (!(collisionMapBitmap[OFFSET(player.worldCol + 8, player.worldRow + player.height, MAPWIDTH)])
        || !(collisionMapBitmap[OFFSET(player.worldCol + player.width - 9, player.worldRow + player.height, MAPWIDTH)])) {
            
            // This is to align us with the ground pixel-perfect while falling
            // decrementing by rvel isn't very exact and can land us inside of the collision map
            while (!(collisionMapBitmap[OFFSET(player.worldCol + 8, player.worldRow + player.height - 1, MAPWIDTH)])
            || !(collisionMapBitmap[OFFSET(player.worldCol + player.width - 9, player.worldRow + player.height - 1, MAPWIDTH)])) {
                player.worldRow--;
            }

            // Convert current worldRow to Floating Point format for use
            player.worldRow_FP = player.worldRow * FP_SCALING_FACTOR;

            // If the player is standing on the ground, they can jump
            // which will increase their velocity instantly to the max
            if (BUTTON_PRESSED(BUTTON_UP)) {

                // Stop player from jumping if at top of screen
                if (player.worldRow > 0) {

                // If jumping, immediately decrement to our maximum row velocity
                player.rvel_FP = - (RVEL_MAX_FP);

                }

            } else {

                // Otherwise if the player isn't jumping, put their rvel back to 0
                player.rvel_FP = 0;

            }

        } else {

            // Else increment the rvel by the acceleration constant to simulate gravity
            player.rvel_FP += FP_GRAVITY_ACCEL;

        }

    }
    else {

        // Otherwise we are traveling downwards and need to increase our rvel by acceleration
        // to simulate gravity
        player.rvel_FP += FP_GRAVITY_ACCEL;

        // Put top collision boundary logic here if needed (a future maybe TODO)

    }

    // Gravity logic
    player.worldRow_FP += player.rvel_FP;

    // Update player screen row and column coordinates
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;    

}

// Helper to update the gems
void updateGems(GEM* g) {

    // Check to see if g is active before updating
    if (g->active) {

        // First, update screen column and row coordinates
        g->screenCol = g->worldCol - hOff;
        g->screenRow = g->worldRow - vOff;

        // If gem's screen coordinates are off the screen, hide it
        if (g->screenRow > 160 || g->screenRow + g->height < 0) {

            shadowOAM[g->OAMpos].attr0 = ATTR0_HIDE;

        } else {

            // Otherwise g is on the screen and active, and you need
            // to check for player collisions
            if (collision(player.screenCol + 8, player.screenRow, player.width/2, player.height, g->screenCol, g->screenRow, g->width, g->height)) {

                // If there is a collision, turn off the gem
                g->active = 0;

                // Decrement gems remaining counter
                gemsRemaining--;

            }

            shadowOAM[g->OAMpos].attr0 = (ROWMASK & g->screenRow) | ATTR0_SQUARE;
            shadowOAM[g->OAMpos].attr1 = (COLMASK & g->screenCol) | ATTR1_TINY;
            shadowOAM[g->OAMpos].attr2 = ATTR2_TILEID(8, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

        }

    } else {
        
        // Else if g isn't active, make sure it's hidden
        shadowOAM[g->OAMpos].attr0 = ATTR0_HIDE;

    }

}

// Helper to update the wolves
void updateWolves(WOLF* w) {

    // First, check if wolf is active
    // This should be helpful when implementing the cheat to kill wolves
    if (w->active) {

        w->aniCounter++;

        // First, update screen column and row coordinates
        w->screenCol = w->worldCol - hOff;
        w->screenRow = w->worldRow - vOff;

        if (w->aniCounter == 1) {
            // Detect if the wolf can continue moving in its current direction ( 1 = right, 0 = left)
            if (w->direction == 1) {

                // If the wolf is moving to the right,
                // If it will extend past the map limit, hit a wall, or go over an empty ledge, flip the direction
                if ((w->worldCol + w->width > MAPWIDTH)
                || !(collisionMapBitmap[OFFSET(w->worldCol + w->width - 1 + w->cvel, w->worldRow + w->height/2, MAPWIDTH)])
                || !(collisionMapBitmap[OFFSET(w->worldCol + w->width - 1 + w->cvel, w->worldRow + w->height - 1, MAPWIDTH)])
                || (collisionMapBitmap[OFFSET(w->worldCol + w->width - 1 + w->cvel, w->worldRow + w->height, MAPWIDTH)])) {
                    w->direction = 0;
                } else {
                    // Else, keep moving right
                    w->worldCol++;
                }  

            } 

            if (w->direction == 0) {

                // If the wolf is moving to the left,
                // If it will extend past the map limit, hit a wall, or go over empty ledge, flip the direction
                if ((w->worldCol < 0)
                || !(collisionMapBitmap[OFFSET(w->worldCol - w->cvel, w->worldRow + w->height/2, MAPWIDTH)])
                || !(collisionMapBitmap[OFFSET(w->worldCol - w->cvel, w->worldRow + w->height - 1, MAPWIDTH)])
                || (collisionMapBitmap[OFFSET(w->worldCol - w->cvel, w->worldRow + w->height, MAPWIDTH)])) {
                    w->direction = 1;
                } else {
                    // Else, keep moving left
                    w->worldCol--;
                }

            }

            w->aniCounter = 0;
        }

        // If wolf's screen coordinates are off the screen, hide it
        if (w->screenRow > 160 || w->screenRow + w->height < 0) {

            shadowOAM[w->OAMpos].attr0 = ATTR0_HIDE;

        } else {

            // Otherwise g is on the screen and active, and you need
            // to check for player collisions
            if (collision(player.screenCol + 8, player.screenRow, player.width/2, player.height, w->screenCol, w->screenRow + w->height/2, w->width, w->height)) {

                // this is a TODO: If there is a collision with the cheat ON, turn off the gem
                // w->active = 0;

                // Decrement lives remaining counter if there is a collision
                livesRemaining--;

            }

            shadowOAM[w->OAMpos].attr0 = (ROWMASK & w->screenRow) | ATTR0_SQUARE;
            shadowOAM[w->OAMpos].attr1 = (COLMASK & w->screenCol) | ATTR1_MEDIUM;
            shadowOAM[w->OAMpos].attr2 = ATTR2_TILEID(4, 0) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);

        }

    } else {

        // If wolf isn't active, make sure it's hidden
        shadowOAM[w->OAMpos].attr0 = ATTR0_HIDE;

    }

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
