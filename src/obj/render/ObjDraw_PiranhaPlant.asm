.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_884B
ptr6_884B:
	LDX $A4
	LDA objVar,X
	BPL bra8_8853
	RTS
bra8_8853:
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA tbl8_887F,X
	STA $32
	LDA tbl8_887F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8874
	LDY #$C0
bra8_8874:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
