
//{{BLOCK(platformsBG)

//======================================================================
//
//	platformsBG, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 64 + 4096 = 4672
//
//	Time-stamp: 2019-11-18, 18:26:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PLATFORMSBG_H
#define GRIT_PLATFORMSBG_H

#define platformsBGTilesLen 64
extern const unsigned short platformsBGTiles[32];

#define platformsBGMapLen 4096
extern const unsigned short platformsBGMap[2048];

#define platformsBGPalLen 512
extern const unsigned short platformsBGPal[256];

#endif // GRIT_PLATFORMSBG_H

//}}BLOCK(platformsBG)
