b53_sub00:
	LDA $05F2
	SEC
	SBC PlayerXPos2
	STA $05F9
	LDA $05F3
	SBC PlayerXScreen2
	STA $05FA
	BEQ b53_sub01
	CMP #$FF
	BEQ b53_sub01
	RTS
b53_sub01:
	LDA $05F4
	SEC
	SBC PlayerYPos2
	STA $05FB
	LDA $05F5
	SBC PlayerYScreen2
	STA $05FC
	LDA PlayerYScreen2
	CMP $05F5
	BEQ b53_sub03
	LDA $05FC
	BPL b53_sub02
	LDA $05FB
	CLC
	ADC #$10
	STA $05FB
	LDA $05FC
	ADC #$00
	STA $05FC
	JMP b53_sub03
b53_sub02:
	LDA $05FB
	SEC
	SBC #$10
	STA $05FB
	LDA $05FC
	SBC #$00
	STA $05FC
b53_sub03:
	LDA $05F1
	AND #$7F
	ASL
	TAY
	LDA b53_sub04,Y
	STA $32
	LDA b53_sub05,Y
	STA $33
	JMP ($0032)
b53_sub04:
	.hex $78
b53_sub05:
	.hex $80, $79, $80, $AB, $80, $50, $81, $97, $81, $60
	LDA $06
	AND #$07
	BNE b53_sub06
	LDA $05F6
	AND #$0F
	TAX
	LDA b53_sub08,X
	BMI b53_sub07
	STA $05F8
	INC $05F6
b53_sub06:
	RTS
b53_sub07:
	INC $05F1
	LDA $05F6
	AND #$F0
	STA $05F6
	LDA #$00
	STA FreezeFlag
	RTS
b53_sub08:
	.hex $00, $01, $00, $01, $02, $03, $02, $03, $80
	LDX $05F6
	LDA $813c,X
	CMP #$02
	BNE b53_sub09
	JSR $B758
	BNE b53_sub09
	LDA #$04
	STA $05F1
	LDA #$00
	STA $05F7
	RTS
b53_sub09:
	JSR $820C
	LDA $06
	AND #$03
	BEQ b53_sub10
	RTS
b53_sub10:
	LDA $05F6
	AND #$0F
	TAY 
	LDA b53_sub16,Y
	BPL b53_sub11
	LDA $05F6
	AND #$F0
	STA $05F6
	LDY #$00
	LDA b53_sub16
b53_sub11:
	LDX $0621
	CPX #$01
	BEQ b53_sub12
	LDA #$09
b53_sub12:
	STA $05F8
	LDA $813c,Y
	BMI b53_sub14
	CLC
	ADC $05F4
	STA $05F4
	BCS b53_sub13
	CMP #$F0
	BCC b53_sub15
b53_sub13:
	CLC
	ADC #$10
	STA $05F4
	INC $05D5
	JMP b53_sub15
b53_sub14:
	CLC
	ADC $05F4
	STA $05F4
	BCS b53_sub15
	SEC
	SBC #$10
	STA $05F4
	DEC $05F5
b53_sub15:
	INC $05F6
	RTS
b53_sub16:
	;[data values here]