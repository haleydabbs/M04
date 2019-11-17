
//{{BLOCK(loseBG)

//======================================================================
//
//	loseBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 54 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1728 + 2048 = 4288
//
//	Time-stamp: 2019-11-12, 23:31:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEBG_H
#define GRIT_LOSEBG_H

#define loseBGTilesLen 1728
extern const unsigned short loseBGTiles[864];

#define loseBGMapLen 2048
extern const unsigned short loseBGMap[1024];

#define loseBGPalLen 512
extern const unsigned short loseBGPal[256];

#endif // GRIT_LOSEBG_H

//}}BLOCK(loseBG)
