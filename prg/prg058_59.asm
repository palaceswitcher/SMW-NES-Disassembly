;Disassembled by BZK 6502 Disassembler
tbl10_8000:
	dw ofs_NA
	dw ofs_Vol01
	dw ofs_Vol02
	dw ofs_Vol03
	dw ofs_Pitch04
	dw ofs_Pitch05
	dw ofs_Pitch06
	dw ofs_Duty07 ; 50%
	dw ofs_Vol08
	dw ofs_Vol09
	dw ofs_Vol0A
	dw ofs_Pitch0B
	dw ofs_Vol0C
	dw ofs_Pitch0D
	dw ofs_Duty0E ; 12.5%-25%-50% x1
	dw ofs_Pitch0F
	dw ofs_Vol10
	dw ofs_Vol11
	dw ofs_Duty12 ; 12.5%-25% x1
	dw ofs_NA
	dw ofs_Vol14
	dw ofs_Vol15
	dw ofs_Pitch16
	dw ofs_Duty17 ; 50%-25% x1
	dw ofs_Vol28 ; castle flat dynamics
	dw ofs_Vol19
	dw ofs_Vol1A
	dw ofs_Vol1B
	dw ofs_Vol29
	dw ofs_Vol1D
	dw ofs_Vol1E
	dw ofs_Vol1F
	dw ofs_Vol20
	dw ofs_Vol21
	dw ofs_Vol22
	dw ofs_Vol23
	dw ofs_Vol24
	dw ofs_Vol25
	dw ofs_Vol26
	dw ofs_Vol27
	dw ofs_Vol28
	dw ofs_Vol29
	dw ofs_Pitch2A
	dw ofs_Vol2B
	dw ofs_Vol2C
	dw ofs_Duty2D ; 210121 x1
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Vol33
	dw ofs_Duty34 ; 3|2101 x1
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Duty38 ; 50%
	dw ofs_Pitch39
	dw ofs_Pitch3A
	dw ofs_Vol3B
	dw ofs_Duty3C ; 75%
	dw ofs_Duty3D ; 12.5%
	dw ofs_Vol3E
	dw ofs_Pitch3F
	dw ofs_Vol40
	dw ofs_Vol41
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Vol46
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Pitch51
	dw ofs_Vol52
	dw ofs_Vol53
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Duty60 ; 75%-12.5% x5
	dw ofs_Vol61
	dw ofs_Pitch62
	dw ofs_Pitch63
	dw ofs_Pitch64
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_NA
	dw ofs_Pitch74
	dw ofs_Vol75
	dw ofs_Vol76
	dw ofs_Vol77
	dw ofs_Vol78
	dw ofs_Duty79 ; 75%-25% x1
	dw ofs_Pitch7A
	dw ofs_Duty7B ; 25%
	dw ofs_Pitch7C
	dw ofs_Vol7D
	dw ofs_Vol7E
	dw ofs_Vol7F
	.include sound/instruments.asm
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
	LDA #0
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
	STA MuteFlag,Y
	DEY
	BNE bra10_85F8
	LDA #$FF
	LDX #$04
bra10_8602:
	DEX
	STA Pulse1VolumeDelay,X
	STA SFXVolumeDelay,X
	BNE bra10_8602
	LDX #$04
bra10_860D:
	DEX
	STA Pulse1PitchDelay,X
	STA SFXPitchDelay,X
	BNE bra10_860D
	LDX #$02
bra10_8618:
	DEX
	STA Pulse1DutyDelay,X
	STA SFXDutyDelay,X
	BNE bra10_8618
	LDX #$08
bra10_8623:
	DEX
	STA SoundQueue,X
	BNE bra10_8623
	RTS
jmp_58_862A:
	LDA PauseFlag
	BEQ bra10_8642
	LDA SFXPointer+2
	ORA SFXPointer+3
	CMP #1
	LDA #$02
	BCS PauseNotDone
	LDA #$00
PauseNotDone:
	STA APUStatus
	LDA #%00001111
	STA APUStatus ;Disable noise channel
	JSR UpdateChannels
	JSR sub10_86E8
	JMP loc10_8671
bra10_8642:
;	LDA #$0F
;	STA APUStatus ;Re-enable all channels (excluding DMC)
loc10_8647:
	JSR UpdateChannels
	JSR sub10_86E8
	LDA #$00
	STA CurrentTrackID
	STA CurrentTrackOffset
	STA CurrentTrackPointerOffset
bra10_8658:
	JSR sub10_87A1
	JSR sub10_8B25
	INC CurrentTrackID
	INC CurrentTrackOffset
	INC CurrentTrackPointerOffset
	INC CurrentTrackPointerOffset
	LDX CurrentTrackID
	CPX #$05
	BNE bra10_8658
loc10_8671:
	LDA #$10
	STA CurrentTrackID
	LDA #SOUND_RAM_LENGTH
	STA CurrentTrackOffset
	STA CurrentTrackPointerOffset
bra10_867E:
	JSR sub10_87A1
	JSR sub10_8B25
	INC CurrentTrackID
	INC CurrentTrackOffset
	INC CurrentTrackPointerOffset
	INC CurrentTrackPointerOffset
	LDX CurrentTrackID
	CPX #$15
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
	JSR FetchDutyCycle
	LDA SoundPointer
	AND #$F0
	ORA #$30
	STA Sq1Vol
	LDX #$01
	LDY #$02
	JSR FetchDutyCycle
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
	LDA MuteFlag
	BEQ bra10_8706_RTS
	LDY #$00
bra10_86EF:
	LDA SoundQueue,Y
	BMI bra10_8701
	TAX
	TYA
	PHA
	JSR sub10_8707
	PLA
	TAY
	LDA #$FF
	STA SoundQueue,Y
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
	STA CurrentTrackID
	TAX
	CPX #$FF
	BEQ bra10_86DF_RTS ;Stop if the end byte is reached ($FF)
	LDA CurrentTrackID
	BMI bra10_872F
	STA CurrentTrackOffset
	ASL
	STA CurrentTrackPointerOffset
	JMP loc10_8741
bra10_872F:
	AND #$7F
	CLC
	ADC #SOUND_RAM_LENGTH
	STA CurrentTrackOffset
	TXA
	AND #$7F
	ASL
	CLC
	ADC #SOUND_RAM_LENGTH
	STA CurrentTrackPointerOffset
loc10_8741:
	LDA CurrentTrackID
	AND #$0F
	ASL
	ASL
	TAX
	LDA #$7f
	STA Sq1Sweep, X
	LDX CurrentTrackPointerOffset
	INY
	LDA (SoundPointer),Y
	STA MusicPointer,X
	INY
	LDA (SoundPointer),Y
	STA MusicPointer+1,X
	INY
	TYA
	PHA
	LDY #$00
	LDA CurrentTrackID
	BPL bra10_875C
	LDY #SOUND_RAM_LENGTH
bra10_875C:
	LDA CurrentTrackID
	AND #$0F
	TAY
	LDA #$00
	STA RemainingSongTicks,X
	STA NumSongTicks,X
	LDX CurrentTrackOffset
	LDA #$00
	STA Pulse1VolumeEnv,X
	LDA #$FF
	STA Pulse1VolumeDelay,X
	CPY #$04
	BPL bra10_879C
	LDA #$00
	STA Pulse1PitchSetting,X
	LDA #$FF
	STA Pulse1PitchDelay,X
	CPY #$03
	BPL bra10_879C
	LDA #$00
	STA Pulse1Transpose,X
	CPY #$02
	BPL bra10_879C
	LDA #$00
	STA Pulse1Duty,X
	LDA #$FF
	STA Pulse1DutyDelay,X
bra10_879C:
	PLA
	TAY
	JMP loc10_8716
sub10_87A1:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	ORA MusicPointer+1,X
	BEQ bra10_87DF_RTS
	LDA RemainingSongTicks,X
	BNE bra10_87DC
	LDA NumSongTicks,X
	BNE bra10_87C5
	JSR GaugeMusicByte
	LDX CurrentTrackPointerOffset
	LDY CurrentTrackOffset
	LDA NoteLengths,Y
	STA NumSongTicks,X
bra10_87C5:
	DEC NumSongTicks,X
	LDY CurrentTrackID
	CPY #$05
	LDY #SOUND_RAM_LENGTH
	BCS loc10_87D6
	LDY #$00
loc10_87D6:
	LDA MusicSpeed,Y
	STA RemainingSongTicks,X
bra10_87DC:
	DEC RemainingSongTicks,X
bra10_87DF_RTS:
	RTS
GaugeMusicByte:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	BPL GaugePitch
	TAX
	CPX #$F0
	BMI GaugeNoteLength
	JMP GaugeMusicCommand
GaugeNoteLength:
	AND #$7F
	BEQ InvalidNoteLength
	LDX CurrentTrackOffset
	STA NoteLengths,X
InvalidNoteLength:
	JSR sub10_8E20
	JMP GaugeMusicByte
musDummy:
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
GaugePitch:
	BNE bra10_883B
	JSR sub10_8E20
	JMP loc10_8A0A
	RTS
bra10_883B:
	PHA
	LDA CurrentTrackID
	AND #$0F
	TAX
	PLA
	CPX #$03
	BEQ bra10_8866
	CPX #$04
	BNE bra10_884B
	LDX CurrentTrackPointerOffset
	STA Pulse1Pitch, X
	CPX #SOUND_RAM_LENGTH
	BCS SetDPCMIndex
	LDA SFXPointer, X
	ORA SFXPointer+1, X
	BNE SkipDPCMSet
SetDPCMIndex:
	LDA #0
	STA Pulse1Pitch+1,X
	LDA #1
	STA DPCMFlag
SkipDPCMSet:
	JMP loc10_8878
bra10_884B:
	LDX CurrentTrackOffset
	CLC
	ADC Pulse1Transpose,X
	ASL
	TAY
	LDX CurrentTrackPointerOffset
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
	LDX CurrentTrackPointerOffset
	STA Pulse1Pitch,X
loc10_8878:
	JSR sub10_8A65
	JSR sub10_8E20
	RTS
GaugeMusicCommand:
	AND #$0F
	ASL
	TAY
	JSR sub10_8E20
	TYA
	TAX
	LDA MusicCommandTable,X
	STA SoundPointer
	LDA MusicCommandTable+1,X
	STA SoundPointer+1
	JMP (SoundPointer)
MusicCommandTable:
	dw musCall
	dw musRet
	dw musLoop
	dw musLoopEnd
	dw musJump
	dw musSpeed
	dw musTransposition
	dw musSweep
	dw musVolumeEnv
	dw musDutyCycle
	dw musModulation
	dw musVerboseLoop
	dw musDummy
	dw GaugeNoteLength
	dw GaugeMusicByte
	dw musEnd
musSweep:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDA CurrentTrackID
	AND #$0F
	ASL A
	ASL A
	TAX
	LDY #$00
	LDA (SoundPointer),Y
	STA Sq1Sweep, X ; update sweep
	JSR sub10_8E20
	JMP GaugeMusicByte
musCall:
	LDX CurrentTrackPointerOffset
	CLC
	LDA MusicPointer,X
	ADC #$02
	STA SongReturnPointer,X
	LDA MusicPointer+1,X
	ADC #$00
	STA SongReturnPointer+1,X
	JMP loc10_893D
musRet:
	LDX CurrentTrackPointerOffset
	LDA SongReturnPointer,X
	STA MusicPointer,X
	LDA SongReturnPointer+1,X
	STA MusicPointer+1,X
	LDA #$00
	STA SongReturnPointer,X
	STA SongReturnPointer+1,X
	JMP GaugeMusicByte
musLoop:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA SongLoopCounter,X
	JSR sub10_8E20
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SongLoopPointer,X
	LDA MusicPointer+1,X
	STA SongLoopPointer+1,X
	JMP GaugeMusicByte
musLoopEnd:
	LDX CurrentTrackOffset
	DEC SongLoopCounter,X
	BEQ bra10_892C
	LDX CurrentTrackPointerOffset
	LDA SongLoopPointer,X
	STA MusicPointer,X
	LDA SongLoopPointer+1,X
	STA MusicPointer+1,X
	JMP GaugeMusicByte
bra10_892C:
	LDX CurrentTrackPointerOffset
	LDA #$00
	STA SongLoopPointer,X
	STA SongLoopPointer+1,X
	JMP GaugeMusicByte
musJump:
	LDX CurrentTrackPointerOffset
loc10_893D:
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	STA MusicPointer,X
	INY
	LDA (SoundPointer),Y
	STA MusicPointer+1,X
	JMP GaugeMusicByte
musSpeed:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	LDX CurrentTrackID
	CPX #$04
	BMI bra10_8971
	LDY #SOUND_RAM_LENGTH
bra10_8971:
	STA MusicSpeed,Y ;Set Music/SFX speed
	JSR sub10_8E20
	JMP GaugeMusicByte
musTransposition:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$03
	BPL bra10_899B
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	LDY #$00
	LDA (SoundPointer),Y
	LDX CurrentTrackOffset
	STA Pulse1Transpose,X
bra10_899B:
	JSR sub10_8E20
	JMP GaugeMusicByte
musVolumeEnv:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_89B1
	JSR sub10_8E20
	JMP GaugeMusicByte
bra10_89B1:
	JSR sub10_8B0D
	STA Pulse1VolumeEnv,X
	JMP GaugeMusicByte
musDutyCycle:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$02
	BMI bra10_89CA
	JSR sub10_8E20
	JMP GaugeMusicByte
bra10_89CA:
	JSR sub10_8B0D
	STA Pulse1Duty,X
	JMP GaugeMusicByte
musModulation:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_89E3
	JSR sub10_8E20
	JMP GaugeMusicByte
bra10_89E3:
	JSR sub10_8B0D
	STA Pulse1PitchSetting,X
	JMP GaugeMusicByte
musEnd:
	LDA CurrentTrackID
	AND #$0F
	ASL
	ASL
	TAX
	LDA #$7f
	STA Sq1Sweep, X
	LDX CurrentTrackPointerOffset
	LDA #$00
	STA MusicPointer,X
	STA MusicPointer+1,X
	LDA CurrentTrackID
	AND #$0F
	ASL
	TAX
	CLC
	ADC #SOUND_RAM_LENGTH
	TAY
	LDA #$FF
	STA Pulse1FinalPitch+1,X
	STA Pulse1FinalPitch+1,Y
loc10_8A0A:
	LDY CurrentTrackOffset
	LDA CurrentTrackID
	AND #$0F
	TAX
	LDA #$FF
	CPX #$04
	BPL bra10_8A26_RTS
	STA Pulse1VolumeDelay,Y
	STA Pulse1PitchDelay,Y
	CPX #$02
	BPL bra10_8A26_RTS
	STA Pulse1DutyDelay,Y
bra10_8A26_RTS:
	RTS
musVerboseLoop:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	JSR sub10_8E20
	LDX CurrentTrackOffset
	LDA SongLoopCounter,X
	BNE bra10_8A46
	LDY #$00
	LDA (SoundPointer),Y
	STA SongLoopCounter,X
bra10_8A46:
	DEC SongLoopCounter,X
	BNE bra10_8A62
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	CLC
	ADC #$02
	STA MusicPointer,X
	LDA MusicPointer+1,X
	ADC #$00
	STA MusicPointer+1,X
	JMP GaugeMusicByte
bra10_8A62:
	JMP musJump
sub10_8A65:
	LDX CurrentTrackPointerOffset
	LDA Pulse1FinalPitch+1,X
	ORA #$80
	STA Pulse1FinalPitch+1,X
	JSR sub10_8A7A
	JSR sub10_8AAB
	JSR sub10_8ADC
	RTS
sub10_8A7A:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_8A85
	RTS
bra10_8A85:
	LDX CurrentTrackOffset
	LDY CurrentTrackPointerOffset
	LDA Pulse1VolumeEnv,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA Pulse1VolumePointer,Y
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA Pulse1VolumePointer+1,Y
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1VolumeDelay,X
	RTS
sub10_8AAB:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$02
	BMI bra10_8AB6
	RTS
bra10_8AB6:
	LDX CurrentTrackOffset
	LDY CurrentTrackPointerOffset
	LDA Pulse1Duty,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA Pulse1DutyPointer,Y
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA Pulse1DutyPointer+1,Y
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1DutyDelay,X
	RTS
sub10_8ADC:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BMI bra10_8AE7
	RTS
bra10_8AE7:
	LDX CurrentTrackOffset
	LDY CurrentTrackPointerOffset
	LDA Pulse1PitchSetting,X
	ASL
	TAX
	LDA tbl10_8000,X
	STA Pulse1PitchPointer,Y
	STA SoundPointer
	LDA tbl10_8000+1,X
	STA Pulse1PitchPointer+1,Y
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1PitchDelay,X
	RTS
sub10_8B0D:
	LDX CurrentTrackPointerOffset
	LDA MusicPointer,X
	STA SoundPointer
	LDA MusicPointer+1,X
	STA SoundPointer+1
	JSR sub10_8E20
	LDY #$00
	LDA (SoundPointer),Y
	LDX CurrentTrackOffset
	RTS
sub10_8B25:
	JSR sub10_8B2F
	JSR sub10_8BA2
	JSR sub10_8C15
	RTS
sub10_8B2F:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BPL bra10_8BA1_RTS
bra10_8B39:
loc10_8B39:
	LDX CurrentTrackOffset
	LDA Pulse1VolumeDelay,X
	TAY
	CPY #$FF
	BEQ bra10_8BA1_RTS
	LDX CurrentTrackOffset
	LDA Pulse1VolumeDelay,X
	BNE bra10_8B9E
	LDX CurrentTrackPointerOffset
	LDA #$02
	CLC
	ADC Pulse1VolumePointer,X
	STA Pulse1VolumePointer,X
	STA SoundPointer
	LDA #$00
	ADC Pulse1VolumePointer+1,X
	STA Pulse1VolumePointer+1,X
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1VolumeDelay,X
	TAY
	CPY #$FF
	BNE bra10_8B39
	LDX CurrentTrackPointerOffset
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8B91
	CLC
	ADC Pulse1VolumePointer,X
	STA Pulse1VolumePointer,X
	STA SoundPointer
	BCS bra10_8B8C
	DEC Pulse1VolumePointer+1,X
bra10_8B8C:
	LDA Pulse1VolumePointer+1,X
	STA SoundPointer+1
bra10_8B91:
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1VolumeDelay,X
	JMP loc10_8B39
bra10_8B9E:
	DEC Pulse1VolumeDelay,X
bra10_8BA1_RTS:
	RTS
sub10_8BA2:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$02
	BPL bra10_8C14_RTS
bra10_8BAC:
loc10_8BAC:
	LDX CurrentTrackOffset
	LDA Pulse1DutyDelay,X
	TAY
	CPY #$FF
	BEQ bra10_8C14_RTS
	LDX CurrentTrackOffset
	LDA Pulse1DutyDelay,X
	BNE bra10_8C11
	LDX CurrentTrackPointerOffset
	LDA #$02
	CLC
	ADC Pulse1DutyPointer,X
	STA Pulse1DutyPointer,X
	STA SoundPointer
	LDA #$00
	ADC Pulse1DutyPointer+1,X
	STA Pulse1DutyPointer+1,X
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1DutyDelay,X
	TAY
	CPY #$FF
	BNE bra10_8BAC
	LDX CurrentTrackPointerOffset
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8C04
	CLC
	ADC Pulse1DutyPointer,X
	STA Pulse1DutyPointer,X
	STA SoundPointer
	BCS bra10_8BFF
	DEC Pulse1DutyPointer+1,X
bra10_8BFF:
	LDA Pulse1DutyPointer+1,X
	STA SoundPointer+1
bra10_8C04:
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1DutyDelay,X
	JMP loc10_8BAC
bra10_8C11:
	DEC Pulse1DutyDelay,X
bra10_8C14_RTS:
	RTS
sub10_8C15:
	LDA CurrentTrackID
	AND #$0F
	TAX
	CPX #$04
	BPL bra10_8C84_RTS
bra10_8C1F:
loc10_8C1F:
	LDX CurrentTrackOffset
	LDA Pulse1PitchDelay,X
	TAY
	CPY #$FF
	BEQ bra10_8C84_RTS
	LDA Pulse1PitchDelay,X
	BNE bra10_8C81
	LDX CurrentTrackPointerOffset
	LDA #$02
	CLC
	ADC Pulse1PitchPointer,X
	STA Pulse1PitchPointer,X
	STA SoundPointer
	LDA #$00
	ADC Pulse1PitchPointer+1,X
	STA Pulse1PitchPointer+1,X
	STA SoundPointer+1
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1PitchDelay,X
	TAY
	CPY #$FF
	BNE bra10_8C1F
	LDX CurrentTrackPointerOffset
	LDY #$01
	LDA (SoundPointer),Y
	AND #$FE
	BPL bra10_8C74
	CLC
	ADC Pulse1PitchPointer,X
	STA Pulse1PitchPointer,X
	STA SoundPointer
	BCS bra10_8C6F
	DEC Pulse1PitchPointer+1,X
bra10_8C6F:
	LDA Pulse1PitchPointer+1,X
	STA SoundPointer+1
bra10_8C74:
	LDX CurrentTrackOffset
	LDY #$00
	LDA (SoundPointer),Y
	STA Pulse1PitchDelay,X
	JMP loc10_8C1F
bra10_8C81:
	DEC Pulse1PitchDelay,X
bra10_8C84_RTS:
	RTS
UpdateChannels:
	JSR UpdateSquare1
	JSR UpdateSquare2
	JSR UpdateTriangle
	JSR UpdateNoise
	JMP UpdateDPCM
UpdateSquare1:
	LDX #SOUND_RAM_LENGTH
	LDY #SOUND_RAM_LENGTH
	LDA SFXPointer+1
	ORA SFXPointer
	BNE bra10_8CA2
	LDX #$00
	LDY #$00
bra10_8CA2:
	JSR FetchVolume
	LDA SoundPointer
	PHA
	JSR FetchDutyCycle
	PLA
	ORA SoundPointer
	ORA #$30
	STA Sq1Vol
	JSR FetchModulation
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8CC0
	DEC SoundPointer+1
bra10_8CC0:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA Pulse1FinalPitch,Y
	STA Sq1Lo
	LDA Pulse1FinalPitch+1,Y
	STA SoundPointer
	LDA Pulse1Pitch+1,Y
	ADC SoundPointer+1
	TAX
	CPX $FE
	BEQ bra10_8CE3_RTS
	STA Pulse1FinalPitch+1,Y
	ORA #$F8
	STA Sq1Hi
bra10_8CE3_RTS:
	RTS
UpdateSquare2:
	LDX #SOUND_RAM_LENGTH+1
	LDY #SOUND_RAM_LENGTH+2
	LDA SFXPointer+3
	ORA SFXPointer+2
	BNE bra10_8CF4
	LDX #$01
	LDY #$02
bra10_8CF4:
	JSR FetchVolume
	LDA SoundPointer
	PHA
	JSR FetchDutyCycle
	PLA
	ORA SoundPointer
	ORA #$30
	STA Sq2Vol
	JSR FetchModulation
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8D12
	DEC SoundPointer+1
bra10_8D12:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA Pulse1FinalPitch,Y
	STA Sq2Lo
	LDA Pulse1FinalPitch+1,Y
	STA SoundPointer
	LDA Pulse1Pitch+1,Y
	ADC SoundPointer+1
	TAX
	CPX $FE
	BEQ bra10_8D35_RTS
	STA Pulse1FinalPitch+1,Y
	ORA #$F8
	STA Sq2Hi
bra10_8D35_RTS:
	RTS
UpdateTriangle:
	LDX #SOUND_RAM_LENGTH+2
	LDY #SOUND_RAM_LENGTH+4
	LDA SFXPointer+5
	ORA SFXPointer+4
	BNE bra10_8D46
	LDX #$02
	LDY #$04
bra10_8D46:
	JSR FetchVolume
	LDA SoundPointer
	BEQ bra10_8D4F
	LDA #$FF
bra10_8D4F:
	ORA #$80
	STA TriLinear
	JSR FetchModulation
	LDA #$00
	STA SoundPointer+1
	LDA SoundPointer
	BPL bra10_8D61
	DEC SoundPointer+1
bra10_8D61:
	LDA Pulse1Pitch,Y
	CLC
	ADC $FE
	STA Pulse1FinalPitch,Y
	STA TriLo
	LDA Pulse1FinalPitch+1,Y
	STA SoundPointer
	LDA Pulse1Pitch+1,Y
	ADC SoundPointer+1
	TAX
	CPX $FE
	BEQ bra10_8D84_RTS
	STA Pulse1FinalPitch+1,Y
	ORA #$F8
	STA TriHi
bra10_8D84_RTS:
	RTS
UpdateNoise:
	LDX #SOUND_RAM_LENGTH+3
	LDY #SOUND_RAM_LENGTH+6
	LDA SFXPointer+7
	ORA SFXPointer+6
	BNE bra10_8D95
	LDX #$03
	LDY #$06
bra10_8D95:
	JSR FetchVolume
	LDA SoundPointer
	ORA #$30
	STA NoiseVol
	JSR FetchModulation
	LDA Pulse1Pitch,Y
	CLC
	ADC SoundPointer
	STA NoiseLo
	LDA #$F8
	STA NoiseHi
	RTS
UpdateDPCM:
	LDA DPCMFlag
	BNE DPCMFlagWasSet
	RTS
DPCMFlagWasSet:
	LDX #SOUND_RAM_LENGTH+4
	LDY #SOUND_RAM_LENGTH+8
	LDA SFXPointer+9
	ORA SFXPointer+8
	BNE SetDPCMPitch
	LDX #$04
	LDY #$08
SetDPCMPitch:
	LDA #0
	STA DPCMFlag
	LDA #$0f
	STA APUStatus
	LDA Pulse1Pitch,Y
	BEQ UpdateDPCM_Quit
	TAY
	LDA DPCM_PitchTable, Y
	STA DMCFreq
	LDA DPCM_BankTable, Y
	STA M90_PRG2
	LDA DPCM_AddressTable, Y
	ASL A
	ASL A
	STA DPCMBackupOffset
	LDA DPCM_EndAddressTable, Y
	SEC
	SBC DPCMBackupOffset
	STA DMCLength
	LDA DPCM_AddressTable, Y
	STA DMCStart
	LDA #$1f
	STA APUStatus
UpdateDPCM_Quit:
	RTS
FetchVolume:
	TYA
	PHA
	LDA Pulse1VolumeDelay,X
	TAY
	CPY #$FF
	BNE bra10_8DC0
	LDA #$00
	JMP loc10_8DD1
bra10_8DC0:
	PLA
	PHA
	TAY
	LDA Pulse1VolumePointer,Y
	STA SoundPointer
	LDA Pulse1VolumePointer+1,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8DD1:
	STA SoundPointer
	PLA
	TAY
	RTS
FetchDutyCycle:
	TYA
	PHA
	LDA Pulse1DutyDelay,X
	TAY
	CPY #$FF
	BNE bra10_8DE5
	LDA #$00
	JMP loc10_8DF6
bra10_8DE5:
	PLA
	PHA
	TAY
	LDA Pulse1DutyPointer,Y
	STA SoundPointer
	LDA Pulse1DutyPointer+1,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8DF6:
	STA SoundPointer
	PLA
	TAY
	RTS
FetchModulation:
	TYA
	PHA
	LDA Pulse1PitchDelay,X
	TAY
	CPY #$FF
	BNE bra10_8E0A
	LDA #$00
	JMP loc10_8E1B
bra10_8E0A:
	PLA
	PHA
	TAY
	LDA Pulse1PitchPointer,Y
	STA SoundPointer
	LDA Pulse1PitchPointer+1,Y
	STA SoundPointer+1
	LDY #$01
	LDA (SoundPointer),Y
loc10_8E1B:
	STA SoundPointer
	PLA
	TAY
	RTS
sub10_8E20:
	LDX CurrentTrackPointerOffset
sub_58_8E23:
	INC MusicPointer,X
	LDA MusicPointer,X
	BNE bra10_8E2E_RTS
	INC MusicPointer+1,X
bra10_8E2E_RTS:
	LDA CurrentTrackID
	AND #$0F
	CMP #$04
	BCC LeaveAloneMix
	LDX CurrentTrackPointerOffset
	CPX #SOUND_RAM_LENGTH
	BCS UpdateAPUStat
	LDA SFXPointer, X
	ORA SFXPointer+1, X
	BNE LeaveAloneMix
UpdateAPUStat:
	LDA #$0F
	STA APUStatus
LeaveAloneMix:
	RTS

sub10_8E2F:
	TAX ;Store saved sound ID in X reg
	LDY #$FF ;Set index to -1
bra10_8E32:
	CPY #$07
	BEQ bra10_8E40_RTS ;Stop if the index is out of range
	INY ;Increment index
	LDA SoundQueue,Y
	BPL bra10_8E32 ;Loop only if bit 7 of the sound ID is cleared
	TXA ;Retrieve backed up sound ID
	STA SoundQueue,Y ;Store in SFX queue
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
	dw HitBlock_Footer
	dw FireBall_Footer
	dw Switch_Footer
	dw DryBones_Footer
	dw Spring_Footer
	dw Thwomp_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
	dw Empty_Footer
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
	dw InvincibleStar_Footer
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
	dw SongLoopPointer ;B-0
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
DPCM_BankTable:
	db $3E ; C0
REPT 6
	db $28 ; C#0 - F#0
ENDR
REPT 9
	db $3C ; G0 - D#1
ENDR
REPT 15
	db $3E ; E1 - F#2
ENDR
REPT 8
	db $34 ; G2 - D3
ENDR
	db $2d ; D#3
	db $3E ; E3
	db $3E ; F3
	db $3E ; F#3
	db $3E ; G3
	db $28 ; G#3
	db $28 ; A3
	db $3C ; A#3
	db $3E ; B3
	db $3E ; C4
	db $28 ; C#4
	db $28 ; D4
	db $3C ; D#4
	db $3E ; E4
	db $3E ; F4
	db $3E ; F#4
	db $3E ; G4
	db $3E ; G#4
	db $3E ; A4
DPCM_AddressTable:
	db $7F			; C0
	db Bb_DIM_DOWN >> 2	; C#0
	db C_5Min7_LD >> 2	; D0
	db UC#4 >> 2		; D#0
	db UD4 >> 2		; E0
	db F_MAJ_DOWN >> 2	; F0
	db G_MIN_UP_FI >> 2	; F#0
	db UD#4 >> 2		; G0
	db G_MIN_DOWN_FI >> 2	; G#0
	db G_MIN_DOWN_SI >> 2	; A0
	db Ab_MAJ_DOWN >> 2	; A#0
	db A_MIN_DOWN >> 2	; B0
	db Bb_MAJ_DOWN >> 2	; C1
	db B_DIM_DOWN >> 2	; C#1
	db Ab_DIM_DOWN >> 2	; D1
	db C_7_DOWN >> 2	; D#1
	db G_SUS_DOWN >> 2	; E1
	db UE4 >> 2		; F1
	db UF4 >> 2		; F#1
	db UF#4 >> 2		; G1
	db UG4 >> 2		; G#1
	db UG#4 >> 2		; A1
	db UA4 >> 2		; A#1
	db G_MIN_UP_SI >> 2	; B1
	db Ab_MAJ_UP >> 2	; C2
	db A_MIN_UP >> 2	; C#2
	db C_7_UP >> 2		; D2
	db C_MAJ_DOWN >> 2	; D#2
	db C_MAJ_UP >> 2	; E2
	db F_MAJ_UP >> 2	; F2
	db Ab_DIM_UP >> 2	; F#2
	db Bb_DIM_UP >> 2	; G2
	db Bb_MAJ_UP >> 2	; G#2
	db B_DIM_UP >> 2	; A2
	db G_SUS_UP >> 2	; A#2
	db YOSHI1 >> 2		; B2
	db YOSHI2 >> 2		; C3
	db SWIM >> 2		; C#3
	db KICK_DRUM >> 2	; D3
	db POWER_SNARE >> 2	; D#3
	db $7F			; E3
	db $7F			; F3
	db $7F			; F#3
	db $7F			; G3
	db UC#4 >> 2		; G#3
	db UD4 >> 2		; A3
	db UD#4 >> 2		; A#3
	db UE4 >> 2		; B3
	db UF4 >> 2		; C4
	db UC#4 >> 2		; C#4
	db UD4 >> 2		; D4
	db UD#4 >> 2		; D#4
	db UE4 >> 2		; E4
	db UF4 >> 2		; F4
	db UF#4 >> 2		; F#4
	db UG4 >> 2		; G4
	db UG#4 >> 2		; G#4
	db UA4 >> 2		; A4
DPCM_EndAddressTable:
	dl $FF			; C0
	dl Bb_DIM_DOWN_END	; C#0
	dl C_5Min7_LD_END	; D0
	dl UC#4_END		; D#0
	dl UD4_END		; E0
	dl F_MAJ_DOWN_END	; F0
	dl G_MIN_UP_FI_END	; F#0
	dl UD#4_END		; G0
	dl G_MIN_DOWN_FI_END	; G#0
	dl G_MIN_DOWN_SI_END	; A0
	dl Ab_MAJ_DOWN_END	; A#0
	dl A_MIN_DOWN_END	; B0
	dl Bb_MAJ_DOWN_END	; C1
	dl B_DIM_DOWN_END	; C#1
	dl Ab_DIM_DOWN_END	; D1
	dl C_7_DOWN_END		; D#1
	dl G_SUS_DOWN_END	; E1
	dl UE4_END		; F1
	dl UF4_END		; F#1
	dl UF#4_END		; G1
	dl UG4_END		; G#1
	dl UG#4_END		; A1
	dl UA4_END		; A#1
	dl G_MIN_UP_SI_END	; B1
	dl Ab_MAJ_UP_END	; C2
	dl A_MIN_UP_END		; C#2
	dl C_7_UP_END		; D2
	dl C_MAJ_DOWN_END	; D#2
	dl C_MAJ_UP_END		; E2
	dl F_MAJ_UP_END		; F2
	dl Ab_DIM_UP_END	; F#2
	dl Bb_DIM_UP_END	; G2
	dl Bb_MAJ_UP_END	; G#2
	dl B_DIM_UP_END		; A2
	dl G_SUS_UP_END		; A#2
	dl YOSHI1_END		; B2
	dl YOSHI2_END		; C3
	dl SWIM_END		; C#3
	dl KICK_DRUM_END	; D3
	dl POWER_SNARE_END	; D#3
	dl $FF			; E3
	dl $FF			; F3
	dl $FF			; F#3
	dl $FF			; G3
	dl UC#4_END		; G#3
	dl UD4_END		; A3
	dl UD#4_END		; A#3
	dl UE4_END		; B3
	dl UF4_END		; C4
	dl UC#4_END		; C#4
	dl UD4_END		; D4
	dl UD#4_END		; D#4
	dl UE4_END		; E4
	dl UF4_END		; F4
	dl UF#4_END		; F#4
	dl UG4_END		; G4
	dl UG#4_END		; G#4
	dl UA4_END		; A4
DPCM_PitchTable:
	db $F			; C0
	db $F			; C#0
	db $F			; D0
	db $F			; D#0
	db $F			; E0
	db $F			; F0
	db $F			; F#0
	db $F			; G0
	db $F			; G#0
	db $F			; A0
	db $F			; A#0
	db $F			; B0
	db $F			; C1
	db $F			; C#1
	db $F			; D1
	db $F			; D#1
	db $F			; E1
	db $F			; F1
	db $F			; F#1
	db $F			; G1
	db $F			; G#1
	db $F			; A1
	db $F			; A#1
	db $F			; B1
	db $F			; C2
	db $F			; C#2
	db $F			; D2
	db $F			; D#2
	db $F			; E2
	db $F			; F2
	db $F			; F#2
	db $F			; G2
	db $F			; G#2
	db $F			; A2
	db $F			; A#2
	db $F			; B2
	db $F			; C3
	db $F			; C#3
	db $F			; D3
	db $F			; D#3
	db $F			; E3
	db $F			; F3
	db $F			; F#3
	db $F			; G3
	db $E			; G#3
	db $E			; A3
	db $E			; A#3
	db $E			; B3
	db $E			; C4
	db $F			; C#4
	db $F			; D4
	db $F			; D#4
	db $F			; E4
	db $F			; F4
	db $F			; F#4
	db $F			; G4
	db $F			; G#4
	db $F			; A4
 ;include sfx_ data
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
	.include sound/sfx_HitBlock.asm
	.include sound/sfx_FireBall.asm
	.include sound/sfx_Switch.asm
	.include sound/sfx_DryBones.asm
	.include sound/sfx_Spring.asm
	.include sound/sfx_Thwomp.asm
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
	.include sound/mus_InvincibleStar.asm
;	.incbin prg/padding/padding058_59.bin
