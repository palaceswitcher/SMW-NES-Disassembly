.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9279
ptr6_9279:
	LDX $A4
	LDA objVar,X
	BPL bra9_9281
	RTS
bra9_9281:
	CMP #$40
	BCS bra9_9291
	LDY #$00
	LDA frameCount
	AND #$10
	BEQ bra9_929B
	LDY #$01
	BNE bra9_929B
bra9_9291:
	SEC
	SBC #$40
	AND #$07
	TAY
	LDA tbl9_92C3,Y
	TAY
bra9_929B:
	LDA objFlags,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_92D0,X
	STA $32
	LDA tbl9_92D0+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_92BD
	LDY #$C0
bra9_92BD:
	STY $36
	JSR jmp_54_A118
	RTS
