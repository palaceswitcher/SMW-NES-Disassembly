; disassembled by BZK 6502 Disassembler
sub4_8000:
	LDX $A4
	LDA objVar,X
	AND #$7F
	ASL
	TAY
	LDA objState,X
	AND #$20
	BNE bra4_8013
	JMP loc4_809A
bra4_8013:
	JSR sub3_B077
	BNE bra4_8070
	LDA objVar,X
	AND #$7F
	CMP #$07
	BCS bra4_8024
	INC objVar,X
bra4_8024:
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra4_8036
	LDA objYHi,X
	ADC #$00
	BPL bra4_803B
bra4_8036:
	LDA objYHi,X ; unlogged
	SBC #$00 ; unlogged
bra4_803B:
	STA objYHi,X
	JSR sub3_B057
	BNE bra4_806F_RTS
	LDY #$00
	LDA ($32),Y
	TAY
	LDA objState,X
	AND #$40
	BEQ bra4_8054
	TYA
	EOR #$FF
	TAY
	INY
bra4_8054:
	TYA
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra4_8067
	LDA objXHi,X
	ADC #$00
	BPL bra4_806C
bra4_8067:
	LDA objXHi,X
	SBC #$00
bra4_806C:
	STA objXHi,X
bra4_806F_RTS:
	RTS
bra4_8070:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA objYLo,X
	SEC
	SBC $25
	BCS bra4_8086
	DEC objYHi,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
bra4_8086:
	STA objYLo,X
	LDA objState,X
	AND #$C0
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
loc4_809A:
	INY
	LDA ($32),Y
	BMI bra4_80B8
	JSR sub3_B077
	BNE bra4_80B8
	LDA objState,X
	ORA #$20
	STA objState,X
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra4_80B8:
	DEY
	JSR sub3_B057
	BEQ bra4_80C2
	INY
	JMP loc4_80F0
bra4_80C2:
	LDA objState,X
	AND #$40
	BEQ bra4_80D3
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc4_80D5
bra4_80D3:
	LDA ($32),Y
loc4_80D5:
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra4_80E7
	LDA objXHi,X
	ADC #$00
	BPL bra4_80EC
bra4_80E7:
	LDA objXHi,X
	SBC #$00
bra4_80EC:
	STA objXHi,X
	INY
loc4_80F0:
	LDA ($32),Y
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra4_8104
	LDA objYHi,X
	ADC #$00
	BPL bra4_8109
bra4_8104:
	LDA objYHi,X
	SBC #$00
bra4_8109:
	STA objYHi,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra4_811E
	LDA objState,X ; unlogged
	EOR #$40 ; unlogged
	STA objState,X ; unlogged
	JMP loc4_813C ; unlogged
bra4_811E:
	AND #$F0
	BEQ bra4_813C
	LDA ($32),Y
	AND #$3F
	BNE bra4_8131
	LDA objVar,X ; unlogged
	AND #$80 ; unlogged
	STA objVar,X ; unlogged
	RTS ; unlogged
bra4_8131:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra4_813C:
loc4_813C:
	INC objVar,X
	RTS
sub4_8140:
	LDX $A4
	LDA objVar,X
	AND #$7F
	ASL
	TAY
	LDA objState,X
	AND #$20
	BNE bra4_8153
	JMP loc4_81D1
bra4_8153:
	JSR sub3_B077
	BNE bra4_81B8
	LDA objVar,X
	AND #$7F
	CMP #$07
	BCS bra4_8164
	INC objVar,X
bra4_8164:
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra4_8176
	LDA objYHi,X
	ADC #$00
	BPL bra4_817B
bra4_8176:
	LDA objYHi,X
	SBC #$00
bra4_817B:
	STA objYHi,X
	JSR sub3_B057
	BEQ bra4_818B
	LDA objState,X
	EOR #$40
	STA objState,X
bra4_818B:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA objState,X
	AND #$40
	BEQ bra4_819C
	TYA
	EOR #$FF
	TAY
	INY
bra4_819C:
	TYA
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra4_81AF
	LDA objXHi,X
	ADC #$00
	BPL bra4_81B4
bra4_81AF:
	LDA objXHi,X
	SBC #$00
bra4_81B4:
	STA objXHi,X
	RTS
bra4_81B8:
	LDA objYLo,X
	AND #$F8
	STA objYLo,X
	LDA objState,X
	AND #$C0
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
loc4_81D1:
	INY
	LDA ($32),Y
	BMI bra4_81EC
	JSR sub3_B077
	BNE bra4_81EC
	LDA objState,X
	ORA #$20
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra4_81EC:
	DEY
	JSR sub3_B057
	BEQ bra4_81FA
	LDA objState,X
	EOR #$40
	STA objState,X
bra4_81FA:
	LDA objState,X
	AND #$40
	BEQ bra4_820B
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc4_820D
bra4_820B:
	LDA ($32),Y
loc4_820D:
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra4_821F
	LDA objXHi,X
	ADC #$00
	BPL bra4_8224
bra4_821F:
	LDA objXHi,X
	SBC #$00
bra4_8224:
	STA objXHi,X
	INY
	LDA ($32),Y
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra4_823C
	LDA objYHi,X
	ADC #$00
	BPL bra4_8241
bra4_823C:
	LDA objYHi,X
	SBC #$00
bra4_8241:
	STA objYHi,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra4_8256
	LDA objState,X
	EOR #$40
	STA objState,X
	JMP loc4_8274
bra4_8256:
	AND #$F0
	BEQ bra4_8274
	LDA ($32),Y
	AND #$3F
	BNE bra4_8269
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra4_8269:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra4_8274:
loc4_8274:
	INC objVar,X
	RTS
obj0xBE:
	LDX $A4
	LDA objVar,X
	BMI bra4_8282
	JMP loc4_82F0
bra4_8282:
	CMP #$80
	BEQ bra4_8289
	JMP sub_54_B4FC
bra4_8289:
	LDA objXLo,X ; unlogged
	SEC ; unlogged
	SBC playerXLoDup ; unlogged
	STA objXDistLo,X ; unlogged
	LDA objXHi,X ; unlogged
	SBC playerXHiDup ; unlogged
	STA objXDistHi,X ; unlogged
	STA $28 ; unlogged
	BEQ bra4_82A5 ; unlogged
	CMP #$FF ; unlogged
	BEQ bra4_82A5 ; unlogged
	JMP objRemoveObject ; unlogged
bra4_82A5:
	LDA objYLo,X ; unlogged
	SEC ; unlogged
	SBC playerYLoDup ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYHi,X ; unlogged
	SBC playerYHiDup ; unlogged
	STA objYDistHi,X ; unlogged
	LDA playerYHiDup ; unlogged
	CMP objYHi,X ; unlogged
	BEQ bra4_82E7 ; unlogged
	LDA objYDistHi,X ; unlogged
	BPL bra4_82D6 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_82E7 ; unlogged
bra4_82D6:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_82E7:
loc4_82E7:
	LDA freezeFlag ; unlogged
	BEQ bra4_82ED ; unlogged
	RTS ; unlogged
bra4_82ED:
	JMP objFacePlayer ; unlogged
loc4_82F0:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8312
	CMP #$FF
	BEQ bra4_8312
	JMP objRemoveObject
bra4_8312:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8354
	LDA objYDistHi,X
	BPL bra4_8343
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8354 ; unlogged
bra4_8343:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8354:
loc4_8354:
	LDA freezeFlag
	BEQ bra4_835A
	RTS ; unlogged
bra4_835A:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_836E,Y
	STA $32
	LDA tbl4_836E+1,Y
	STA $33
	JMP ($32)
tbl4_836E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8378
	.word objFlipKill
ptr9_8378:
	JSR sub4_83B3
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	CLC
	ADC #$04
	CMP #$D0
	BCC bra4_83AA
	LDA #$81
	STA objVar,X
	RTS
bra4_83AA:
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_83B3:
	LDA objVar,X
	CMP #$08
	BCS bra4_8422
	LDA objState,X
	AND #$20
	BEQ bra4_83DC
	LDA objFrameCount ; unlogged
	AND #$00 ; unlogged
	BNE bra4_83D9 ; unlogged
	LDA #$80 ; unlogged
	ASL ; unlogged
	TAY ; unlogged
	LDA tbl4_9A83,Y ; unlogged
	STA $32 ; unlogged
	LDA tbl4_9A83+1,Y ; unlogged
	STA $33 ; unlogged
	JSR sub4_8140 ; unlogged
bra4_83D9:
	JMP loc4_83F4 ; unlogged
bra4_83DC:
	LDA objFrameCount
	AND #$0E
	BNE bra4_83F4
	LDA #$80
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_83F4:
loc4_83F4:
	LDA objVar,X
	CMP #$04
	BCC bra4_8421_RTS
	LDA objYDistHi,X
	BPL bra4_8421_RTS
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X
	LDA #$11
	STA objVar,X
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
bra4_8421_RTS:
	RTS
bra4_8422:
	LDA objFrameCount
	AND #$00
	BNE bra4_843A_RTS
	LDA #$80
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_843A_RTS:
	RTS
ptr9_843B:
	LDX $A4
	LDA objVar,X
	BPL bra4_8446
	LDY #$03
	BNE bra4_8468
bra4_8446:
	CMP #$08
	BCS bra4_845D
	LDY #$00
	LDA objFrameCount
	AND #$20
	BEQ bra4_8455
	LDY #$40
bra4_8455:
	STY $05F0
	LDA #$00
	JMP loc4_9104
bra4_845D:
	LDY #$01
	LDA objFrameCount
	AND #$04
	BEQ bra4_8468
	LDY #$02
bra4_8468:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $40
	.byte $01
	.byte $00
obj0xC0:
	LDX $A4
	LDA objVar,X
	CMP #$80
	BEQ bra4_8488
	JMP loc4_84F6
bra4_8488:
	CMP #$80
	BEQ bra4_848F
	JMP sub_54_B4FC ; unlogged
bra4_848F:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_84AB
	CMP #$FF
	BEQ bra4_84AB
	JMP objRemoveObject ; unlogged
bra4_84AB:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_84ED
	LDA objYDistHi,X
	BPL bra4_84DC
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_84ED ; unlogged
bra4_84DC:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_84ED:
loc4_84ED:
	LDA freezeFlag
	BEQ bra4_84F3
	RTS ; unlogged
bra4_84F3:
	JMP objFacePlayer
loc4_84F6:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8518
	CMP #$FF
	BEQ bra4_8518
	JMP objRemoveObject
bra4_8518:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_855A
	LDA objYDistHi,X
	BPL bra4_8549
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_855A ; unlogged
bra4_8549:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_855A:
loc4_855A:
	LDA freezeFlag
	BEQ bra4_8560
	RTS ; unlogged
bra4_8560:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8574,Y
	STA $32
	LDA tbl4_8574+1,Y
	STA $33
	JMP ($32)
tbl4_8574:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_857E
	.word objFlipKill
ptr9_857E:
	JSR sub4_85B9
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	CLC
	ADC #$02
	CMP #$D0
	BCC bra4_85B0
	LDA #$81
	STA objVar,X
	RTS
bra4_85B0:
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_85B9:
	LDA objVar,X
	CMP #$11
	BCC bra4_85CA
	JSR sub3_B057
	BEQ bra4_85CA
	LDA #$01
	STA objVar,X
bra4_85CA:
	LDA objFrameCount
	AND #$00
	BNE bra4_85E2
	LDA #$81
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8000
bra4_85E2:
	LDA objVar,X
	CMP #$11
	BCS bra4_8611
	LDA objState,X
	AND #$20
	BNE bra4_8610_RTS
	LDA objVar,X
	BNE bra4_8610_RTS
	LDA objYDistHi,X
	BPL bra4_85FD
	JMP loc4_8631
bra4_85FD:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
bra4_8610_RTS:
	RTS
bra4_8611:
	LDA objFrameCount
	AND #$1E
	BNE bra4_863F_RTS
	LDA objYDistHi,X
	BPL bra4_8631
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	RTS
bra4_8631:
loc4_8631:
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
bra4_863F_RTS:
	RTS
ptr6_8640:
	LDX $A4
	LDA objVar,X
	BPL bra4_864B
	LDY #$03
	BNE bra4_8669
bra4_864B:
	LDA objState,X
	AND #$20
	BNE bra4_865E
	LDA objVar,X
	CMP #$11
	BCS bra4_865E
	LDY #$03
	JMP loc4_8669
bra4_865E:
	LDY #$01
	LDA objFrameCount
	AND #$02
	BEQ bra4_8669
	LDY #$02
bra4_8669:
loc4_8669:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
obj0xC2:
	LDX $A4
	LDA objVar,X
	BMI bra4_867F
	JMP loc4_86E6
bra4_867F:
	LDA objXLo,X ; unlogged
	SEC ; unlogged
	SBC playerXLoDup ; unlogged
	STA objXDistLo,X ; unlogged
	LDA objXHi,X ; unlogged
	SBC playerXHiDup ; unlogged
	STA objXDistHi,X ; unlogged
	STA $28 ; unlogged
	BEQ bra4_869B ; unlogged
	CMP #$FF ; unlogged
	BEQ bra4_869B ; unlogged
	JMP objRemoveObject ; unlogged
bra4_869B:
	LDA objYLo,X ; unlogged
	SEC ; unlogged
	SBC playerYLoDup ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYHi,X ; unlogged
	SBC playerYHiDup ; unlogged
	STA objYDistHi,X ; unlogged
	LDA playerYHiDup ; unlogged
	CMP objYHi,X ; unlogged
	BEQ bra4_86DD ; unlogged
	LDA objYDistHi,X ; unlogged
	BPL bra4_86CC ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_86DD ; unlogged
bra4_86CC:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_86DD:
loc4_86DD:
	LDA freezeFlag ; unlogged
	BEQ bra4_86E3 ; unlogged
	RTS ; unlogged
bra4_86E3:
	JMP objFacePlayer ; unlogged
loc4_86E6:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8708
	CMP #$FF
	BEQ bra4_8708
	JMP objRemoveObject ; unlogged
bra4_8708:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_874A
	LDA objYDistHi,X
	BPL bra4_8739
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_874A ; unlogged
bra4_8739:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_874A:
loc4_874A:
	LDA freezeFlag
	BEQ bra4_8750
	RTS ; unlogged
bra4_8750:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8764,Y
	STA $32
	LDA tbl4_8764+1,Y
	STA $33
	JMP ($32)
tbl4_8764:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_876E
	.word objFlipKill
ptr9_876E:
	JSR sub4_8778
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	RTS
sub4_8778:
	LDA objState,X
	AND #$20
	BEQ bra4_879A
	LDA objFrameCount
	AND #$00
	BNE bra4_8797
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8797:
	JMP loc4_87C7_RTS
bra4_879A:
	LDA objFrameCount
	AND #$02
	BNE bra4_87B2
	LDA #$82
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_87B2:
	LDA objVar,X
	CMP #$0E
	BCC bra4_87C7_RTS
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
bra4_87C7_RTS:
loc4_87C7_RTS:
	RTS
ptr6_87C8:
	LDX $A4
	LDA objVar,X
	BPL bra4_87DC
	LDA objState,X ; unlogged
	AND #$40 ; unlogged
	STA $05F0 ; unlogged
	LDA #$03 ; unlogged
	JMP loc4_9104 ; unlogged
bra4_87DC:
	CMP #$0A
	BCS bra4_87F1
	AND #$0F
	TAY
	LDA objState,X
	AND #$40
	STA $05F0
	LDA tbl4_8804,Y
	JMP loc4_9104
bra4_87F1:
	LDY #$00
	LDA objFrameCount
	AND #$04
	BEQ bra4_87FC
	LDY #$40
bra4_87FC:
	STY $05F0
	LDA #$07
	JMP loc4_9104
tbl4_8804:
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
obj0xCE:
	LDX $A4
	LDA objVar,X
	BMI bra4_881E
	JMP loc4_8920
bra4_881E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_883A
	CMP #$FF
	BEQ bra4_883A
	JMP objRemoveObject ; unlogged
bra4_883A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_887C
	LDA objYDistHi,X
	BPL bra4_886B
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_887C ; unlogged
bra4_886B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_887C:
loc4_887C:
	LDA freezeFlag
	BEQ bra4_8882
	RTS ; unlogged
bra4_8882:
	JSR objFacePlayer
	LDY #$50
	LDA objState,X
	AND #$40
	BNE bra4_8890
	LDY #$B0
bra4_8890:
	STY $25
	TYA
	CLC
	ADC objXLo,X
	STA objXLo,X
	LDA $25
	BMI bra4_88A6
	LDA objXHi,X
	ADC #$00
	JMP loc4_88AB
bra4_88A6:
	LDA objXHi,X
	SBC #$00
loc4_88AB:
	STA objXHi,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_88CA
	CMP #$FF
	BEQ bra4_88CA
	JMP objRemoveObject ; unlogged
bra4_88CA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_890C
	LDA objYDistHi,X
	BPL bra4_88FB
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_890C ; unlogged
bra4_88FB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_890C:
loc4_890C:
	LDA freezeFlag
	BEQ bra4_8912
	RTS ; unlogged
bra4_8912:
	LDA objSlot,X
	AND #$01
	TAY
	LDA #$AA
	STA $03C9,Y
	JMP loc4_8A27
loc4_8920:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8942
	CMP #$FF
	BEQ bra4_8942
	JMP objRemoveObject
bra4_8942:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8984
	LDA objYDistHi,X
	BPL bra4_8973
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8984 ; unlogged
bra4_8973:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8984:
loc4_8984:
	LDA freezeFlag
	BEQ bra4_898A
	RTS ; unlogged
bra4_898A:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_899E,Y
	STA $32
	LDA tbl4_899E+1,Y
	STA $33
	JMP ($32)
tbl4_899E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_89A8
	.word objFlipKill
ptr9_89A8:
	JSR sub4_89DA
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	AND #$01
	ORA #$C4
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_89DA:
	LDA objState,X
	AND #$20
	BNE bra4_8A06
	LDA objVar,X
	BNE bra4_8A06
	LDY #$01
	LDA objYDistHi,X
	BPL bra4_89EF
	LDY #$11
bra4_89EF:
	TYA
	STA objVar,X
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
bra4_8A06:
	LDA objFrameCount
	AND #$04
	BNE bra4_8A1E
	LDA #$83
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8A1E:
	LDA objVar,X
	AND #$0F
	CMP #$0D
	BNE bra4_8A80_RTS
loc4_8A27:
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objState,X
	AND #$40
	BNE bra4_8A49
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8A55
bra4_8A49:
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
loc4_8A55:
	LDA objYLo,X
	CLC
	ADC #$0C
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objState,X
	AND #$40
	STA objState,Y
	LDA #$00
	STA objVar,Y
	STA objAction,Y
	LDA objSlot,X
	AND #$01
	ORA #$B0
	STA objSlot,Y
bra4_8A80_RTS:
	RTS
ptr6_8A81:
	LDX $A4
	LDA objVar,X
	BPL bra4_8A8C
	LDY #$03
	BNE bra4_8A9F
bra4_8A8C:
	LDY #$0C
	LDA objState,X
	AND #$20
	BNE bra4_8A9F
	LDA objVar,X
	AND #$1F
	TAY
	LDA tbl4_8AAB,Y
	TAY
bra4_8A9F:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
tbl4_8AAB:
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $0A
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $0A
	.byte $08
	.byte $08
	.byte $08
	.byte $08
obj0xAE:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8AE9
	CMP #$FF
	BEQ bra4_8AE9
	JMP objRemoveObject
bra4_8AE9:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8B2B
	LDA objYDistHi,X
	BPL bra4_8B1A
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8B2B ; unlogged
bra4_8B1A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8B2B:
loc4_8B2B:
	LDA freezeFlag
	BEQ bra4_8B31
	RTS ; unlogged
bra4_8B31:
	LDA objState,X
	AND #$0F
	CMP #$04
	BCC bra4_8B45
bra4_8B3A:
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objState,X
	RTS
bra4_8B45:
	LDA #$08
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra4_8B3A
	LDA objFrameCount
	AND #$00
	BNE bra4_8B68
	LDA #$84
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_8B68:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JMP jmp_54_BF74
ptr6_8B71:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra4_8B7E
	LDY #$40
bra4_8B7E:
	STY $05F0
	LDA #$00
	JMP loc4_90CE
obj0xD0:
	LDX $A4
	LDA objVar,X
	BMI bra4_8B90
	JMP loc4_8BF7
bra4_8B90:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8BAC
	CMP #$FF ; unlogged
	BEQ bra4_8BAC ; unlogged
	JMP objRemoveObject ; unlogged
bra4_8BAC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8BEE ; unlogged
	LDA objYDistHi,X ; unlogged
	BPL bra4_8BDD ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8BEE ; unlogged
bra4_8BDD:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8BEE:
loc4_8BEE:
	LDA freezeFlag
	BEQ bra4_8BF4
	RTS ; unlogged
bra4_8BF4:
	JMP objFacePlayer
loc4_8BF7:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8C19
	CMP #$FF
	BEQ bra4_8C19
	JMP objRemoveObject
bra4_8C19:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8C5B
	LDA objYDistHi,X ; unlogged
	BPL bra4_8C4A ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8C5B ; unlogged
bra4_8C4A:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8C5B:
loc4_8C5B:
	LDA freezeFlag
	BEQ bra4_8C61
	RTS ; unlogged
bra4_8C61:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8C75,Y
	STA $32
	LDA tbl4_8C75+1,Y
	STA $33
	JMP ($32)
tbl4_8C75:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8C7F
	.word objFlipKill
ptr9_8C7F:
	JSR sub4_8CB1
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	AND #$01
	ORA #$C4
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_8CB1:
	LDA objVar,X
	BNE bra4_8CCC
	INC objVar,X
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
bra4_8CCC:
	LDY #$0E
	LDA objState,X
	AND #$20
	BEQ bra4_8CD7
	LDY #$00
bra4_8CD7:
	STY $25
	LDA objFrameCount
	AND $25
	BNE bra4_8CF1
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8CF1:
	LDA objState,X
	AND #$20
	BNE bra4_8D58_RTS
	LDA objVar,X
	CMP #$02
	BNE bra4_8D58_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objState,X
	AND #$40
	BNE bra4_8D21
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8D2D
bra4_8D21:
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
loc4_8D2D:
	LDA objYLo,X
	CLC
	ADC #$0C
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objState,X
	AND #$40
	STA objState,Y
	LDA #$06
	STA objVar,Y
	STA objAction,Y
	LDA objSlot,X
	AND #$01
	ORA #$B2
	STA objSlot,Y
bra4_8D58_RTS:
	RTS
ptr6_8D59:
	LDX $A4
	LDY #$03
	LDA objState,X
	AND #$20
	BNE bra4_8D71
	LDY #$0E
	LDA objVar,X
	SEC
	SBC #$02
	CMP #$02
	BCC bra4_8D71
	DEY
bra4_8D71:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	JMP loc4_9104
obj0xB0:
	LDX $A4
	JSR sub4_8DEC
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8D9E
	CMP #$FF
	BEQ bra4_8D9E
	JMP objRemoveObject
bra4_8D9E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8DE0
	LDA objYDistHi,X
	BPL bra4_8DCF
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_8DE0
bra4_8DCF:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8DE0:
loc4_8DE0:
	LDA freezeFlag
	BEQ bra4_8DE6
	RTS ; unlogged
bra4_8DE6:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_8DEC:
	LDA objState,X
	AND #$20
	BNE bra4_8E0B
	LDA objVar,X
	BNE bra4_8E0B
	LDA objFrameCount
	ADC objXDistLo+1,X
	LSR
	ADC objYDistLo,X
	AND #$03
	TAY
	LDA tbl4_8E24,Y
	STA objVar,X
bra4_8E0B:
	LDA objFrameCount
	AND #$02
	BNE bra4_8E23_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8E23_RTS:
	RTS
tbl4_8E24:
	.byte $0E
	.byte $31
	.byte $31
	.byte $20
ptr6_8E28:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra4_8E35
	LDY #$40
bra4_8E35:
	STY $05F0
	LDA #$01
	JMP loc4_90CE
obj0xD2:
	LDX $A4
	LDA objVar,X
	BMI bra4_8E47
	JMP loc4_8EE3
bra4_8E47:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8E63
	CMP #$FF
	BEQ bra4_8E63
	JMP objRemoveObject ; unlogged
bra4_8E63:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8EA5
	LDA objYDistHi,X ; unlogged
	BPL bra4_8E94 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8EA5 ; unlogged
bra4_8E94:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8EA5:
loc4_8EA5:
	LDA freezeFlag
	BEQ bra4_8EAB
	RTS ; unlogged
bra4_8EAB:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	LDA objFrameCount
	AND #$00
	BNE bra4_8ED6
	LDA #$85
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8ED6:
	LDA objState,X
	AND #$20
	BNE bra4_8EE2_RTS
	LDA #$00
	STA objVar,X
bra4_8EE2_RTS:
	RTS
loc4_8EE3:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8F05
	CMP #$FF
	BEQ bra4_8F05
	JMP objRemoveObject
bra4_8F05:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8F47
	LDA objYDistHi,X ; unlogged
	BPL bra4_8F36 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8F47 ; unlogged
bra4_8F36:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra4_8F47:
loc4_8F47:
	LDA freezeFlag
	BEQ bra4_8F4D
	RTS ; unlogged
bra4_8F4D:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_8F61,Y
	STA $32
	LDA tbl4_8F61+1,Y
	STA $33
	JMP ($32)
tbl4_8F61:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8F6B
	.word objFlipKill
ptr9_8F6B:
	JSR sub4_8F9D
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	AND #$01
	ORA #$C4
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_8F9D:
	LDA objFrameCount
	AND #$0E
	BNE bra4_9019_RTS
	INC objVar,X
	LDA objVar,X
	CMP #$18
	BCC bra4_8FBA
	CMP #$1F
	BCC bra4_9019_RTS
	LDA #$00
	STA objVar,X
	JMP loc4_9019_RTS
bra4_8FBA:
	AND #$07
	CMP #$03
	BNE bra4_9019_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objState,X
	AND #$40
	BNE bra4_8FE2
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8FEE
bra4_8FE2:
	LDA objXLo,X ; unlogged
	STA objXLo,Y ; unlogged
	LDA objXHi,X ; unlogged
	STA objXHi,Y ; unlogged
loc4_8FEE:
	LDA objYLo,X
	CLC
	ADC #$0C
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objState,X
	AND #$40
	STA objState,Y
	LDA #$06
	STA objVar,Y
	STA objAction,Y
	LDA objSlot,X
	AND #$01
	ORA #$B4
	STA objSlot,Y
bra4_9019_RTS:
loc4_9019_RTS:
	RTS
ptr6_901A:
	LDX $A4
	LDY #$0F
	LDA objVar,X
	CMP #$18
	BCS bra4_9034
	AND #$07
	TAY
	LDA tbl4_9038,Y
	TAY
	LDA objState,X
	AND #$40
	STA $05F0
bra4_9034:
	TYA
	JMP loc4_9104
tbl4_9038:
	.byte $0F
	.byte $10
	.byte $11
	.byte $11
	.byte $12
	.byte $0F
	.byte $0F
	.byte $0F
obj0xB2:
	LDX $A4
	LDA objFrameCount
	AND #$02
	BNE bra4_905A
	LDA #$87
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_905A:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9076
	CMP #$FF
	BEQ bra4_9076
	JMP objRemoveObject
bra4_9076:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_90B8
	LDA objYDistHi,X
	BPL bra4_90A7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_90B8
bra4_90A7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_90B8:
loc4_90B8:
	LDA freezeFlag
	BEQ bra4_90BE
	RTS ; unlogged
bra4_90BE:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
ptr6_90C4:
	LDY #$00
	STY $05F0
	LDA #$02
	JMP loc4_90CE
loc4_90CE:
	ASL
	TAX
	LDA sprTblChuckProjectiles,X
	STA $32
	LDA sprTblChuckProjectiles+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_90E7
	LDY #$C0
bra4_90E7:
	STY $36
	JMP jmp_52_AC3B

sprTblChuckProjectiles:
	.word sprBaseball
	.word sprFootball
	.word sprRock ; Unused
sprBaseball:
	.byte $01
	.byte $01
	.byte $AA
	.byte $01
sprFootball:
	.byte $02
	.byte $02
	.byte $AA
	.byte $02, $03
	.byte $06, $07
sprRock:
	.byte $02
	.byte $02
	.byte $AF
	.byte $04, $05
	.byte $08, $00

loc4_9104:
	ASL
	TAX
	LDA tbl4_9122,X
	STA $32
	LDA tbl4_9122+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_911D
	LDY #$C0
bra4_911D:
	STY $36
	JMP jmp_54_A118

tbl4_9122:
	.word sprCharginChuckIdle
	.word sprCharginChuckRun1
	.word sprCharginChuckRun2
	.word sprCharginChuckRun
	.word sprCharginChuckStun1
	.word sprCharginChuckStun2
	.word sprCharginChuckStun3
	.word sprCharginChuckStun4
	.word sprBaseballChuckIdle
	.word sprBaseballChuckHold
	.word sprBaseballChuckThrow1
	.word sprBaseballChuckRunHold
	.word sprBaseballChuckThrow2
	.word sprPassinChuckIdle
	.word sprPassinChuckKick
	.word sprDigginChuckIdle
	.word sprDigginChuckDig
	.word sprDigginChuckThrow1
	.word sprDigginChuckThrow2
sprCharginChuckIdle:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $14, $15, $16
	.byte $22, $23, $24
	.byte $2A, $2B, $2C
sprCharginChuckRun1:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1D, $1E, $FF
	.byte $2C, $2D, $2E, $FF
sprCharginChuckRun2:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1B, $1C, $FF
	.byte $28, $29, $2A, $2B
sprCharginChuckRun:
	.byte $04
	.byte $04
	.byte $A8
	.byte $FF, $1F, $20, $FF
	.byte $23, $24, $25, $26
	.byte $2B, $2C, $2D, $2E
	.byte $33, $34, $35, $36
sprCharginChuckStun1:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $09, $0A, $FF
	.byte $1A, $0F, $1B
	.byte $25, $26, $27
sprCharginChuckStun2:
	.byte $03
	.byte $04
	.byte $A9
	.byte $09, $0A, $FF
	.byte $0E, $0F, $10
	.byte $1C, $1D, $1E
	.byte $25, $26, $27
sprCharginChuckStun3:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $0B, $0C, $0D
	.byte $17, $18, $19
	.byte $25, $26, $27
sprCharginChuckStun4:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $11, $12, $13
	.byte $1F, $20, $21
	.byte $28, $29, $27
; Unused Clappin' Chuck Mappings
	.byte $04
	.byte $04
	.byte $A8
	.byte $FF, $1D, $1E, $FF
	.byte $FF, $21, $22, $FF
	.byte $27, $28, $29, $2A
	.byte $2F, $30, $31, $32
sprDigginChuckIdle:
	.byte $04 ; digging chuck (unused) mappings
	.byte $03
	.byte $AF
	.byte $FF, $0B, $0C, $0D
	.byte $FF, $16, $17, $18
	.byte $23, $24, $25, $26
sprDigginChuckDig:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $14
	.byte $FF, $1D, $1E, $1F
	.byte $2A, $2B, $2C, $2D
sprDigginChuckThrow1:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $15
	.byte $FF, $20, $21, $22
	.byte $23, $24, $25, $26
sprDigginChuckThrow2:
	.byte $04
	.byte $03
	.byte $AF
	.byte $0E, $0F, $10, $11
	.byte $19, $1A, $1B, $1C
	.byte $FF, $27, $28, $29
sprPassinChuckIdle:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $30, $31, $32
	.byte $36, $37, $38
	.byte $3C, $3D, $3E
sprPassinChuckKick:
	.byte $03
	.byte $04
	.byte $AF
	.byte $FF, $2E, $FF
	.byte $2F, $30, $31
	.byte $32, $33, $34
	.byte $35, $36, $37
	.byte $37, $38 ; Excess bytes
sprBaseballChuckIdle:
	.byte $03
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $11, $12, $FF
	.byte $1F, $20, $21
	.byte $2F, $30, $31
sprBaseballChuckHold:
	.byte $03
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF
	.byte $38, $39, $FF
	.byte $3A, $3B, $3C
	.byte $3D, $3E, $3F
sprBaseballChuckThrow1:
	.byte $03
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $18, $19
	.byte $25, $26, $27
	.byte $35, $36, $37
sprBaseballChuckRunHold:
	.byte $03
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $17, $FF
	.byte $25, $26, $27
	.byte $35, $36, $37
sprBaseballChuckThrow2:
	.byte $03
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $13, $14, $15
	.byte $22, $23, $24
	.byte $32, $33, $34
ptr6_9286:
	RTS
obj0xD6:
	LDX $A4
	LDA objVar,X
	BMI bra4_92C1
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA objXDistHi,X
	BEQ bra4_92C0_RTS
	CMP #$FF
	BEQ bra4_92C0_RTS
	LDA #$00
	STA booBuddiesFlag
	JMP objRemoveObject
bra4_92C0_RTS:
	RTS
bra4_92C1:
	LDA booBuddiesFlag
	CMP #$FF
	BNE bra4_92CA
	JMP objRemoveObject ; unlogged
bra4_92CA:
	LDA #$FF
	STA booBuddiesFlag
	LDA objXLo,X
	STA booBuddiesX
	LDA objXHi,X
	STA booBuddiesXScreen
	LDA objYLo,X
	STA booBuddiesY
	LDA objYHi,X
	STA booBuddiesYScreen
	LDA #$00
	STA objVar,X
	LDA #$09
	STA $25
	LDA objSlot,X
	AND #$01
	ORA #$B6
	STA $26
bra4_92F4:
	LDX objCount
	INC objCount
	LDY $25
	LDA tbl4_934B,Y
	STA objVar,X
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesX
	STA objXLo,X
	PLA
	BMI bra4_9314
	LDA booBuddiesXScreen
	ADC #$00
	BPL bra4_9318
bra4_9314:
	LDA booBuddiesXScreen
	SBC #$00
bra4_9318:
	STA objXHi,X
	LDY $25
	LDA tbl4_935F,Y
	STA objState,X
	LDA tbl4_9355,Y
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesY
	STA objYLo,X
	PLA
	BMI bra4_933A
	LDA booBuddiesYScreen
	ADC #$00
	BPL bra4_933E
bra4_933A:
	LDA booBuddiesYScreen
	SBC #$00
bra4_933E:
	STA objYHi,X
	LDA $26
	STA objSlot,X
	DEC $25
	BPL bra4_92F4
	RTS
tbl4_934B:
	.byte $0B
	.byte $16
	.byte $21
	.byte $2C
	.byte $37
	.byte $42
	.byte $4D
	.byte $58
	.byte $63
	.byte $6E
tbl4_9355:
	.byte $2B
	.byte $36
	.byte $41
	.byte $4C
	.byte $57
	.byte $62
	.byte $6D
	.byte $78
	.byte $03
	.byte $0E
tbl4_935F:
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
obj0xB4:
	LDX $A4
	LDA booBuddiesFlag
	CMP #$FF
	BEQ bra4_937B
	LDA #$00
	STA objSlot,X
	STA objState,X
	STA objVar,X
	RTS
bra4_937B:
	JSR sub4_93B0
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA objXDistHi,X
	BEQ bra4_93AA
	CMP #$FF
	BEQ bra4_93AA
	RTS
bra4_93AA:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_93B0:
	LDA frameCount
	AND #$07
	BEQ bra4_93B7
	RTS
bra4_93B7:
	LDA objVar,X
	CLC
	ADC #$01
	AND #$7F
	STA objVar,X
	LDA objVar,X
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesX
	STA objXLo,X
	PLA
	BMI bra4_93D9
	LDA booBuddiesXScreen
	ADC #$00
	BPL bra4_93DD
bra4_93D9:
	LDA booBuddiesXScreen
	SBC #$00
bra4_93DD:
	STA objXHi,X
	TYA
	CLC
	ADC #$20
	AND #$7F
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesY
	STA objYLo,X
	PLA
	BMI bra4_93FA
	LDA booBuddiesYScreen
	ADC #$00
	BPL bra4_93FE
bra4_93FA:
	LDA booBuddiesYScreen
	SBC #$00
bra4_93FE:
	STA objYHi,X
	RTS
obj0xD8:
	LDX $A4
	LDA objVar,X
	CMP #$80
	BEQ bra4_940E
	JMP loc4_9475
bra4_940E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_942A
	CMP #$FF
	BEQ bra4_942A
	JMP objRemoveObject
bra4_942A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_946C
	LDA objYDistHi,X
	BPL bra4_945B
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_946C ; unlogged
bra4_945B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_946C:
loc4_946C:
	LDA freezeFlag
	BEQ bra4_9472
	RTS ; unlogged
bra4_9472:
	JMP objFacePlayer
loc4_9475:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9497
	CMP #$FF
	BEQ bra4_9497
	JMP objRemoveObject
bra4_9497:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_94D9
	LDA objYDistHi,X
	BPL bra4_94C8
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_94D9
bra4_94C8:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_94D9:
loc4_94D9:
	LDA freezeFlag
	BEQ bra4_94DF
	RTS
bra4_94DF:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_94F3,Y
	STA $32
	LDA tbl4_94F3+1,Y
	STA $33
	JMP ($32)
tbl4_94F3:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_94FD
	.word objFlipKill
ptr9_94FD:
	JSR sub4_9506
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9506:
	LDA objFrameCount
	AND #$02
	BNE bra4_951E
	LDA #$88
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_951E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_953A
	CMP #$FF
	BEQ bra4_953A
	JMP objRemoveObject ; unlogged
bra4_953A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_957C
	LDA objYDistHi,X
	BPL bra4_956B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_957C
bra4_956B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_957C:
loc4_957C:
	LDA freezeFlag
	BEQ bra4_9582
	RTS ; unlogged
bra4_9582:
	LDA objVar,X
	CMP #$20
	BCC bra4_95D0
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BEQ bra4_95BC
	LDA objYDistHi,X
	BMI bra4_95AD
	LDA #$00
	STA objVar,X
	LDA objState,X
	AND #$DF
	STA objState,X
	JMP loc4_95BC
bra4_95AD:
	LDY #$00
	LDA objState,X
	AND #$20
	BEQ bra4_95B8
	LDY #$10
bra4_95B8:
	TYA
	STA objVar,X
bra4_95BC:
loc4_95BC:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	RTS
bra4_95D0:
	LDA objState,X
	AND #$20
	BNE bra4_962E
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BNE bra4_95F2
	LDA frameCount
	AND #$3E
	BNE bra4_95F1_RTS
	LDA #$20
	STA objVar,X
bra4_95F1_RTS:
	RTS
bra4_95F2:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BCC bra4_961A
	LDA objYDistHi,X
	BPL bra4_961A
	LDA objYDistLo,X
	CMP #$C8
	BCS bra4_961A
	LDA frameCount
	AND #$06
	BNE bra4_961A
	LDA #$10
	STA objVar,X
	LDA objState,X
	ORA #$20
	STA objState,X
bra4_961A:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	RTS
bra4_962E:
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BNE bra4_9649
	LDA frameCount
	AND #$3E
	BNE bra4_9648_RTS
	LDA #$20
	STA objVar,X
bra4_9648_RTS:
	RTS
bra4_9649:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BCC bra4_9671
	LDA objYDistHi,X
	BPL bra4_965E
	LDA objYDistLo,X
	CMP #$E0
	BCC bra4_9671
bra4_965E:
	LDA frameCount
	AND #$06
	BNE bra4_9671
	LDA #$00
	STA objVar,X
	LDA objState,X
	AND #$DF
	STA objState,X
bra4_9671:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	RTS

;----------------------------------------
; Boo object code
;----------------------------------------
obj0xDA:
	LDX $A4 ; Get object index
	LDA objVar,X
	CMP #$80
	BEQ bra4_9691 ; Branch if variable is $80? This never seems to occur in-game
	JMP loc4_9703
bra4_9691:
; Boo X position - player X position = horizontal distance between Boo and player
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28 ; Backup X screen distance?

	BEQ bra4_96AD ; Branch if the player and Boo are on the screen
	CMP #$FF
	BEQ bra4_96AD ; Branch if the Boo is within one screen behind the player
	JMP objRemoveObject ; Otherwise, unload the boo if it's ahead of the player
bra4_96AD:
; Boo Y position - player Y position = vertical distance between Boo and player
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X

	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc4_96EF ; Branch if the player and boo are on the same vertical screen
	LDA objYDistHi,X
	BPL bra4_96DE ; Branch if the Boo is ahead of the player

; Otherwise, if the Boo is behind the player, subtract 16 pixels from the distance between it and the player
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	
	JMP loc4_96EF
bra4_96DE:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc4_96EF:
	LDA freezeFlag
	BEQ bra4_96F5 ; Only continue if the game isn't frozen
	RTS ; Stop if it is frozen
bra4_96F5:
	JSR objFacePlayer
	LDA $A4
	AND #$03 ; Mask out lower 2 bits of current object index
	ORA objState,X
	STA objState,X
	RTS

loc4_9703:
	JSR sub4_976B
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9722
	CMP #$FF
	BEQ bra4_9722
	JMP objRemoveObject
bra4_9722:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_9764
	LDA objYDistHi,X
	BPL bra4_9753
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_9764
bra4_9753:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_9764:
loc4_9764:
	LDA freezeFlag
	BEQ bra4_976A_RTS
	RTS ; unlogged
bra4_976A_RTS:
	RTS
sub4_976B:
	LDA objFrameCount
	AND #$04
	BNE bra4_9783 ; Branch if not on a 4th frame
	LDA #$89
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_9783:
	LDA objState,X
	AND #$40
	BNE bra4_97A7 ; Branch if Boo is already facing left
	LDA objXDistHi,X
	BMI bra4_97A4 ; Branch if Boo is behind the player
	LDA objXDistLo,X
	CMP #$43
	BCC bra4_97A4 ; Branch if the Boo is within 67 ($43) pixels ahead of the player
	LDA frameCount
	AND #$1F
	BNE bra4_97A4 ; Branch if not on a 32nd frame
	LDA objState,X 
	EOR #$40
	STA objState,X ; Turn Boo around
bra4_97A4:
	JMP loc4_97C1
bra4_97A7:
	LDA objXDistHi,X
	BPL loc4_97C1
	LDA objXDistLo,X
	CMP #$C6
	BCS loc4_97C1
	LDA frameCount
	AND #$7E
	BNE loc4_97C1 ; Continue every 2 frames for every 128 frames
	LDA objState,X
	EOR #$40
	STA objState,X ; Turn Boo around
loc4_97C1:
	LDA frameCount
	AND #$7F
	BNE bra4_97E7_RTS ; Only continue every 128th frame
	LDA objXDistHi,X
	EOR objState,X
	AND #$40
	BEQ bra4_97E7_RTS ; Stop if player is facing left?
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X ; Turn Boo into Boo Crew Boo
	LDA #$00
	STA objVar,X ; Clear variable
	LDA objState,X
	AND #%11011111
	STA objState,X ; Mask out bit 5 of Boo's state
bra4_97E7_RTS:
	RTS

obj0xDC:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9806
	CMP #$FF
	BEQ bra4_9806
	JMP objRemoveObject
bra4_9806:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_9848
	LDA objYDistHi,X
	BPL bra4_9837
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_9848
bra4_9837:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_9848:
loc4_9848:
	LDA freezeFlag
	BEQ bra4_984E
	RTS ; unlogged
bra4_984E:
	JSR sub4_9857
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9857:
	LDA objFrameCount
	AND #$02
	BNE bra4_986F
	LDA #$8A
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_986F:
	LDA objState,X
	AND #$20
	BNE bra4_9896
	LDA frameCount
	AND #$1F
	BNE bra4_9895_RTS
	LDA objYDistHi,X
	BPL bra4_9888
	LDA objYDistLo,X
	CMP #$D0
	BCC bra4_9895_RTS
bra4_9888:
	LDA objState,X
	ORA #$20
	STA objState,X
	LDA #$10
	STA objVar,X
bra4_9895_RTS:
	RTS
bra4_9896:
	LDA frameCount
	AND #$0F
	BNE bra4_98B6_RTS
	LDA objYDistHi,X
	BPL bra4_98B6_RTS
	LDA objYDistLo,X
	CMP #$9B
	BCS bra4_98B6_RTS
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$80
	STA objVar,X
bra4_98B6_RTS:
	RTS
ptr6_98B7:
	LDA frameCount
	AND #$01
	BEQ bra4_98BE
	RTS
bra4_98BE:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDA objState,X
	AND #$03
	TAY
	LDA tbl4_98DD,Y
	TAY
	LDA frameCount
	AND #$10
	BEQ bra4_98D9
	INY
bra4_98D9:
	TYA
	JMP loc4_992B
tbl4_98DD:
	.byte $00
	.byte $02
	.byte $04
	.byte $02
ptr6_98E1:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDY #$03
	LDA objVar,X
	CMP #$20
	BCC bra4_990A
	LDY #$05
	INC objAction,X
	LDA objAction,X
	BMI bra4_990A
	CMP #$20
	BCS bra4_990A
	LDY #$00
	AND #$04
	BEQ bra4_990A
	LDY #$01
bra4_990A:
	TYA
	JMP loc4_992B
ptr6_990E:
	LDX $A4
	LDY #$00
	LDA objState,X
	ROL
	ROL
	ROL
	ROL
	AND #$06
	TAY
	LDA frameCount
	AND #$10
	BEQ bra4_9923
	INY
bra4_9923:
	LDA #$00
	STA $05F0
	TYA
	AND #$07
loc4_992B:
	ASL
	TAX
	LDA sprTblBoo,X
	STA $32
	LDA sprTblBoo+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra4_9944
	LDY #$C0 ; unlogged
bra4_9944:
	STY $36
	JMP jmp_54_A118
sprTblBoo:
	.word sprBoo_Tease1
	.word sprBoo_Tease2
	.word sprBoo_ChaseAlt ; Only used by Boo Buddies
	.word sprBoo_Chase
	.word sprBoo_MouthOpen ; Only used by Boo Buddies
	.word sprBoo_Hide
	.word sprBoo_Tease1 ; Unused
	.word sprBoo_Tease2 ; Unused
sprBoo_Tease1:
	.byte $02
	.byte $02
	.byte $AB
	.byte $01, $02
	.byte $04, $05
sprBoo_Tease2:
	.byte $02
	.byte $02
	.byte $AB
	.byte $01, $03
	.byte $06, $07
sprBoo_ChaseAlt:
	.byte $02
	.byte $2
	.byte $AB
	.byte $17, $18
	.byte $1D, $1E
sprBoo_Chase:
	.byte $02
	.byte $02
	.byte $AB
	.byte $17, $19
	.byte $1F, $20
sprBoo_MouthOpen:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $09
	.byte $0F, $10
sprBoo_Hide:
	.byte $02
	.byte $02
	.byte $AB
	.byte $08, $0A
	.byte $11, $12
	
; Boo Buddies sine/cosine lookup table
; Roughly equivalent to 79cos((pi/64)*x) rounded up with a few values being one off.
; Sine values are obtained by shifting 32 values ahead
booBuddiesSineTable:
	.byte $4F
	.byte $4F
	.byte $4F
	.byte $4E
	.byte $4D
	.byte $4C
	.byte $4B
	.byte $49
	.byte $48
	.byte $46
	.byte $44
	.byte $42
	.byte $40
	.byte $3D
	.byte $3B
	.byte $38
	.byte $35
	.byte $32
	.byte $2F
	.byte $2C
	.byte $29
	.byte $25
	.byte $22
	.byte $1E
	.byte $1A
	.byte $17
	.byte $13
	.byte $0F
	.byte $0B
	.byte $07
	.byte $03
	.byte $00
	.byte $FD
	.byte $F9
	.byte $F5
	.byte $F1
	.byte $ED
	.byte $E9
	.byte $E6
	.byte $E2
	.byte $DE
	.byte $DB
	.byte $D7
	.byte $D4
	.byte $D1
	.byte $CE
	.byte $CB
	.byte $C8
	.byte $C5
	.byte $C3
	.byte $C0
	.byte $BE
	.byte $BC
	.byte $BA
	.byte $B8
	.byte $B7
	.byte $B5
	.byte $B4
	.byte $B3
	.byte $B2
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B4
	.byte $B5
	.byte $B7
	.byte $B8
	.byte $BA
	.byte $BC
	.byte $BE
	.byte $C0
	.byte $C3
	.byte $C5
	.byte $C8
	.byte $CB
	.byte $CE
	.byte $D1
	.byte $D4
	.byte $D7
	.byte $DB
	.byte $DE
	.byte $E2
	.byte $E6
	.byte $E9
	.byte $ED
	.byte $F1
	.byte $F5
	.byte $F9
	.byte $FD
	.byte $00
	.byte $03
	.byte $07
	.byte $0B
	.byte $0F
	.byte $13
	.byte $17
	.byte $1A
	.byte $1E
	.byte $22
	.byte $25
	.byte $29
	.byte $2C
	.byte $2F
	.byte $32
	.byte $35
	.byte $38
	.byte $3B
	.byte $3D
	.byte $40
	.byte $42
	.byte $44
	.byte $46
	.byte $48
	.byte $49
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $4F
	.byte $4F
	.byte $4F ; end of boo circle movement thing
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
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
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
tbl4_9A83:
	.word ofs_9B1C
	.word ofs_9B7B
	.word ofs_9BA1
	.word ofs_9BC2
	.word ofs_9C02
	.word ofs_9C05
	.word ofs_9C20
	.word ofs_9C8E
	.word ofs_9CB0 ; Used for normal Boo
	.word ofs_9CF4
	.word ofs_9D33
	.word ofs_9A9B
ofs_9A9B:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $06
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F9
	.byte $00
	.byte $FB
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $05
	.byte $00
	.byte $07
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $00
	.byte $00
	.byte $F6
	.byte $00
	.byte $F7
	.byte $00
	.byte $F8
	.byte $00
	.byte $F9
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FE
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $07
	.byte $00
	.byte $08
	.byte $00
	.byte $09
	.byte $00
	.byte $0A
	.byte $80
ofs_9B1C:
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
	.byte $FF
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9B7B:
	.byte $04
	.byte $00
	.byte $04
	.byte $F8
	.byte $04
	.byte $F8
	.byte $04
	.byte $F8
	.byte $04
	.byte $FA
	.byte $04
	.byte $FA
	.byte $04
	.byte $FC
	.byte $04
	.byte $FC
	.byte $04
	.byte $FC
	.byte $04
	.byte $FD
	.byte $04
	.byte $FD
	.byte $04
	.byte $FE
	.byte $04
	.byte $FE
	.byte $04
	.byte $FF
	.byte $04
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9BA1:
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
	.byte $81
ofs_9BC2:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FA
	.byte $00
	.byte $FC
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $81
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
	.byte $80
	.byte $00
ofs_9C02:
	.byte $01
	.byte $00
	.byte $80
ofs_9C05:
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9C20:
	.byte $03
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
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9C8E:
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $F8
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FA
	.byte $03
	.byte $FB
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FC
	.byte $03
	.byte $FD
	.byte $03
	.byte $FD
	.byte $03
	.byte $FE
	.byte $03
	.byte $FE
	.byte $03
	.byte $FF
	.byte $03
	.byte $00
	.byte $81
	.byte $00
ofs_9CB0:
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $FF
	.byte $81
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $01
	.byte $81
	.byte $00
	.byte $00
	.byte $00
	.byte $81
	.byte $00
ofs_9CF4:
	.byte $01
	.byte $00
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FF
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $80
ofs_9D33:
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $81
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $FE
	.byte $81
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
