b54_sub00:
	LDA $05F1
	BNE b54_sub01
	RTS
b54_sub01:
	LDA Event
	CMP #$04
	BEQ b54_sub02
	LDA #$35
	STA $AC
	LDA $AC
	STA $8000
	LDA #$33
	STA $8003
	JSR $8000
	LDA #$3F
	STA $8003
	RTS
b54_sub02:
	LDA $05F2
	SEC
	SBC PlayerXPos2
	STA $05F9
	LDA $05F3
	SBC PlayerXScreen2
	STA $05FA
	BEQ b54_sub03
	CMP #$FF
	BEQ b54_sub03
	RTS
b54_sub03:
	LDA $05F4
	SEC
	SBC PlayerYPos2
	STA $05FB
	LDA $05F5
	SBC PlayerYScreen2
	STA $05FC
	LDA PlayerYScreen2
	CMP $05F5
	BEQ b54_sub05
	LDA $05FC
	BPL b54_sub04
	LDA $05FB
	CLC
	ADC #$10
	STA $05FB
	LDA $05FC
	ADC #$00
	STA $05FC
	JMP b54_sub05
b54_sub04:
	LDA $05FB
	SEC
	SBC #$10
	STA $05FB
	LDA $05FC
	SBC #$00
	STA $05FC
b54_sub05:
	RTS
	LDX #$00
b54_sub06:
	STX $A4
	LDA ObjectSlot,X	;loads into an available object slot
	BEQ b54_sub07
	LDA #$33
	STA $8003
	JSR b54_sub08
b54_sub07:
	LDX $A4
	INX
	CPX $a3
	BCC b54_sub05
	LDA #$3F
	STA $8003
	RTS
b54_sub08:
	LDY ObjectSlot
	BMI b54_sub09
	LDA $A3B5,Y
	BNE b54_sub10
b54_sub09:
	TYA
	SEC
	SBC #$80
	TAY
	LDA $A635,Y
b54_sub10:
	STA $AC
	LDA $AC
	STA $8000
	LDA ObjectSlot,X
	BMI b54_sub11
	ASL
	TAX
	LDA $a1b5,X
	STA $32
	LDA $a1b6,X
	STA $33
	JMP $0032
b54_sub11:
	ASL
	TAX
	LDA $a435,X
	STA $32
	LDA $a346,X
	STA $33
	JMP $0032
	RTS
	LDX #$00
b54_sub12:
	STX $A4
	LDA ObjectSlot,X
	BEQ b54_sub16
	LDX $A4
	LDA $0514,X
	SEC
	SBC PlayerXPos2
	STA $05A0,X
	LDA $0528,X
	SBC PlayerXScreen2
	STA $05B4,X
	STA $28
	BEQ b54_sub13
	CMP #$FF
	BEQ b54_sub13
	JMP $a6b5
b54_sub13:
	LDA $053C,X
	SEC
	SBC PlayerYPos2
	STA $05C8,X
	LDA $0550,X
	SBC PlayerYScreen2
	STA $05DC,X
	LDA PlayerYScreen2
	CMP $0550,X
	BEQ b54_sub15
	LDA $05DC,X
	BPL b54_sub14
	LDA $05C8,X
	CLC
	ADC #$10
	STA $05C8,X
	LDA $05DC,X
	ADC #$00
	STA $05DC,X
	JMP b54_sub15
b54_sub14:
	LDA $05C8,X
	SEC
	SBC #$10
	STA $05C8,X
	LDA $05DC,X
	SBC #$00
	STA $05DC,X
b54_sub15:
	LDA FreezeFlag
	BEQ b54_sub15
	RTS
b54_sub16:
	LDX $A4
	INX
	CPX $A3
	BCC b54_sub12
	RTS
	LDX #$00
b54_sub17:
	LDA ObjectSlot,X
	BEQ b54_sub18
	INX
	CPX $A3
	BCC b54_sub17
	RTS
b54_sub18:
	TXA
	TAY
	INY
b54_sub19:
	LDA ObjectSlot,X
	BEQ b54_sub20
	LDA $0514,Y
	STA $0514,X
	LDA $0528,Y
	STA $0528,X
	LDA $053C,Y
	STA $053C,X
	LDA $0550,Y
	STA $0550,X
	LDA ObjectSlot,Y
	LDA ObjectSlot,X
	LDA $0564,Y
	STA $0564,X
	LDA $0578,Y
	STA $0578,X
	LDA $058C,Y
	STA $058C,X
	LDA $0641,Y
	STA $0641,X
	LDA $0655,Y
	STA $0655,X
	LDA $0669,Y
	STA $0669,X
	LDA #$00
	STA ObjectSlot,Y
	INX
b54_sub20:
	INY
	CPY $A3
	BCC b54_sub19
	STX $A3
	RTS