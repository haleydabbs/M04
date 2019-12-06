#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "myLib.h"
#include "FinalGameSprites.h"
#include "game.h"
#include "collisionMap.h"
#include "sound.h"
#include "GemCollectSound.h"
#include "HurtSound.h"
#include "BossBattleSongLooping.h"
#include "EnemyInjured.h"

// Initialize the game
void initGame() {

    // Set up sprite sheet
    DMANow(3, FinalGameSpritesTiles, &CHARBLOCK[4], FinalGameSpritesTilesLen/2);
    DMANow(3, FinalGameSpritesPal, SPRITEPALETTE, FinalGameSpritesPalLen/2);

    // Initializing counting variables
    gemsRemaining = GEMCOUNT;
    livesRemaining = LIFECOUNT;
    statueLivesRemaining = GEMCOUNT;

    // Hide the sprites
    hideSprites();

    // Initialize player sprite
    player.width = 32;
    player.height = 32;
    player.worldRow = MAPHEIGHT - player.height - 16;
    player.worldRow_FP = player.worldRow * FP_SCALING_FACTOR;
    player.worldCol = (SCREENWIDTH/2) - (player.width/2) + hOff;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 5;
    player.aniState = 0;
    player.cvel = 2;
    player.rvel = 0;
    player.rvel_FP = 0;
    player.jumping = 1;

    // Initialize gems that need to be collected
    for (int i = 0; i < GEMCOUNT; i++) {
        initGems(&gems[i], i);
    }

    // Initialize the wolves
    for (int i = 0; i < WOLF_COUNT; i++) {
        initWolves(&wolves[i], i);
    }

    // Initialize the gem counter icon
    gemCounterIcon.width = 8;
    gemCounterIcon.height = 8;
    gemCounterIcon.worldCol = 8;
    gemCounterIcon.worldRow = SCREENHEIGHT - 16;
    gemCounterIcon.OAMpos = 7;

    // Initialize the number that we use to count gems
    gemNum.width = 8;
    gemNum.height = 8;
    gemNum.worldCol = 18;
    gemNum.worldRow = SCREENHEIGHT - 16;
    gemNum.OAMpos = 8;

    // Initialize the heart icons
    for (int i = 0; i < LIFECOUNT; i++) {
        initHearts(&hearts[i], i);
    }

    // Initialize the statue
    statue.width = 32;
    statue.height = 32;
    statue.worldCol = MAPWIDTH/2 + statue.width/2;
    statue.worldRow = MAPHEIGHT - 38 - statue.height;
    statue.active = 1;
    statue.OAMpos = 12;
    statue.aniState = 0;
    statue.attack = 0;
    statue.palRow = 0;
    statue.colliding = 0;
    statue.rvel = 1;

    // Initialize the text bubble
    textBubble.width = 64;
    textBubble.height = 32;
    textBubble.worldCol = SCREENWIDTH/2 + 40 - textBubble.width/2;
    textBubble.worldRow = SCREENHEIGHT - 90 - textBubble.height;
    textBubble.active = 1;
    textBubble.OAMpos = 13;
    textBubble.spriteSheetrow = 0;

    // Set gameState to cutscene
    gameState = CUTSCENE1;

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
    w->colliding = 0;
    w->numFrames = 4;

    if (i == 0) {

        w->worldCol = 16;
        w->worldRow = 32;

    } else if (i == 1) {

        w->worldCol = 96;
        w->worldRow = 152;

    }

}

// Helper to init hearts
void initHearts(HEART* h, int i) {

    h->active = 1;
    h->width = 8;
    h->height = 8;
    h->worldRow = SCREENHEIGHT - 16;
    h->worldCol = 224 - (16 * i);
    h->OAMpos = 9 + i;

}

// Update the game
void updateGame() {


    // Update player sprite
    updatePlayer();

    // Update statue sprite
    updateStatue();

    // Update gems for player to collect on screen
    for (int i = 0; i < GEMCOUNT; i++) {
        updateGems(&gems[i]);
    }

    // Update wolf enemies
    for (int i = 0; i < WOLF_COUNT; i++) {
        updateWolves(&wolves[i]);
    }

    // Update heart sprites
    for (int i = 0; i < LIFECOUNT; i++) {
        updateHearts(&hearts[i]);
    }

    // Update textBubble
    updateText();

}

// Helper to update player
void updatePlayer() {

    // Convert worldrow_FP into int format for use in collision detection
    player.worldRow = player.worldRow_FP / FP_SCALING_FACTOR;
    player.rvel = player.rvel_FP / FP_SCALING_FACTOR;

    // Moving left logic
    if (BUTTON_HELD(BUTTON_LEFT) && !(player.cheatOn) && (gameState == PLAY || gameState == BOSSBATTLE)) {
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
    if (BUTTON_HELD(BUTTON_RIGHT) && !(player.cheatOn) && (gameState == PLAY || gameState == BOSSBATTLE)) {
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
        
        player.jumping = 1;

        // Complex vertical movement
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
            if (BUTTON_PRESSED(BUTTON_UP) && (gameState == PLAY || gameState == BOSSBATTLE)) {

                // Stop player from jumping if at top of screen
                if (player.worldRow > 0) {

                // If jumping, immediately decrement to our maximum row velocity
                player.rvel_FP = - (RVEL_MAX_FP);

                }

            } else {

                // Otherwise if the player isn't jumping, put their rvel back to 0
                player.rvel_FP = 0;
                player.jumping = 0;

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
        player.jumping = 1;

    }

    // Gravity logic
    player.worldRow_FP += player.rvel_FP;

    // Update player screen row and column coordinates
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;  

    animatePlayer();  

}

// Helper to animate player
void animatePlayer() {

    // Set up prevAnistate, and set default player state to idle (when nothing is pressed)
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    if (player.aniCounter % 5 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }   
    
    if (gameState == PLAY || gameState == BOSSBATTLE) {

        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.aniState = PLAYERLEFT;
        } if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.aniState = PLAYERRIGHT;
        } if (BUTTON_HELD(BUTTON_DOWN)) {
            player.aniState = PLAYERDOWN;
            // Turn cheat variable on if you are holding down
            player.cheatOn = 1;
        } else {
            // Turn off the cheat once down is released
            player.cheatOn = 0;
        }

    }

    if (player.jumping) {
        player.curFrame = 2;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;

        // Check in midair if player is going left or
        // right to avoid weird backwards jumping effect
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.aniState = PLAYERLEFT;
        } if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.aniState = PLAYERRIGHT;
        } 

    } else if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else if (player.aniState == PLAYERDOWN) {
        player.curFrame = 5;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }


}

// Helper to update the statue sprite
void updateStatue() {

    // If the player has collected all of the gems AND drops them off at the statue
    // AND the statue is on screen
    // turn statue to evil mode >:(
    if ( (statue.screenRow <= 100)
    && (statue.screenRow + statue.height >= 0)
    && (gemsRemaining == 0)
    && (gameState != BOSSBATTLE)
    && (gameState != CUTSCENE3)
    && (gameState != END)) {

        statue.aniState = 3;
        gameState = CUTSCENE2;
        statue.palRow = 3;

    }


    // If in bossbattle state, do movement/collision logic
    if (gameState == BOSSBATTLE) {
        
        if (statue.direction == 1) {

            // If the statue is moving to the right,
            // If it will extend past the map limit or hit a wall, flip the direction
            if ((statue.worldCol + statue.width > MAPWIDTH)
            || !(collisionMapBitmap[OFFSET(statue.worldCol + statue.width - 1 + statue.cvel, statue.worldRow + statue.height/2, MAPWIDTH)])
            || !(collisionMapBitmap[OFFSET(statue.worldCol + statue.width - 1 + statue.cvel, statue.worldRow + statue.height - 1, MAPWIDTH)])) {
                statue.direction = 0;
            } else {
                // Else, keep moving right
                statue.worldCol += statue.rvel;
            }  

        } 

        if (statue.direction == 0) {

            // If the statue is moving to the left,
            // If it will extend past the map limit or hit a wall, flip the direction
            if ((statue.worldCol < 0)
            || !(collisionMapBitmap[OFFSET(statue.worldCol - statue.cvel, statue.worldRow + statue.height/2, MAPWIDTH)])
            || !(collisionMapBitmap[OFFSET(statue.worldCol - statue.cvel, statue.worldRow + statue.height - 1, MAPWIDTH)])) {
                statue.direction = 1;
            } else {
                // Else, keep moving left
                statue.worldCol -= statue.rvel;
            }

        }

        // Check for a collision with the player
        if (collision(player.screenCol + 8, player.screenRow, player.width/2, player.height, statue.screenCol, statue.screenRow + statue.height, statue.width, statue.height)) {

            if (!(statue.colliding) && !(player.cheatOn)) {

                if (statue.screenRow > player.screenRow - 3) {

                    statue.aniState--;
                    statue.rvel++;
                    playSoundB(EnemyInjured, ENEMYINJUREDLEN, ENEMYINJUREDFREQ, 0);

                } else {

                    // Turn off the leftmost heart icon
                    if ((LIFECOUNT-livesRemaining >= 0) && (LIFECOUNT - livesRemaining < 3)) {
                        hearts[LIFECOUNT - livesRemaining].active = 0;
                    }

                    // Decrement lives remaining counter if there is a collision
                    livesRemaining--;

                    // Play the hurt sound
                    playSoundB(HurtSound, HURTSOUNDLEN, HURTSOUNDFREQ, 0);

                }
        
            // Using this switch variable to prevent collision from instantly
            // decrementing all lives
            statue.colliding = 1;


            }

        } else {

            statue.colliding = 0;

        }

        // If statue has returned to 0 anistate, the game is over!
        if (statue.aniState == 0) {
            statue.active = 0;
            gameState = END;
        }

    }

    // Update statue screenRow and screenCol
    statue.screenRow = statue.worldRow - vOff;
    statue.screenCol = statue.worldCol - hOff;

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

                // Play gem collected sound
                playSoundB(GemCollectSound, GEMCOLLECTSOUNDLEN, GEMCOLLECTSOUNDFREQ, 0);

            }

            // Draw gems here to avoid repetitive looping
            shadowOAM[g->OAMpos].attr0 = (ROWMASK & g->screenRow) | ATTR0_SQUARE;
            shadowOAM[g->OAMpos].attr1 = (COLMASK & g->screenCol) | ATTR1_TINY;
            shadowOAM[g->OAMpos].attr2 = ATTR2_TILEID(16, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

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

        // Increment anidelay to delay movement
        w->aniDelay++;

        // First, update screen column and row coordinates
        w->screenCol = w->worldCol - hOff;
        w->screenRow = w->worldRow - vOff;

        // ANIMATION STUFF
        w->prevAniState = player.aniState;

        if (w->aniCounter % 8 == 0) {
            w->aniFrame = (w->aniFrame + 1) % w->numFrames;
        }  

        // Increment aniCounter to increment animation frame
        w->aniCounter++;

        if (w->aniDelay == 1) {
            // Detect if the wolf can continue moving in its current direction ( 1 = right, 0 = left)
            if (w->direction == 1) {

                w->aniState = WOLFRIGHT;

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

                w->aniState = WOLFLEFT;

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

            // Restart anicounter
            w->aniDelay = 0;
        }

        // If wolf's screen coordinates are off the screen, hide it
        if (w->screenRow > 160 || w->screenRow + w->height < 0) {

            shadowOAM[w->OAMpos].attr0 = ATTR0_HIDE;

        } else {

            // Otherwise the wolf is on the screen and active, and you need
            // to check for player collisions
            if (collision(player.screenCol + 8, player.screenRow, player.width/2, player.height, w->screenCol, w->screenRow + w->height/2, w->width, w->height)) {

                
                if (!(w->colliding) && !(player.cheatOn)) {
                    // Turn off the leftmost heart icon
                    if ((LIFECOUNT-livesRemaining >= 0) && (LIFECOUNT - livesRemaining < 3)) {
                        hearts[LIFECOUNT - livesRemaining].active = 0;
                    }

                    // Decrement lives remaining counter if there is a collision
                    livesRemaining--;

                    // Play the hurt sound
                    playSoundB(HurtSound, HURTSOUNDLEN, HURTSOUNDFREQ, 0);
                }

                // Using this switch variable to prevent collision from instantly
                // decrementing all lives
                w->colliding = 1;

            } else {

                w->colliding = 0;

            }

            // Draw the wolf here (to avoid unecessary looping)
            shadowOAM[w->OAMpos].attr0 = (ROWMASK & w->screenRow) | ATTR0_SQUARE;
            shadowOAM[w->OAMpos].attr1 = (COLMASK & w->screenCol) | ATTR1_MEDIUM;
            shadowOAM[w->OAMpos].attr2 = ATTR2_TILEID(8 + (4 * w->aniState), w->aniFrame * 4) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);

        }

    } else {

        // If wolf isn't active, make sure it's hidden
        shadowOAM[w->OAMpos].attr0 = ATTR0_HIDE;

    }

}

// Helper to update heart sprites
void updateHearts(HEART* h) {

    if (h->active) {

        // If the heart is still active, draw it
        shadowOAM[h->OAMpos].attr0 = (ROWMASK & h->worldRow) | ATTR0_SQUARE;
        shadowOAM[h->OAMpos].attr1 = (COLMASK & h->worldCol) | ATTR1_TINY;
        shadowOAM[h->OAMpos].attr2 = ATTR2_TILEID(16, 1) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);

    } else {

        // Otherwise, hide it
        shadowOAM[h->OAMpos].attr0 = ATTR0_HIDE;

    }

}

// Helper to update text bubble
void updateText() {

    // If we are in a cutscene
    if ((gameState == CUTSCENE1) || (gameState == CUTSCENE2)) {

        // Increment text bubble sprite when player presses a
        if(BUTTON_PRESSED(BUTTON_A)) {

            textBubble.spriteSheetrow++;

        }

        // If we're in cutscene 1 and we reach spritesheetrow 2, turn off text bubble
        if ((textBubble.spriteSheetrow == 2) && (gameState == CUTSCENE1)) {

            textBubble.active = 0;
            gameState = PLAY;

        }
        // else if we're in cutscene 2 and we reach spritesheetrow 4, turn off text bubble
        else if (textBubble.spriteSheetrow == 4 && gameState == CUTSCENE2) {

            stopSound();
            playSoundA(BossBattleSongLooping, BOSSBATTLESONGLOOPINGLEN, BOSSBATTLESONGLOOPINGFREQ, 1);

            textBubble.active = 0;
            gameState = BOSSBATTLE;

        }
        // else we are in a cutscene still and the textbubble should be active
        else {
            
            textBubble.active = 1;

        }

    }

    // If the text bubble is active, draw it
    if (textBubble.active) {

        shadowOAM[textBubble.OAMpos].attr0 = (ROWMASK & textBubble.worldRow) | ATTR0_WIDE;
        shadowOAM[textBubble.OAMpos].attr1 = (COLMASK & textBubble.worldCol) | ATTR1_LARGE;
        shadowOAM[textBubble.OAMpos].attr2 = ATTR2_TILEID(21, textBubble.spriteSheetrow * 4) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

    } else {

        // Otherwise, hide it
        shadowOAM[textBubble.OAMpos].attr0 = ATTR0_HIDE;

    }

}

// Draw sprites
void drawGame() {

    // Call helper to draw player
    drawPlayer();

    // Call helper to draw gem icon
    drawGemCounterIcon();

    // Call helper to draw gem Num
    drawGemNum();

    // Call helper to draw the statue
    drawStatue();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);

    // Update offset registers for platforms
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    // Update offsets for the parallax BG at a slower speed
    REG_BG2HOFF = hOff >> 2;
    REG_BG2VOFF = vOff >> 2;

}

// Helper to draw the player sprite
void drawPlayer() {

    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(2) | ATTR2_PRIORITY(0);

}

// Helper to draw the gem counter icon
void drawGemCounterIcon() {

    shadowOAM[gemCounterIcon.OAMpos].attr0 = (ROWMASK & gemCounterIcon.worldRow) | ATTR0_SQUARE;
    shadowOAM[gemCounterIcon.OAMpos].attr1 = (COLMASK & gemCounterIcon.worldCol) | ATTR1_TINY;
    shadowOAM[gemCounterIcon.OAMpos].attr2 = ATTR2_TILEID(16, 0) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}

// Helper to draw the number of gems collected
void drawGemNum() {

    shadowOAM[gemNum.OAMpos].attr0 = (ROWMASK & gemNum.worldRow) | ATTR0_SQUARE;
    shadowOAM[gemNum.OAMpos].attr1 = (COLMASK & gemNum.worldCol) | ATTR1_TINY;
    shadowOAM[gemNum.OAMpos].attr2 = ATTR2_TILEID(16, 2 + gemsRemaining) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);

}

// Helper to draw the statue
void drawStatue() {

    // If the statue is off screen, hide it
    if (statue.screenRow > 160 || statue.screenRow + statue.height < 0 || !(statue.active)) {

        shadowOAM[statue.OAMpos].attr0 = ATTR0_HIDE;

    } else {

        // Otherwise, draw it
        shadowOAM[statue.OAMpos].attr0 = (ROWMASK & statue.screenRow) | ATTR0_SQUARE;
        shadowOAM[statue.OAMpos].attr1 = (COLMASK & statue.screenCol) | ATTR1_MEDIUM;
        shadowOAM[statue.OAMpos].attr2 = ATTR2_TILEID(17, statue.aniState * 4) | ATTR2_PALROW(statue.palRow) | ATTR2_PRIORITY(0);

    }

}
