;disassembled by BZK 6502 Disassembler
tbl10_8000:
	.byte $00
tbl10_8001:
	.byte $81
	.byte $04
	.byte $81
	.byte $10
	.byte $81
	.byte $16
	.byte $81
	.byte $1C
	.byte $81
	.byte $24
	.byte $81
	.byte $40
	.byte $81
	.byte $46
	.byte $81
	.byte $4A
	.byte $81
	.byte $58
	.byte $81
	.byte $5C
	.byte $81
	.byte $76
	.byte $81
	.byte $80
	.byte $81
	.byte $8A
	.byte $81
	.byte $94
	.byte $81
	.byte $9C
	.byte $81
	.byte $A6
	.byte $81
	.byte $AC
	.byte $81
	.byte $C2
	.byte $81
	.byte $CD
	.byte $81
	.byte $D9
	.byte $81
	.byte $E3
	.byte $81
	.byte $ED
	.byte $81
	.byte $F7
	.byte $81
	.byte $FF
	.byte $81
	.byte $03
	.byte $82
	.byte $1F
	.byte $82
	.byte $2B
	.byte $82
	.byte $3B
	.byte $82
	.byte $41
	.byte $82
	.byte $45
	.byte $82
	.byte $49
	.byte $82
	.byte $4F
	.byte $82
	.byte $6F
	.byte $82
	.byte $75
	.byte $82
	.byte $7D
	.byte $82
	.byte $8D
	.byte $82
	.byte $91
	.byte $82
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $93
	.byte $82
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $9D
	.byte $82
	.byte $B5
	.byte $82
	.byte $BF
	.byte $82
	.byte $C9
	.byte $82
	.byte $D1
	.byte $82
	.byte $FD
	.byte $82
	.byte $1B
	.byte $83
	.byte $00
	.byte $81
	.byte $27
	.byte $83
	.byte $37
	.byte $83
	.byte $3F
	.byte $83
	.byte $43
	.byte $83
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $00
	.byte $81
	.byte $4F
	.byte $83
	.byte $5F
	.byte $83
	.byte $79
	.byte $83
	.byte $81
	.byte $83
	.byte $97
	.byte $83
	.byte $A1
	.byte $83
	.byte $B3
	.byte $83
	.byte $C7
	.byte $83
	.byte $0B
	.byte $84
	.byte $0F
	.byte $84
	.byte $13
	.byte $84
	.byte $25
	.byte $84
	.byte $2B
	.byte $84
	.byte $31
	.byte $84
	.byte $37
	.byte $84
	.byte $00
	.byte $81
	.byte $3D
	.byte $84
	.byte $4E
	.byte $84
	.byte $5E
	.byte $84
	.byte $62
	.byte $84
	.byte $6E
	.byte $84
	.byte $72
	.byte $84
	.byte $86
	.byte $84
	.byte $B0
	.byte $84
	.byte $B4
	.byte $84
	.byte $C0
	.byte $84
	.byte $00
	.byte $81
	.byte $CC
	.byte $84
	.byte $D0
	.byte $84
	.byte $DE
	.byte $84
	.byte $EE
	.byte $84
	.byte $08
	.byte $85
	.byte $20
	.byte $85
	.byte $28
	.byte $85
	.byte $3E
	.byte $85
	.byte $54
	.byte $85
	.byte $76
	.byte $85
	.incbin sound/instrument.bin
	LDA SFXRegister
	BMI bra10_85C4
	BNE bra10_85CE
bra10_85C4:
	LDA MusicRegister
	CMP $90
	BEQ bra10_85D5_RTS
	LDA MusicRegister
	STA $90
bra10_85CE:
	JSR sub10_8E2F
	LDA #$00
	STA SFXRegister
bra10_85D5_RTS:
	RTS
jmp_58_85D6:
	LDA #$0F
	STA $4015
	LDA #$00
	STA $4000
	STA $4004
	STA $4008
	STA $400C
	STA $4010
	LDA #$7F
	STA $4001
	STA $4005
	LDA #$00
	LDY #$D5
bra10_85F8:
	STA $0700,Y
	DEY
	BNE bra10_85F8
	LDA #$FF
	LDX #$04
bra10_8602:
	DEX
	STA $074D,X
	STA $07B1,X
	BNE bra10_8602
	LDX #$04
bra10_860D:
	DEX
	STA $0765,X
	STA $07C9,X
	BNE bra10_860D
	LDX #$02
bra10_8618:
	DEX
	STA $075B,X
	STA $07BF,X
	BNE bra10_8618
	LDX #$08
bra10_8623:
	DEX
	STA $0701,X
	BNE bra10_8623
	RTS
	LDA $0709
	BEQ bra10_8642
	LDA #$00
	STA $4015
	LDA #$07
	STA $4015
	JSR sub10_8C85
	JSR sub10_86E8
	JMP loc10_8671
bra10_8642:
	LDA #$0F
	STA $4015
loc10_8647:
	JSR sub10_8C85
	JSR sub10_86E8
	LDA #$00
	STA $070A
	STA $070B
	STA $070C
bra10_8658:
	JSR sub10_87A1
	JSR sub10_8B25
	INC $070A
	INC $070B
	INC $070C
	INC $070C
	LDX $070A
	CPX #$04
	BNE bra10_8658
loc10_8671:
	LDA #$10
	STA $070A
	LDA #$64
	STA $070B
	STA $070C
bra10_867E:
	JSR sub10_87A1
	JSR sub10_8B25
	INC $070A
	INC $070B
	INC $070C
	INC $070C
	LDX $070A
	CPX #$14
	BNE bra10_867E
	RTS
	TAY
	CPY #$01
	BNE bra10_86A2
	LDA #$00
	STA $4015
bra10_86A2:
	CPY #$F0
	BEQ bra10_86AB
	CPY #$F1
	BEQ bra10_86E0
	RTS
bra10_86AB:
	LDX #$00
	LDY #$00
	JSR sub10_8DD6
	LDA $FE
	AND #$F0
	ORA #$30
	STA $4000
	LDX #$01
	LDY #$02
	JSR sub10_8DD6
	LDA $FE
	AND #$F0
	ORA #$30
	STA $4004
	LDA #$00
	STA $4008
	LDA #$30
	STA $400C
	LDA #$FF
	STA $0709
	LDA #$0F
	STA $4015
bra10_86DF_RTS:
	RTS
bra10_86E0:
	LDA #$00
	STA $0709
	JMP loc10_8647
sub10_86E8:
	LDA $0700
	BEQ bra10_8706_RTS
	LDY #$00
bra10_86EF:
	LDA $0701,Y
	BMI bra10_8701
	TAX
	TYA
	PHA
	JSR sub10_8707
	PLA
	TAY
	LDA #$FF
	STA $0701,Y
bra10_8701:
	INY
	CPY #$08
	BNE bra10_86EF
bra10_8706_RTS:
	RTS
sub10_8707:
	TXA
	ASL
	TAX
	LDA tbl10_8E41,X
	STA $FE
	LDA tbl10_8E42,X
	STA $FF
	LDY #$00
loc10_8716:
	LDA ($FE),Y
	STA $070A
	TAX
	CPX #$FF
	BEQ bra10_86DF_RTS
	LDA $070A
	BMI bra10_872F
	STA $070B
	ASL
	STA $070C
	JMP loc10_8741
bra10_872F:
	AND #$7F
	CLC
	ADC #$64
	STA $070B
	TXA
	AND #$7F
	ASL
	CLC
	ADC #$64
	STA $070C
loc10_8741:
	LDX $070C
	INY
	LDA ($FE),Y
	STA $0724,X
	INY
	LDA ($FE),Y
	STA $0725,X
	INY
	TYA
	PHA
	LDY #$00
	LDA $070A
	BPL bra10_875C
	LDY #$64
bra10_875C:
	LDA $070A
	AND #$0F
	TAY
	LDA #$00
	STA $0731,X
	STA $0732,X
	LDX $070B
	LDA #$00
	STA Pulse1VolumeEnv,X
	LDA #$FF
	STA $074D,X
	CPY #$04
	BPL bra10_879C
	LDA #$00
	STA Pulse1PitchSetting,X
	LDA #$FF
	STA $0765,X
	CPY #$03
	BPL bra10_879C
	LDA #$00
	STA Pulse1Transpose,X
	CPY #$02
	BPL bra10_879C
	LDA #$00
	STA Pulse1Duty,X
	LDA #$FF
	STA $075B,X
bra10_879C:
	PLA
	TAY
	JMP loc10_8716
sub10_87A1:
	LDX $070C
	LDA $0724,X
	ORA $0725,X
	BEQ bra10_87DF_RTS
	LDA $0731,X
	BNE bra10_87DC
	LDA $0732,X
	BNE bra10_87C5
	JSR sub10_87E0
	LDX $070C
	LDY $070B
	LDA $072D,Y
	STA $0732,X
bra10_87C5:
	DEC $0732,X
	LDY $070A
	CPY #$04
	BMI bra10_87D4
	LDY #$64
	JMP loc10_87D6
bra10_87D4:
	LDY #$00
loc10_87D6:
	LDA MusicSpeed,Y
	STA $0731,X
bra10_87DC:
	DEC $0731,X
bra10_87DF_RTS:
	RTS
sub10_87E0:
loc10_87E0:
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	BPL bra10_8832
	TAX
	CPX #$F0
	BMI bra10_87FB
	JMP loc10_887F
bra10_87FB:
	AND #$7F
	BEQ bra10_8805
	LDX $070B
	STA $072D,X
bra10_8805:
	JSR sub10_8E20
	JMP loc10_87E0
	JSR sub10_8E20
	RTS
	LDX $060A
	BEQ bra10_881F_RTS
	LDX #$FF
bra10_8816:
	INX
	CMP tbl10_8820,X
	BNE bra10_8816
	LDA tbl10_8829,X
bra10_881F_RTS:
	RTS
tbl10_8820:
	.byte $03
	.byte $00
	.byte $06
	.byte $09
	.byte $0C
	.byte $12
	.byte $18
	.byte $24
	.byte $30
tbl10_8829:
	.byte $02
	.byte $03
	.byte $04
	.byte $06
	.byte $08
	.byte $0C
	.byte $10
	.byte $18
	.byte $20
bra10_8832:
	BNE bra10_883B
	JSR sub10_8E20
	JMP loc10_8A0A
	RTS
bra10_883B:
	PHA
	LDA $070A
	AND #$0F
	TAX
	PLA
	CPX #$03
	BEQ bra10_8866
	CPX #$04
	BNE bra10_884B
bra10_884B:
	LDX $070B
	CLC
	ADC Pulse1Transpose,X
	ASL
	TAY
	LDX $070C
	LDA tbl10_8EC0,Y
	STA $0739,X
	LDA tbl10_8EC1,Y
	STA $073A,X
	JMP loc10_8878
bra10_8866:
	TAX
	AND #$10
	BEQ bra10_8871
	TXA
	AND #$0F
	ORA #$80
	TAX
bra10_8871:
	TXA
	LDX $070C
	STA $0739,X
loc10_8878:
	JSR sub10_8A65
	JSR sub10_8E20
	RTS
loc10_887F:
	AND #$0F
	ASL
	TAY
	JSR sub10_8E20
	TYA
	TAX
	LDA tbl10_8895,X
	STA $FE
	LDA tbl10_8896,X
	STA $FF
	JMP ($FE)
tbl10_8895:
	.byte $B5
tbl10_8896:
	.byte $88
	.byte $CC
	.byte $88
	.byte $E6
	.byte $88
	.byte $12
	.byte $89
	.byte $3A
	.byte $89
	.byte $57
	.byte $89
	.byte $7A
	.byte $89
	.byte $E0
	.byte $87
	.byte $A1
	.byte $89
	.byte $BA
	.byte $89
	.byte $D3
	.byte $89
	.byte $27
	.byte $8A
	.byte $0B
	.byte $88
	.byte $FB
	.byte $87
	.byte $E0
	.byte $87
	.byte $EC
	.byte $89
	LDX $070C
	CLC
	LDA $0724,X
	ADC #$02
	STA $071C,X
	LDA $0725,X
	ADC #$00
	STA $071D,X
	JMP loc10_893D
	LDX $070C
	LDA $071C,X
	STA $0724,X
	LDA $071D,X
	STA $0725,X
	LDA #$00
	STA $071C,X
	STA $071D,X
	JMP loc10_87E0
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0710,X
	JSR sub10_8E20
	LDX $070C
	LDA $0724,X
	STA $0714,X
	LDA $0725,X
	STA $0715,X
	JMP loc10_87E0
	LDX $070B
	DEC $0710,X
	BEQ bra10_892C
	LDX $070C
	LDA $0714,X
	STA $0724,X
	LDA $0715,X
	STA $0725,X
	JMP loc10_87E0
bra10_892C:
	LDX $070C
	LDA #$00
	STA $0714,X
	STA $0715,X
	JMP loc10_87E0
loc10_893A:
	LDX $070C
loc10_893D:
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	STA $0724,X
	INY
	LDA ($FE),Y
	STA $0725,X
	JMP loc10_87E0
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	LDX $070A
	CPX #$04
	BMI bra10_8971
	LDY #$64
bra10_8971:
	STA MusicSpeed,Y
	JSR sub10_8E20
	JMP loc10_87E0
	LDA $070A
	AND #$0F
	TAX
	CPX #$03
	BPL bra10_899B
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	STA Pulse1Transpose,X
bra10_899B:
	JSR sub10_8E20
	JMP loc10_87E0
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_89B1
	JSR sub10_8E20
	JMP loc10_87E0
bra10_89B1:
	JSR sub10_8B0D
	STA Pulse1VolumeEnv,X
	JMP loc10_87E0
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BMI bra10_89CA
	JSR sub10_8E20
	JMP loc10_87E0
bra10_89CA:
	JSR sub10_8B0D
	STA Pulse1Duty,X
	JMP loc10_87E0
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_89E3
	JSR sub10_8E20
	JMP loc10_87E0
bra10_89E3:
	JSR sub10_8B0D
	STA Pulse1PitchSetting,X
	JMP loc10_87E0
	LDX $070C
	LDA #$00
	STA $0724,X
	STA $0725,X
	LDA $070A
	AND #$0F
	ASL
	TAX
	CLC
	ADC #$64
	TAY
	LDA #$FF
	STA $0742,X
	STA $0742,Y
loc10_8A0A:
	LDY $070B
	LDA $070A
	AND #$0F
	TAX
	LDA #$FF
	CPX #$04
	BPL bra10_8A26_RTS
	STA $074D,Y
	STA $0765,Y
	CPX #$02
	BPL bra10_8A26_RTS
	STA $075B,Y
bra10_8A26_RTS:
	RTS
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	JSR sub10_8E20
	LDX $070B
	LDA $0710,X
	BNE bra10_8A46
	LDY #$00
	LDA ($FE),Y
	STA $0710,X
bra10_8A46:
	DEC $0710,X
	BNE bra10_8A62
	LDX $070C
	LDA $0724,X
	CLC
	ADC #$02
	STA $0724,X
	LDA $0725,X
	ADC #$00
	STA $0725,X
	JMP loc10_87E0
bra10_8A62:
	JMP loc10_893A
sub10_8A65:
	LDX $070C
	LDA $0742,X
	ORA #$80
	STA $0742,X
	JSR sub10_8A7A
	JSR sub10_8AAB
	JSR sub10_8ADC
	RTS
sub10_8A7A:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_8A85
	RTS
bra10_8A85:
	LDX $070B
	LDY $070C
	LDA Pulse1VolumeEnv,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA $0751,Y
	STA $FE
	LDA tbl10_8001,X
	STA $0752,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $074D,X
	RTS
sub10_8AAB:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BMI bra10_8AB6
	RTS
bra10_8AB6:
	LDX $070B
	LDY $070C
	LDA Pulse1Duty,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA $075D,Y
	STA $FE
	LDA tbl10_8001,X
	STA $075E,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075B,X
	RTS
sub10_8ADC:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_8AE7
	RTS
bra10_8AE7:
	LDX $070B
	LDY $070C
	LDA Pulse1PitchSetting,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA $0769,Y
	STA $FE
	LDA tbl10_8001,X
	STA $076A,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0765,X
	RTS
sub10_8B0D:
	LDX $070C
	LDA $0724,X
	STA $FE
	LDA $0725,X
	STA $FF
	JSR sub10_8E20
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	RTS
sub10_8B25:
	JSR sub10_8B2F
	JSR sub10_8BA2
	JSR sub10_8C15
	RTS
sub10_8B2F:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL bra10_8BA1_RTS
bra10_8B39:
loc10_8B39:
	LDX $070B
	LDA $074D,X
	TAY
	CPY #$FF
	BEQ bra10_8BA1_RTS
	LDX $070B
	LDA $074D,X
	BNE bra10_8B9E
	LDX $070C
	LDA #$02
	CLC
	ADC $0751,X
	STA $0751,X
	STA $FE
	LDA #$00
	ADC $0752,X
	STA $0752,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $074D,X
	TAY
	CPY #$FF
	BNE bra10_8B39
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL bra10_8B91
	CLC
	ADC $0751,X
	STA $0751,X
	STA $FE
	BCS bra10_8B8C
	DEC $0752,X
bra10_8B8C:
	LDA $0752,X
	STA $FF
bra10_8B91:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $074D,X
	JMP loc10_8B39
bra10_8B9E:
	DEC $074D,X
bra10_8BA1_RTS:
	RTS
sub10_8BA2:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BPL bra10_8C14_RTS
bra10_8BAC:
loc10_8BAC:
	LDX $070B
	LDA $075B,X
	TAY
	CPY #$FF
	BEQ bra10_8C14_RTS
	LDX $070B
	LDA $075B,X
	BNE bra10_8C11
	LDX $070C
	LDA #$02
	CLC
	ADC $075D,X
	STA $075D,X
	STA $FE
	LDA #$00
	ADC $075E,X
	STA $075E,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075B,X
	TAY
	CPY #$FF
	BNE bra10_8BAC
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL bra10_8C04
	CLC
	ADC $075D,X
	STA $075D,X
	STA $FE
	BCS bra10_8BFF
	DEC $075E,X
bra10_8BFF:
	LDA $075E,X
	STA $FF
bra10_8C04:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075B,X
	JMP loc10_8BAC
bra10_8C11:
	DEC $075B,X
bra10_8C14_RTS:
	RTS
sub10_8C15:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL bra10_8C84_RTS
bra10_8C1F:
loc10_8C1F:
	LDX $070B
	LDA $0765,X
	TAY
	CPY #$FF
	BEQ bra10_8C84_RTS
	LDA $0765,X
	BNE bra10_8C81
	LDX $070C
	LDA #$02
	CLC
	ADC $0769,X
	STA $0769,X
	STA $FE
	LDA #$00
	ADC $076A,X
	STA $076A,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0765,X
	TAY
	CPY #$FF
	BNE bra10_8C1F
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL bra10_8C74
	CLC
	ADC $0769,X
	STA $0769,X
	STA $FE
	BCS bra10_8C6F
	DEC $076A,X
bra10_8C6F:
	LDA $076A,X
	STA $FF
bra10_8C74:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0765,X
	JMP loc10_8C1F
bra10_8C81:
	DEC $0765,X
bra10_8C84_RTS:
	RTS
sub10_8C85:
	JSR sub10_8C92
	JSR sub10_8CE4
	JSR sub10_8D36
	JSR sub10_8D85
	RTS
sub10_8C92:
	LDX #$64
	LDY #$64
	LDA $0788
	ORA $0789
	BNE bra10_8CA2
	LDX #$00
	LDY #$00
bra10_8CA2:
	JSR sub10_8DB1
	LDA $FE
	PHA
	JSR sub10_8DD6
	PLA
	ORA $FE
	ORA #$30
	STA $4000
	JSR sub10_8DFB
	LDA #$00
	STA $FF
	LDA $FE
	BPL bra10_8CC0
	DEC $FF
bra10_8CC0:
	LDA $0739,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $4002
	LDA $0742,Y
	STA $FE
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8CE3_RTS
	STA $0742,Y
	ORA #$F8
	STA $4003
bra10_8CE3_RTS:
	RTS
sub10_8CE4:
	LDX #$65
	LDY #$66
	LDA $078A
	ORA $078B
	BNE bra10_8CF4
	LDX #$01
	LDY #$02
bra10_8CF4:
	JSR sub10_8DB1
	LDA $FE
	PHA
	JSR sub10_8DD6
	PLA
	ORA $FE
	ORA #$30
	STA $4004
	JSR sub10_8DFB
	LDA #$00
	STA $FF
	LDA $FE
	BPL bra10_8D12
	DEC $FF
bra10_8D12:
	LDA $0739,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $4006
	LDA $0742,Y
	STA $FE
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8D35_RTS
	STA $0742,Y
	ORA #$F8
	STA $4007
bra10_8D35_RTS:
	RTS
sub10_8D36:
	LDX #$66
	LDY #$68
	LDA $078C
	ORA $078D
	BNE bra10_8D46
	LDX #$02
	LDY #$04
bra10_8D46:
	JSR sub10_8DB1
	LDA $FE
	BEQ bra10_8D4F
	LDA #$FF
bra10_8D4F:
	ORA #$80
	STA $4008
	JSR sub10_8DFB
	LDA #$00
	STA $FF
	LDA $FE
	BPL bra10_8D61
	DEC $FF
bra10_8D61:
	LDA $0739,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $400A
	LDA $0742,Y
	STA $FE
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8D84_RTS
	STA $0742,Y
	ORA #$F8
	STA $400B
bra10_8D84_RTS:
	RTS
sub10_8D85:
	LDX #$67
	LDY #$6A
	LDA $078E
	ORA $078F
	BNE bra10_8D95
	LDX #$03
	LDY #$06
bra10_8D95:
	JSR sub10_8DB1
	LDA $FE
	ORA #$30
	STA $400C
	JSR sub10_8DFB
	LDA $0739,Y
	CLC
	ADC $FE
	STA $400E
	LDA #$F8
	STA $400F
	RTS
sub10_8DB1:
	TYA
	PHA
	LDA $074D,X
	TAY
	CPY #$FF
	BNE bra10_8DC0
	LDA #$00
	JMP loc10_8DD1
bra10_8DC0:
	PLA
	PHA
	TAY
	LDA $0751,Y
	STA $FE
	LDA $0752,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y
loc10_8DD1:
	STA $FE
	PLA
	TAY
	RTS
sub10_8DD6:
	TYA
	PHA
	LDA $075B,X
	TAY
	CPY #$FF
	BNE bra10_8DE5
	LDA #$00
	JMP loc10_8DF6
bra10_8DE5:
	PLA
	PHA
	TAY
	LDA $075D,Y
	STA $FE
	LDA $075E,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y
loc10_8DF6:
	STA $FE
	PLA
	TAY
	RTS
sub10_8DFB:
	TYA
	PHA
	LDA $0765,X
	TAY
	CPY #$FF
	BNE bra10_8E0A
	LDA #$00
	JMP loc10_8E1B
bra10_8E0A:
	PLA
	PHA
	TAY
	LDA $0769,Y
	STA $FE
	LDA $076A,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y
loc10_8E1B:
	STA $FE
	PLA
	TAY
	RTS
sub10_8E20:
	LDX $070C
	INC $0724,X
	LDA $0724,X
	BNE bra10_8E2E_RTS
	INC $0725,X
bra10_8E2E_RTS:
	RTS
sub10_8E2F:
	TAX
	LDY #$FF
bra10_8E32:
	CPY #$07
	BEQ bra10_8E40_RTS
	INY
	LDA $0701,Y
	BPL bra10_8E32
	TXA
	STA $0701,Y
bra10_8E40_RTS:
	RTS
tbl10_8E41:
	.byte $A1
tbl10_8E42:
	.byte $8E
	.byte $BE
	.byte $8F
	.byte $D8
	.byte $8F
	.byte $E9
	.byte $8F
	.byte $FC
	.byte $8F
	.byte $0E
	.byte $90
	.byte $2A
	.byte $90
	.byte $46
	.byte $90
	.byte $59
	.byte $90
	.byte $7D
	.byte $90
	.byte $9F
	.byte $90
	.byte $B5
	.byte $90
	.byte $CB
	.byte $90
	.byte $01
	.byte $91
	.byte $18
	.byte $91
	.byte $2C
	.byte $91
	.byte $3D
	.byte $91
	.byte $4F
	.byte $91
	.byte $61
	.byte $91
	.byte $73
	.byte $91
	.byte $85
	.byte $91
	.byte $97
	.byte $91
	.byte $A9
	.byte $91
	.byte $BB
	.byte $91
	.byte $CD
	.byte $91
	.byte $E8
	.byte $91
	.byte $FA
	.byte $91
	.byte $13
	.byte $92
	.byte $31
	.byte $92
	.byte $41
	.byte $92
	.byte $A1
	.byte $8E
	.byte $A1
	.byte $8E
	.byte $68
	.byte $95
	.byte $A5
	.byte $95
	.byte $0E
	.byte $96
	.byte $C0
	.byte $96
	.byte $D5
	.byte $97
	.byte $C1
	.byte $98
	.byte $89
	.byte $99
	.byte $F8
	.byte $9A
	.byte $F9
	.byte $9B
	.byte $50
	.byte $9F
	.byte $1F
	.byte $A0
	.byte $4A
	.byte $A1
	.byte $33
	.byte $A5
	.byte $93
	.byte $A7
	.byte $A1
	.byte $8E
	.byte $C5
	.byte $A8
	.byte $00
	.byte $BF
	.byte $8E
	.byte $01
	.byte $BF
	.byte $8E
	.byte $02
	.byte $BF
	.byte $8E
	.byte $03
	.byte $BF
	.byte $8E
	.byte $04
	.byte $BF
	.byte $8E
	.byte $80
	.byte $BF
	.byte $8E
	.byte $81
	.byte $BF
	.byte $8E
	.byte $82
	.byte $BF
	.byte $8E
	.byte $83
	.byte $BF
	.byte $8E
	.byte $84
	.byte $BF
	.byte $8E
	.byte $FF
tbl10_8EC0:
	.byte $00
tbl10_8EC1:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F2
	.byte $07
	.byte $80
	.byte $07
	.byte $14
	.byte $07
	.byte $AE
	.byte $06
	.byte $4E
	.byte $06
	.byte $F4
	.byte $05
	.byte $9E
	.byte $05
	.byte $4D
	.byte $05
	.byte $01
	.byte $05
	.byte $B9
	.byte $04
	.byte $75
	.byte $04
	.byte $35
	.byte $04
	.byte $F9
	.byte $03
	.byte $C0
	.byte $03
	.byte $8A
	.byte $03
	.byte $57
	.byte $03
	.byte $27
	.byte $03
	.byte $FA
	.byte $02
	.byte $CF
	.byte $02
	.byte $A7
	.byte $02
	.byte $81
	.byte $02
	.byte $5D
	.byte $02
	.byte $3B
	.byte $02
	.byte $1B
	.byte $02
	.byte $FC
	.byte $01
	.byte $E0
	.byte $01
	.byte $C5
	.byte $01
	.byte $AC
	.byte $01
	.byte $94
	.byte $01
	.byte $7D
	.byte $01
	.byte $68
	.byte $01
	.byte $53
	.byte $01
	.byte $40
	.byte $01
	.byte $2E
	.byte $01
	.byte $1D
	.byte $01
	.byte $0D
	.byte $01
	.byte $FE
	.byte $00
	.byte $F0
	.byte $00
	.byte $E2
	.byte $00
	.byte $D6
	.byte $00
	.byte $CA
	.byte $00
	.byte $BE
	.byte $00
	.byte $B4
	.byte $00
	.byte $AA
	.byte $00
	.byte $A0
	.byte $00
	.byte $97
	.byte $00
	.byte $8F
	.byte $00
	.byte $87
	.byte $00
	.byte $7F
	.byte $00
	.byte $78
	.byte $00
	.byte $71
	.byte $00
	.byte $6B
	.byte $00
	.byte $65
	.byte $00
	.byte $5F
	.byte $00
	.byte $5A
	.byte $00
	.byte $55
	.byte $00
	.byte $50
	.byte $00
	.byte $4C
	.byte $00
	.byte $47
	.byte $00
	.byte $43
	.byte $00
	.byte $40
	.byte $00
	.byte $3C
	.byte $00
	.byte $39
	.byte $00
	.byte $35
	.byte $00
	.byte $32
	.byte $00
	.byte $30
	.byte $00
	.byte $2D
	.byte $00
	.byte $2A
	.byte $00
	.byte $28
	.byte $00
	.byte $26
	.byte $00
	.byte $24
	.byte $00
	.byte $22
	.byte $00
	.byte $20
	.byte $00
	.byte $1E
	.byte $00
	.byte $1C
	.byte $00
	.byte $1B
	.byte $00
	.byte $19
	.byte $00
	.byte $18
	.byte $00
	.byte $16
	.byte $00
	.byte $15
	.byte $00
	.byte $14
	.byte $00
	.byte $13
	.byte $00
	.byte $12
	.byte $00
	.byte $11
	.byte $00
	.byte $10
	.byte $00
	.byte $0F
	.byte $00
	.byte $0E
	.byte $00
	.byte $0D
	.byte $00
	.byte $0C
	.byte $00
	.byte $0B
	.byte $00
	.byte $0A
	.byte $00
	.byte $09
	.byte $00
	.byte $08
	.byte $00
	.byte $07
	.byte $00
	.byte $06
	.byte $00
	.byte $05
	.byte $00
	.byte $04
	.byte $00
	.byte $03
	.byte $00
	.byte $02
	.byte $00
	;include sfx binary
	.incbin sound/sfx_Spinjump.bin
	.incbin sound/sfx_Pause.bin
	.incbin sound/sfx_Jump.bin
	.incbin sound/sfx_Swim.bin
	.incbin sound/sfx_Beep.bin
	.incbin sound/sfx_YoshiCoin.bin
	.incbin sound/sfx_1up.bin
	.incbin sound/sfx_Coin.bin
	.incbin sound/sfx_Mushroom.bin
	.incbin sound/sfx_Warp.bin
	.incbin sound/sfx_Block.bin
	.incbin sound/sfx_Powerdown.bin
	.incbin sound/sfx_YoshiMount.bin
	.incbin sound/sfx_Feather.bin
	.incbin sound/sfx_Thud.bin
	.incbin sound/sfx_Explosion.bin
	.incbin sound/sfx_EnemyHit1.bin
	.incbin sound/sfx_EnemyHit2.bin
	.incbin sound/sfx_EnemyHit3.bin
	.incbin sound/sfx_EnemyHit4.bin
	.incbin sound/sfx_EnemyHit5.bin
	.incbin sound/sfx_EnemyHit6.bin
	.incbin sound/sfx_EnemyHit7.bin
	.incbin sound/sfx_EnemyHit8.bin
	.incbin sound/sfx_YoshiTongue.bin
	.incbin sound/sfx_YoshiSwallow.bin
	.incbin sound/sfx_YoshiFireSpit.bin
	.incbin sound/sfx_Checkpoint.bin
	.incbin sound/sfx_Chainsaw.bin
	;include music binary
	.incbin sound/mus_Title.bin
	.incbin sound/mus_GameOver.bin
	.incbin sound/mus_PlayerDown.bin
	.incbin sound/mus_Victory.bin
	.incbin sound/mus_MainMap.bin
	.incbin sound/mus_YoshisIsland.bin
	.incbin sound/mus_ValleyofBowser.bin
	.incbin sound/mus_VanillaDome.bin
	.incbin sound/mus_ForestofIllusion.bin
	.incbin sound/mus_Overworld.bin
	.byte $F5	;underground theme is .byte since it splits between 2 banks
	.byte $01
	.byte $F6
	.byte $05
	.byte $F9
	.byte $5B
	.byte $FA
	.byte $39
	.byte $F8
	.byte $11
	.byte $98
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $98
	.byte $00
	.byte $27
	.byte $A4
	.byte $24
	.byte $8C
	.byte $1F
	.byte $21
	.byte $C8
	.byte $24
	.byte $8C
	.byte $00
	.byte $98
	.byte $00
	.byte $1F
	.byte $8C
	.byte $24
	.byte $A4
	.byte $2B
	.byte $B0
	.byte $27
	.byte $98
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $27
	.byte $A4
	.byte $24
	.byte $8C
	.byte $1F
	.byte $21
	.byte $C8
	.byte $24
	.byte $8C
	.byte $00
	.byte $98
	.byte $00
	.byte $1F
	.byte $8C
	.byte $24
	.byte $A4
	.byte $2B
	.byte $B0
	.byte $27
	.byte $98
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $27
	.byte $A4
	.byte $24
	.byte $8C
	.byte $1F
	.byte $98
	.byte $27
	.byte $C8
	.byte $24
	.byte $8C
	.byte $26
	.byte $23
	.byte $1F
	.byte $98
	.byte $27
	.byte $E0
	.byte $26
	.byte $A4
	.byte $00
	.byte $98
	.byte $00
	.byte $27
	.byte $A4
	.byte $24
	.byte $8C
	.byte $1F
	.byte $98
	.byte $27
	.byte $C8
	.byte $24
	.byte $8C
	.byte $26
	.byte $23
	.byte $1F
	.byte $98
	.byte $27
	.byte $E0
	.byte $26
	.byte $A4
	.byte $00
	.byte $F4
	.byte $7B
	.byte $9F
	.byte $FF
	.byte $F6
	.byte $05
	.byte $F9
	.byte $38
	.byte $FA
	.byte $39
	.byte $F8
	.byte $40
	.byte $86
	.byte $21
	.byte $00
	.byte $24
	.byte $00
