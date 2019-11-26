
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 628 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 20096 + 2048 = 22656
//
//	Time-stamp: 2019-11-25, 22:12:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 20096
extern const unsigned short gameBGTiles[10048];

#define gameBGMapLen 2048
extern const unsigned short gameBGMap[1024];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
