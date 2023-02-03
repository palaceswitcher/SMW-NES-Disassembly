;Disassembled by BZK 6502 Disassembler
tbl10_8000:
	.word ofs_8100
	.word ofs_8104
	.word ofs_8110
	.word ofs_8116
	.word ofs_811C
	.word ofs_8124
	.word ofs_8140
	.word ofs_8146
	.word ofs_814A
	.word ofs_8158
	.word ofs_815C
	.word ofs_8176
	.word ofs_8180
	.word ofs_818A
	.word ofs_8194
	.word ofs_819C
	.word ofs_81A6
	.word ofs_81AC
	.word ofs_81C2
	.word ofs_81CD
	.word ofs_81D9
	.word ofs_81E3
	.word ofs_81ED
	.word ofs_81F7
	.word ofs_81FF
	.word ofs_8203
	.word ofs_821F
	.word ofs_822B
	.word ofs_823B
	.word ofs_8241
	.word ofs_8245
	.word ofs_8249
	.word ofs_824F
	.word ofs_826F
	.word ofs_8275
	.word ofs_827D
	.word ofs_828D
	.word ofs_8291
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8293
	.word ofs_8100
	.word ofs_8100
	.word ofs_829D
	.word ofs_82B5
	.word ofs_82BF
	.word ofs_82C9
	.word ofs_82D1
	.word ofs_82FD
	.word ofs_831B
	.word ofs_8100
	.word ofs_8327
	.word ofs_8337
	.word ofs_833F
	.word ofs_8343
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_834F
	.word ofs_835F
	.word ofs_8379
	.word ofs_8381
	.word ofs_8397
	.word ofs_83A1
	.word ofs_83B3
	.word ofs_83C7
	.word ofs_840B
	.word ofs_840F
	.word ofs_8413
	.word ofs_8425
	.word ofs_842B
	.word ofs_8431
	.word ofs_8437
	.word ofs_8100
	.word ofs_843D
	.word ofs_844E
	.word ofs_845E
	.word ofs_8462
	.word ofs_846E
	.word ofs_8472
	.word ofs_8486
	.word ofs_84B0
	.word ofs_84B4
	.word ofs_84C0
	.word ofs_8100
	.word ofs_84CC
	.word ofs_84D0
	.word ofs_84DE
	.word ofs_84EE
	.word ofs_8508
	.word ofs_8520
	.word ofs_8528
	.word ofs_853E
	.word ofs_8554
	.word ofs_8576
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8598
	.word ofs_8100
	.word ofs_8100
	.word ofs_859A
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_85A0
	.word ofs_85A8
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_85B3
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.word ofs_8100
	.include sound/instruments.asm
jmp_58_85BE:
	LDA SFXRegister
	BMI bra10_85C4
	BNE bra10_85CE
bra10_85C4:
	LDA MusicRegister
	CMP MusicBackup
	BEQ bra10_85D5_RTS
	LDA MusicRegister ;Back up the current music ID if it isn't backed up already
	STA MusicBackup
bra10_85CE:
	JSR sub10_8E2F
	LDA #$00
	STA SFXRegister
bra10_85D5_RTS:
	RTS
jmp_58_85D6:
	LDA #$0F
	STA APUStatus
	LDA #$00
	STA Sq1Vol
	STA Sq2Vol
	STA TriLinear
	STA NoiseVol
	STA DMCFreq
	LDA #$7F
	STA Sq1Sweep
	STA Sq2Sweep
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
jmp_58_862A:
	LDA PauseFlag
	BEQ bra10_8642
	LDA #$00
	STA APUStatus
	LDA #%00000111
	STA APUStatus ;Disable noise channel
	JSR sub10_8C85
	JSR sub10_86E8
	JMP loc10_8671
bra10_8642:
	LDA #$0F
	STA APUStatus ;Re-enable all channels (excluding DMC)
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
	STA APUStatus
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
	LDA SoundPointer
	AND #$F0
	ORA #$30
	STA Sq1Vol
	LDX #$01
	LDY #$02
	JSR sub10_8DD6
	LDA SoundPointer
	AND #$F0
	ORA #$30
	STA Sq2Vol
	LDA #$00
	STA TriLinear
	LDA #$30
	STA NoiseVol
	LDA #$FF
	STA PauseFlag
	LDA #$0F
	STA APUStatus
bra10_86DF_RTS:
	RTS
bra10_86E0:
	LDA #$00
	STA PauseFlag
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
	STA SoundPointer
	LDA tbl10_8E41+1,X
	STA SoundPointer+1
	LDY #$00
loc10_8716:
	LDA (SoundPointer),Y
	STA $070A
	TAX
	CPX #$FF
	BEQ bra10_86DF_RTS ;Stop if the end byte is reached ($FF)
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
	LDA (SoundPointer),Y
	STA $0724,X
	INY
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
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
ofs_880B:
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
	LDA NotePitchTable,Y
	STA Pulse1Pitch,X
	LDA NotePitchTable+1,Y
	STA Pulse1Pitch+1,X
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
	STA Pulse1Pitch,X
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
	STA SoundPointer
	LDA tbl10_8895+1,X
	STA SoundPointer+1
	JMP (SoundPointer)
tbl10_8895:
	.word ofs_88B5
	.word ofs_88CC
	.word ofs_88E6
	.word ofs_8912
	.word loc10_893A
	.word ofs_8957
	.word ofs_897A
	.word loc10_87E0
	.word ofs_89A1
	.word ofs_89BA
	.word ofs_89D3
	.word ofs_8A27
	.word ofs_880B
	.word bra10_87FB
	.word loc10_87E0
	.word ofs_89EC
ofs_88B5:
	LDX $070C
	CLC
	LDA $0724,X
	ADC #$02
	STA $071C,X
	LDA $0725,X
	ADC #$00
	STA $071D,X
	JMP loc10_893D
ofs_88CC:
	LDX $070C
	LDA $071C,X
	STA $0724,X
	LDA $071D,X
	STA $0725,X
	LDA #$00
	STA $071C,X
	STA $071D,X
	JMP loc10_87E0
ofs_88E6:
	LDX $070C
	LDA $0724,X
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $0710,X
	JSR sub10_8E20
	LDX $070C
	LDA $0724,X
	STA $0714,X
	LDA $0725,X
	STA $0715,X
	JMP loc10_87E0
ofs_8912:
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
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	STA $0724,X
	INY
	LDA (SoundPointer),Y
	STA $0725,X
	JMP loc10_87E0
ofs_8957:
	LDX $070C
	LDA $0724,X
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	LDX $070A
	CPX #$04
	BMI bra10_8971
	LDY #$64
bra10_8971:
	STA MusicSpeed,Y ;Set Music/SFX speed
	JSR sub10_8E20
	JMP loc10_87E0
ofs_897A:
	LDA $070A
	AND #$0F
	TAX
	CPX #$03
	BPL bra10_899B
	LDX $070C
	LDA $0724,X
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	LDX $070B
	STA Pulse1Transpose,X
bra10_899B:
	JSR sub10_8E20
	JMP loc10_87E0
ofs_89A1:
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
ofs_89BA:
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
ofs_89D3:
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
ofs_89EC:
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
ofs_8A27:
	LDX $070C
	LDA $0724,X
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	JSR sub10_8E20
	LDX $070B
	LDA $0710,X
	BNE bra10_8A46
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA $0752,Y
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA $075E,Y
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA $076A,Y
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $0765,X
	RTS
sub10_8B0D:
	LDX $070C
	LDA $0724,X
	STA SoundPointer
	LDA $0725,X
	STA SoundPointer+1
	JSR sub10_8E20
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA #$00
	ADC $0752,X
	STA $0752,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $074D,X
	TAY
	CPY #$FF
	BNE bra10_8B39
	LDX $070C
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8B91
	CLC
	ADC $0751,X
	STA $0751,X
	STA SoundPointer
	BCS bra10_8B8C
	DEC $0752,X
bra10_8B8C:
	LDA $0752,X
	STA SoundPointer+1
bra10_8B91:
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA #$00
	ADC $075E,X
	STA $075E,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $075B,X
	TAY
	CPY #$FF
	BNE bra10_8BAC
	LDX $070C
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8C04
	CLC
	ADC $075D,X
	STA $075D,X
	STA SoundPointer
	BCS bra10_8BFF
	DEC $075E,X
bra10_8BFF:
	LDA $075E,X
	STA SoundPointer+1
bra10_8C04:
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
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
	STA SoundPointer
	LDA #$00
	ADC $076A,X
	STA $076A,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $0765,X
	TAY
	CPY #$FF
	BNE bra10_8C1F
	LDX $070C
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8C74
	CLC
	ADC $0769,X
	STA $0769,X
	STA SoundPointer
	BCS bra10_8C6F
	DEC $076A,X
bra10_8C6F:
	LDA $076A,X
	STA SoundPointer+1
bra10_8C74:
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
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
	LDA SoundPointer
	PHA
	JSR sub10_8DD6
	PLA
	ORA SoundPointer
	ORA #$30
	STA Sq1Vol
	JSR sub10_8DFB
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8CC0
	DEC $FF
bra10_8CC0:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $4002
	LDA $0742,Y
	STA SoundPointer
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
	LDA SoundPointer
	PHA
	JSR sub10_8DD6
	PLA
	ORA SoundPointer
	ORA #$30
	STA Sq2Vol
	JSR sub10_8DFB
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8D12
	DEC $FF
bra10_8D12:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $4006
	LDA $0742,Y
	STA SoundPointer
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
	LDA SoundPointer
	BEQ bra10_8D4F
	LDA #$FF
bra10_8D4F:
	ORA #$80
	STA TriLinear
	JSR sub10_8DFB
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8D61
	DEC $FF
bra10_8D61:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA $400A
	LDA $0742,Y
	STA SoundPointer
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
	LDA SoundPointer
	ORA #$30
	STA NoiseVol
	JSR sub10_8DFB
	LDA Pulse1Pitch,Y
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
	STA SoundPointer
	LDA $0752,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8DD1:
	STA SoundPointer
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
	STA SoundPointer
	LDA $075E,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8DF6:
	STA SoundPointer
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
	STA SoundPointer
	LDA $076A,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8E1B:
	STA SoundPointer
	PLA
	TAY
	RTS
sub10_8E20:
	LDX $070C
sub_58_8E23:
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
	.word Empty_Footer
	.word SpinJump_Footer
	.word Pause_Footer
	.word Jump_Footer
	.word Swim_Footer
	.word Beep_Footer
	.word YoshiCoin_Footer
	.word Life_Footer
	.word Coin_Footer
	.word Powerup_Footer
	.word Warp_Footer
	.word Block_Footer
	.word Powerdown_Footer
	.word YoshiMount_Footer
	.word Feather_Footer
	.word Thud_Footer
	.word Explosion_Footer
	.word EnemyHit1_Footer
	.word EnemyHit2_Footer
	.word EnemyHit3_Footer
	.word EnemyHit4_Footer
	.word EnemyHit5_Footer
	.word EnemyHit6_Footer
	.word EnemyHit7_Footer
	.word EnemyHit8_Footer
	.word YoshiTongue_Footer
	.word YoshiSwallow_Footer
	.word YoshiFireSpit_Footer
	.word Checkpoint_Footer
	.word Chainsaw_Footer
	.word Empty_Footer
	.word Empty_Footer
;Music pointers
	.word Title_Footer
	.word GameOver_Footer
	.word PlayerDown_Footer
	.word Victory_Footer
	.word DonutPlains_Footer
	.word YoshisIsland_Footer
	.word ValleyofBowser_Footer
	.word VanillaDome_Footer
	.word ForestofIllusion_Footer
	.word Overworld_Footer
	.word Underground_Footer
	.word GhostHouse_Footer
	.word Castle_Footer
	.word Underwater_Footer
	.word Empty_Footer
	.word Ending_Footer
Empty_Footer:
	.byte $00
	.word UnknownMusPtr
	.byte $01
	.word UnknownMusPtr
	.byte $02
	.word UnknownMusPtr
	.byte $03
	.word UnknownMusPtr
	.byte $04
	.word UnknownMusPtr
	.byte $80
	.word UnknownMusPtr
	.byte $81
	.word UnknownMusPtr
	.byte $82
	.word UnknownMusPtr
	.byte $83
	.word UnknownMusPtr
	.byte $84
	.word UnknownMusPtr
UnknownMusPtr:
	.byte $FF
NotePitchTable:
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $0000
	.word $07F2
	.word $0780
	.word $0714
	.word $06AE
	.word $064E
	.word $05F4
	.word $059E
	.word $054D
	.word $0501
	.word $04B9
	.word $0475
	.word $0435
	.word $03F9
	.word $03C0
	.word $038A
	.word $0357
	.word $0327
	.word $02FA
	.word $02CF
	.word $02A7
	.word $0281
	.word $025D
	.word $023B
	.word $021B
	.word $01FC
	.word $01E0
	.word $01C5
	.word $01AC
	.word $0194
	.word $017D
	.word $0168
	.word $0153
	.word $0140
	.word $012E
	.word $011D
	.word $010D
	.word $00FE
	.word $00F0
	.word $00E2
	.word $00D6
	.word $00CA
	.word $00BE
	.word $00B4
	.word $00AA
	.word $00A0
	.word $0097
	.word $008F
	.word $0087
	.word $007F
	.word $0078
	.word $0071
	.word $006B
	.word $0065
	.word $005F
	.word $005A
	.word $0055
	.word $0050
	.word $004C
	.word $0047
	.word $0043
	.word $0040
	.word $003C
	.word $0039
	.word $0035
	.word $0032
	.word $0030
	.word $002D
	.word $002A
	.word $0028
	.word $0026
	.word $0024
	.word $0022
	.word $0020
	.word $001E
	.word $001C
	.word $001B
	.word $0019
	.word $0018
	.word $0016
	.word $0015
	.word $0014
	.word $0013
	.word $0012
	.word $0011
	.word $0010
	.word $000F
	.word $000E
	.word $000D
	.word $000C
	.word $000B
	.word $000A
	.word $0009
	.word $0008
	.word $0007
	.word $0006
	.word $0005
	.word $0004
	.word $0003
	.word $0002
 ;include sfx data
	.include sound/sfx_SpinJump.asm
	.include sound/sfx_Pause.asm
	.include sound/sfx_Jump.asm
	.include sound/sfx_Swim.asm
	.include sound/sfx_Beep.asm
	.include sound/sfx_YoshiCoin.asm
	.include sound/sfx_1up.asm
	.include sound/sfx_Coin.asm
	.include sound/sfx_Powerup.asm
	.include sound/sfx_Warp.asm
	.include sound/sfx_Block.asm
	.include sound/sfx_Powerdown.asm
	.include sound/sfx_YoshiMount.asm
	.include sound/sfx_Feather.asm
	.include sound/sfx_Thud.asm
	.include sound/sfx_Explosion.asm
	.include sound/sfx_EnemyHit1.asm
	.include sound/sfx_EnemyHit2.asm
	.include sound/sfx_EnemyHit3.asm
	.include sound/sfx_EnemyHit4.asm
	.include sound/sfx_EnemyHit5.asm
	.include sound/sfx_EnemyHit6.asm
	.include sound/sfx_EnemyHit7.asm
	.include sound/sfx_EnemyHit8.asm
	.include sound/sfx_YoshiTongue.asm
	.include sound/sfx_YoshiSwallow.asm
	.include sound/sfx_YoshiFireSpit.asm
	.include sound/sfx_Checkpoint.asm
	.include sound/sfx_Chainsaw.asm
 ;include music data
	.include sound/mus_Title.asm
	.include sound/mus_GameOver.asm
	.include sound/mus_PlayerDown.asm
	.include sound/mus_Victory.asm
	.include sound/mus_DonutPlains.asm
	.include sound/mus_YoshisIsland.asm
	.include sound/mus_ValleyofBowser.asm
	.include sound/mus_VanillaDome.asm
	.include sound/mus_ForestofIllusion.asm
	.include sound/mus_Overworld.asm
	.include sound/mus_Underground.asm
	.include sound/mus_GhostHouse.asm
	.include sound/mus_Castle.asm
	.include sound/mus_Underwater.asm
	.include sound/mus_Ending.asm
	.incbin prg/padding/padding058_59.bin