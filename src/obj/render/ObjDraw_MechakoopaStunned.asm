.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_95B5
ptr6_95B5:
	LDX $A4
	LDA objStateTimer,X
	CMP #$D0
	BCC bra8_95C6
	LDA objFrameCount
	AND #$04
	BNE bra8_95C6
	RTS
bra8_95C6:
	LDA objSlot,X
	LSR
	SEC
	SBC #$1E
	TAY
	LDA objFlags,X
	AND #$1F
	CMP #$05
	BNE bra8_95DC
	TYA
	CLC
	ADC #$03
	TAY
bra8_95DC:
	TYA
	ASL
	TAX
	LDA tbl8_9612,X
	STA $32
	LDA tbl8_9612+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_95F6
	LDY #$C0
bra8_95F6:
	STY $36
	LDA objFlags,X
	BPL bra8_960A
	AND #$BF
	STA $34
	LDA playerMoveFlags
	AND #$40
	ORA $34
	STA objFlags,X
bra8_960A:
	AND #$40
	STA objAttrs
	JMP loc8_9374
