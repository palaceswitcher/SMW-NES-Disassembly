.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; VOLCANO LOTUS UPPER LEFT POLLEN CODE ($8D52)
;----------------------------------------
.export obj0x26
obj0x26:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra8_8DBC

bra8_8DBC:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8DD0,Y
	STA $32
	LDA tbl8_8DD0+1,Y
	STA $33
	JMP ($32)
tbl8_8DD0:
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8E0E
ptr3_8DDA:
	LDA objSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA frameCount
	AND #$03
	BNE bra8_8DF1
	LDA $25
	JSR parseMovementData
bra8_8DF1:
	LDA objYLo,X
	CMP #$E0
	BCC bra8_8E04
	LDA #$00
	STA objSlot,X
	STA objFlags,X
	STA objVar,X
	RTS
bra8_8E04:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
ptr3_8E0E:
	LDA #$00
	STA objSlot,X
	STA objFlags,X
	RTS
