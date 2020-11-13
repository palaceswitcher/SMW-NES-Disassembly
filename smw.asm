;---------------------------------------------------
.db "NES", $1A     ; Header
.db 32             ; 32 x 16k PRG banks
.db 32             ; 32 x 8k CHR banks
.db $A1, $50	   ; Mapper: 90
.dsb 8, $00
;--------------------------------------

;Here are some defines

;sound effect defines
sfx_SpinJump = $01
sfx_Pause = $02
sfx_Jump = $03
sfx_Swim = $04
sfx_YoshiCoin = $06
sfx_1up = $07
sfx_Coin = $08
sfx_Powerup = $09
sfx_Warp = $0a
sfx_BlockRelease = $0b
sfx_PowerDown = $0c
sfx_YoshiMount = $0d
sfx_Feather = $0e
sfx_Thud = $0f
sfx_Thunder? = $10
sfx_EnemyHit1 = $11
sfx_EnemyHit2 = $12
sfx_EnemyHit3 = $13
sfx_EnemyHit4 = $14
sfx_EnemyHit5 = $15
sfx_EnemyHit6 = $16
sfx_EnemyHit7 = $17
sfx_EnemyHit8 = $18
sfx_YoshiTongue = $19
sfx_YoshiSwallow = $1a
sfx_YoshiFireSpit = $1b
sfx_Checkpoint = $1c
sfx_Cutter = $1d

;music defines
mus_Title = $20
mus_GameOver = $21
mus_Death = $22
mus_Victory = $23
mus_MainMap = $24
mus_YoshisIsland = $25
mus_ValleyofBowser = $26
mus_VanillaDome = $27
mus_ForestofIllusion = $28
mus_Overworld = $29
mus_Underground = $2a
mus_GhostHouse = $2b
mus_Castle = $2c
mus_Underwater = $2d
mus_Ending = $2f

;ram defines
PlayerXScreen = $0E
PlayerXPosition = $0F
Music = $8E
SFX = $8F
Event = $DF
GameState = $DE
GameType = $035F
PlayerCHRBank = $03C7
PlayerState = $0624
ItemBox = $0625
MusicSpeed = $072C
;hardware ram defines
PPUControl = $2000
PPUMask = $2001
PPUStatus = $2002
PPUScroll = $2005
PPUAddress = $2006
PPUData = $2007

;--------------------------------------
;data chunks---
;use a hex editor if you want to edit
;these
.incbin levels/levels.bin
.incbin tilesets/tilesets.bin
;--------------------------------------
;PRG banks

.incbin prg/prg036.bin
;48010 - 4a00f
;sprite animation stuff

.incbin prg/prg037.bin
;4a010 - 4c00f
;unknown atm 

.incbin prg/prg038.bin
;4c010 - 4e00f

.incbin prg/prg039.bin
;4e010 - 5000f

.incbin prg/prg040.bin
;50010 - 5200f

.incbin prg/prg041.bin
;52010 - 5400f

.incbin prg/prg042.bin
;54010 - 5600f

.incbin prg/prg043.bin
;56010 - 5800f

.incbin prg/prg044.bin
;58010 - 5a00f

.incbin prg/prg045.bin
;5a010 - 5c00f

.incbin prg/prg046.bin
;5c010 - 5e00f

.incbin prg/prg047.bin
;5e010 - 6000f

.incbin prg/prg048.bin
;60010 - 6200f

.incbin prg/prg049.bin
;62010 - 6400f

.incbin prg/prg050.bin
;64010 - 6600f

.incbin prg/prg051.bin
;66010 - 6800f

.incbin prg/prg052.bin
;68010 - 6a00f

.incbin prg/prg053.bin
;6a010 - 6c00f

.incbin prg/prg054.bin
;6c010 - 6e00f

.incbin prg/prg055.bin
;6e010 - 7000f

.incbin prg/prg056.bin
;70010 - 7200f

.incbin prg/prg057.bin
;72010 - 7400f

.incbin prg/prg058.bin
;74010 - 7600f

.incbin prg/prg059.bin
;76010 - 7800f

.incbin prg/prg060.bin
;78010 - 7a00f

.incbin prg/prg061.bin
;7a010 - 7c00f

.incbin prg/prg062.bin
;7c010 - 7e00f

.incbin prg/prg063.bin
;7e010 - 8000f

;--------------------------------------

;vectors:	.dw IRQ

.incbin SMW.chr