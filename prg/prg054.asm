b54_sub00:
	LDA $05f1
	BNE b54_sub01
	RTS
b54_sub01:
	LDA Event ;loads event state
	CMP #$04
	BEQ b54_sub02 ;if event is 04, branch
	LDA #$35
	STA $ac
	LDA $ac
	STA $8000
	LDA #$33
	STA $8003
	JSR $8000
	LDA #$3f
	STA $8003
	RTS
b54_sub02:
	LDA $05f2
	SEC
	SBC PlayerXPosition
	STA $05F9
	LDA $05F3
	SBC PlayerXScreen
	STA $05fa
	BEQ b54_sub03
	CMP #$ff
	BEQ b54_sub03
b54_sub03:
	LDA $05F4
	SEC
	SBC $11
	STA $05FB
	LDA $05F5
	SBC $10
	STA $05FC
	LDA $10
	CMP $05F5
	BPL $A07D
	LDA $05FC
	BPL b54_sub04
	LDA $05FB
	CLC
	ADC #$10
	STA $05FB
	LDA $05FC
	ADC #$00
	STA $05FC
	JMP $A07D
b54_sub04:
	LDA $05FB
	SEC
	SBC #$10
	STA $05FB
	LDA $05FC
	SBC #$00
	STA $05FC
	RTS
