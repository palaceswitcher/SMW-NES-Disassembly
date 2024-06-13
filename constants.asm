;Button bits
buttonA = %10000000
buttonB = %01000000
buttonSelect = %00100000
buttonStart= %00010000
dirUp = %00001000
dirDown = %00000100
dirLeft = %00000010
dirRight = %00000001

;Sound effect IDs
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

;Music IDs
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
musSilence = $2E
musEnding = $2F

;Music Note IDs
NRest = $00
C1 = $0C
C#1 = $0D
D1 = $0E
D#1 = $0F
E1 = $10
F1 = $11
F#1 = $12
G1 = $13
G#1 = $14
A1 = $15
A#1 = $16
B1 = $17
C2 = $18
C#2 = $19
D2 = $1A
D#2 = $1B
E2 = $1C
F2 = $1D
F#2 = $1E
G2 = $1F
G#2 = $20
A2 = $21
A#2 = $22
B2 = $23
C3 = $24
C#3 = $25
D3 = $26
D#3 = $27
E3 = $28
F3 = $29
F#3 = $2A
G3 = $2B
G#3 = $2C
A3 = $2D
A#3 = $2E
B3 = $2F
C4 = $30
C#4 = $31
D4 = $32
D#4 = $33
E4 = $34
F4 = $35
F#4 = $36
G4 = $37
G#4 = $38
A4 = $39
A#4 = $3A
B4 = $3B
C5 = $3C
C#5 = $3D
D5 = $3E
D#5 = $3F
E5 = $40
F5 = $41
F#5 = $42
G5 = $43
G#5 = $44
A5 = $45
A#5 = $46
B5 = $47
C6 = $48
C#6 = $49
D6 = $4A
D#6 = $4B
E6 = $4C
F6 = $4D
F#6 = $4E
G6 = $4F
G#6 = $50
A6 = $51
A#6 = $52
B6 = $53
C7 = $54
;Music Commands
NLen = $80
SegCall = $F0
SegEnd = $F1
SongLoop = $f2
SongLoopEnd = $f3
SongJump = $F4
SongSpeed = $F5	;Equivalent to Famitracker speed
Transpose = $F6
VolSet = $F8
DutySet = $F9
PitchSet = $FA

; DMC Bank $28
.enum 0
; 0/$200
Bb_DIM_DOWN:	.dsb $ab
Bb_DIM_DOWN_END:
	.dsb $1
; $ac/$2000
C_5Min7_LD:	.dsb $88
C_5Min7_LD_END:
; $134/$200
UC#4:		.dsb $3f
UC#4_END:
	.dsb $1
; $174/$200
UD4:		.dsb $3c
UD4_END:
; $1b0/$200
F_MAJ_DOWN:	.dsb $38
F_MAJ_DOWN_END:
; $1e8/$200
G_MIN_UP_FI:	.dsb $12
G_MIN_UP_FI_END:
; $1fc/$200
.ende
; DMC Bank $3C
.enum 0
; 0/$200
UD#4:		.dsb $38
UD#4_END:
; $38/$200
G_MIN_DOWN_FI:	.dsb $37
G_MIN_DOWN_FI_END:
	.dsb 1
; $70/$200
G_MIN_DOWN_SI:	.dsb $37
G_MIN_DOWN_SI_END:
	.dsb 1
; $a8/$200
Ab_MAJ_DOWN:	.dsb $37
Ab_MAJ_DOWN_END:
	.dsb 1
; $e0/$200
A_MIN_DOWN:	.dsb $37
A_MIN_DOWN_END:
	.dsb 1
; $118/$200
Bb_MAJ_DOWN:	.dsb $37
Bb_MAJ_DOWN_END:
	.dsb 1
; $150/$200
B_DIM_DOWN:	.dsb $37
B_DIM_DOWN_END:
	.dsb 1
; $188/$200
C_7_DOWN:	.dsb $37
C_7_DOWN_END:
	.dsb 1
; $1c0/$200
Ab_DIM_DOWN:	.dsb $37
Ab_DIM_DOWN_END:
; $1f7/$200
.ende

; DMC Bank $3e
.enum 0
; $0/$200
G_SUS_DOWN:	.dsb $37
G_SUS_DOWN_END:
	.dsb 1
; $38/$200
UE4:		.dsb $35
UE4_END:
	.dsb 3
; $70/$200
UF4:		.dsb $32
UF4_END:
	.dsb 2
; $a4/$200
UF#4:		.dsb $2f
UF#4_END:
	.dsb 1
; $d4/$200
UG4:		.dsb $2d
UG4_END:
	.dsb 3
; $104/$200
UG#4:		.dsb $2a
UG#4_END:
	.dsb 2
; $130/$200
UA4:		.dsb $28
UA4_END:
; $158/$200
G_MIN_UP_SI:	.dsb $12
G_MIN_UP_SI_END:
	.dsb 2
; $16c/$200
Ab_MAJ_UP:	.dsb $12
Ab_MAJ_UP_END:
	.dsb 2
; $180/$200
A_MIN_UP:	.dsb $12
A_MIN_UP_END:
	.dsb 2
; $194/$200
C_7_UP:	.dsb $12
C_7_UP_END:
	.dsb 2
; $1a8/$200
C_MAJ_DOWN:	.dsb $12
C_MAJ_DOWN_END:
	.dsb 2
; $1bc/$200
C_MAJ_UP:	.dsb $12
C_MAJ_UP_END:
	.dsb 2
; $1d0/$200
F_MAJ_UP:	.dsb $12
F_MAJ_UP_END:
	.dsb 2
; $1e4/$200
Ab_DIM_UP:	.dsb $12
Ab_DIM_UP_END:
	.dsb 2
; $1f8/$200
.ende

; DMC Bank $34
.enum $f4
Bb_DIM_UP:	.dsb $11
Bb_DIM_UP_END:
	.dsb 3
Bb_MAJ_UP:	.dsb $11
Bb_MAJ_UP_END:
	.dsb 3
B_DIM_UP:	.dsb $11
B_DIM_UP_END:
	.dsb 3
G_SUS_UP:	.dsb $11
G_SUS_UP_END:
	.dsb 3
.ende

;Events
evt1_Default = $02
evt1_Door = $03
evt1_Death = $04
evt1_Cutscene = $05
evt1_LevelClear = $06
evt1_Peach = $09
evt1_EasterEgg = $0A
evt1_PipeEnterDown = $0B
evt1_PipeExitSide = $0C
evt1_PipeLevelEnter = $0D
evt1_PipeExitUp = $0E
evt1_PipeCannonEnter = $0F
evt1_PipeCannonLaunch = $10
evt1_PipeCannonEnter2 = $11
evt1_PipeCannonLaunch2 = $12
evt1_PipeEnterUp = $13