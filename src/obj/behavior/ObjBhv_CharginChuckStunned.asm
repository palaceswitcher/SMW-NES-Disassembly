.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"


.export obj0xC2
obj0xC2:
	LDX $A4
	LDA objVar,X
	BMI bra4_867F
	JMP loc4_86E6
bra4_867F:
	objDistCalc bra4_86E3

bra4_86E3:
	JMP objFacePlayer ; unlogged
loc4_86E6:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra4_8750

bra4_8750:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8764,Y
	STA $32
	LDA tbl4_8764+1,Y
	STA $33
	JMP ($32)
tbl4_8764:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_876E
	.word objFlipKill
.export ptr9_876E
ptr9_876E:
	JSR sub4_8778
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	RTS
sub4_8778:
	LDA objFlags,X
	AND #$20
	BEQ bra4_879A
	LDA objFrameCount
	AND #$00
	BNE bra4_8797
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8797:
	JMP loc4_87C7_RTS
bra4_879A:
	LDA objFrameCount
	AND #$02
	BNE bra4_87B2
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_87B2:
	LDA objVar,X
	CMP #$0E
	BCC bra4_87C7_RTS
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
bra4_87C7_RTS:
loc4_87C7_RTS:
	RTS
