.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; This is only used by the spring and P-Switch
.export ptr5_8695
ptr5_8695:
	LDA frameCount
	AND #$00
	BNE bra7_86A0
	LDA #$04
	JSR getMovementData
bra7_86A0:
	LDA objFlags,X
	AND #$20
	BEQ bra7_86F2_RTS
	LDA objXDistHi,X
	BPL bra7_86B9
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra7_86C0
	BCC bra7_86E0
bra7_86B9:
	LDA objXDistLo,X
	CMP #$10
	BCS bra7_86E0
bra7_86C0:
	LDA objYDistHi,X
	BEQ bra7_86D6
	CMP #$FF
	BNE bra7_86E0
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra7_86DD
	BCC bra7_86E0
bra7_86D6:
	LDA objYDistLo,X
	CMP #$00
	BCS bra7_86E0
bra7_86DD:
	CLC
	BCC bra7_86E1
bra7_86E0:
	SEC
bra7_86E1:
	BCS bra7_86F2_RTS
	LDA objFlags,X
	AND #$40
	ORA #$04
	STA objFlags,X
	LDA #$00
	STA objVar,X
bra7_86F2_RTS:
	RTS

