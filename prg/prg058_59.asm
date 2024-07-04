;Disassembled by BZK 6502 Disassembler
tbl10_8000:
	dw ofs_8100
	dw ofs_8104
	dw ofs_8110
	dw ofs_8116
	dw ofs_811C
	dw ofs_8124
	dw ofs_8140
	dw ofs_8146
	dw ofs_814A
	dw ofs_8158
	dw ofs_815C
	dw ofs_8176
	dw ofs_8180
	dw ofs_818A
	dw ofs_8194
	dw ofs_819C
	dw ofs_81A6
	dw Vol_LongEcho1 ;0x11
	dw ofs_81C2 ;0x12
	dw ofs_81CD ;0x13
	dw ofs_81D9
	dw ofs_81E3
	dw ofs_81ED
	dw ofs_81F7
	dw ofs_81FF
	dw ofs_8203
	dw ofs_821F
	dw ofs_822B
	dw ofs_823B
	dw ofs_8241
	dw ofs_8245
	dw ofs_8249
	dw ofs_824F
	dw ofs_826F
	dw ofs_8275
	dw ofs_827D
	dw ofs_828D
	dw ofs_8291
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8293
	dw ofs_8100
	dw ofs_8100
	dw ofs_829D
	dw ofs_82B5
	dw ofs_82BF
	dw ofs_82C9
	dw ofs_82D1
	dw ofs_82FD
	dw ofs_831B ;0x34
	dw ofs_8100
	dw ofs_8327
	dw ofs_8337
	dw ofs_833F
	dw ofs_8343 ;0x39
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_834F
	dw Vol_PlinkEcho ;0x41
	dw ofs_8379
	dw ofs_8381
	dw ofs_8397
	dw ofs_83A1
	dw ofs_83B3
	dw ofs_83C7
	dw ofs_840B
	dw ofs_840F
	dw ofs_8413
	dw ofs_8425
	dw ofs_842B
	dw ofs_8431
	dw ofs_8437
	dw ofs_8100
	dw ofs_843D ;0x50
	dw ofs_844E ;0x51
	dw ofs_845E ;0x52
	dw ofs_8462
	dw ofs_846E
	dw ofs_8472
	dw ofs_8486
	dw ofs_84B0
	dw ofs_84B4
	dw ofs_84C0
	dw ofs_8100
	dw ofs_84CC ;0x5B
	dw ofs_84D0
	dw ofs_84DE
	dw ofs_84EE ;0x5E
	dw ofs_8508
	dw ofs_8520 ;0x60
	dw ofs_8528 ;0x61
	dw ofs_853E
	dw ofs_8554
	dw ofs_8576 ;0x64
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8598
	dw ofs_8100
	dw ofs_8100
	dw ofs_859A
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_85A0
	dw ofs_85A8
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_85B3
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	dw ofs_8100
	include sound/instruments.asm
jmp_58_85BE:
	LDA SFXRegister
	BMI bra10_85C4
	BNE bra10_85CE
bra10_85C4:
	LDA MusicRegister
	CMP MusicBackup ;Check if the BGM has changed
	BEQ bra10_85D5_RTS ;If not, stop
	LDA MusicRegister ;If it has, back up the song ID
	STA MusicBackup
bra10_85CE:
	JSR sub10_8E2F
	LDA #$00
	STA SFXRegister ;Clear SFX register
bra10_85D5_RTS:
	RTS

;This is the effective start point for the driver.
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
	STA ChannelPtrs,X
	INY
	LDA (SoundPointer),Y
	STA ChannelPtrs+1,X
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
	STA ChannelPitchSetting,X
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
	LDA ChannelPtrs,X
	ORA ChannelPtrs+1,X
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
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
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
	db $03
	db $00
	db $06
	db $09
	db $0C
	db $12
	db $18
	db $24
	db $30
tbl10_8829:
	db $02
	db $03
	db $04
	db $06
	db $08
	db $0C
	db $10
	db $18
	db $20
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
	STA ChannelPitch,X
	LDA NotePitchTable+1,Y
	STA ChannelPitch+1,X
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
	STA ChannelPitch,X
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
	dw ofs_88B5
	dw ofs_88CC
	dw ofs_88E6
	dw ofs_8912
	dw loc10_893A
	dw ofs_8957
	dw ofs_897A
	dw loc10_87E0
	dw ofs_89A1
	dw ofs_89BA
	dw ofs_89D3
	dw ofs_8A27
	dw ofs_880B
	dw bra10_87FB
	dw loc10_87E0
	dw ofs_89EC
ofs_88B5:
	LDX $070C
	CLC
	LDA ChannelPtrs,X
	ADC #$02
	STA $071C,X
	LDA ChannelPtrs+1,X
	ADC #$00
	STA $071D,X
	JMP loc10_893D
ofs_88CC:
	LDX $070C
	LDA $071C,X
	STA ChannelPtrs,X
	LDA $071D,X
	STA ChannelPtrs+1,X
	LDA #$00
	STA $071C,X
	STA $071D,X
	JMP loc10_87E0
ofs_88E6:
	LDX $070C
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $0710,X
	JSR sub10_8E20
	LDX $070C
	LDA ChannelPtrs,X
	STA $0714,X
	LDA ChannelPtrs+1,X
	STA $0715,X
	JMP loc10_87E0
ofs_8912:
	LDX $070B
	DEC $0710,X
	BEQ bra10_892C
	LDX $070C
	LDA $0714,X
	STA ChannelPtrs,X
	LDA $0715,X
	STA ChannelPtrs+1,X
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
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	STA ChannelPtrs,X
	INY
	LDA (SoundPointer),Y
	STA ChannelPtrs+1,X
	JMP loc10_87E0
ofs_8957:
	LDX $070C
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
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
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
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
	STA ChannelPitchSetting,X
	JMP loc10_87E0
ofs_89EC:
	LDX $070C
	LDA #$00
	STA ChannelPtrs,X
	STA ChannelPtrs+1,X
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
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
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
	LDA ChannelPtrs,X
	CLC
	ADC #$02
	STA ChannelPtrs,X
	LDA ChannelPtrs+1,X
	ADC #$00
	STA ChannelPtrs+1,X
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
	AND #%1111 ;Mask out lower nybble
	TAX
	CPX #$04
	BMI bra10_8A85 ;Branch if it's commands F0 to F3
	RTS

bra10_8A85:
	LDX $070B
	LDY $070C
	LDA Pulse1VolumeEnv,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA VolMacroPtrs,Y
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA VolMacroPtrs+1,Y
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
	STA DutyMacroPtrs,Y
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA DutyMacroPtrs+1,Y
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
	LDA ChannelPitchSetting,X
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
	;Load pointer for current channel
	LDX $070C
	LDA ChannelPtrs,X
	STA SoundPointer
	LDA ChannelPtrs+1,X
	STA SoundPointer+1
	
	JSR sub10_8E20 ;Move to next byte
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

loc10_8B39:
	LDX $070B
	LDA $074D,X
	TAY
	CPY #$FF
	BEQ bra10_8BA1_RTS
	LDX $070B
	LDA $074D,X
	BNE bra10_8B9E
	
	;Move to next RLE tag
	LDX $070C
	LDA #$02
	CLC
	ADC VolMacroPtrs,X
	STA VolMacroPtrs,X
	STA SoundPointer
	LDA #$00
	ADC VolMacroPtrs+1,X
	STA VolMacroPtrs+1,X
	STA SoundPointer+1
	
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $074D,X
	TAY
	CPY #$FF
	BNE loc10_8B39
	LDX $070C
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8B91
	CLC
	ADC VolMacroPtrs,X
	STA VolMacroPtrs,X
	STA SoundPointer
	BCS bra10_8B8C
	DEC VolMacroPtrs+1,X
bra10_8B8C:
	LDA VolMacroPtrs+1,X
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
	ADC DutyMacroPtrs,X
	STA DutyMacroPtrs,X
	STA SoundPointer
	LDA #$00
	ADC DutyMacroPtrs+1,X
	STA DutyMacroPtrs+1,X
	STA SoundPointer+1
	LDX $070B
	LDY #$00
	LDA (SoundPointer),Y
	STA $075B,X
	TAY
	CPY #$FF
	BNE loc10_8BAC
	LDX $070C
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8C04
	CLC
	ADC DutyMacroPtrs,X
	STA DutyMacroPtrs,X
	STA SoundPointer
	BCS bra10_8BFF
	DEC DutyMacroPtrs+1,X
bra10_8BFF:
	LDA DutyMacroPtrs+1,X
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
	LDA ChannelPitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA Sq1Lo
	LDA $0742,Y
	STA SoundPointer
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8CE3_RTS
	STA $0742,Y
	ORA #$F8
	STA Sq1Hi
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
	LDA ChannelPitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA Sq2Lo
	LDA $0742,Y
	STA SoundPointer
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8D35_RTS
	STA $0742,Y
	ORA #$F8
	STA Sq2Hi
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
	LDA ChannelPitch,Y
	CLC
	ADC $FE
	STA $0741,Y
	STA TriLo
	LDA $0742,Y
	STA SoundPointer
	LDA $073A,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ bra10_8D84_RTS
	STA $0742,Y
	ORA #$F8
	STA TriHi
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
	LDA ChannelPitch,Y
	CLC
	ADC $FE
	STA NoiseLo
	LDA #$F8
	STA NoiseHi
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
	LDA VolMacroPtrs,Y
	STA SoundPointer
	LDA VolMacroPtrs+1,Y
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
	LDA DutyMacroPtrs,Y
	STA SoundPointer
	LDA DutyMacroPtrs+1,Y
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

;----------------------------------------
;SUBROUTINES ($8E20, $8E23)
;Increments the pointer for channel data, optionally ignoring the index for the current channel if the second subroutine is called.
;----------------------------------------
sub10_8E20:
	LDX $070C ;Get current channel
sub_58_8E23:
	INC ChannelPtrs,X
	LDA ChannelPtrs,X
	BNE bra10_8E2E_RTS ;Don't increment high byte if no overflow
		INC ChannelPtrs+1,X
bra10_8E2E_RTS:
	RTS

sub10_8E2F:
	TAX ;Store saved sound ID in X reg
	LDY #$FF ;Set index to -1
bra10_8E32:
	CPY #$07
	BEQ bra10_8E40_RTS ;Stop if the index is out of range
	INY ;Increment index
	LDA $0701,Y
	BPL bra10_8E32 ;Loop only if bit 7 of the sound ID is cleared
	TXA ;Retrieve backed up sound ID
	STA $0701,Y ;Store in SFX queue
bra10_8E40_RTS:
	RTS

tbl10_8E41:
	dw Empty_Footer
	dw SpinJump_Footer
	dw Pause_Footer
	dw Jump_Footer
	dw Swim_Footer
	dw Beep_Footer
	dw YoshiCoin_Footer
	dw Life_Footer
	dw Coin_Footer
	dw Powerup_Footer
	dw Warp_Footer
	dw Block_Footer
	dw Powerdown_Footer
	dw YoshiMount_Footer
	dw Feather_Footer
	dw Thud_Footer
	dw Explosion_Footer
	dw EnemyHit1_Footer
	dw EnemyHit2_Footer
	dw EnemyHit3_Footer
	dw EnemyHit4_Footer
	dw EnemyHit5_Footer
	dw EnemyHit6_Footer
	dw EnemyHit7_Footer
	dw EnemyHit8_Footer
	dw YoshiTongue_Footer
	dw YoshiSwallow_Footer
	dw YoshiFireSpit_Footer
	dw Checkpoint_Footer
	dw Chainsaw_Footer
	dw Empty_Footer
	dw Empty_Footer
;Music pointers
	dw Title_Footer
	dw GameOver_Footer
	dw PlayerDown_Footer
	dw Victory_Footer
	dw DonutPlains_Footer
	dw YoshisIsland_Footer
	dw ValleyofBowser_Footer
	dw VanillaDome_Footer
	dw ForestofIllusion_Footer
	dw Overworld_Footer
	dw Underground_Footer
	dw GhostHouse_Footer
	dw Castle_Footer
	dw Underwater_Footer
	dw Empty_Footer
	dw Ending_Footer
Empty_Footer:
	db $00
	dw UnknownMusPtr
	db $01
	dw UnknownMusPtr
	db $02
	dw UnknownMusPtr
	db $03
	dw UnknownMusPtr
	db $04
	dw UnknownMusPtr
	db $80
	dw UnknownMusPtr
	db $81
	dw UnknownMusPtr
	db $82
	dw UnknownMusPtr
	db $83
	dw UnknownMusPtr
	db $84
	dw UnknownMusPtr
UnknownMusPtr:
	db $FF
NotePitchTable:
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $07F2 ;A-0
	dw $0780 ;A#0
	dw $0714 ;B-0
	dw $06AE ;C-1
	dw $064E ;C#1
	dw $05F4 ;D-1
	dw $059E ;D#1
	dw $054D ;E-1
	dw $0501 ;F-1
	dw $04B9
	dw $0475
	dw $0435
	dw $03F9
	dw $03C0
	dw $038A
	dw $0357
	dw $0327
	dw $02FA
	dw $02CF
	dw $02A7
	dw $0281
	dw $025D
	dw $023B
	dw $021B
	dw $01FC
	dw $01E0
	dw $01C5
	dw $01AC
	dw $0194
	dw $017D
	dw $0168
	dw $0153
	dw $0140
	dw $012E
	dw $011D
	dw $010D
	dw $00FE
	dw $00F0
	dw $00E2
	dw $00D6
	dw $00CA
	dw $00BE
	dw $00B4
	dw $00AA
	dw $00A0
	dw $0097
	dw $008F
	dw $0087
	dw $007F
	dw $0078
	dw $0071
	dw $006B
	dw $0065
	dw $005F
	dw $005A
	dw $0055
	dw $0050
	dw $004C
	dw $0047
	dw $0043
	dw $0040
	dw $003C
	dw $0039
	dw $0035
	dw $0032
	dw $0030
	dw $002D
	dw $002A
	dw $0028
	dw $0026
	dw $0024
	dw $0022
	dw $0020
	dw $001E
	dw $001C
	dw $001B
	dw $0019
	dw $0018
	dw $0016
	dw $0015
	dw $0014
	dw $0013
	dw $0012
	dw $0011
	dw $0010
	dw $000F
	dw $000E
	dw $000D
	dw $000C
	dw $000B
	dw $000A
	dw $0009
	dw $0008
	dw $0007
	dw $0006
	dw $0005
	dw $0004
	dw $0003
	dw $0002
 ;include sfx_ data
	include sound/sfx_SpinJump.asm
	include sound/sfx_Pause.asm
	include sound/sfx_Jump.asm
	include sound/sfx_Swim.asm
	include sound/sfx_Beep.asm
	include sound/sfx_YoshiCoin.asm
	include sound/sfx_1UP.asm
	include sound/sfx_Coin.asm
	include sound/sfx_Powerup.asm
	include sound/sfx_Warp.asm
	include sound/sfx_Block.asm
	include sound/sfx_Powerdown.asm
	include sound/sfx_YoshiMount.asm
	include sound/sfx_Feather.asm
	include sound/sfx_Thud.asm
	include sound/sfx_Explosion.asm
	include sound/sfx_EnemyHit1.asm
	include sound/sfx_EnemyHit2.asm
	include sound/sfx_EnemyHit3.asm
	include sound/sfx_EnemyHit4.asm
	include sound/sfx_EnemyHit5.asm
	include sound/sfx_EnemyHit6.asm
	include sound/sfx_EnemyHit7.asm
	include sound/sfx_EnemyHit8.asm
	include sound/sfx_YoshiTongue.asm
	include sound/sfx_YoshiSwallow.asm
	include sound/sfx_YoshiFireSpit.asm
	include sound/sfx_Checkpoint.asm
	include sound/sfx_Chainsaw.asm
 ;include music data
	include sound/mus_Title.asm
	include sound/mus_GameOver.asm
	include sound/mus_PlayerDown.asm
	include sound/mus_Victory.asm
	include sound/mus_DonutPlains.asm
	include sound/mus_YoshisIsland.asm
	include sound/mus_ValleyofBowser.asm
	include sound/mus_VanillaDome.asm
	include sound/mus_ForestofIllusion.asm
	include sound/mus_Overworld.asm
	include sound/mus_Underground.asm
	include sound/mus_GhostHouse.asm
	include sound/mus_Castle.asm
	include sound/mus_Underwater.asm
	include sound/mus_Ending.asm
	incbin prg/padding/padding058_59.bin