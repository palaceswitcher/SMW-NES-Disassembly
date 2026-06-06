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
.incbin "data/levels/lvl_1-1.bin"
.segment "PRG01"
.incbin "data/levels/lvl_1-2.bin"
.segment "PRG02"
.incbin "data/levels/lvl_1-3.bin"
.segment "PRG03"
.incbin "data/levels/lvl_1-4_1.bin" ; 1-4 is split up by special levels
.incbin "data/levels/lvl_GhostHouseIntro.bin"
.incbin "data/levels/lvl_CastleIntro.bin"
.incbin "data/levels/lvl_YoshiHouse.bin"
.incbin "data/levels/lvl_1-4_2.bin"
.incbin "data/levels/lvl_Bonus.bin"
.segment "PRG04"
.incbin "data/levels/lvl_2-1.bin"
.segment "PRG05"
.incbin "data/levels/lvl_2-2.bin"
.segment "PRG06"
.incbin "data/levels/lvl_2-3.bin"
.segment "PRG07"
.incbin "data/levels/lvl_2-4.bin"
.segment "PRG08"
.incbin "data/levels/lvl_3-1.bin"
.segment "PRG09"
.incbin "data/levels/lvl_3-2.bin"
.segment "PRG10"
.incbin "data/levels/lvl_3-3.bin"
.segment "PRG11"
.incbin "data/levels/lvl_3-4.bin"
.segment "PRG12"
.incbin "data/levels/lvl_4-1.bin"
.segment "PRG13"
.incbin "data/levels/lvl_4-2.bin"
.segment "PRG14"
.incbin "data/levels/lvl_4-3.bin"
.segment "PRG15"
.incbin "data/levels/lvl_4-4.bin"
.segment "PRG16"
.incbin "data/levels/lvl_5-1.bin"
.segment "PRG17"
.incbin "data/levels/lvl_5-2.bin"
.segment "PRG18"
.incbin "data/levels/lvl_5-3.bin"
.segment "PRG19"
.incbin "data/levels/lvl_5-4.bin"
.segment "PRG20"
.incbin "data/levels/lvl_6-1.bin"
.segment "PRG21"
.incbin "data/levels/lvl_6-2.bin"
.segment "PRG22"
.incbin "data/levels/lvl_6-3.bin"
.segment "PRG23"
.incbin "data/levels/lvl_6-4.bin"
.segment "PRG24"
.incbin "data/levels/lvl_7-1.bin"
.segment "PRG25"
.incbin "data/levels/lvl_7-2.bin"
.segment "PRG26"
.incbin "data/levels/lvl_7-3.bin"
.segment "PRG27"
.incbin "data/levels/lvl_7-4.bin"
.incbin "data/levels/lvl_BowserRoom.bin"
.incbin "data/levels/lvl_ClownCar.bin"
; Tilesets
.segment "PRG28"
.incbin "data/tilesets/ts_1-1.bin"
.incbin "data/tilesets/ts_1-2.bin"
.incbin "data/tilesets/ts_1-3.bin"
.incbin "data/tilesets/ts_1-4.bin"
.segment "PRG29"
.incbin "data/tilesets/ts_2-1.bin"
.incbin "data/tilesets/ts_2-2.bin"
.incbin "data/tilesets/ts_2-3.bin"
.incbin "data/tilesets/ts_2-4.bin"
.segment "PRG30"
.incbin "data/tilesets/ts_3-1.bin"
.incbin "data/tilesets/ts_3-2.bin"
.incbin "data/tilesets/ts_3-3.bin"
.incbin "data/tilesets/ts_3-4.bin"
.segment "PRG31"
.incbin "data/tilesets/ts_4-1.bin"
.incbin "data/tilesets/ts_4-2.bin"
.incbin "data/tilesets/ts_4-3.bin"
.incbin "data/tilesets/ts_4-4.bin"
.segment "PRG32"
.incbin "data/tilesets/ts_5-1.bin"
.incbin "data/tilesets/ts_5-2.bin"
.incbin "data/tilesets/ts_5-3.bin"
.incbin "data/tilesets/ts_5-4.bin"
.segment "PRG33"
.incbin "data/tilesets/ts_6-1.bin"
.incbin "data/tilesets/ts_6-2.bin"
.incbin "data/tilesets/ts_6-3.bin"
.incbin "data/tilesets/ts_6-4.bin"
.segment "PRG34"
.incbin "data/tilesets/ts_7-1.bin"
.incbin "data/tilesets/ts_7-2.bin"
.incbin "data/tilesets/ts_7-3.bin"
.incbin "data/tilesets/ts_7-4.bin"
.segment "PRG35"
.incbin "data/tilesets/ts_YoshiHouse.bin"
.incbin "data/tilesets/ts_Unused1.bin"
.incbin "data/tilesets/ts_GhostHouseIntro.bin"
.incbin "data/tilesets/ts_CastleIntro.bin"

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
.incbin "data/chr/chr000.chr"
.incbin "data/chr/chr001.chr"
.incbin "data/chr/chr002.chr"
.incbin "data/chr/chr003.chr"
.incbin "data/chr/chr004.chr"
.incbin "data/chr/chr005.chr"
.incbin "data/chr/chr006.chr"
.incbin "data/chr/chr007.chr"

.segment "CHR01"
.incbin "data/chr/chr008.chr"
.incbin "data/chr/chr009.chr"
.incbin "data/chr/chr010.chr"
.incbin "data/chr/chr011.chr"
.incbin "data/chr/chr012.chr"
.incbin "data/chr/chr013.chr"
.incbin "data/chr/chr014.chr"
.incbin "data/chr/chr015.chr"

.segment "CHR02"
.incbin "data/chr/chr016.chr"
.incbin "data/chr/chr017.chr"
.incbin "data/chr/chr018.chr"
.incbin "data/chr/chr019.chr"
.incbin "data/chr/chr020.chr"
.incbin "data/chr/chr021.chr"
.incbin "data/chr/chr022.chr"
.incbin "data/chr/chr023.chr"

.segment "CHR03"
.incbin "data/chr/chr024.chr"
.incbin "data/chr/chr025.chr"
.incbin "data/chr/chr026.chr"
.incbin "data/chr/chr027.chr"
.incbin "data/chr/chr028.chr"
.incbin "data/chr/chr029.chr"
.incbin "data/chr/chr030.chr"
.incbin "data/chr/chr031.chr"

.segment "CHR04"
.incbin "data/chr/chr032.chr"
.incbin "data/chr/chr033.chr"
.incbin "data/chr/chr034.chr"
.incbin "data/chr/chr035.chr"
.incbin "data/chr/chr036.chr"
.incbin "data/chr/chr037.chr"
.incbin "data/chr/chr038.chr"
.incbin "data/chr/chr039.chr"

.segment "CHR05"
.incbin "data/chr/chr040.chr"
.incbin "data/chr/chr041.chr"
.incbin "data/chr/chr042.chr"
.incbin "data/chr/chr043.chr"
.incbin "data/chr/chr044.chr"
.incbin "data/chr/chr045.chr"
.incbin "data/chr/chr046.chr"
.incbin "data/chr/chr047.chr"

.segment "CHR06"
.incbin "data/chr/chr048.chr"
.incbin "data/chr/chr049.chr"
.incbin "data/chr/chr050.chr"
.incbin "data/chr/chr051.chr"
.incbin "data/chr/chr052.chr"
.incbin "data/chr/chr053.chr"
.incbin "data/chr/chr054.chr"
.incbin "data/chr/chr055.chr"

.segment "CHR07"
.incbin "data/chr/chr056.chr"
.incbin "data/chr/chr057.chr"
.incbin "data/chr/chr058.chr"
.incbin "data/chr/chr059.chr"
.incbin "data/chr/chr060.chr"
.incbin "data/chr/chr061.chr"
.incbin "data/chr/chr062.chr"
.incbin "data/chr/chr063.chr"

.segment "CHR08"
.incbin "data/chr/chr064.chr"
.incbin "data/chr/chr065.chr"
.incbin "data/chr/chr066.chr"
.incbin "data/chr/chr067.chr"
.incbin "data/chr/chr068.chr"
.incbin "data/chr/chr069.chr"
.incbin "data/chr/chr070.chr"
.incbin "data/chr/chr071.chr"

.segment "CHR09"
.incbin "data/chr/chr072.chr"
.incbin "data/chr/chr073.chr"
.incbin "data/chr/chr074.chr"
.incbin "data/chr/chr075.chr"
.incbin "data/chr/chr076.chr"
.incbin "data/chr/chr077.chr"
.incbin "data/chr/chr078.chr"
.incbin "data/chr/chr079.chr"

.segment "CHR10"
.incbin "data/chr/chr080.chr"
.incbin "data/chr/chr081.chr"
.incbin "data/chr/chr082.chr"
.incbin "data/chr/chr083.chr"
.incbin "data/chr/chr084.chr"
.incbin "data/chr/chr085.chr"
.incbin "data/chr/chr086.chr"
.incbin "data/chr/chr087.chr"

.segment "CHR11"
.incbin "data/chr/chr088.chr"
.incbin "data/chr/chr089.chr"
.incbin "data/chr/chr090.chr"
.incbin "data/chr/chr091.chr"
.incbin "data/chr/chr092.chr"
.incbin "data/chr/chr093.chr"
.incbin "data/chr/chr094.chr"
.incbin "data/chr/chr095.chr"

.segment "CHR12"
.incbin "data/chr/chr096.chr"
.incbin "data/chr/chr097.chr"
.incbin "data/chr/chr098.chr"
.incbin "data/chr/chr099.chr"
.incbin "data/chr/chr100.chr"
.incbin "data/chr/chr101.chr"
.incbin "data/chr/chr102.chr"
.incbin "data/chr/chr103.chr"

.segment "CHR13"
.incbin "data/chr/chr104.chr"
.incbin "data/chr/chr105.chr"
.incbin "data/chr/chr106.chr"
.incbin "data/chr/chr107.chr"
.incbin "data/chr/chr108.chr"
.incbin "data/chr/chr109.chr"
.incbin "data/chr/chr110.chr"
.incbin "data/chr/chr111.chr"

.segment "CHR14"
.incbin "data/chr/chr112.chr"
.incbin "data/chr/chr113.chr"
.incbin "data/chr/chr114.chr"
.incbin "data/chr/chr115.chr"
.incbin "data/chr/chr116.chr"
.incbin "data/chr/chr117.chr"
.incbin "data/chr/chr118.chr"
.incbin "data/chr/chr119.chr"

.segment "CHR15"
.incbin "data/chr/chr120.chr"
.incbin "data/chr/chr121.chr"
.incbin "data/chr/chr122.chr"
.incbin "data/chr/chr123.chr"
.incbin "data/chr/chr124.chr"
.incbin "data/chr/chr125.chr"
.incbin "data/chr/chr126.chr"
.incbin "data/chr/chr127.chr"

.segment "CHR16"
.incbin "data/chr/chr128.chr"
.incbin "data/chr/chr129.chr"
.incbin "data/chr/chr130.chr"
.incbin "data/chr/chr131.chr"
.incbin "data/chr/chr132.chr"
.incbin "data/chr/chr133.chr"
.incbin "data/chr/chr134.chr"
.incbin "data/chr/chr135.chr"

.segment "CHR17"
.incbin "data/chr/chr136.chr"
.incbin "data/chr/chr137.chr"
.incbin "data/chr/chr138.chr"
.incbin "data/chr/chr139.chr"
.incbin "data/chr/chr140.chr"
.incbin "data/chr/chr141.chr"
.incbin "data/chr/chr142.chr"
.incbin "data/chr/chr143.chr"

.segment "CHR18"
.incbin "data/chr/chr144.chr"
.incbin "data/chr/chr145.chr"
.incbin "data/chr/chr146.chr"
.incbin "data/chr/chr147.chr"
.incbin "data/chr/chr148.chr"
.incbin "data/chr/chr149.chr"
.incbin "data/chr/chr150.chr"
.incbin "data/chr/chr151.chr"

.segment "CHR19"
.incbin "data/chr/chr152.chr"
.incbin "data/chr/chr153.chr"
.incbin "data/chr/chr154.chr"
.incbin "data/chr/chr155.chr"
.incbin "data/chr/chr156.chr"
.incbin "data/chr/chr157.chr"
.incbin "data/chr/chr158.chr"
.incbin "data/chr/chr159.chr"

.segment "CHR20"
.incbin "data/chr/chr160.chr"
.incbin "data/chr/chr161.chr"
.incbin "data/chr/chr162.chr"
.incbin "data/chr/chr163.chr"
.incbin "data/chr/chr164.chr"
.incbin "data/chr/chr165.chr"
.incbin "data/chr/chr166.chr"
.incbin "data/chr/chr167.chr"

.segment "CHR21"
.incbin "data/chr/chr168.chr"
.incbin "data/chr/chr169.chr"
.incbin "data/chr/chr170.chr"
.incbin "data/chr/chr171.chr"
.incbin "data/chr/chr172.chr"
.incbin "data/chr/chr173.chr"
.incbin "data/chr/chr174.chr"
.incbin "data/chr/chr175.chr"

.segment "CHR22"
.incbin "data/chr/chr176.chr"
.incbin "data/chr/chr177.chr"
.incbin "data/chr/chr178.chr"
.incbin "data/chr/chr179.chr"
.incbin "data/chr/chr180.chr"
.incbin "data/chr/chr181.chr"
.incbin "data/chr/chr182.chr"
.incbin "data/chr/chr183.chr"

.segment "CHR23"
.incbin "data/chr/chr184.chr"
.incbin "data/chr/chr185.chr"
.incbin "data/chr/chr186.chr"
.incbin "data/chr/chr187.chr"
.incbin "data/chr/chr188.chr"
.incbin "data/chr/chr189.chr"
.incbin "data/chr/chr190.chr"
.incbin "data/chr/chr191.chr"

.segment "CHR24"
.incbin "data/chr/chr192.chr"
.incbin "data/chr/chr193.chr"
.incbin "data/chr/chr194.chr"
.incbin "data/chr/chr195.chr"
.incbin "data/chr/chr196.chr"
.incbin "data/chr/chr197.chr"
.incbin "data/chr/chr198.chr"
.incbin "data/chr/chr199.chr"

.segment "CHR25"
.incbin "data/chr/chr200.chr"
.incbin "data/chr/chr201.chr"
.incbin "data/chr/chr202.chr"
.incbin "data/chr/chr203.chr"
.incbin "data/chr/chr204.chr"
.incbin "data/chr/chr205.chr"
.incbin "data/chr/chr206.chr"
.incbin "data/chr/chr207.chr"

.segment "CHR26"
.incbin "data/chr/chr208.chr"
.incbin "data/chr/chr209.chr"
.incbin "data/chr/chr210.chr"
.incbin "data/chr/chr211.chr"
.incbin "data/chr/chr212.chr"
.incbin "data/chr/chr213.chr"
.incbin "data/chr/chr214.chr"
.incbin "data/chr/chr215.chr"

.segment "CHR27"
.incbin "data/chr/chr216.chr"
.incbin "data/chr/chr217.chr"
.incbin "data/chr/chr218.chr"
.incbin "data/chr/chr219.chr"
.incbin "data/chr/chr220.chr"
.incbin "data/chr/chr221.chr"
.incbin "data/chr/chr222.chr"
.incbin "data/chr/chr223.chr"

.segment "CHR28"
.incbin "data/chr/chr224.chr"
.incbin "data/chr/chr225.chr"
.incbin "data/chr/chr226.chr"
.incbin "data/chr/chr227.chr"
.incbin "data/chr/chr228.chr"
.incbin "data/chr/chr229.chr"
.incbin "data/chr/chr230.chr"
.incbin "data/chr/chr231.chr"

.segment "CHR29"
.incbin "data/chr/chr232.chr"
.incbin "data/chr/chr233.chr"
.incbin "data/chr/chr234.chr"
.incbin "data/chr/chr235.chr"
.incbin "data/chr/chr236.chr"
.incbin "data/chr/chr237.chr"
.incbin "data/chr/chr238.chr"
.incbin "data/chr/chr239.chr"

.segment "CHR30"
.incbin "data/chr/chr240.chr"
.incbin "data/chr/chr241.chr"
.incbin "data/chr/chr242.chr"
.incbin "data/chr/chr243.chr"
.incbin "data/chr/chr244.chr"
.incbin "data/chr/chr245.chr"
.incbin "data/chr/chr246.chr"
.incbin "data/chr/chr247.chr"

.segment "CHR31"
.incbin "data/chr/chr248.chr"
.incbin "data/chr/chr249.chr"
.incbin "data/chr/chr250.chr"
.incbin "data/chr/chr251.chr"
.incbin "data/chr/chr252.chr"
.incbin "data/chr/chr253.chr"
.incbin "data/chr/chr254.chr"
.incbin "data/chr/chr255.chr"
