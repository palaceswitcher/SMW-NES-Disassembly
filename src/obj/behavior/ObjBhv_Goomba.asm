.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x94
obj0x94:
	LDX $A4
	LDA objVar,X
	BPL bra9_85E0
	objDistCalc bra9_85DD

; Make goomba face player if bit 7 of variable is set
bra9_85DD:
	JMP objFacePlayer

bra9_85E0:
	LDA #$06
	STA $25 ; Swallow when eaten by yoshi
	LDX $A4
	objDistCalc bra9_864A

bra9_864A:
	LDA objFlags,X
	AND #%00011111
	ASL
	TAY
	LDA tbl9_865E,Y
	STA $32
	LDA tbl9_865E+1,Y
	STA $33
	JMP ($32)
tbl9_865E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck ; Check if eaten as a powerup?
	.word ptr2_8668 ; Collision handling
	.word objFlipKill ; Flip object when killed

ptr2_8668:
	JSR sub9_8698
	JSR objCollStompOrHurt ; Handle collision with the player
	JSR objKillOnSpinJump ; Kill if spinjumped on
	LDA #16
	STA playerYSpd ; Give player vertical speed boost
	LDA playerMoveFlags
	ORA #%00000100 ; Boost player upwards
	EOR #%00000001 ; Move player in opposite direction
	STA playerMoveFlags
	LDA #16
	STA playerXSpd ; Move player backwards a bit
	LDA #1
	JSR rewardPoints ; Reward 200 points
	LDA #SFX_ENEMYHIT2
	STA sndSfx ; Play hit sound
	LDX $A4
	INC objSlot,X
	INC objSlot,X ; Knock goomba over
	LDA #$80
	STA objVar,X ; Face the player
	RTS

sub9_8698:
	LDA objVar,X
	CMP #$03
	BCS bra9_86A2
	JMP loc9_86BB
bra9_86A2:
	LDA objFrameCount
	AND #$00
	BNE bra9_86BA_RTS
	LDA #$85 ; Hardcoded straight line movement
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86BA_RTS:
	RTS

loc9_86BB:
	LDA objFrameCount
	AND #$02
	BNE bra9_86D3_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86D3_RTS:
	RTS
