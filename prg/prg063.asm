;this may or may not be the irq code
b63_sub00:
	LDA $01
	STA PPUMask
	LDA $063F
	STA PPUScroll
	LDA $0640
	STA PPUScroll
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
	STA PPUControl
	JSR $F6E0
	LDA $03C5
	STA $9000
	LDA $03CB
	STA $9001
	LDA $03C6
	STA $9002
	LDA $03CC
	STA $9003
	LDA PlayerCHRBank
	STA $9004
	LDA $03C8
	STA $9005
	LDA $03C9
	STA $9006
	LDA $03CA
	STA $9007
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	JMP $EF10
	JMP $EFE0
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
	LDA $0480
	BEQ $E0E8
	LDA PPUStatus
	LDA $00
	ORA #$04
	STA PPUControl
	LDA PPUStatus
	LDA $0480
	STA PPUAddress
	LDA $0481
	STA PPUAddress
	LDX #$00
b63_sub01:
	LDA $0485,X
	STA PPUData
	INX
	CPX #$1E
	BCC $b63_sub01
	