; disassembled by BZK 6502 Disassembler
sub9_8000:
	LDX $A4
	LDA objVar,X
	AND #%01111111
	ASL
	TAY
	LDA objState,X
	AND #%00100000
	BNE bra9_8013
	JMP loc9_80A2 ; Jump if goomba is moving up

bra9_8013:
	JSR sub3_B077
	BNE bra9_8078
	LDA objVar,X
	AND #%01111111
	CMP #$07
	BCS bra9_8024 ; No goomba has more than 7 movement vectors
	INC objVar,X ; Go to next movement vector

bra9_8024:
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra9_8036
	LDA objYHi,X
	ADC #$00
	BPL bra9_803B
bra9_8036:
	LDA objYHi,X
	SBC #$00
bra9_803B:
	STA objYHi,X
	JSR sub3_B057
	BEQ bra9_804B
	LDA objState,X
	EOR #$40
	STA objState,X
bra9_804B:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA objState,X
	AND #$40
	BEQ bra9_805C
	TYA
	EOR #$FF
	TAY
	INY
bra9_805C:
	TYA
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra9_806F
	LDA objXHi,X
	ADC #$00
	BPL bra9_8074
bra9_806F:
	LDA objXHi,X
	SBC #$00
bra9_8074:
	STA objXHi,X
	RTS

bra9_8078:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA objYLo,X
	SEC
	SBC $25
	BCS bra9_808E
	DEC objYHi,X
	SEC
	SBC #$10
bra9_808E:
	STA objYLo,X
	LDA objState,X
	AND #$C0
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS

loc9_80A2:
	INY
	LDA ($32),Y
	BMI bra9_80BD
	JSR sub3_B077
	BNE bra9_80BD
	LDA objState,X
	ORA #$20
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS

bra9_80BD:
	DEY
	JSR sub3_B057
	BEQ bra9_80CB
	LDA objState,X
	EOR #$40
	STA objState,X
bra9_80CB:
	LDA objState,X
	AND #$40
	BEQ bra9_80DC
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc9_80DE
bra9_80DC:
	LDA ($32),Y
loc9_80DE:
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra9_80F0
	LDA objXHi,X
	ADC #$00
	BPL bra9_80F5
bra9_80F0:
	LDA objXHi,X
	SBC #$00
bra9_80F5:
	STA objXHi,X
	INY
	LDA ($32),Y
	PHA
	CLC
	ADC objYLo,X
	STA objYLo,X
	PLA
	BMI bra9_810D
	LDA objYHi,X
	ADC #$00
	BPL bra9_8112
bra9_810D:
	LDA objYHi,X
	SBC #$00
bra9_8112:
	STA objYHi,X
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra9_8127
	LDA objState,X
	EOR #$40
	STA objState,X
	JMP loc9_8145
bra9_8127:
	AND #$F0
	BEQ bra9_8145
	LDA ($32),Y
	AND #$3F
	BNE bra9_813A
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra9_813A:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra9_8145:
loc9_8145:
	INC objVar,X
	RTS
obj0xA0:
	LDX $A4
	LDA objVar,X
	BPL bra9_8153
	JMP objFacePlayer
bra9_8153:
	LDA #$06
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
	BEQ bra9_8175
	CMP #$FF
	BEQ bra9_8175
	JMP objRemoveObject
bra9_8175:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_81B7
	LDA objYDistHi,X
	BPL bra9_81A6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_81B7
bra9_81A6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_81B7:
loc9_81B7:
	LDA freezeFlag
	BEQ bra9_81BD
	RTS
bra9_81BD:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_81D1,Y
	STA $32
	LDA tbl9_81D1+1,Y
	STA $33
	JMP ($32)
tbl9_81D1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_81D1
	.word objFlipKill
ptr2_81D1:
	LDX $A4
	LDA objVar,X
	BNE bra9_81FC
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_81EB
	LDY #$40
bra9_81EB:
	STY $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	LDA #$01
	STA objVar,X
bra9_81FC:
	JSR sub9_82AE
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDX $A4
	LDA objSlot,X
	AND #$01
	ORA #$94
	STA objSlot,X
	LDA #$80
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	CLC
	ADC #$10
	STA objYLo,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8265
	CMP #$FF
	BEQ bra9_8265
	JMP objRemoveObject
bra9_8265:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_82A7
	LDA objYDistHi,X
	BPL bra9_8296
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_82A7
bra9_8296:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_82A7:
loc9_82A7:
	LDA freezeFlag
	BEQ bra9_82AD_RTS
	RTS
bra9_82AD_RTS:
	RTS
sub9_82AE:
	LDA objFrameCount
	AND #$02
	BNE bra9_82C6_RTS
	LDA #$89
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_82C6_RTS:
	RTS
ptr6_82C7:
	LDY #$08
	LDX $A4
	LDA objVar,X
	CMP #$10
	BCC bra9_82D4
	LDY #$04
bra9_82D4:
	STY $25
	LDY #$00
	LDA objFrameCount
	AND $25
	BEQ bra9_82E1
	LDY #$01
bra9_82E1:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA sprPtrs_Paragoomba,X
	STA $32
	LDA sprPtrs_Paragoomba+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8303
	LDY #$C0
bra9_8303:
	STY $36
	JSR jmp_54_A118
	RTS
sprPtrs_Paragoomba:
	.word sprMap_Paragoomba1
	.word sprMap_Paragoomba2
sprMap_Paragoomba1:
	.byte $04
	.byte $04
	.byte $A5
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF
	.byte $03, $04, $05, $FF
	.byte $0A, $0B, $0C, $FF
sprMap_Paragoomba2:
	.byte $04
	.byte $04
	.byte $A5
	.byte $0F, $FF, $10, $11
	.byte $12, $13, $14, $15
	.byte $16, $17, $18, $19
	.byte $1A, $1B, $1C, $FF
obj0x98:
	LDX $A4
	LDA objVar,X
	BPL bra9_83A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8356
	CMP #$FF
	BEQ bra9_8356
	JMP objRemoveObject
bra9_8356:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_8398
	LDA objYDistHi,X
	BPL bra9_8387
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8398
bra9_8387:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_8398:
loc9_8398:
	LDA freezeFlag
	BEQ bra9_839E
	RTS
bra9_839E:
	LDA #$00
	STA objVar,X
	RTS
bra9_83A4:
	LDA #$06
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
	BEQ bra9_83C6
	CMP #$FF
	BEQ bra9_83C6
	JMP objRemoveObject
bra9_83C6:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_8408
	LDA objYDistHi,X
	BPL bra9_83F7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8408
bra9_83F7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_8408:
loc9_8408:
	LDA freezeFlag
	BEQ bra9_840E
	RTS
bra9_840E:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8422,Y
obj0x8E:
	STA $32
	LDA tbl9_8422+1,Y
	STA $33
	JMP ($32)
tbl9_8422:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_842C
	.word objFlipKill
ptr2_842C:
	LDA objXDistHi,X
	EOR #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	JSR sub9_84FE
	JSR sub3_B077
	BEQ bra9_8448
	JMP loc9_846E
bra9_8448:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	JMP loc9_846E
	RTS
loc9_846E:
	LDX $A4
	LDA objSlot,X
	AND #$01
	ORA #$94
	STA objSlot,X
	LDA #$80
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	CLC
	ADC #$0E
	STA objYLo,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_84B5
	CMP #$FF
	BEQ bra9_84B5
	JMP objRemoveObject
bra9_84B5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_84F7
	LDA objYDistHi,X
	BPL bra9_84E6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_84F7
bra9_84E6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_84F7:
loc9_84F7:
	LDA freezeFlag
	BEQ bra9_84FD_RTS
	RTS
bra9_84FD_RTS:
	RTS
sub9_84FE:
	LDA objFrameCount
	AND #$0E
	BNE bra9_8516_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8516_RTS:
	RTS
ptr6_8517:
	LDA objFrameCount
	LSR
	LSR
	LSR
	AND #$06
	TAY
	LDA tbl9_8548+1,Y
	STA $05F0
	LDA tbl9_8548,Y
	ASL
	TAX
	LDA sprPtrs_ParachuteGoomba,X
	STA $32
	LDA sprPtrs_ParachuteGoomba+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8542
	LDY #$C0
bra9_8542:
	STY $36
ptr6_8544:
	JSR jmp_54_A118
	RTS

; Animation attributes
; =====Format=====
; Frame number, attributes
tbl9_8548:
; Still
	.byte $00
	.byte $00
; Tilted left
	.byte $01
	.byte $00
; Still
	.byte $00
	.byte $00
; Titled right
	.byte $01
	.byte $40

sprPtrs_ParachuteGoomba:
	.word sprMap_ParachuteGoomba1
	.word sprMap_ParachuteGoomba2
sprMap_ParachuteGoomba1:
	.byte $03
	.byte $04
	.byte $A5
	.byte $1D, $1E, $1F
	.byte $22, $23, $24
	.byte $27, $28, $FF
	.byte $2C, $2D, $FF
sprMap_ParachuteGoomba2:
	.byte $03
	.byte $04
	.byte $A5
	.byte $FF, $20, $21
	.byte $FF, $25, $26
	.byte $29, $2A, $2B
	.byte $2E, $2F, $30

obj0x94:
	LDX $A4
	LDA objVar,X
	BPL bra9_85E0
	objDistCalc bra9_85DD

; Make goomba face player if bit 7 of variable is set
bra9_85DD:
	JMP objFacePlayer

bra9_85E0:
	LDA #$06
	STA $25 ; Swallow when eaten by yoshi
	LDX $A4
	objDistCalc bra9_864A

bra9_864A:
	LDA objState,X
	AND #%00011111
	ASL
	TAY
	LDA tbl9_865E,Y
	STA $32
	LDA tbl9_865E+1,Y
	STA $33
	JMP ($32)
tbl9_865E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck ; Check if eaten as a powerup?
	.word ptr2_8668 ; Collision handling
	.word objFlipKill ; Flip object when killed

ptr2_8668:
	JSR sub9_8698
	JSR objPlayerHitCheck ; Handle collision with the player
	JSR objKillOnSpinJump ; Kill if spinjumped on
	LDA #16
	STA playerYSpd ; Give player vertical speed boost
	LDA playerMoveFlags
	ORA #%00000100 ; Boost player upwards
	EOR #%00000001 ; Move player in opposite direction
	STA playerMoveFlags
	LDA #16
	STA playerXSpd ; Move player backwards a bit
	LDA #1
	JSR rewardPoints ; Reward 200 points
	LDA #SFX_ENEMYHIT2
	STA sndSfx ; Play hit sound
	LDX $A4
	INC objSlot,X
	INC objSlot,X ; Knock goomba over
	LDA #$80
	STA objVar,X ; Face the player
	RTS

sub9_8698:
	LDA objVar,X
	CMP #$03
	BCS bra9_86A2
	JMP loc9_86BB
bra9_86A2:
	LDA objFrameCount
	AND #$00
	BNE bra9_86BA_RTS
	LDA #$85 ; Hardcoded straight line movement
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86BA_RTS:
	RTS

loc9_86BB:
	LDA objFrameCount
	AND #$02
	BNE bra9_86D3_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_86D3_RTS:
	RTS
obj0x96:
	LDX $A4
	LDA #$06
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
	BEQ bra9_86F8
	CMP #$FF
	BEQ bra9_86F8
	JMP objRemoveObject
bra9_86F8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_873A
	LDA objYDistHi,X
	BPL bra9_8729
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_873A
bra9_8729:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_873A:
loc9_873A:
	LDA freezeFlag
	BEQ bra9_8740
	RTS
bra9_8740:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8754,Y
	STA $32
	LDA tbl9_8754+1,Y
	STA $33
	JMP ($32)
tbl9_8754:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_875E
	.word objFlipKill

ptr2_875E:
	LDX $A4
	LDA objVar,X
	BPL bra9_87D7
	JSR sub9_887E
	JSR sub3_B077
	BEQ bra9_87D6_RTS
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_878E
	CMP #$FF
	BEQ bra9_878E
	JMP objRemoveObject
bra9_878E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_87D0
	LDA objYDistHi,X
	BPL bra9_87BF
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_87D0
bra9_87BF:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_87D0:
loc9_87D0:
	LDA freezeFlag
	BEQ bra9_87D6_RTS
	RTS
bra9_87D6_RTS:
	RTS
bra9_87D7:
	CMP #$0D
	BEQ bra9_880C
	CMP #$0F
	BCS bra9_87E5
	JSR sub9_881D
	JMP loc9_87E8
bra9_87E5:
	JSR sub9_8865
loc9_87E8:
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	LDX $A4
	LDA objVar,X
	BEQ bra9_880B_RTS
	LDA #$0F
	STA objVar,X
	LDA objXDistHi,X
	AND #$40
	STA $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
bra9_880B_RTS:
	RTS
bra9_880C:
	DEC objSlot,X
	DEC objSlot,X
	JSR objFacePlayer
	LDA #$03
	STA objVar,X
	JMP obj0x94
sub9_881D:
	LDA objState,X
	AND #$20
	BEQ bra9_884C
	LDA objFrameCount
	AND #$00
	BNE bra9_883C
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_883C:
	LDA objState,X
	AND #$20
	BNE bra9_884B_RTS
	LDA objState,X
	AND #$F0
	STA objState,X
bra9_884B_RTS:
	RTS
bra9_884C:
	LDA objFrameCount
	AND #$1E
	BNE bra9_8864_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8864_RTS:
	RTS
sub9_8865:
	LDA objFrameCount
	AND #$00
	BNE bra9_887D_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_887D_RTS:
	RTS
sub9_887E:
	LDA objFrameCount
	AND #$00
	BNE bra9_8896_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8896_RTS:
	RTS
ptr6_8897:
	LDX $A4
	LDY #$08
	LDA objVar,X
	SEC
	SBC #$09
	BCC bra9_88A9
	CMP #$04
	BCS bra9_88A9
	LDY #$04
bra9_88A9:
	STY $25
	LDY #$02
	LDA objFrameCount
	AND $25
	BEQ bra9_88B6
	LDY #$03
bra9_88B6:
	LDA objState,X
	AND #$C0
	ORA #$80
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8915+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_88DA
	LDY #$C0
bra9_88DA:
	STY $36
	JSR jmp_54_A118
	RTS
ptr6_88E0:
	LDX $A4
	LDY #$00
	LDA objFrameCount
	AND #$08
	BEQ bra9_88ED
	LDY #$01
bra9_88ED:
	LDA objState,X
	AND #$C0
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_8915,X
	STA $32
	LDA tbl9_8915+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_890F
	LDY #$C0
bra9_890F:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8915:
	.word off_891D
	.word off_8924
	.word off_892B
	.word off_8932
off_891D:
	.byte $02
	.byte $02
	.byte $A5
	.byte $01
	.byte $02
	.byte $08
	.byte $09
off_8924:
	.byte $02
	.byte $02
	.byte $A5
	.byte $06
	.byte $07
	.byte $0D
	.byte $0E
off_892B:
	.byte $02
	.byte $02
	.byte $A5
	.byte $08
	.byte $09
	.byte $01
	.byte $02
off_8932:
	.byte $02
	.byte $02
	.byte $A5
	.byte $0D
	.byte $0E
	.byte $06
	.byte $07
obj0x9A:
	LDX $A4
	LDA objVar,X
	BPL bra9_89AE
	CMP #$81
	BEQ bra9_89AB
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8960
	CMP #$FF
	BEQ bra9_8960
	JMP objRemoveObject
bra9_8960:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_89A2
	LDA objYDistHi,X
	BPL bra9_8991
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_89A2
bra9_8991:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_89A2:
loc9_89A2:
	LDA freezeFlag
	BEQ bra9_89A8
	RTS
bra9_89A8:
	JMP objFacePlayer
bra9_89AB:
	JMP sub_54_B4FC
bra9_89AE:
	LDA #$06
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
	BEQ bra9_89D0
	CMP #$FF
	BEQ bra9_89D0
	JMP objRemoveObject
bra9_89D0:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_8A12
	LDA objYDistHi,X
	BPL bra9_8A01
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8A12
bra9_8A01:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_8A12:
loc9_8A12:
	LDA freezeFlag
	BEQ bra9_8A18
	RTS
bra9_8A18:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8A2C,Y
	STA $32
	LDA tbl9_8A2C+1,Y
	STA $33
	JMP ($32)
tbl9_8A2C:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8A36
	.word objFlipKill
ptr2_8A36:
	JSR sub9_8A45
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JMP jmp_54_BF74
sub9_8A45:
	LDA objFrameCount
	AND #$02
	BNE bra9_8A5D_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8A5D_RTS:
	RTS
ptr6_8A5E:
	LDA #$00
	STA $05F0
	LDA objFrameCount
	LSR
	LSR
	LSR
	AND #$01 ; Check if on an 8th frame
	ASL
	TAX ; Get pointer index for odd/even frame
	LDA tbl9_8A8A,X
	STA $32
	LDA tbl9_8A8A+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8A84
	LDY #$C0
bra9_8A84:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8A8A:
	.word spinyWalk1
	.word spinyWalk2
spinyWalk1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14, $15
	.byte $16, $17
spinyWalk2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $14, $15
	.byte $18, $19
; Unused ball sprites --->
	.byte $02
	.byte $02
	.byte $A6
	.byte $1A, $1B
	.byte $1E, $1F
;-----
	.byte $02
	.byte $02
	.byte $A6
	.byte $1C, $1D
	.byte $20, $21
; <---
obj0x80:
	LDX $A4
	LDA objVar,X
	BMI bra9_8AB4
	JMP loc9_8B27
bra9_8AB4:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8AD0
	CMP #$FF
	BEQ bra9_8AD0
	JMP objRemoveObject
bra9_8AD0:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_8B12
	LDA objYDistHi,X
	BPL bra9_8B01
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8B12
bra9_8B01:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_8B12:
loc9_8B12:
	LDA freezeFlag
	BEQ bra9_8B18
	RTS
bra9_8B18:
	LDA objVar,X
	CMP #$81
	BCS bra9_8B23
	JSR objFacePlayer
	RTS
bra9_8B23:
	JSR sub_54_B4FC
	RTS
loc9_8B27:
	LDA #$06
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
	BEQ bra9_8B49
	CMP #$FF
	BEQ bra9_8B49
	JMP objRemoveObject
bra9_8B49:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_8B8B
	LDA objYDistHi,X
	BPL bra9_8B7A
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8B8B
bra9_8B7A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_8B8B:
loc9_8B8B:
	LDA freezeFlag
	BEQ bra9_8B91
	RTS
bra9_8B91:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8BA5,Y
	STA $32
	LDA tbl9_8BA5+1,Y
	STA $33
	JMP ($32)
tbl9_8BA5:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8B8F
	.word objFlipKill
ptr2_8B8F:
	LDA frameCount
	AND #$00
	BEQ bra9_8BB6
	RTS
bra9_8BB6:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDX $A4
	LDA #$81
	STA objVar,X
	RTS
ptr6_8BF1:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDA #$00
	ASL
	TAX
	LDA sprPtrs_BulletBill,X
	STA $32
	LDA sprPtrs_BulletBill+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8C16
	LDY #$C0
bra9_8C16:
	STY $36
	JSR jmp_54_A118
	RTS
sprPtrs_BulletBill:
	.word sprMap_BulletBill
sprMap_BulletBill:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $2A, $2B
	.byte $2C, $2D
	LDY #$00
	LDX $A4
	LDA objState,X
	AND #$C0
	STA $05F0
	LDA objState,X
	BPL bra9_8C38
	LDY #$01
bra9_8C38:
	TYA
	ASL
	TAX
	LDA sprPtrs_VBulletBill,X
	STA $32
	LDA sprPtrs_VBulletBill+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8C52
	LDY #$C0
bra9_8C52:
	STY $36
	JSR jmp_54_A118
	RTS
sprPtrs_VBulletBill:
	.word sprMap_VBulletBill1
	.word sprMap_VBulletBill2
sprMap_VBulletBill1:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $2E, $2F
	.byte $30, $31
sprMap_VBulletBill2:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $A6 ; 1K CHR Bank
	.byte $30, $31
	.byte $2E, $2F
obj0x9C:
	LDX $A4
	LDA objVar,X
	BPL bra9_8C76
	LDA #$00
	STA objVar,X
bra9_8C76:
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
	BEQ bra9_8C98
	CMP #$FF
	BEQ bra9_8C98
	JMP objRemoveObject
bra9_8C98:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc9_8CDA
	LDA objYDistHi,X
	BPL bra9_8CC9
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8CDA
bra9_8CC9:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc9_8CDA:
	LDA freezeFlag
	BEQ bra9_8CE0
	RTS
bra9_8CE0:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8CF4,Y
	STA $32
	LDA tbl9_8CF4+1,Y
	STA $33
	JMP ($32)
tbl9_8CF4:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8CFE
	.word objFlipKill
ptr2_8CFE:
	LDA objVar,X
	CMP #$06
	BCS bra9_8D73
	LDA frameCount
	AND #$1E
	BNE bra9_8D0E
	INC objVar,X
bra9_8D0E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8D2A
	CMP #$FF
	BEQ bra9_8D2A
	JMP objRemoveObject
bra9_8D2A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc9_8D6C
	LDA objYDistHi,X
	BPL bra9_8D5B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8D6C
bra9_8D5B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc9_8D6C:
	LDA freezeFlag
	BEQ bra9_8D72_RTS
	RTS
bra9_8D72_RTS:
	RTS
bra9_8D73:
	JSR sub9_8D7C
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub9_8D7C:
	LDA frameCount
	AND #$02
	BEQ bra9_8D83
	RTS
bra9_8D83:
	LDA #$87
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
ptr6_8D95:
	LDY #$00
	STY $05F0
	LDX $A4
	LDA objVar,X
	CMP #$06
	BCS bra9_8DA4
	RTS
bra9_8DA4:
	CMP #$15
	BCC bra9_8DAF
	LDY #$02
	LDA #$80
	STA $05F0
bra9_8DAF:
	LDA frameCount
	AND #$08
	BEQ bra9_8DB6
	INY
bra9_8DB6:
	TYA
	ASL
	TAX
	LDA tbl9_8DD6,X
	STA $32
	LDA tbl9_8DD6+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8DD0
	LDY #$C0
bra9_8DD0:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8DD6:
	.word vPodoboo1
	.word vPodoboo2
	.word vPodoboo3
	.word vPodoboo4
vPodoboo1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2A
	.byte $2B
	.byte $2E
	.byte $2F
vPodoboo2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2C
	.byte $2D
	.byte $30
	.byte $31
vPodoboo3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $2E
	.byte $2F
	.byte $2A
	.byte $2B
vPodoboo4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $30
	.byte $31
	.byte $2C
	.byte $2D
obj0x9E:
	LDX $A4
	LDA objVar,X
	BMI bra9_8E04
	JMP loc9_8E6B
bra9_8E04:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8E20
	CMP #$FF
	BEQ bra9_8E20
	JMP objRemoveObject
bra9_8E20:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc9_8E62
	LDA objYDistHi,X
	BPL bra9_8E51
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8E62
bra9_8E51:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc9_8E62:
	LDA freezeFlag
	BEQ bra9_8E68
	RTS
bra9_8E68:
	JMP objFacePlayer
loc9_8E6B:
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
	BEQ bra9_8E8D
	CMP #$FF
	BEQ bra9_8E8D
	JMP objRemoveObject
bra9_8E8D:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc9_8ECF
	LDA objYDistHi,X
	BPL bra9_8EBE
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8ECF
bra9_8EBE:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc9_8ECF:
	LDA freezeFlag
	BEQ bra9_8ED5
	RTS
bra9_8ED5:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8EE9,Y
	STA $32
	LDA tbl9_8EE9+1,Y
	STA $33
	JMP ($32)
tbl9_8EE9:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8EF3
	.word objFlipKill
ptr2_8EF3:
	JSR sub9_8EFC ; unlogged
	JSR jmp_54_BC3E ; unlogged
	JMP jmp_54_BF74 ; unlogged
sub9_8EFC:
	LDA frameCount
	AND #$04
	BEQ bra9_8F03
	RTS
bra9_8F03:
	LDA #$88
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
ptr6_8F15:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objVar,X
	CMP #$20
	BCS bra9_8F32
	LDY #$02
	LDA $05F0
	ORA #$80
	STA $05F0
bra9_8F32:
	LDA frameCount
	AND #$08
	BEQ bra9_8F39
	INY
bra9_8F39:
	TYA
	ASL
	TAX
	LDA tbl9_8F59,X
	STA $32
	LDA tbl9_8F59+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8F53
	LDY #$C0
bra9_8F53:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_8F59:
	.word tbl9_8F61
	.word tbl9_8F68
	.word tbl9_8F6F
	.word tbl9_8F76
tbl9_8F61:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2B, $2C
	.byte $36, $37
tbl9_8F68:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2D, $2E
	.byte $38, $39
tbl9_8F6F:
	.byte $02
	.byte $02
	.byte $A7
	.byte $36, $37
	.byte $2B, $2C
tbl9_8F76:
	.byte $02
	.byte $02
	.byte $A7
	.byte $38, $39
	.byte $2D, $2E
obj0x82:
	LDX $A4
	LDA objVar,X
	BMI bra9_8F87
	JMP loc9_8FEF
bra9_8F87:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_8FA3
	CMP #$FF
	BEQ bra9_8FA3
	JMP objRemoveObject
bra9_8FA3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc9_8FE5
	LDA objYDistHi,X
	BPL bra9_8FD4
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_8FE5
bra9_8FD4:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc9_8FE5:
	LDA freezeFlag
	BEQ bra9_8FEB
	RTS
bra9_8FEB:
	JSR objFacePlayer
	RTS
loc9_8FEF:
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
	BEQ bra9_9011
	CMP #$FF
	BEQ bra9_9011
	JMP objRemoveObject
bra9_9011:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9053
	LDA objYDistHi,X
	BPL bra9_9042
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9053
bra9_9042:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9053:
loc9_9053:
	LDA freezeFlag
	BEQ bra9_9059
	RTS
bra9_9059:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_906D,Y
	STA $32
	LDA tbl9_906D+1,Y
	STA $33
	JMP ($32)
tbl9_906D:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_9075
ptr2_9075:
	LDA frameCount
	AND #$00
	BEQ bra9_907C
	RTS
bra9_907C:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
ptr6_9093:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objFrameCount
	AND #$10
	BEQ bra9_90A8
	LDY #$01
bra9_90A8:
	TYA
	ASL
	TAX
	LDA tbl9_90C8,X
	STA $32
	LDA tbl9_90C8+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_90C2
	LDY #$C0
bra9_90C2:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_90C8:
	.word eerie1
	.word eerie2
eerie1:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0B
	.byte $0C
	.byte $13
	.byte $14
	.byte $1A
	.byte $1B
eerie2:
	.byte $02
	.byte $03
	.byte $AB
	.byte $0D
	.byte $0E
	.byte $15
	.byte $16
	.byte $1A
	.byte $1C
obj0xAA:
	LDX $A4
	LDA objVar,X
	BMI bra9_90E8
	JMP loc9_914F
bra9_90E8:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9104
	CMP #$FF
	BEQ bra9_9104
	JMP objRemoveObject
bra9_9104:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9146
	LDA objYDistHi,X
	BPL bra9_9135
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9146
bra9_9135:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9146:
loc9_9146:
	LDA freezeFlag
	BEQ bra9_914C
	RTS
bra9_914C:
	JMP objFacePlayer
loc9_914F:
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
	BEQ bra9_9171
	CMP #$FF
	BEQ bra9_9171
	JMP objRemoveObject
bra9_9171:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_91B3
	LDA objYDistHi,X
	BPL bra9_91A2
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_91B3
bra9_91A2:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_91B3:
loc9_91B3:
	LDA freezeFlag
	BEQ bra9_91B9
	RTS
bra9_91B9:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_91CD,Y
	STA $32
	LDA tbl9_91CD+1,Y
	STA $33
	JMP ($32)
tbl9_91CD:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_91D7
	.word objFlipKill
ptr2_91D7:
	LDA objVar,X
	CMP #$40
	BCS bra9_91E4
	JSR sub9_9224
	JMP loc9_91E7
bra9_91E4:
	JSR sub9_9260
loc9_91E7:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA objVar,X
	CMP #$40
	BCS bra9_9221
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDX $A4
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
bra9_9221:
	JMP jmp_54_BF74
sub9_9224:
	LDA frameCount
	AND #$02
	BEQ bra9_922B
	RTS
bra9_922B:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDX $A4
	LDA objVar,X
	BEQ bra9_9247
	CMP #$20
	BNE bra9_925F_RTS
bra9_9247:
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_9250
	LDY #$40
bra9_9250:
	STY $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	INC objVar,X
bra9_925F_RTS:
	RTS
sub9_9260:
	LDA frameCount
	AND #$1E
	BEQ bra9_9267
	RTS
bra9_9267:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
ptr6_9279:
	LDX $A4
	LDA objVar,X
	BPL bra9_9281
	RTS
bra9_9281:
	CMP #$40
	BCS bra9_9291
	LDY #$00
	LDA frameCount
	AND #$10
	BEQ bra9_929B
	LDY #$01
	BNE bra9_929B
bra9_9291:
	SEC
	SBC #$40
	AND #$07
	TAY
	LDA tbl9_92C3,Y
	TAY
bra9_929B:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_92D0,X
	STA $32
	LDA tbl9_92D0+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_92BD
	LDY #$C0
bra9_92BD:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_92C3:
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
tbl9_92D0:
	.word bonyBeetle1
	.word bonyBeetle2
	.word bonyBeetle3
	.word bonyBeetle4
bonyBeetle1:
	.byte $02
	.byte $02
	.byte $AD
	.byte $01
	.byte $02
	.byte $09
	.byte $0A
bonyBeetle2:
	.byte $02
	.byte $02
	.byte $AD
	.byte $03
	.byte $04
	.byte $0B
	.byte $0C
bonyBeetle3:
	.byte $02
	.byte $02
	.byte $AD
	.byte $07
	.byte $08
	.byte $0F
	.byte $10
bonyBeetle4:
	.byte $02
	.byte $02
	.byte $AD
	.byte $05
	.byte $06
	.byte $0D
	.byte $0E
obj0xAC:
	LDX $A4
	LDA objVar,X
	CMP #$05
	BCS bra9_9303
	JSR sub9_9385
	JMP loc9_9306
bra9_9303:
	JSR sub9_939E
loc9_9306:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9322
	CMP #$FF
	BEQ bra9_9322
	JMP objRemoveObject
bra9_9322:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9364
	LDA objYDistHi,X
	BPL bra9_9353
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9364
bra9_9353:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9364:
loc9_9364:
	LDA freezeFlag
	BEQ bra9_936A
	RTS
bra9_936A:
	LDA objVar,X
	CMP #$10
	BCC bra9_9384_RTS
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$00
	STA objState,X
	LDA #$80
	STA objVar,X
bra9_9384_RTS:
	RTS
sub9_9385:
	LDA frameCount
	AND #$3F
	BEQ bra9_938C
	RTS
bra9_938C:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
sub9_939E:
	LDA frameCount
	AND #$02
	BEQ bra9_93A5
	RTS
bra9_93A5:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
ptr6_93B7:
	LDY #$00
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDA objVar,X
	CMP #$0D
	BCC bra9_93CC
	LDY #$01
bra9_93CC:
	TYA
	ASL
	TAX
	LDA tbl9_93EC,X
	STA $32
	LDA tbl9_93EC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_93E6
	LDY #$C0
bra9_93E6:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_93EC:
	.word StunbonyBeetle1
	.word StunbonyBeetle2
StunbonyBeetle1:
	.byte $03
	.byte $02
	.byte $AD
	.byte $FF
	.byte $FF
	.byte $11
	.byte $15
	.byte $16
	.byte $17
StunbonyBeetle2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $12
	.byte $13
	.byte $14
	.byte $18
	.byte $19
	.byte $1A
obj0x8A:
	LDX $A4
	LDA objVar,X
	BPL bra9_9470
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9425
	CMP #$FF
	BEQ bra9_9425
	JMP objRemoveObject
bra9_9425:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9467
	LDA objYDistHi,X
	BPL bra9_9456
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9467
bra9_9456:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9467:
loc9_9467:
	LDA freezeFlag
	BEQ bra9_946D
	RTS
bra9_946D:
	JMP objFacePlayer
bra9_9470:
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
	BEQ bra9_9492
	CMP #$FF
	BEQ bra9_9492
	JMP objRemoveObject ; unlogged?
bra9_9492:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_94D4
	LDA objYDistHi,X
	BPL bra9_94C3
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_94D4
bra9_94C3:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_94D4:
loc9_94D4:
	LDA freezeFlag
	BEQ bra9_94DA
	RTS
bra9_94DA:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_94EE,Y
	STA $32
	LDA tbl9_94EE+1,Y
	STA $33
	JMP ($32)
tbl9_94EE:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_94F6
ptr2_94F6:
	JSR sub9_9500
	JSR objPlayerHitCheck
	JSR jmp_54_BF74
	RTS
sub9_9500:
	LDA frameCount
	AND #$06
	BEQ bra9_9507
	RTS
bra9_9507:
	LDA #$83
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
ptr6_9519:
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDY #$00
	LDA objVar,X
	AND #$08
	BNE bra9_9536
	LDY #$01
	LDA objFrameCount
	AND #$04 ; Set animation speed to per 4 frames
	BNE bra9_9536
	INY
bra9_9536:
	TYA
	ASL
	TAX
	LDA tbl9_9556,X
	STA $32
	LDA tbl9_9556+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9550
	LDY #$C0
bra9_9550:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9556:
	.word fishBones1
	.word fishBones2
	.word fishBones3
fishBones1:
	.byte $03 ; Tile Width
	.byte $02 ; Tile Height
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $1E, $1F, $20
fishBones2:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $1D
	.byte $21, $1F, $20
fishBones3:
	.byte $03
	.byte $02
	.byte $AD
	.byte $1B, $1C, $22
	.byte $1E, $1F, $23
obj0x8C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9595
	CMP #$FF
	BEQ bra9_9595
	JMP objRemoveObject
bra9_9595:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_95D7
	LDA objYDistHi,X
	BPL bra9_95C6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_95D7
bra9_95C6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_95D7:
loc9_95D7:
	LDA freezeFlag
	BEQ bra9_95DD
	RTS
bra9_95DD:
	LDA objVar,X
	BPL bra9_960D
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	SEC
	SBC #$0C
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$30
	STA objYLo,X
	BCS bra9_960C_RTS
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra9_960C_RTS:
	RTS
bra9_960D:
	LDX $A4
	LDA objFrameCount
	AND #$07
	BNE bra9_9621
	INC objVar,X
	LDA objVar,X
	AND #$1F
	STA objVar,X
bra9_9621:
	LDA objFrameCount
	AND #$03
	BNE bra9_962B
	JSR jmp_54_BBC3
bra9_962B:
	JSR objPlayerHitCheck
	JSR jmp_54_BF74
	RTS
ptr7_9632:
	LDY #$00
	LDX $A4
	LDA #$00
	ASL
	TAX
	LDA tbl9_9657,X
	STA $32
	LDA tbl9_9657+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9651
	LDY #$C0
bra9_9651:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9657:
	.word spikeBall
spikeBall:
	.byte $04
	.byte $04
	.byte $AC
	.byte $FF
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
obj0xA4:
	LDX $A4
	LDA objVar,X
	BMI bra9_9676
	JMP loc9_96DD
bra9_9676:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9692
	CMP #$FF
	BEQ bra9_9692
	JMP objRemoveObject
bra9_9692:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_96D4
	LDA objYDistHi,X
	BPL bra9_96C3
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_96D4
bra9_96C3:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_96D4:
loc9_96D4:
	LDA freezeFlag
	BEQ bra9_96DA
	RTS
bra9_96DA:
	JMP objFacePlayer
loc9_96DD:
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
	BEQ bra9_96FF
	CMP #$FF
	BEQ bra9_96FF
	JMP objRemoveObject
bra9_96FF:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9741
	LDA objYDistHi,X
	BPL bra9_9730
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9741
bra9_9730:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9741:
loc9_9741:
	LDA freezeFlag
	BEQ bra9_9747
	RTS
bra9_9747:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_975B,Y
	STA $32
	LDA tbl9_975B+1,Y
	STA $33
	JMP ($32)
tbl9_975B:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_9765
	.word objFlipKill
ptr2_9765:
	JSR sub9_978D
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	JMP loc9_98D1
sub9_978D:
	LDA frameCount
	AND #$02
	BEQ bra9_9794
	RTS
bra9_9794:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
obj0xA2:
	LDX $A4
	LDA objVar,X
	BMI bra9_97B0
	JMP loc9_9817
bra9_97B0:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_97CC
	CMP #$FF
	BEQ bra9_97CC
	JMP objRemoveObject
bra9_97CC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_980E
	LDA objYDistHi,X
	BPL bra9_97FD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_980E
bra9_97FD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_980E:
loc9_980E:
	LDA freezeFlag
	BEQ bra9_9814
	RTS
bra9_9814:
	JMP objFacePlayer
loc9_9817:
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
	BEQ bra9_9839
	CMP #$FF
	BEQ bra9_9839
	JMP objRemoveObject
bra9_9839:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_987B
	LDA objYDistHi,X
	BPL bra9_986A
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_987B
bra9_986A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_987B:
loc9_987B:
	LDA freezeFlag
	BEQ bra9_9881
	RTS
bra9_9881:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_9895,Y
	STA $32
	LDA tbl9_9895+1,Y
	STA $33
	JMP ($32)
tbl9_9895:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_989F
	.word objFlipKill
ptr2_989F:
	LDA objVar,X
	CMP #$40
	BCS bra9_98AC
	JSR sub9_98E2
	JMP loc9_98AF
bra9_98AC:
	JSR sub9_991E
loc9_98AF:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
loc9_98D1:
	LDX $A4
	LDA objSlot,X
	CLC
	ADC #$06
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub9_98E2:
	LDA frameCount
	AND #$02
	BEQ bra9_98E9
	RTS
bra9_98E9:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDX $A4
	LDA objVar,X
	BEQ bra9_9905
	CMP #$20
	BNE bra9_991D_RTS
bra9_9905:
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_990E
	LDY #$40
bra9_990E:
	STY $25
	LDA objState,X
	AND #$BF
	ORA $25
	STA objState,X
	INC objVar,X
bra9_991D_RTS:
	RTS
sub9_991E:
	LDA frameCount
	AND #$1E
	BEQ bra9_9925
	RTS
bra9_9925:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDA objVar,X
	CMP #$46
	BNE bra9_997F_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$08
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
	CLC
	ADC #$04
	STA objSlot,Y
bra9_997F_RTS:
	RTS
ptr6_9980:
	LDX $A4
	LDA objVar,X
	CMP #$40
	BCS bra9_9995
	LDY #$00
	LDA frameCount
	AND #$10
	BEQ bra9_99A2
	LDY #$01
	BNE bra9_99A2
bra9_9995:
	LDY #$00
	SEC
	SBC #$43
	BCC bra9_99A2
	CMP #$03
	BCS bra9_99A2
	LDY #$02
bra9_99A2:
	LDA objState,X
	AND #$40
	STA $05F0
	TYA
	ASL
	TAX
	LDA tbl9_99CA,X
	STA $32
	LDA tbl9_99CA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_99C4
	LDY #$C0
bra9_99C4:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_99CA:
	.word dryBones1
	.word dryBones2
	.word dryBones3
dryBones1:
	.byte $03
	.byte $04
	.byte $AC
	.byte $11
	.byte $12
	.byte $FF
	.byte $15
	.byte $17
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $28
	.byte $29
	.byte $2A
dryBones2:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $19
	.byte $FF
	.byte $1F
	.byte $22
	.byte $23
	.byte $28
	.byte $2B
	.byte $2C
dryBones3:
	.byte $03
	.byte $04
	.byte $AC
	.byte $13
	.byte $14
	.byte $FF
	.byte $18
	.byte $1A
	.byte $1B
	.byte $FF
	.byte $24
	.byte $23
	.byte $FF
	.byte $2D
	.byte $2C
obj0xA8:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9A1B
	CMP #$FF
	BEQ bra9_9A1B
	JMP objRemoveObject
bra9_9A1B:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9A5D
	LDA objYDistHi,X
	BPL bra9_9A4C
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9A5D
bra9_9A4C:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9A5D:
loc9_9A5D:
	LDA freezeFlag
	BEQ bra9_9A63
	RTS
bra9_9A63:
	LDA frameCount
	AND #$07
	BNE bra9_9A86_RTS
	INC objVar,X
	LDA objVar,X
	CMP #$20
	BCC bra9_9A86_RTS
	LDA objSlot,X
	SEC
	SBC #$06
	STA objSlot,X
	LDA #$00
	STA objState,X
	LDA #$80
	STA objVar,X
bra9_9A86_RTS:
	RTS
ptr7_9A87:
	LDY #$00
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	LDA objVar,X
	CMP #$1D
	BCC bra9_9AA2
	LDY #$01
	CMP #$31
	BCC bra9_9AA2
	LDY #$02
bra9_9AA2:
	TYA
	ASL
	TAX
	LDA tbl9_9AC2,X
	STA $32
	LDA tbl9_9AC2+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9ABC
	LDY #$C0
bra9_9ABC:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9AC2:
	.word StundryBones1
	.word StundryBones2
	.word StundryBones3
StundryBones1:
	.byte $03
	.byte $04
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $36
	.byte $37
	.byte $38
StundryBones2:
	.byte $03
	.byte $04
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $30
	.byte $33
	.byte $34
	.byte $35
StundryBones3:
	.byte $03
	.byte $04
	.byte $AC
	.byte $11
	.byte $12
	.byte $FF
	.byte $15
	.byte $16
	.byte $FF
	.byte $1C
	.byte $1D
	.byte $1E
	.byte $25
	.byte $26
	.byte $27
obj0xA6:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9B13
	CMP #$FF
	BEQ bra9_9B13
	JMP objRemoveObject
bra9_9B13:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9B55
	LDA objYDistHi,X
	BPL bra9_9B44
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9B55
bra9_9B44:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9B55:
loc9_9B55:
	LDA freezeFlag
	BEQ bra9_9B5B
	RTS
bra9_9B5B:
	LDA frameCount
	AND #$00
	BEQ bra9_9B62
	RTS
bra9_9B62:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR objPlayerHitCheck
	JMP jmp_54_BF74
ptr6_9B79:
	LDY #$00
	LDX $A4
	LDA frameCount
	AND #$0E
	TAY
	LDA tbl9_9BAB,Y
	STA $05F0
	LDA tbl9_9BAA,Y
	ASL
	TAX
	LDA tbl9_9BBA,X
	STA $32
	LDA tbl9_9BBA+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_9BA4
	LDY #$C0
bra9_9BA4:
	STY $36
	JSR jmp_54_A118
	RTS
tbl9_9BAA:
	.byte $00
tbl9_9BAB:
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $40
	.byte $03
	.byte $00
	.byte $03
	.byte $00
	.byte $02
	.byte $C0
	.byte $02
	.byte $80
	.byte $00
	.byte $00
tbl9_9BBA:
	.word bone1
	.word bone2
	.word bone3
	.word bone4
bone1:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $31
	.byte $39
	.byte $3A
bone2:
	.byte $02
	.byte $02
	.byte $AC
	.byte $FF
	.byte $32
	.byte $FF
	.byte $3B
bone3:
	.byte $02
	.byte $02
	.byte $AC
	.byte $39
	.byte $3A
	.byte $FF
	.byte $31
bone4:
	.byte $02
	.byte $02
	.byte $AC
	.byte $32
	.byte $FF
	.byte $3B
	.byte $FF
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
tbl9_9C5E:
	.word ofs_9C78
	.word ofs_9C7B
	.word ofs_9C78
	.word ofs_9C7E
	.word ofs_9C9F
	.word ofs_9CCC
	.word ofs_9CED
	.word ofs_9CF0
	.word ofs_9D3B
	.word ofs_9DBC
	.word ofs_9DF3
	.word ofs_9E84
	.word ofs_9E87
ofs_9C78:
	.byte $03
	.byte $00
	.byte $80
ofs_9C7B:
	.byte $00
	.byte $01
	.byte $80
ofs_9C7E:
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $02
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $04
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9C9F:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $00
	.byte $08
	.byte $00
	.byte $07
	.byte $00
	.byte $07
	.byte $00
	.byte $07
	.byte $00
	.byte $04
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9CCC:
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $81
	.byte $00
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $80
ofs_9CED:
	.byte $02
	.byte $00
	.byte $80
ofs_9CF0:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $F6
	.byte $00
	.byte $F6
	.byte $00
	.byte $F6
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $F8
	.byte $00
	.byte $FA
	.byte $00
	.byte $FA
	.byte $00
	.byte $FB
	.byte $00
	.byte $FB
	.byte $00
	.byte $FC
	.byte $00
	.byte $FD
	.byte $00
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
	.byte $01
	.byte $00
	.byte $02
	.byte $00
	.byte $03
	.byte $00
	.byte $04
	.byte $00
	.byte $05
	.byte $00
	.byte $05
	.byte $00
	.byte $06
	.byte $00
	.byte $06
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $08
	.byte $00
	.byte $0A
	.byte $00
	.byte $0A
	.byte $00
	.byte $0A
	.byte $00
	.byte $00
	.byte $80
ofs_9D3B:
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $80
ofs_9DBC:
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
	.byte $FA
	.byte $02
	.byte $FB
	.byte $02
	.byte $FC
	.byte $02
	.byte $FC
	.byte $02
	.byte $FD
	.byte $02
	.byte $FD
	.byte $02
	.byte $FE
	.byte $02
	.byte $FE
	.byte $02
	.byte $FF
	.byte $02
	.byte $FF
	.byte $02
	.byte $00
	.byte $80
ofs_9DF3:
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
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
ofs_9E84:
	.byte $01
	.byte $00
	.byte $80
ofs_9E87:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $02
	.byte $00
	.byte $FE
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $9E
	STA $33
	JMP ($32) ; This code seems to be cut off/overwritten
	.byte $BB
	.byte $A7
	.byte $7B
	.byte $AA
	.byte $29
	.byte $AB
	.byte $B8
	.byte $9E
	LDA objXDistHi,X ; The rest of the code in this is unused
	BPL bra9_9EE4_RTS
	LDA #$23
	STA sndMusic
	LDA #$06
	STA gameState
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAY
	LDA $0399
	BEQ bra9_9ED9
	TYA
	CLC
	ADC #$1C
	TAY
bra9_9ED9:
	LDA #$00
	STA checkpointFlag,Y
	STA invincibilityTimer
	STA playerPowerupBuffer
bra9_9EE4_RTS:
	RTS
	LDA playerPowerup
	BNE bra9_9EF6_RTS
	INC playerPowerup
	LDA #$07
	STA gameState
	LDA #$01
	STA playerPowerupBuffer
bra9_9EF6_RTS:
	RTS
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra9_9F15
	CMP #$FF
	BEQ bra9_9F15
	JMP objRemoveObject
bra9_9F15:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra9_9F57
	LDA objYDistHi,X
	BPL bra9_9F46
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc9_9F57
bra9_9F46:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra9_9F57:
loc9_9F57:
	LDA freezeFlag
	BEQ bra9_9F5D
	RTS
bra9_9F5D:
	LDA objVar,X
	BPL bra9_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra9_9F78
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$0F
	STA objXLo,X
	RTS
bra9_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra9_9F8D
	LDA objXDistHi,X
	BPL bra9_9F8C_RTS
bra9_9F84:
	INC $E0
	LDX $0399
	INC $036A,X
bra9_9F8C_RTS:
	RTS
bra9_9F8D:
	LDA objXDistHi,X
	BPL bra9_9F84
	RTS
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
