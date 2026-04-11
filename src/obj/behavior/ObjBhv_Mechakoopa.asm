.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x3A
obj0x3A:
	LDX $A4
	LDA objVar,X
	BMI bra8_9189
	JMP loc8_9202
bra8_9189:
	LDA objYLo,X
	CLC
	ADC #$08
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
	objDistCalc bra8_91FE

bra8_91FE:
	JSR objFacePlayer
	RTS
loc8_9202:
	LDA objState,X
	BNE bra8_920A
	JMP loc8_9287
bra8_920A:
	CMP #$10
	BCC bra8_9214
	LDA #$00
	STA objState,X
	RTS
bra8_9214:
	INC objState,X
	LDA frameCount
	AND #$01
		BNE bra8_9222
	LDA #$4B
	JSR getMovementData
bra8_9222:
	objDistCalc bra8_9286_RTS

bra8_9286_RTS:
	RTS
loc8_9287:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra8_92F1

bra8_92F1:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9305,Y
	STA $32
	LDA tbl8_9305+1,Y
	STA $33
	JMP ($32)
tbl8_9305:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_930F
	.word objFlipKill
ptr3_930F:
	LDA frameCount
	AND #$00
	BNE bra8_931A
	LDA #$13
	JSR getMovementData
bra8_931A:
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
	LDA objVar,X
	AND #$06
	LSR
	TAY
	LDA tbl8_9345,Y
	CLC
	ADC objSlot,X
	STA objSlot,X
	LDA #$00
	STA objStateTimer,X
	STA objVar,X
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	RTS
tbl8_9345:
	.byte $02
	.byte $04
	.byte $06
	.byte $04
