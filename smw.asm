; Disassembly of Super Mario World (Unl)

; This is still a work in progress and is not recommended for use in hacks.

; Assembles with morskoyzmey's fork of ASM6.

;----------------------------------------
.byte "NES", $1A	; NES Header
.byte 32			; 32 x 16k PRG banks
.byte 32			; 32 x 8k CHR banks
.byte $A1, $50		; Mapper: 90
.dsb 8, $00		; Header Tail
;----------------------------------------

; Constants
.include constants.asm

; Macros
.include macros.asm

; General RAM defines

; Game engine
ppuCtrlMirror = $00
ppuMaskMirror = $01
scrollX = $02
scrollY = $03
frameCount = $06
bank42Backup = $08
bank41Backup = $09
btnHeld = $030A
btnPressed = $030C
btnMirrored = $030E
controller2Input = $063E
secFrameCount = $0313
scratchRam = $2E
playerAnimPtr = $E5
nmiJmpOpcode = $063A
cameraXHi = $51
vertScrollFlag = $5B
tileRowCount = $B0
bgAttrRowCount = $B1
metaspriteRowAlignment = $B2
lvlObjSetPtr = $DC ; Object set for the current level
inLvlFlag = $DE
gameState = $DF
gameSubstate = $E0
playerState = $E1

bgCurPalette = $0310
fadeoutMode = $0311
palTransition = $0312
bgTileAttrs = $0400
tileColumnMem = $0485 ; TODO: Get a better name for this
palAssignPtr = $04C1
palAssignData = $04C3
ppuUpdatePtr = $03A1
ppuBufSize = $03A4
ppuDataBuf = $03A5

warpLvlNumber = $060B
warpNumber = $060C
vertScrollLock = $060D
horizScrollLock = $060F

; Sprite rendering variables
oamFreeIndex = $3C ; Free space index
metaspriteBankIndex = $36
metaspriteRelTile = $38
metaspriteColumnXBuf = $41
metaspriteRowYBuf = $B2
metaspriteColumnCount = $3E
metaspriteRowCount = $3F

gs0SpriteAnimPtr = $AE
gs0SpriteCount = $30
gs0chrSpriteBank = $31
gs0SpriteX = $41
gs0SpriteFrame = $B2
gs0SpriteSlot = $033B
gs0SpriteFlags = $034D
gs0SpriteY = $0356
titleDemoAction = $0365
titleJumpTimer = $0366
titleWalkTimer = $0367
curRleTilemap = $032F
rleRepeatCount = $3E
rleRepeatBytesLeft = $3E
numPlayers = $035F
hudUpdateTiles = $0378
hudUpdateState = $037D
hudDisplay = $0607
chrBgBank1 = $03C5
chrBgBank2 = $03CB
chrBgBank3 = $03C6
chrBgBank4 = $03CC ; Unused
chrBgBankAnimation = $03CD
chrSpriteBank1 = $03C7
chrSpriteBank2 = $03C8
chrSpriteBank3 = $03C9
chrSpriteBank4 = $03CA
prgDataBank1 = $04F3
prgDataBank2 = $04F5
worldNumber = $04F6
prgDataBank3 = $04F7
levelNumber = $04F7
levelScreenOrderPtr = $8C
xScroll = $063F
yScroll = $0640

playerXHi = $0A
playerXLo = $0B
playerYHi = $0C
playerYLo = $0D
playerXHiDup = $0E
playerXLoDup = $0F
playerYHiDup = $10
playerYLoDup = $11
playerSprX = $12
playerSprY = $13
playerXSpd = $14
playerXMoveVec = $28
playerYSpd = $15
playerYMoveVec = $2B

playerAnim = $16
playerAnimFrame = $17
playerMoveFlags = $19
playerPrevDirection = $4F
playerSprAttrs = $1A ; Not sure what else to call this
playerFramePtr = $1B
playerAction = $1D
playerPrevAction = $1E
playerClimbState = $49
playerSprXOfs = $1F
playerSprYOfs = $21
playerSpriteFlags = $23
playerMetaspriteHAlign = $28
playerMetaspriteVAlign = $2B
playerWidth = $3A
playerHeight = $3B
playerPalMappingLo = $C9
playerPalMappingHi = $CA
memJmpOpcode = $0600
memJmpPtr = $0601
playerCapeAction = $062C
playerAttrs = $06E0

playerBackColl = $96 ; TODO: Get a better name for this
playerScreenId = $99
playerCollXHi = $64
playerCollXLo = $65
playerCollYHi = $66
playerCollYLo = $67

fireballSlot = $062F
fireballSlot2 = $0630
usedFireballSlots = $0631

playerLives = $036A
playerDragonCoins = $036C
levelTimer = $036E
playerScores = $0372
playerCoins = $0376
playerStoredYoshi = $0393
curPlayer = $0399
playerHurtFlag = $05FD
playerActionFrameCount = $0611
playerActionTicks = $0612
swallowFrameCount = $0613
yoshiSwallowTimer = $0614
flightTakeoffTimer = $061C
playerYoshiState = $061F
yoshiExitStatus = $0620
yoshiIdleStorage = $0621
yoshiIdleMovement = $0622
yoshiTongueState = $0623
playerPowerup = $0624
playerItemBox = $0625
playerStoredPowerup = $06DA

shellHitCount = $4A
shellHitTimer = $4B

spriteMem = $0200
scrollSpd = $0326
logoFlag = $032D
logoXOffs = $0330
logoYOffs = $0331

overworldMapTimer = $032F
worldSelectNum = $032F
titleCursorY = $0357
playerTitleY = $0357
playerMapAnim = $0361
playerMapFrame = $0378
mapMoveFlag = $0379
mapLevelId = $037F
castlesDestroyed = $0380
timeUpFlag = $0398
mapScreen = $0390
worldSelectTrigger = $0396
unlockNextLevel = $0397
levelId = $039C
player1LevelsUnlocked = $039E
player2LevelsUnlocked = $039F
columnFinishFlag = $0480
nextBgColumn = $0481

; Object RAM

; Object handler
curObjPrgBank = $AC
objCount = $A3
objLowerSlot = $A4
objSlot = $0500
objXLo = $0514
objXHi = $0528
objYLo = $053C
objYHi = $0550
objFlags = $0564 ; Sometimes inconsistent, but generally consistent status bits
objVar = $0578
objXDistLo = $05A0
objXDistHi = $05B4
objYDistLo = $05C8
objYDistHi = $05DC
objAttrs = $05F0
objState = $0669 ; Object-specific states. Not used by all objects
objStateTimer = $0641
enemyAnimFrame = $0655
objFrameCount = $062B

; Special objects
bubbleX = $0619
bubbleY = $061A
bubbleSpawnPoint = $061B

booBuddiesFlag = $C3
booBuddiesX = $C4
booBuddiesXScreen = $C5
booBuddiesY = $C6
booBuddiesYScreen = $C7

yoshiUnmountedState = $05F1
yoshiXLo = $05F2
yoshiXHi = $05F3
yoshiYLo = $05F4
yoshiYHi = $05F5
yoshiAnim = $05F8
yoshiXDistLo = $05F9
yoshiXDistHi = $05FA
yoshiYDist = $05FB
yoshiYDistHi = $05FC

jyEasterEggInput = $05EF
bowserState = $05F7
interruptMode = $0606 ; TODO: Rename this
levelYScreenCount = $060E
levelXScreenCount = $0610
levelWaterFlag = $061D
levelVerticalScreenOffs = $04FA
lvlBottomScreenOffs = $04FB

playerPowerupBuffer = $0626
screenShake = $0633
pSwitchFrameCount = $0634
pSwitchTimer = $0635
playerHoldFlag = $0636
playerHoldFlag2 = $0637
invincibilityTimer = $0638
reznorsDefeated = $0666
switchBlockFlag = $0668
freezeFlag = $067D
checkpointFlag = $06A2
bowserHitCount = $06E5
endingFreezeFlag = $06E6
clownCarFace = $06E8
playerXMovementLocked = $06EF
pauseFlag = $0709

; Sound Driver RAM Defines
sndMusic = $8E ; ID of the music track being played
sndSfx = $8F ; ID of the sound effect being played
sndMusicBackup = $90
sndDataPtr = $FE
sndMuteFlag = $0700
sndCurChannelOffs = $070B
sndCurChannelPtrOffs = $070C
sndChannelPtrs = $0724
sndVolMacroPtrs = $0751
sndDutyMacroPtrs = $075D

sndMusicMacroPtrs = $0769
sndMusicVolRleCounters = $074D
sndSfxVolRleCounters = $07B1
sndFreeSfxChannels = $07C9

sndTranspose = $070D
sndChannelPitches = $0739
sndVolMacros = $0749
sndDutyMacros = $0759
sndPitchMacros = $0761

sndMusicSpeed = $072C

; Hardware registers
PPUCTRL = $2000
PPUMASK = $2001
PPUSTATUS = $2002
OAMADDR = $2003
OAMDATA = $2004
PPUSCROLL = $2005
PPUADDR = $2006
PPUDATA = $2007
SQ1_VOL = $4000
SQ1_SWEEP = $4001
SQ1_LO = $4002
SQ1_HI = $4003
SQ2_VOL = $4004
SQ2_SWEEP = $4005
SQ2_LO = $4006
SQ2_HI = $4007
TRI_LINEAR = $4008
TRI_LO = $400A
TRI_HI = $400B
NOISE_VOL = $400C
NOISE_LO = $400E
NOISE_HI = $400F
DMC_FREQ = $4010
DMC_RAW = $4011
DMC_START = $4012
DMC_LEN = $4013
OAMDMA = $4014
APUSTATUS = $4015
JOY1 = $4016
JOY2 = $4017

; Mapper-specific registers

; PRG banks
M90_PRG0 = $8000
M90_PRG1 = $8001
M90_PRG2 = $8002
M90_PRG3 = $8003

; CHR banks
M90_BG_CHR0 = $9000
M90_BG_CHR1 = $9001
M90_BG_CHR2 = $9002
M90_BG_CHR3 = $9003
M90_SP_CHR0 = $9004
M90_SP_CHR1 = $9005
M90_SP_CHR2 = $9006
M90_SP_CHR3 = $9007

; Nametable banks
M90_NT0 = $B000
M90_NT1 = $B001
M90_NT2 = $B002
M90_NT3 = $B003

; Multiplier
M90_MULTIPLICAND = $5800
M90_MULTIPLIER = $5801

; IRQ registers
M90_IRQ_MODE = $C001
M90_IRQ_DISABLE = $C002
M90_IRQ_ENABLE = $C003
M90_IRQ_PRESCALER = $C004
M90_IRQ_COUNTER = $C005
M90_IRQ_XOR = $C006

; Misc
M90_BANK_SIZE = $D000
M90_CHR_CTRL2 = $D001
M90_PPU_CFG = $D002
M90_CHR_CTRL1 = $D003

;--------------------------------------
; Level Data
; Levels
.incbin levels/lvl_1-1.bin
.incbin levels/lvl_1-2.bin
.incbin levels/lvl_1-3.bin
.incbin levels/lvl_1-4_1.bin ; 1-4 is split up by special levels
.incbin levels/lvl_GhostHouseIntro.bin
.incbin levels/lvl_CastleIntro.bin
.incbin levels/lvl_YoshiHouse.bin
.incbin levels/lvl_1-4_2.bin
.incbin levels/lvl_Bonus.bin
.incbin levels/lvl_2-1.bin
.incbin levels/lvl_2-2.bin
.incbin levels/lvl_2-3.bin
.incbin levels/lvl_2-4.bin
.incbin levels/lvl_3-1.bin
.incbin levels/lvl_3-2.bin
.incbin levels/lvl_3-3.bin
.incbin levels/lvl_3-4.bin
.incbin levels/lvl_4-1.bin
.incbin levels/lvl_4-2.bin
.incbin levels/lvl_4-3.bin
.incbin levels/lvl_4-4.bin
.incbin levels/lvl_5-1.bin
.incbin levels/lvl_5-2.bin
.incbin levels/lvl_5-3.bin
.incbin levels/lvl_5-4.bin
.incbin levels/lvl_6-1.bin
.incbin levels/lvl_6-2.bin
.incbin levels/lvl_6-3.bin
.incbin levels/lvl_6-4.bin
.incbin levels/lvl_7-1.bin
.incbin levels/lvl_7-2.bin
.incbin levels/lvl_7-3.bin
.incbin levels/lvl_7-4.bin
.incbin levels/lvl_BowserRoom.bin
.incbin levels/lvl_ClownCar.bin
; Tilesets
.incbin tilesets/ts_1-1.bin
.incbin tilesets/ts_1-2.bin
.incbin tilesets/ts_1-3.bin
.incbin tilesets/ts_1-4.bin
.incbin tilesets/ts_2-1.bin
.incbin tilesets/ts_2-2.bin
.incbin tilesets/ts_2-3.bin
.incbin tilesets/ts_2-4.bin
.incbin tilesets/ts_3-1.bin
.incbin tilesets/ts_3-2.bin
.incbin tilesets/ts_3-3.bin
.incbin tilesets/ts_3-4.bin
.incbin tilesets/ts_4-1.bin
.incbin tilesets/ts_4-2.bin
.incbin tilesets/ts_4-3.bin
.incbin tilesets/ts_4-4.bin
.incbin tilesets/ts_5-1.bin
.incbin tilesets/ts_5-2.bin
.incbin tilesets/ts_5-3.bin
.incbin tilesets/ts_5-4.bin
.incbin tilesets/ts_6-1.bin
.incbin tilesets/ts_6-2.bin
.incbin tilesets/ts_6-3.bin
.incbin tilesets/ts_6-4.bin
.incbin tilesets/ts_7-1.bin
.incbin tilesets/ts_7-2.bin
.incbin tilesets/ts_7-3.bin
.incbin tilesets/ts_7-4.bin
.incbin tilesets/ts_YoshiHouse.bin
.incbin tilesets/ts_Unused1.bin
.incbin tilesets/ts_GhostHouseIntro.bin
.incbin tilesets/ts_CastleIntro.bin

;--------------------------------------
; PRG banks

.base $C000
.include prg/prg036.asm
.pad $E000
; 48010 - 4a00f
; Player mapping data

.base $8000
.include prg/prg037.asm
.pad $A000, $00
; 4a010 - 4c00f
; Code for various objects

.base $8000
.include prg/prg038.asm
.pad $A000
; 4c010 - 4e00f
; Unknown/unused tileset data

.base $E000
.include prg/prg039.asm
.pad $E000+8192
; 4e010 - 5000f
; Collision code and tile behavior

.include prg/prg040.asm
; 50010 - 5200f
; Completely empty/unused

.base $A000
.include prg/prg041.asm
.pad $C000
; 52010 - 5400f
; Various Game Mode 0 stuff (Title, map, etc)

.base $8000
.include prg/prg042.asm
.pad $A000
; 54010 - 5600f
; 8x8 Tilemaps and Overworld Data

.base $8000
.include prg/prg043.asm
.pad $A000
; 56010 - 5800f
; Bonus level tileset

.base $8000
.include prg/prg044.asm
.pad $A000
; 58010 - 5a00f
; Title Screen/Map Tilesets

.base $8000
.include prg/prg045.asm
.pad $A000
; 5a010 - 5c00f
; Title screen level data

.base $8000
.include prg/prg046.asm
.pad $A000
; 5c010 - 5e00f
; Overworld Map Tile Data

.base $C000
.include prg/prg047.asm
.pad $E000
; 5e010 - 6000f
; Sprite palette mappings

.base $8000
.include prg/prg048.asm
.pad $A000
; 60010 - 6200f
; More object code

.base $8000
.include prg/prg049.asm
.pad $A000
; 62010 - 6400f
; Code for platforms and other objects

.base $8000
.include prg/prg050.asm
.pad $A000
; 64010 - 6600f
; Various objects

.base $E000
.include prg/prg051.asm
.pad $E000+8192
; 66010 - 6800f
; Movement data for various objects

.base $A000
.include prg/prg052.asm
.pad $C000
; 68010 - 6a00f
; sprite manager?

.base $8000
.include prg/prg053.asm
.pad $A000
; 6a010 - 6c00f
; Various objects

.base $A000
.include prg/prg054.asm
.pad $C000
; 6c010 - 6e00f
; Object handler

.base $8000
.include prg/prg055.asm
.pad $A000
; 6e010 - 7000f
; More code for objects

.base $8000
.include prg/prg056.asm
.pad $A000
; 70010 - 7200f
; Even more object code

.base $A000
.include prg/prg057.asm
.pad $C000
; 72010 - 7400f
; Player control code

.base $8000
.include prg/prg058_59.asm
.pad $C000
; 74010 - 7800f
; Music data and sound driver

.base $8000
.include prg/prg060.asm
; 78010 - 7a00f
; Unknown

.base $A000
.include prg/prg061.asm
.pad $C000
; 7a010 - 7c00f
; Level handling

.base $C000
.include prg/prg062.asm
.pad $E000
; 7c010 - 7e00f
; Bank 47 clone

.base $E000
.include prg/prg063.asm
.pad $FFFA
; 7e010 - 8000f
; IRQ, game engine, etc.

;--------------------------------------
; Interrupt vectors
.word nmiJmpOpcode
.word reset
.word irq

;--------------------------------------
; CHR file
.incbin SMW.chr

;--------------------------------------
