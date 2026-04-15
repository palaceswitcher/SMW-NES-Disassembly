.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9660
ptr6_9660:
	LDY $A4
	LDA objFlags,Y
	AND #$1F
	CMP #$04
	BEQ bra7_966F
	CMP #$06
	BNE bra7_968A
bra7_966F:
	LDA #$0C
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$80
	STA $05F0
	JSR jmp_54_A118
	RTS
bra7_968A:
	LDA #$02
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$00
	LDX $A4
	LDA objSlot,X
	CMP #$38
	BNE bra7_96B0
	LDA objFrameCount
	AND #$04
	BEQ bra7_96B0
	LDY #$40
bra7_96B0:
	STY $05F0
	JSR jmp_54_A118
	RTS
