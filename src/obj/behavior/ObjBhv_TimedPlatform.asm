.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xFA
obj0xFA:
	LDX $A4
	objDistCalc bra5_9792

bra5_9792:
	LDA objVar,X
	BMI bra5_979A
	JMP loc5_97D3
bra5_979A:
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	SEC
	SBC #$08
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	LDY #$01
	LDA objSlot,X
	AND #$FE
	CMP #$FE
	BNE bra5_97CE
	LDY #$04
bra5_97CE:
	TYA
	STA enemyAnimFrame,X
	RTS
loc5_97D3:
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_97F0,Y
	CMP #$FF
	BNE bra5_97E3
	RTS
bra5_97E3:
	ASL
	TAY
	JSR jmp_54_B896
	LDA #$DA
	STA $25
	JSR objCollAsPlatform
	RTS
tbl5_97F0:
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
