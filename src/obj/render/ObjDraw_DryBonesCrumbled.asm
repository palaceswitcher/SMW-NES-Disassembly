.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr7_9A87
ptr7_9A87:
	LDY #$00
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA objVar,X
	CMP #$1D
	BCC bra9_9AA2
	LDY #$01
	CMP #$31
	BCC bra9_9AA2
	LDY #$02
bra9_9AA2:
	TYA
	ASL
	TAX
	LDA tbl9_9AC2,X
	STA $32
	LDA tbl9_9AC2+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9ABC
	LDY #$C0
bra9_9ABC:
	STY $36
	JSR jmp_54_A118
	RTS
