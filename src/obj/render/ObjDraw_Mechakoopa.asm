.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9349
ptr6_9349:
	LDX $A4
	LDA objVar,X
	AND #$06
	LSR
	ASL
	TAX
	LDA tbl8_9395,X
	STA $32
	LDA tbl8_9395+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_936A
	LDY #$C0
bra8_936A:
	STY $36
	LDA objFlags,X
	AND #$40
	STA objAttrs
.export loc8_9374
loc8_9374:
	LDA $06E1
	PHA
	LDA prgDataBank2
	CMP #$26
	BNE bra8_938D
	LDY #$00
	LDA objYLo,X
	CMP #$A0
	BCC bra8_938A
	LDY #$20
bra8_938A:
	STY $06E1
bra8_938D:
	JSR jmp_54_A118
	PLA
	STA $06E1
	RTS
