.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9980
ptr6_9980:
	LDX $A4
	LDA objVar,X
	CMP #$40
	BCS bra9_9995
	LDY #$00
	LDA frameCount
	AND #$10
	BEQ bra9_99A2
	LDY #$01
	BNE bra9_99A2
bra9_9995:
	LDY #$00
	SEC
	SBC #$43
	BCC bra9_99A2
	CMP #$03
	BCS bra9_99A2
	LDY #$02
bra9_99A2:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_99CA,X
	STA $32
	LDA tbl9_99CA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_99C4
	LDY #$C0
bra9_99C4:
	STY $36
	JSR jmp_54_A118
	RTS
