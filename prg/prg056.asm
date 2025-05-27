;disassembled by BZK 6502 Disassembler
sub9_8000:
	LDX $A4
	LDA objVar,X
	AND #%01111111
	ASL
	TAY
	LDA objState,X
	AND #%00100000
	BNE bra9_8013
	JMP loc9_80A2 ;Jump if goomba is moving up

bra9_8013:
	JSR sub3_B077
	BNE bra9_8078
	LDA objVar,X
	AND #%01111111
	CMP #$07
	BCS bra9_8024 ;No goomba has more than 7 movement vectors
	INC objVar,X ;Go to next movement vector

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
Obj_hA0:
	LDX $A4
	LDA objVar,X
	BPL bra9_8153
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_81D1
	dw Obj_FlipKill
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
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR RewardPoints
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
	JMP Obj_RemoveObject
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
	LDA SprPtrs_Paragoomba,X
	STA $32
	LDA SprPtrs_Paragoomba+1,X
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
SprPtrs_Paragoomba:
	dw SprMap_Paragoomba1
	dw SprMap_Paragoomba2
SprMap_Paragoomba1:
	db $04
	db $04
	db $A5
	db $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $FF
	db $03, $04, $05, $FF
	db $0A, $0B, $0C, $FF
SprMap_Paragoomba2:
	db $04
	db $04
	db $A5
	db $0F, $FF, $10, $11
	db $12, $13, $14, $15
	db $16, $17, $18, $19
	db $1A, $1B, $1C, $FF
Obj_h98:
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
	JMP Obj_RemoveObject
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
	JMP Obj_RemoveObject
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
Obj_h8E:
	STA $32
	LDA tbl9_8422+1,Y
	STA $33
	JMP ($32)
tbl9_8422:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_842C
	dw Obj_FlipKill
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
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR RewardPoints
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
	JMP Obj_RemoveObject
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
	LDA SprPtrs_ParachuteGoomba,X
	STA $32
	LDA SprPtrs_ParachuteGoomba+1,X
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

;Animation attributes
;=====Format=====
;Frame number, attributes
tbl9_8548:
;Still
	db $00
	db $00
;Tilted left
	db $01
	db $00
;Still
	db $00
	db $00
;Titled right
	db $01
	db $40

SprPtrs_ParachuteGoomba:
	dw SprMap_ParachuteGoomba1
	dw SprMap_ParachuteGoomba2
SprMap_ParachuteGoomba1:
	db $03
	db $04
	db $A5
	db $1D, $1E, $1F
	db $22, $23, $24
	db $27, $28, $FF
	db $2C, $2D, $FF
SprMap_ParachuteGoomba2:
	db $03
	db $04
	db $A5
	db $FF, $20, $21
	db $FF, $25, $26
	db $29, $2A, $2B
	db $2E, $2F, $30

Obj_h94:
	LDX $A4
	LDA objVar,X
	BPL bra9_85E0
	Obj_DistCalc bra9_85DD

; Make goomba face player if bit 7 of variable is set
bra9_85DD:
	JMP Obj_FacePlayer

bra9_85E0:
	LDA #$06
	STA $25 ;Swallow when eaten by yoshi
	LDX $A4
	Obj_DistCalc bra9_864A

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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck ;Check if eaten as a powerup?
	dw ptr2_8668 ;Collision handling
	dw Obj_FlipKill ;Flip object when killed

ptr2_8668:
	JSR sub9_8698
	JSR Obj_PlayerHitCheck ;Handle collision with the player
	JSR Obj_KillOnSpinJump ;Kill if spinjumped on
	LDA #16
	STA playerYSpd ;Give player vertical speed boost
	LDA playerMoveFlags
	ORA #%00000100 ;Boost player upwards
	EOR #%00000001 ;Move player in opposite direction
	STA playerMoveFlags
	LDA #16
	STA playerXSpd ;Move player backwards a bit
	LDA #1
	JSR RewardPoints ;Reward 200 points
	LDA #sfx_EnemyHit2
	STA sndSfx ;Play hit sound
	LDX $A4
	INC objSlot,X
	INC objSlot,X ;Knock goomba over
	LDA #$80
	STA objVar,X ;Face the player
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
	LDA #$85 ;Hardcoded straight line movement
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
Obj_h96:
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_875E
	dw Obj_FlipKill

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
	JMP Obj_RemoveObject
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
	JSR Obj_KillOnSpinJump
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
	JSR Obj_FacePlayer
	LDA #$03
	STA objVar,X
	JMP Obj_h94
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
	dw off_891D
	dw off_8924
	dw off_892B
	dw off_8932
off_891D:
	db $02
	db $02
	db $A5
	db $01
	db $02
	db $08
	db $09
off_8924:
	db $02
	db $02
	db $A5
	db $06
	db $07
	db $0D
	db $0E
off_892B:
	db $02
	db $02
	db $A5
	db $08
	db $09
	db $01
	db $02
off_8932:
	db $02
	db $02
	db $A5
	db $0D
	db $0E
	db $06
	db $07
Obj_h9A:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_8A36
	dw Obj_FlipKill
ptr2_8A36:
	JSR sub9_8A45
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR Obj_KillOnSpinJump
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
	AND #$01 ;Check if on an 8th frame
	ASL
	TAX ;Get pointer index for odd/even frame
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
	dw SpinyWalk1
	dw SpinyWalk2
SpinyWalk1:
	db $02
	db $02
	db $A6
	db $14, $15
	db $16, $17
SpinyWalk2:
	db $02
	db $02
	db $A6
	db $14, $15
	db $18, $19
;Unused ball sprites --->
	db $02
	db $02
	db $A6
	db $1A, $1B
	db $1E, $1F
;-----
	db $02
	db $02
	db $A6
	db $1C, $1D
	db $20, $21
;<---
Obj_h80:
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
	JMP Obj_RemoveObject
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
	JSR Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_8B8F
	dw Obj_FlipKill
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
	JSR GetSpeedData
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR RewardPoints
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
	LDA SprPtrs_BulletBill,X
	STA $32
	LDA SprPtrs_BulletBill+1,X
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
SprPtrs_BulletBill:
	dw SprMap_BulletBill
SprMap_BulletBill:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $A6 ;1K CHR Bank
	db $2A, $2B
	db $2C, $2D
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
	LDA SprPtrs_VBulletBill,X
	STA $32
	LDA SprPtrs_VBulletBill+1,X
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
SprPtrs_VBulletBill:
	dw SprMap_VBulletBill1
	dw SprMap_VBulletBill2
SprMap_VBulletBill1:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $A6 ;1K CHR Bank
	db $2E, $2F
	db $30, $31
SprMap_VBulletBill2:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $A6 ;1K CHR Bank
	db $30, $31
	db $2E, $2F
Obj_h9C:
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_8CFE
	dw Obj_FlipKill
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
	JMP Obj_RemoveObject
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
	dw VPodoboo1
	dw VPodoboo2
	dw VPodoboo3
	dw VPodoboo4
VPodoboo1:
	db $02
	db $02
	db $AD
	db $2A
	db $2B
	db $2E
	db $2F
VPodoboo2:
	db $02
	db $02
	db $AD
	db $2C
	db $2D
	db $30
	db $31
VPodoboo3:
	db $02
	db $02
	db $AD
	db $2E
	db $2F
	db $2A
	db $2B
VPodoboo4:
	db $02
	db $02
	db $AD
	db $30
	db $31
	db $2C
	db $2D
Obj_h9E:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_8EF3
	dw Obj_FlipKill
ptr2_8EF3:
	JSR sub9_8EFC ;unlogged
	JSR jmp_54_BC3E ;unlogged
	JMP jmp_54_BF74 ;unlogged
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
	JSR GetSpeedData
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
	dw tbl9_8F61
	dw tbl9_8F68
	dw tbl9_8F6F
	dw tbl9_8F76
tbl9_8F61:
	db $02
	db $02
	db $A7
	db $2B, $2C
	db $36, $37
tbl9_8F68:
	db $02
	db $02
	db $A7
	db $2D, $2E
	db $38, $39
tbl9_8F6F:
	db $02
	db $02
	db $A7
	db $36, $37
	db $2B, $2C
tbl9_8F76:
	db $02
	db $02
	db $A7
	db $38, $39
	db $2D, $2E
Obj_h82:
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
	JMP Obj_RemoveObject
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
	JSR Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_9075
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
	JSR GetSpeedData
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
	dw Eerie1
	dw Eerie2
Eerie1:
	db $02
	db $03
	db $AB
	db $0B
	db $0C
	db $13
	db $14
	db $1A
	db $1B
Eerie2:
	db $02
	db $03
	db $AB
	db $0D
	db $0E
	db $15
	db $16
	db $1A
	db $1C
Obj_hAA:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_91D7
	dw Obj_FlipKill
ptr2_91D7:
	LDA objVar,X
	CMP #$40
	BCS bra9_91E4
	JSR sub9_9224
	JMP loc9_91E7
bra9_91E4:
	JSR sub9_9260
loc9_91E7:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
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
	JSR RewardPoints
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
	db $02
	db $02
	db $03
	db $03
	db $03
	db $03
	db $03
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
tbl9_92D0:
	dw BonyBeetle1
	dw BonyBeetle2
	dw BonyBeetle3
	dw BonyBeetle4
BonyBeetle1:
	db $02
	db $02
	db $AD
	db $01
	db $02
	db $09
	db $0A
BonyBeetle2:
	db $02
	db $02
	db $AD
	db $03
	db $04
	db $0B
	db $0C
BonyBeetle3:
	db $02
	db $02
	db $AD
	db $07
	db $08
	db $0F
	db $10
BonyBeetle4:
	db $02
	db $02
	db $AD
	db $05
	db $06
	db $0D
	db $0E
Obj_hAC:
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
	JMP Obj_RemoveObject
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
	JSR GetSpeedData
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
	dw StunBonyBeetle1
	dw StunBonyBeetle2
StunBonyBeetle1:
	db $03
	db $02
	db $AD
	db $FF
	db $FF
	db $11
	db $15
	db $16
	db $17
StunBonyBeetle2:
	db $03
	db $02
	db $AD
	db $12
	db $13
	db $14
	db $18
	db $19
	db $1A
Obj_h8A:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject ;unlogged?
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_94F6
ptr2_94F6:
	JSR sub9_9500
	JSR Obj_PlayerHitCheck
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
	JSR GetSpeedData
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
	AND #$04 ;Set animation speed to per 4 frames
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
	dw FishBones1
	dw FishBones2
	dw FishBones3
FishBones1:
	db $03 ;Tile Width
	db $02 ;Tile Height
	db $AD
	db $1B, $1C, $1D
	db $1E, $1F, $20
FishBones2:
	db $03
	db $02
	db $AD
	db $1B, $1C, $1D
	db $21, $1F, $20
FishBones3:
	db $03
	db $02
	db $AD
	db $1B, $1C, $22
	db $1E, $1F, $23
Obj_h8C:
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
	JMP Obj_RemoveObject
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
	JSR Obj_PlayerHitCheck
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
	dw SpikeBall
SpikeBall:
	db $04
	db $04
	db $AC
	db $FF
	db $01
	db $02
	db $03
	db $04
	db $05
	db $06
	db $07
	db $08
	db $09
	db $0A
	db $0B
	db $0D
	db $0E
	db $0F
	db $10
Obj_hA4:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_9765
	dw Obj_FlipKill
ptr2_9765:
	JSR sub9_978D
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR RewardPoints
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
Obj_hA2:
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
	JMP Obj_RemoveObject
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
	JMP Obj_FacePlayer
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
	JMP Obj_RemoveObject
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
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr2_989F
	dw Obj_FlipKill
ptr2_989F:
	LDA objVar,X
	CMP #$40
	BCS bra9_98AC
	JSR sub9_98E2
	JMP loc9_98AF
bra9_98AC:
	JSR sub9_991E
loc9_98AF:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR RewardPoints
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
	dw DryBones1
	dw DryBones2
	dw DryBones3
DryBones1:
	db $03
	db $04
	db $AC
	db $11
	db $12
	db $FF
	db $15
	db $17
	db $FF
	db $1F
	db $20
	db $21
	db $28
	db $29
	db $2A
DryBones2:
	db $03
	db $04
	db $AC
	db $13
	db $14
	db $FF
	db $18
	db $19
	db $FF
	db $1F
	db $22
	db $23
	db $28
	db $2B
	db $2C
DryBones3:
	db $03
	db $04
	db $AC
	db $13
	db $14
	db $FF
	db $18
	db $1A
	db $1B
	db $FF
	db $24
	db $23
	db $FF
	db $2D
	db $2C
Obj_hA8:
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
	JMP Obj_RemoveObject
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
	dw StunDryBones1
	dw StunDryBones2
	dw StunDryBones3
StunDryBones1:
	db $03
	db $04
	db $AC
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $36
	db $37
	db $38
StunDryBones2:
	db $03
	db $04
	db $AC
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $2E
	db $2F
	db $30
	db $33
	db $34
	db $35
StunDryBones3:
	db $03
	db $04
	db $AC
	db $11
	db $12
	db $FF
	db $15
	db $16
	db $FF
	db $1C
	db $1D
	db $1E
	db $25
	db $26
	db $27
Obj_hA6:
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
	JMP Obj_RemoveObject
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
	JSR GetSpeedData
	JSR Obj_PlayerHitCheck
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
	db $00
tbl9_9BAB:
	db $00
	db $01
	db $00
	db $01
	db $40
	db $03
	db $00
	db $03
	db $00
	db $02
	db $C0
	db $02
	db $80
	db $00
	db $00
tbl9_9BBA:
	dw Bone1
	dw Bone2
	dw Bone3
	dw Bone4
Bone1:
	db $02
	db $02
	db $AC
	db $FF
	db $31
	db $39
	db $3A
Bone2:
	db $02
	db $02
	db $AC
	db $FF
	db $32
	db $FF
	db $3B
Bone3:
	db $02
	db $02
	db $AC
	db $39
	db $3A
	db $FF
	db $31
Bone4:
	db $02
	db $02
	db $AC
	db $32
	db $FF
	db $3B
	db $FF
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
tbl9_9C5E:
	dw ofs_9C78
	dw ofs_9C7B
	dw ofs_9C78
	dw ofs_9C7E
	dw ofs_9C9F
	dw ofs_9CCC
	dw ofs_9CED
	dw ofs_9CF0
	dw ofs_9D3B
	dw ofs_9DBC
	dw ofs_9DF3
	dw ofs_9E84
	dw ofs_9E87
ofs_9C78:
	db $03
	db $00
	db $80
ofs_9C7B:
	db $00
	db $01
	db $80
ofs_9C7E:
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $04
	db $00
	db $04
	db $00
	db $04
	db $00
	db $04
	db $00
	db $04
	db $00
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $80
ofs_9C9F:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $81
	db $00
	db $08
	db $00
	db $07
	db $00
	db $07
	db $00
	db $07
	db $00
	db $04
	db $00
	db $01
	db $00
	db $00
	db $00
	db $80
ofs_9CCC:
	db $00
	db $00
	db $02
	db $00
	db $81
	db $00
	db $00
	db $F8
	db $00
	db $FA
	db $00
	db $FB
	db $00
	db $FC
	db $00
	db $FD
	db $00
	db $FF
	db $00
	db $00
	db $00
	db $01
	db $00
	db $03
	db $00
	db $04
	db $00
	db $05
	db $00
	db $06
	db $00
	db $08
	db $80
ofs_9CED:
	db $02
	db $00
	db $80
ofs_9CF0:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $F6
	db $00
	db $F6
	db $00
	db $F6
	db $00
	db $F8
	db $00
	db $F8
	db $00
	db $F8
	db $00
	db $F8
	db $00
	db $FA
	db $00
	db $FA
	db $00
	db $FB
	db $00
	db $FB
	db $00
	db $FC
	db $00
	db $FD
	db $00
	db $FE
	db $00
	db $FF
	db $00
	db $01
	db $00
	db $02
	db $00
	db $03
	db $00
	db $04
	db $00
	db $05
	db $00
	db $05
	db $00
	db $06
	db $00
	db $06
	db $00
	db $08
	db $00
	db $08
	db $00
	db $08
	db $00
	db $08
	db $00
	db $0A
	db $00
	db $0A
	db $00
	db $0A
	db $00
	db $00
	db $80
ofs_9D3B:
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FE
	db $80
ofs_9DBC:
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $00
	db $02
	db $FA
	db $02
	db $FB
	db $02
	db $FC
	db $02
	db $FC
	db $02
	db $FD
	db $02
	db $FD
	db $02
	db $FE
	db $02
	db $FE
	db $02
	db $FF
	db $02
	db $FF
	db $02
	db $00
	db $80
ofs_9DF3:
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $80
ofs_9E84:
	db $01
	db $00
	db $80
ofs_9E87:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $02
	db $00
	db $FE
	db $00
	db $02
	db $00
	db $FE
	db $00
	db $02
	db $00
	db $FE
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $81
	db $9E
	STA $33
	JMP ($32) ;This code seems to be cut off/overwritten
	db $BB
	db $A7
	db $7B
	db $AA
	db $29
	db $AB
	db $B8
	db $9E
	LDA objXDistHi,X ;The rest of the code in this is unused
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
	JMP Obj_RemoveObject
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
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
