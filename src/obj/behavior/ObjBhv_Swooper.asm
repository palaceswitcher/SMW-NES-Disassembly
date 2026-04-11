.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x2E
obj0x2E:
	LDX $A4
	LDA objVar,X
	BMI bra8_8E5C
	JMP loc8_8EE9
bra8_8E5C:
	objDistCalc bra8_8EC0

bra8_8EC0:
	LDA objVar,X
	CMP #$80
	BNE bra8_8ED9
	LDA objXDistLo,X
	BPL bra8_8ED1
	EOR #$FF
	CLC
	ADC #$01
bra8_8ED1:
	CMP #$40
	BCS bra8_8ED8_RTS
	INC objVar,X
bra8_8ED8_RTS:
	RTS
bra8_8ED9:
	CMP #$81
	BNE bra8_8EE5
	LDA #$10
	STA sndSfx
	JSR objFacePlayer
	RTS
bra8_8EE5:
	JSR sub_54_B4FC
	RTS
loc8_8EE9:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra8_8F53

bra8_8F53:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8F67,Y
	STA $32
	LDA tbl8_8F67+1,Y
	STA $33
	JMP ($32)
tbl8_8F67:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_8F71
	.word objFlipKill
ptr3_8F71:
	LDA frameCount
	AND #$00
	BNE bra8_8F7C
	LDA #$1F
	JSR jmp_54_B11D
bra8_8F7C:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
	LDX $A4
	LDA #$82
	STA objVar,X
	RTS
