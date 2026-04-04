; Disassembly of Super Mario World (Unl)

; This is still a work in progress and is not recommended for use in hacks.

; Assembles with CA65 + LD65

.setcpu "6502"
.feature force_range

.segment "HEADER"
;----------------------------------------
.byte "NES", $1A	; NES Header
.byte 32			; 32 x 16k PRG banks
.byte 32			; 32 x 8k CHR banks
.byte $A1, $50		; Mapper: 90
.byte 0, 0, 0, 0, 0, 0, 0, 0
;--------------------------------------

.include "variables.asm"

; Level Data
; Levels
.segment "PRG00"
.incbin "levels/lvl_1-1.bin"
.segment "PRG01"
.incbin "levels/lvl_1-2.bin"
.segment "PRG02"
.incbin "levels/lvl_1-3.bin"
.segment "PRG03"
.incbin "levels/lvl_1-4_1.bin" ; 1-4 is split up by special levels
.incbin "levels/lvl_GhostHouseIntro.bin"
.incbin "levels/lvl_CastleIntro.bin"
.incbin "levels/lvl_YoshiHouse.bin"
.incbin "levels/lvl_1-4_2.bin"
.incbin "levels/lvl_Bonus.bin"
.segment "PRG04"
.incbin "levels/lvl_2-1.bin"
.segment "PRG05"
.incbin "levels/lvl_2-2.bin"
.segment "PRG06"
.incbin "levels/lvl_2-3.bin"
.segment "PRG07"
.incbin "levels/lvl_2-4.bin"
.segment "PRG08"
.incbin "levels/lvl_3-1.bin"
.segment "PRG09"
.incbin "levels/lvl_3-2.bin"
.segment "PRG10"
.incbin "levels/lvl_3-3.bin"
.segment "PRG11"
.incbin "levels/lvl_3-4.bin"
.segment "PRG12"
.incbin "levels/lvl_4-1.bin"
.segment "PRG13"
.incbin "levels/lvl_4-2.bin"
.segment "PRG14"
.incbin "levels/lvl_4-3.bin"
.segment "PRG15"
.incbin "levels/lvl_4-4.bin"
.segment "PRG16"
.incbin "levels/lvl_5-1.bin"
.segment "PRG17"
.incbin "levels/lvl_5-2.bin"
.segment "PRG18"
.incbin "levels/lvl_5-3.bin"
.segment "PRG19"
.incbin "levels/lvl_5-4.bin"
.segment "PRG20"
.incbin "levels/lvl_6-1.bin"
.segment "PRG21"
.incbin "levels/lvl_6-2.bin"
.segment "PRG22"
.incbin "levels/lvl_6-3.bin"
.segment "PRG23"
.incbin "levels/lvl_6-4.bin"
.segment "PRG24"
.incbin "levels/lvl_7-1.bin"
.segment "PRG25"
.incbin "levels/lvl_7-2.bin"
.segment "PRG26"
.incbin "levels/lvl_7-3.bin"
.segment "PRG27"
.incbin "levels/lvl_7-4.bin"
.incbin "levels/lvl_BowserRoom.bin"
.incbin "levels/lvl_ClownCar.bin"
; Tilesets
.segment "PRG28"
.incbin "tilesets/ts_1-1.bin"
.incbin "tilesets/ts_1-2.bin"
.incbin "tilesets/ts_1-3.bin"
.incbin "tilesets/ts_1-4.bin"
.segment "PRG29"
.incbin "tilesets/ts_2-1.bin"
.incbin "tilesets/ts_2-2.bin"
.incbin "tilesets/ts_2-3.bin"
.incbin "tilesets/ts_2-4.bin"
.segment "PRG30"
.incbin "tilesets/ts_3-1.bin"
.incbin "tilesets/ts_3-2.bin"
.incbin "tilesets/ts_3-3.bin"
.incbin "tilesets/ts_3-4.bin"
.segment "PRG31"
.incbin "tilesets/ts_4-1.bin"
.incbin "tilesets/ts_4-2.bin"
.incbin "tilesets/ts_4-3.bin"
.incbin "tilesets/ts_4-4.bin"
.segment "PRG32"
.incbin "tilesets/ts_5-1.bin"
.incbin "tilesets/ts_5-2.bin"
.incbin "tilesets/ts_5-3.bin"
.incbin "tilesets/ts_5-4.bin"
.segment "PRG33"
.incbin "tilesets/ts_6-1.bin"
.incbin "tilesets/ts_6-2.bin"
.incbin "tilesets/ts_6-3.bin"
.incbin "tilesets/ts_6-4.bin"
.segment "PRG34"
.incbin "tilesets/ts_7-1.bin"
.incbin "tilesets/ts_7-2.bin"
.incbin "tilesets/ts_7-3.bin"
.incbin "tilesets/ts_7-4.bin"
.segment "PRG35"
.incbin "tilesets/ts_YoshiHouse.bin"
.incbin "tilesets/ts_Unused1.bin"
.incbin "tilesets/ts_GhostHouseIntro.bin"
.incbin "tilesets/ts_CastleIntro.bin"

;--------------------------------------
; PRG banks

;.include "prg/prg036.asm"
; 48010 - 4a00f
; Player mapping data

;.include "prg/prg037.asm"
; 4a010 - 4c00f
; Code for various objects

;.include "prg/prg038.asm"
; 4c010 - 4e00f
; Unknown/unused tileset data

;.include "prg/prg039.asm"
; 4e010 - 5000f
; Collision code and tile behavior

;.include "prg/prg040.asm"
; 50010 - 5200f
; Completely empty/unused

;.include "prg/prg041.asm"
; 52010 - 5400f
; Various Game Mode 0 stuff (Title, map, etc)

;.include "prg/prg042.asm"
; 54010 - 5600f
; 8x8 Tilemaps and Overworld Data

;.include "prg/prg043.asm"
; 56010 - 5800f
; Bonus level tileset

;.include "prg/prg044.asm"
; 58010 - 5a00f
; Title Screen/Map Tilesets

;.include "prg/prg045.asm"
; 5a010 - 5c00f
; Title screen level data

;.include "prg/prg046.asm"
; 5c010 - 5e00f
; Overworld Map Tile Data

;.include "prg/prg047.asm"
; 5e010 - 6000f
; Sprite palette mappings

;.include "prg/prg048.asm"
; 60010 - 6200f
; More object code

;.include "prg/prg049.asm"
; 62010 - 6400f
; Code for platforms and other objects

;.include "prg/prg050.asm"
; 64010 - 6600f
; Various objects

;.include "prg/prg051.asm"
; 66010 - 6800f
; Movement data for various objects

;.include "prg/prg052.asm"
; 68010 - 6a00f
; sprite manager?

;.include "prg/prg053.asm"
; 6a010 - 6c00f
; Various objects

;.include "prg/prg054.asm"
; 6c010 - 6e00f
; Object handler

;.include "prg/prg055.asm"
; 6e010 - 7000f
; More code for objects

;.include "prg/prg056.asm"
; 70010 - 7200f
; Even more object code

;.include "prg/prg057.asm"
; 72010 - 7400f
; Player control code

;.include "prg/prg058_59.asm"
; 74010 - 7800f
; Music data and sound driver

;.include "prg/prg060.asm"
; 78010 - 7a00f
; Unknown

;.include "prg/prg061.asm"
; 7a010 - 7c00f
; Level handling

;.include "prg/prg062.asm"
; 7c010 - 7e00f
; Bank 47 clone

;.include "prg/prg063.asm"
; 7e010 - 8000f
; IRQ, game engine, etc.

;--------------------------------------
; Interrupt vectors
.segment "VECTORS"
.word nmiJmpOpcode
.word reset
.word irq

;--------------------------------------
; CHR file
.segment "CHR00"
.incbin "chr/chr000.chr"
.incbin "chr/chr001.chr"
.incbin "chr/chr002.chr"
.incbin "chr/chr003.chr"
.incbin "chr/chr004.chr"
.incbin "chr/chr005.chr"
.incbin "chr/chr006.chr"
.incbin "chr/chr007.chr"

.segment "CHR01"
.incbin "chr/chr008.chr"
.incbin "chr/chr009.chr"
.incbin "chr/chr010.chr"
.incbin "chr/chr011.chr"
.incbin "chr/chr012.chr"
.incbin "chr/chr013.chr"
.incbin "chr/chr014.chr"
.incbin "chr/chr015.chr"

.segment "CHR02"
.incbin "chr/chr016.chr"
.incbin "chr/chr017.chr"
.incbin "chr/chr018.chr"
.incbin "chr/chr019.chr"
.incbin "chr/chr020.chr"
.incbin "chr/chr021.chr"
.incbin "chr/chr022.chr"
.incbin "chr/chr023.chr"

.segment "CHR03"
.incbin "chr/chr024.chr"
.incbin "chr/chr025.chr"
.incbin "chr/chr026.chr"
.incbin "chr/chr027.chr"
.incbin "chr/chr028.chr"
.incbin "chr/chr029.chr"
.incbin "chr/chr030.chr"
.incbin "chr/chr031.chr"

.segment "CHR04"
.incbin "chr/chr032.chr"
.incbin "chr/chr033.chr"
.incbin "chr/chr034.chr"
.incbin "chr/chr035.chr"
.incbin "chr/chr036.chr"
.incbin "chr/chr037.chr"
.incbin "chr/chr038.chr"
.incbin "chr/chr039.chr"

.segment "CHR05"
.incbin "chr/chr040.chr"
.incbin "chr/chr041.chr"
.incbin "chr/chr042.chr"
.incbin "chr/chr043.chr"
.incbin "chr/chr044.chr"
.incbin "chr/chr045.chr"
.incbin "chr/chr046.chr"
.incbin "chr/chr047.chr"

.segment "CHR06"
.incbin "chr/chr048.chr"
.incbin "chr/chr049.chr"
.incbin "chr/chr050.chr"
.incbin "chr/chr051.chr"
.incbin "chr/chr052.chr"
.incbin "chr/chr053.chr"
.incbin "chr/chr054.chr"
.incbin "chr/chr055.chr"

.segment "CHR07"
.incbin "chr/chr056.chr"
.incbin "chr/chr057.chr"
.incbin "chr/chr058.chr"
.incbin "chr/chr059.chr"
.incbin "chr/chr060.chr"
.incbin "chr/chr061.chr"
.incbin "chr/chr062.chr"
.incbin "chr/chr063.chr"

.segment "CHR08"
.incbin "chr/chr064.chr"
.incbin "chr/chr065.chr"
.incbin "chr/chr066.chr"
.incbin "chr/chr067.chr"
.incbin "chr/chr068.chr"
.incbin "chr/chr069.chr"
.incbin "chr/chr070.chr"
.incbin "chr/chr071.chr"

.segment "CHR09"
.incbin "chr/chr072.chr"
.incbin "chr/chr073.chr"
.incbin "chr/chr074.chr"
.incbin "chr/chr075.chr"
.incbin "chr/chr076.chr"
.incbin "chr/chr077.chr"
.incbin "chr/chr078.chr"
.incbin "chr/chr079.chr"

.segment "CHR10"
.incbin "chr/chr080.chr"
.incbin "chr/chr081.chr"
.incbin "chr/chr082.chr"
.incbin "chr/chr083.chr"
.incbin "chr/chr084.chr"
.incbin "chr/chr085.chr"
.incbin "chr/chr086.chr"
.incbin "chr/chr087.chr"

.segment "CHR11"
.incbin "chr/chr088.chr"
.incbin "chr/chr089.chr"
.incbin "chr/chr090.chr"
.incbin "chr/chr091.chr"
.incbin "chr/chr092.chr"
.incbin "chr/chr093.chr"
.incbin "chr/chr094.chr"
.incbin "chr/chr095.chr"

.segment "CHR12"
.incbin "chr/chr096.chr"
.incbin "chr/chr097.chr"
.incbin "chr/chr098.chr"
.incbin "chr/chr099.chr"
.incbin "chr/chr100.chr"
.incbin "chr/chr101.chr"
.incbin "chr/chr102.chr"
.incbin "chr/chr103.chr"

.segment "CHR13"
.incbin "chr/chr104.chr"
.incbin "chr/chr105.chr"
.incbin "chr/chr106.chr"
.incbin "chr/chr107.chr"
.incbin "chr/chr108.chr"
.incbin "chr/chr109.chr"
.incbin "chr/chr110.chr"
.incbin "chr/chr111.chr"

.segment "CHR14"
.incbin "chr/chr112.chr"
.incbin "chr/chr113.chr"
.incbin "chr/chr114.chr"
.incbin "chr/chr115.chr"
.incbin "chr/chr116.chr"
.incbin "chr/chr117.chr"
.incbin "chr/chr118.chr"
.incbin "chr/chr119.chr"

.segment "CHR15"
.incbin "chr/chr120.chr"
.incbin "chr/chr121.chr"
.incbin "chr/chr122.chr"
.incbin "chr/chr123.chr"
.incbin "chr/chr124.chr"
.incbin "chr/chr125.chr"
.incbin "chr/chr126.chr"
.incbin "chr/chr127.chr"

.segment "CHR16"
.incbin "chr/chr128.chr"
.incbin "chr/chr129.chr"
.incbin "chr/chr130.chr"
.incbin "chr/chr131.chr"
.incbin "chr/chr132.chr"
.incbin "chr/chr133.chr"
.incbin "chr/chr134.chr"
.incbin "chr/chr135.chr"

.segment "CHR17"
.incbin "chr/chr136.chr"
.incbin "chr/chr137.chr"
.incbin "chr/chr138.chr"
.incbin "chr/chr139.chr"
.incbin "chr/chr140.chr"
.incbin "chr/chr141.chr"
.incbin "chr/chr142.chr"
.incbin "chr/chr143.chr"

.segment "CHR18"
.incbin "chr/chr144.chr"
.incbin "chr/chr145.chr"
.incbin "chr/chr146.chr"
.incbin "chr/chr147.chr"
.incbin "chr/chr148.chr"
.incbin "chr/chr149.chr"
.incbin "chr/chr150.chr"
.incbin "chr/chr151.chr"

.segment "CHR19"
.incbin "chr/chr152.chr"
.incbin "chr/chr153.chr"
.incbin "chr/chr154.chr"
.incbin "chr/chr155.chr"
.incbin "chr/chr156.chr"
.incbin "chr/chr157.chr"
.incbin "chr/chr158.chr"
.incbin "chr/chr159.chr"

.segment "CHR20"
.incbin "chr/chr160.chr"
.incbin "chr/chr161.chr"
.incbin "chr/chr162.chr"
.incbin "chr/chr163.chr"
.incbin "chr/chr164.chr"
.incbin "chr/chr165.chr"
.incbin "chr/chr166.chr"
.incbin "chr/chr167.chr"

.segment "CHR21"
.incbin "chr/chr168.chr"
.incbin "chr/chr169.chr"
.incbin "chr/chr170.chr"
.incbin "chr/chr171.chr"
.incbin "chr/chr172.chr"
.incbin "chr/chr173.chr"
.incbin "chr/chr174.chr"
.incbin "chr/chr175.chr"

.segment "CHR22"
.incbin "chr/chr176.chr"
.incbin "chr/chr177.chr"
.incbin "chr/chr178.chr"
.incbin "chr/chr179.chr"
.incbin "chr/chr180.chr"
.incbin "chr/chr181.chr"
.incbin "chr/chr182.chr"
.incbin "chr/chr183.chr"

.segment "CHR23"
.incbin "chr/chr184.chr"
.incbin "chr/chr185.chr"
.incbin "chr/chr186.chr"
.incbin "chr/chr187.chr"
.incbin "chr/chr188.chr"
.incbin "chr/chr189.chr"
.incbin "chr/chr190.chr"
.incbin "chr/chr191.chr"

.segment "CHR24"
.incbin "chr/chr192.chr"
.incbin "chr/chr193.chr"
.incbin "chr/chr194.chr"
.incbin "chr/chr195.chr"
.incbin "chr/chr196.chr"
.incbin "chr/chr197.chr"
.incbin "chr/chr198.chr"
.incbin "chr/chr199.chr"

.segment "CHR25"
.incbin "chr/chr200.chr"
.incbin "chr/chr201.chr"
.incbin "chr/chr202.chr"
.incbin "chr/chr203.chr"
.incbin "chr/chr204.chr"
.incbin "chr/chr205.chr"
.incbin "chr/chr206.chr"
.incbin "chr/chr207.chr"

.segment "CHR26"
.incbin "chr/chr208.chr"
.incbin "chr/chr209.chr"
.incbin "chr/chr210.chr"
.incbin "chr/chr211.chr"
.incbin "chr/chr212.chr"
.incbin "chr/chr213.chr"
.incbin "chr/chr214.chr"
.incbin "chr/chr215.chr"

.segment "CHR27"
.incbin "chr/chr216.chr"
.incbin "chr/chr217.chr"
.incbin "chr/chr218.chr"
.incbin "chr/chr219.chr"
.incbin "chr/chr220.chr"
.incbin "chr/chr221.chr"
.incbin "chr/chr222.chr"
.incbin "chr/chr223.chr"

.segment "CHR28"
.incbin "chr/chr224.chr"
.incbin "chr/chr225.chr"
.incbin "chr/chr226.chr"
.incbin "chr/chr227.chr"
.incbin "chr/chr228.chr"
.incbin "chr/chr229.chr"
.incbin "chr/chr230.chr"
.incbin "chr/chr231.chr"

.segment "CHR29"
.incbin "chr/chr232.chr"
.incbin "chr/chr233.chr"
.incbin "chr/chr234.chr"
.incbin "chr/chr235.chr"
.incbin "chr/chr236.chr"
.incbin "chr/chr237.chr"
.incbin "chr/chr238.chr"
.incbin "chr/chr239.chr"

.segment "CHR30"
.incbin "chr/chr240.chr"
.incbin "chr/chr241.chr"
.incbin "chr/chr242.chr"
.incbin "chr/chr243.chr"
.incbin "chr/chr244.chr"
.incbin "chr/chr245.chr"
.incbin "chr/chr246.chr"
.incbin "chr/chr247.chr"

.segment "CHR31"
.incbin "chr/chr248.chr"
.incbin "chr/chr249.chr"
.incbin "chr/chr250.chr"
.incbin "chr/chr251.chr"
.incbin "chr/chr252.chr"
.incbin "chr/chr253.chr"
.incbin "chr/chr254.chr"
.incbin "chr/chr255.chr"
