.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8897
ptr6_8897:
	LDX $A4
	LDY #$08
	LDA objVar,X
	SEC
	SBC #$09
	BCC bra9_88A9
	CMP #$04
	BCS bra9_88A9
	LDY #$04
bra9_88A9:
	STY $25
	LDY #$02
	LDA objFrameCount
	AND $25
	BEQ bra9_88B6
	LDY #$03
bra9_88B6:
	LDA objFlags,X
	AND #$C0
	ORA #$80
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8915+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_88DA
	LDY #$C0
bra9_88DA:
	STY $36
	JSR jmp_54_A118
	RTS
