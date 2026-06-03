.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub9_8000
sub9_8000:
	LDX $A4
	LDA objVar,X
	AND #%01111111
	ASL
	TAY
	LDA objFlags,X
	AND #%00100000
	BNE bra9_8013
	JMP loc9_80A2 ; Jump if goomba is moving up

bra9_8013:
	JSR sub3_B077
	BNE bra9_8078
	LDA objVar,X
	AND #%01111111
	CMP #$07
	BCS bra9_8024 ; No goomba has more than 7 movement vectors
	INC objVar,X ; Go to next movement vector

bra9_8024:
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra9_8036
	LDA objYHi,X
	ADC #$00
	BPL bra9_803B
bra9_8036:
	LDA objYHi,X
	SBC #$00
bra9_803B:
	STA objYHi,X
	JSR sub3_B057
	BEQ bra9_804B
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra9_804B:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA objFlags,X
	AND #$40
	BEQ bra9_805C
	TYA
	EOR #$FF
	TAY
	INY
bra9_805C:
	TYA
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra9_806F
	LDA objXHi,X
	ADC #$00
	BPL bra9_8074
bra9_806F:
	LDA objXHi,X
	SBC #$00
bra9_8074:
	STA objXHi,X
	RTS

bra9_8078:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA objYLo,X
	SEC
	SBC $25
	BCS bra9_808E
	DEC objYHi,X
	SEC
	SBC #$10
bra9_808E:
	STA objYLo,X
	LDA objFlags,X
	AND #$C0
	STA objFlags,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS

loc9_80A2:
	INY
	LDA ($32),Y
	BMI bra9_80BD
	JSR sub3_B077
	BNE bra9_80BD
	LDA objFlags,X
	ORA #$20
	STA objFlags,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS

bra9_80BD:
	DEY
	JSR sub3_B057
	BEQ bra9_80CB
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra9_80CB:
	LDA objFlags,X
	AND #$40
	BEQ bra9_80DC
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc9_80DE
bra9_80DC:
	LDA ($32),Y
loc9_80DE:
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra9_80F0
	LDA objXHi,X
	ADC #$00
	BPL bra9_80F5
bra9_80F0:
	LDA objXHi,X
	SBC #$00
bra9_80F5:
	STA objXHi,X
	INY
	LDA ($32),Y
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra9_810D
	LDA objYHi,X
	ADC #$00
	BPL bra9_8112
bra9_810D:
	LDA objYHi,X
	SBC #$00
bra9_8112:
	STA objYHi,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra9_8127
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
	JMP loc9_8145
bra9_8127:
	AND #$F0
	BEQ bra9_8145
	LDA ($32),Y
	AND #$3F
	BNE bra9_813A
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra9_813A:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra9_8145:
loc9_8145:
	INC objVar,X
	RTS
