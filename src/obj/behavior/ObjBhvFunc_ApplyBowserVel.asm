.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub_8E78
sub_8E78:
	LDA $06E3
	BMI bra_8E96
	; Apply positive vertical elocity
		CLC
		ADC objYLo,X
		STA objYLo,X
		BCS bra_8E8A
		CMP #$F0
		BCC loc_8EA8
	bra_8E8A:
		CLC
		ADC #$10
		STA objYLo,X
		INC objYHi,X
		JMP loc_8EA8
	
	; Apply negative vertical velocity
	bra_8E96:
		CLC
		ADC objYLo,X
		STA objYLo,X
		BCS loc_8EA8
		SEC
		SBC #$10
		STA objYLo,X
		DEC objYHi,X

	; Apply positive horizontal velocity 
	loc_8EA8:
		LDA $06E2
		PHA
		CLC
		ADC objXLo,X
		STA objXLo,X
		PLA
		BMI bra_8EBD
		LDA objXHi,X
		ADC #$00
		BPL bra_8EC2
	; Apply negative horizontal velocity
	bra_8EBD:
		LDA objXHi,X
		SBC #$00

bra_8EC2:
	STA objXHi,X
	LDA #$00
	STA $06E2
	STA $06E3
	RTS
