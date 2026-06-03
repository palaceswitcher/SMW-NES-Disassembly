.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xC0
obj0xC0:
	LDX $A4
	LDA objVar,X
	CMP #$80
	BEQ bra4_8488
	JMP loc4_84F6
bra4_8488:
	CMP #$80
	BEQ bra4_848F
	JMP sub_54_B4FC ; unlogged
bra4_848F:
	objDistCalc bra4_84F3

bra4_84F3:
	JMP objFacePlayer
loc4_84F6:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra4_8560

bra4_8560:
	LDA objFlags,X
	AND #%00011111
	ASL
	TAY
	LDA tbl4_8574,Y
	STA $32
	LDA tbl4_8574+1,Y
	STA $33
	JMP ($32)
tbl4_8574:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_857E
	.word objFlipKill
ptr9_857E:
	JSR sub4_85B9
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #SFX_ENEMYHIT2
	STA sndSfx
	LDA objSlot,X
	CLC
	ADC #$02
	CMP #$D0
	BCC bra4_85B0
	LDA #$81
	STA objVar,X
	RTS
bra4_85B0:
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_85B9:
	LDA objVar,X
	CMP #$11
	BCC bra4_85CA
	JSR sub3_B057
	BEQ bra4_85CA
	LDA #$01
	STA objVar,X
bra4_85CA:
	LDA objFrameCount
	AND #$00
	BNE bra4_85E2
	LDA #$81
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8000
bra4_85E2:
	LDA objVar,X
	CMP #$11
	BCS bra4_8611
	LDA objFlags,X
	AND #OBJFLAG_VERT
	BNE bra4_8610_RTS
	LDA objVar,X
	BNE bra4_8610_RTS
	LDA objYDistHi,X
	BPL bra4_85FD
	JMP loc4_8631
bra4_85FD:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
bra4_8610_RTS:
	RTS
bra4_8611:
	LDA objFrameCount
	AND #$1E
	BNE bra4_863F_RTS
	LDA objYDistHi,X
	BPL bra4_8631
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	RTS
bra4_8631:
loc4_8631:
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
bra4_863F_RTS:
	RTS
