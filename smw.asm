;--------------------------------------
.db "NES", $1A	   ; Header
.db 32			   ; 32 x 16k PRG banks
.db 32			   ; 32 x 8k CHR banks
.db $A1, $50	   ; Mapper: 90
.dsb 8, $00
;--------------------------------------
;defines

;sound effect IDs
sfxSpinJump = $01
sfxPause = $02
sfxJump = $03
sfxSwim = $04
sfxBeep = $05
sfxYoshiCoin = $06
sfx1up = $07
sfxCoin = $08
sfxPowerup = $09
sfxWarp = $0A
sfxBlockRelease = $0B
sfxPowerDown = $0C
sfxYoshiMount = $0D
sfxFeather = $0E
sfxThud = $0F
sfxThunder? = $10
sfxEnemyHit1 = $11
sfxEnemyHit2 = $12
sfxEnemyHit3 = $13
sfxEnemyHit4 = $14
sfxEnemyHit5 = $15
sfxEnemyHit6 = $16
sfxEnemyHit7 = $17
sfxEnemyHit8 = $18
sfxYoshiTongue = $19
sfxYoshiSwallow = $1A
sfxYoshiFireSpit = $1B
sfxCheckpoint = $1C
sfxCutter = $1D

;music IDs
musTitle = $20
musGameOver = $21
musDeath = $22
musVictory = $23
musMainMap = $24
musYoshisIsland = $25
musValleyofBowser = $26
musVanillaDome = $27
musForestofIllusion = $28
musOverworld = $29
musUnderground = $2A
musGhostHouse = $2B
musCastle = $2C
musUnderwater = $2D
musEnding = $2F

;general ram defines
PPUController = $01
PlayerXScreen = $0A
PlayerXPos = $0B
PlayerYScreen = $0C
PlayerYPos = $0D
PlayerXScreenDup = $0E
PlayerXPosDup = $0F
PlayerYScreenDup = $10
PlayerYPosDup = $11
PlayerSprXPos = $12
PlayerSprYPos = $13
PlayerXSpeed = $14
PlayerYSpeed = $15
PlayerAttributes = $19
PlayerSpriteAttributes = $1A	;not sure what else to call this
PlayerAnimation = $1B
PlayerAction = $1D
PCPointerLowerByte = $32
PCPointerUpperByte = $33
PlayerWidth = $3A
PlayerHeight = $3B
ObjectCount = $A3
BooBuddiesFlag = $C3
BooBuddiesXPos = $C4
BooBuddiesXScreen = $C5
BooBuddiesYPos = $C6
BooBuddiesYScreen = $C7
GameState = $DE
Event = $DF
SpriteMem = $0200
ButtonsHeld = $030A
ButtonsPressed = $030C
ScrollStatus = $0326
WorldSelectNum = $032F	;(this address has multiple different uses)
GameType = $035F
Player1Lives = $036A
Player2Lives = $036B
Player1YoshiCoins = $036C
Player2YoshiCoins = $036D
Player1Coins = $0376
Player2Coins = $0377
MapLevelID = $037F
UnlockNextLevel = $0397
CurrentPlayer = $0399
LevelID = $039C
LevelsCompleted = $039E
BGBank1 = $03C5
BGBank2 = $03CB
BGBank3 = $03C6
SpriteBank1 = $03C7
SpriteBank2 = $03C8
SpriteBank3 = $03C9
SpriteBank4 = $03CA
NextBGColumn = $0481
ObjectSlot = $0500
ObjectSlot2 = $0501
ObjectSlot3 = $0502
ObjectSlot4 = $0503
ObjectXPos = $0514
ObjectXPos2 = $0515
ObjectXPos3 = $0516
ObjectXPos4  = $0517
ObjectXScreen = $0528
ObjectXScreen2 = $0529
ObjectXScreen3 = $052A
ObjectXScreen4 = $052B
ObjectYPos = $053C
ObjectYPos2 = $053D
ObjectYPos3 = $053E
ObjectYPos4 = $053F
ObjectYScreen = $0550
ObjectYScreen2 = $0551
ObjectYScreen3 = $0552
ObjectYScreen4 = $0553
ObjectState = $0564
ObjectState2 = $0565
ObjectState3 = $0566
ObjectState4 = $0567
JYEasterEggInput = $05EF
BowserStatus = $05F7
InterruptMode = $0606
ScreenCount = $0610
BubbleFrequency = $061D
Player1YoshiStatus = $061F
Player2YoshiStatus = $0620
PlayerState = $0624
ItemBox = $0625
PlayerPowerupBuffer = $0626
ScreenShake = $0633
PSwitchFrameCount = $0634
PSwitchSeconds = $0635
PlayerCarryFlag = $0636
PlayerCarryFlag2 = $0637
InvincibilityTimer = $0638
XScroll = $063F
YScroll = $0640
EnemyAnimFrame = $0655
EnemyAnimFrame2 = $0656
EnemyAnimFrame3 = $0657
EnemyAnimFrame4 = $0658
ReznorsDefeated = $0666
ONOFFBlockFlag = $0668
GuidedObjStatus = $0669
GuidedObjStatus2 = $066A
GuidedObjStatus3 = $066B
GuidedObjStatus4 = $066C
FreezeFlag = $067D
CheckpointFlag = $06A2
BowserHits = $06E5
ClownCarFace = $06E8
PauseFlag = $0709

;music ram defines
MusicRegister = $8E
SFXRegister = $8F

Pulse1Transpose = $070D
Pulse1VolumeEnv = $0749
Pulse1Duty = $0759
Pulse1PitchSetting = $0761

Pulse2Transpose = $070E
Pulse2VolumeEnv = $074A
Pulse2Duty = $075A
Pulse2PitchSetting = $0762

TriangleTranspose = $070F
TriangleVolumeEnv = $074B
TrianglePitchSetting = $0763

NoiseVolumeEnv = $074C
NoisePitchSetting = $0764

MusicSpeed = $072C
TrianglePitchSetting = $0763

;hardware registers
PPUCtrl = $2000
PPUMask = $2001
PPUStatus = $2002
PPUOAMAddr = $2003
PPUOAMData = $2004
PPUScroll = $2005
PPUAddr = $2006
PPUData = $2007
Sq1Vol = $4000
Sq1Sweep = $4001
Sq1Lo = $4002
Sq1Hi = $4003
Sq2Vol = $4004
Sq2Sweep = $4005
Sq2Lo = $4006
Sq2Hi = $4007
TriLinear = $4008
TriLo = $400A
TriHi = $400B
NoiseVol = $400C
NoiseLo = $400E
NoiseHi = $400F
DMCFreq = $4010
DMCRaw = $4011
DMCStart = $4012
DMCLength = $4013
OAMDMA = $4014
APUStatus = $4015
Joy1 = $4016
Joy2Frame = $4017

;--------------------------------------
;data chunks---
;use a hex editor if you want to edit
;these
.incbin levels/levels.bin
.incbin tilesets/ts_levels.bin
;--------------------------------------
;PRG banks

.base $C000
.include prg/prg036.asm
.pad $E000
;48010 - 4a00f
;player mapping data

.base $8000
.include prg/prg037.asm
.pad $A000, $00
;4a010 - 4c00f
;code for various objects

.incbin prg/prg038.bin
;4c010 - 4e00f
;completely unused/padding data

.base $E000
.include prg/prg039.asm
;4e010 - 5000f
;collision code and tile behavior

.incbin prg/prg040.bin
;50010 - 5200f
;completely empty/unused

.base $A000
.include prg/prg041.asm
;52010 - 5400f
;title screen data and code

.base $8000
.include prg/prg042.asm
;54010 - 5600f
;data for various tilemaps

.base $8000
.include prg/prg043.asm
;56010 - 5800f
;bonus level tileset

.incbin prg/prg044.bin
;58010 - 5a00f
;title screen tileset data

.incbin prg/prg045.bin
;5a010 - 5c00f
;title screen level data

.incbin prg/prg046.bin
;5c010 - 5e00f
;overworld map tile data

.incbin prg/prg047.bin
;5e010 - 6000f
;sprite palette mappings

.base $8000
.include prg/prg048.asm
;60010 - 6200f
;more object code

.base $8000
.include prg/prg049.asm
;62010 - 6400f
;code for platforms and other objects

.base $8000
.include prg/prg050.asm
;64010 - 6600f
;object stuff

.incbin prg/prg051.bin
;66010 - 6800f
;movement data for various objects

.base $A000
.include prg/prg052.asm
;68010 - 6a00f
;sprite manager?

.base $8000
.include prg/prg053.asm
;6a010 - 6c00f

.base $A000
.include prg/prg054.asm
;6c010 - 6e00f

.base $8000
.include prg/prg055.asm
.pad $A000
;6e010 - 7000f
;more code for objects

.base $8000
.include prg/prg056.asm
;70010 - 7200f
;even more object code

.base $A000
.include prg/prg057.asm
;72010 - 7400f

.base $8000
.include prg/prg058.asm
;74010 - 7600f
;music data and sound driver

.incbin prg/prg059.bin
;76010 - 7800f
;more music data

.incbin prg/prg060.bin
;78010 - 7a00f

.base $A000
.include prg/prg061.asm
;7a010 - 7c00f
;level handling

.incbin prg/prg062.bin
;7c010 - 7e00f
;unknown/unlogged data

.base $E000
.include prg/prg063.asm
;7e010 - 8000f
;IRQ, game engine, etc.

;--------------------------------------
;CHR file

.incbin SMW.chr

;--------------------------------------