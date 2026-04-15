.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8F90
ptr6_8F90:
	LDX $A4
	LDA objVar,X
	BPL bra8_8FA1
	LDY #$00
	CMP #$82
	BCC bra8_8FAB
	LDY #$02
	BNE bra8_8FAB
bra8_8FA1:
	LDY #$01
	LDA objFrameCount
	AND #$04
	BEQ bra8_8FAB
	INY
bra8_8FAB:
	TYA
	ASL
	TAX
	LDA sprTblSwooper,X
	STA $32
	LDA sprTblSwooper+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8FC5
	LDY #$C0
bra8_8FC5:
	STY $36
	LDA objFlags,X
	AND #$40
	STA objAttrs
	JSR jmp_54_A118
	RTS
