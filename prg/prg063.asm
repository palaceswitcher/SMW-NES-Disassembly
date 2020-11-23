;this may or may not be the irq code
b63_sub00:
	PHP
	PHA
	TXA
	PHA
	TYA
	PHA
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
	LDA BGBank1		;Loads 1st 1K BG bank
	STA $9000		
	LDA BGBank2		;Loads 2nd 1K BG bank
	STA $9001
	LDA BGBank3		;Loads 3rd 1K BG bank
	STA $9002
	LDA $03CC
	STA $9003
	LDA SpriteBank1	;Loads 1st 1K sprite bank
	STA $9004
	LDA SpriteBank2	;Loads 2nd 1K sprite bank
	STA $9005
	LDA SpriteBank3	;Loads 3rd 1K sprite bank
	STA $9006
	LDA SpriteBank4	;Loads 4th 1K sprite bank
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
	BEQ b63_sub05
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
	BCC b63_sub01
	LDA PPUStatus
	LDA $0480
	ORA #$08
	STA PPUAddress
	LDA $0481
	STA PPUAddress
b63_sub02:
	LDA $0485
	STA PPUData
	INX
	CPX #$38
	BCC b63_sub02
	LDA PPUStatus
	LDA $00
	AND #$FB
	STA PPUControl
	LDA $04C1
	BEQ b63_sub04
	LDX #$00
b63_sub03:
	LDA PPUStatus
	LDA $04C1,X
	STA PPUAddress
	LDA $04C2,X
	STA PPUAddress
	LDA $04C3,X
	STA PPUData
	INX
	INX
	INX
	CPX #$30
	BCC b63_sub03
	LDA #$00
	STA $04C1
b63_sub04:
	LDA #$00
	STA $0480
	BEQ b63_sub06
	LDA $03A1
b63_sub05:
	BEQ b63_sub06
	JSR $F20F
b63_sub06:
	LDA $03E4
	BEQ b63_sub07
	JSR $F5CE
b63_sub07:
	LDA #$00
	STA PPUOAM
	LDA #$02
	STA OAMDMA
	LDA $01
	STA PPUMask
	LDA $02
	STA PPUScroll
	LDY $03
	LDA $0633
	BEQ b63_sub09
	CMP #$30
	BCC b63_sub08
	LDA #$00
	STA $0633
b63_sub08:
	BEQ b63_sub09
	INC $0633
	LDA $06
	AND #$04
	BNE b63_sub09
	CPY #$EC
	BCS b63_sub09
	INY
	INY
	INY
	INY
b63_sub09:
	STY PPUScroll
	LDA $00
	AND #$FC
	ORA $5B
	STA $00
	STA PPUControl
	JSR $F6E0
	LDA BGBank1		;Loads 1st 1K BG bank
	STA $9000		
	LDA BGBank2		;Loads 2nd 1K BG bank
	STA $9001
	LDA BGBank3		;Loads 3rd 1K BG bank
	STA $9002
	LDA $03CC
	STA $9003
	LDA SpriteBank1	;Loads 1st 1K sprite bank
	STA $9004
	LDA SpriteBank2	;Loads 2nd 1K sprite bank
	STA $9005
	LDA SpriteBank3	;Loads 3rd 1K sprite bank
	STA $9006
	LDA SpriteBank4	;Loads 4th 1K sprite bank
	STA $9007
	JSR $F7DA
	JSR $F19F
	LDA #$3A
	STA $8000
	LDA #$3B
	STA $8001
	JSR $85BE
	JSR $862A
	LDA #$00
	STA $3C
	INC $06
	PLA
	TAY
	PLA
	TAX
	PLA
	PLP
	RTI
	SEI
	CLD
	LDX #$FF
	TXS
	LDA #$00
	STA $C002
	STA PPUMask
	STA PPUControl
	LDX #$02
b63_sub10:
	BIT PPUStatus
	BPL b63_sub10
b63_sub11:
	BIT PPUStatus
	BMI b63_sub11
	DEX
	BNE b63_sub10
	LDA #$3E
	STA $8002
	LDA #$3F
	STA $8003
	LDA #$85
	STA $C001
	LDA #$3E
	STA $D000
	LDA #$00
	STA $B000
	LDA #$01
	STA $B001
	LDA #$02
	STA $B002
	LDA #$03
	STA $B003
	LDA #$00
	STA $C006
	STA $D002
	STA $D003
	LDA #$01
	STA $D001
	LDA #$0F
	STA APUStatus
	LDA #$00
	STA DMCFrequency
	LDA #$40
	STA Joy2Frame
	STA $C002
	LDA PPUStatus
	LDA #$10
	TAX
;b63_sub12:
	;---e202