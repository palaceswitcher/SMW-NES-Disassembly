.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9519
ptr6_9519:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objVar,X
	AND #$08
	BNE bra9_9536
	LDY #$01
	LDA objFrameCount
	AND #$04 ; Set animation speed to per 4 frames
	BNE bra9_9536
	INY
bra9_9536:
	TYA
	ASL
	TAX
	LDA tbl9_9556,X
	STA $32
	LDA tbl9_9556+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9550
	LDY #$C0
bra9_9550:
	STY $36
	JSR jmp_54_A118
	RTS
