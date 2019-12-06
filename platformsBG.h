
//{{BLOCK(platformsBG)

//======================================================================
//
//	platformsBG, 256x512@4, 
//	+ palette 256 entries, not compressed
//	+ 128 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x64 
//	Total size: 512 + 4096 + 4096 = 8704
//
//	Time-stamp: 2019-12-05, 13:05:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PLATFORMSBG_H
#define GRIT_PLATFORMSBG_H

#define platformsBGTilesLen 4096
extern const unsigned short platformsBGTiles[2048];

#define platformsBGMapLen 4096
extern const unsigned short platformsBGMap[2048];

#define platformsBGPalLen 512
extern const unsigned short platformsBGPal[256];

#endif // GRIT_PLATFORMSBG_H

//}}BLOCK(platformsBG)
