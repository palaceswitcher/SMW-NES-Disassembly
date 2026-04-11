.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x30
obj0x30:
	LDX $A4
	LDA objVar,X
	BPL bra8_9063
	objDistCalc bra8_905F

bra8_905F:
	JSR objFacePlayer
	RTS
bra8_9063:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra8_90CD

bra8_90CD:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_90E1,Y
	STA $32
	LDA tbl8_90E1+1,Y
	STA $33
	JMP ($32)
tbl8_90E1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_90EB
	.word objFlipKill
ptr3_90EB:
	LDA objSlot,X
	AND #$FE
	CMP #$52
	BEQ bra8_910B
	LDA objSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA frameCount
	AND #$00
	BNE bra8_910B
	LDA $25
	JSR jmp_54_B11D
bra8_910B:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JSR jmp_54_BF74
	RTS
