; disassembled by BZK 6502 Disassembler
ptr6_8000:
	LDA objFrameCount
	AND #$01
	BEQ bra5_8008
	RTS
bra5_8008:
	LDX $A4
	LDA enemyAnimFrame,X
	BNE bra5_8010
	RTS
bra5_8010:
	AND #$3F
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_802B
	LDY #$C0
bra5_802B:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_8039:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_805E,X
	STA $32
	LDA tbl5_805E+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_805E:
	dw ofs2_80CE
	dw ofs2_8278
	dw ofs2_828F
	dw ofs2_82A6
	dw ofs2_82AD
	dw ofs2_82B4
	dw ofs2_82BB
	dw SpikeTop_Walk1
	dw SpikeTop_Walk2
	dw SpikeTop_SideWalk1
	dw SpikeTop_SideWalk2
	dw SpikeTop_Diag
	dw SpikeTop_Walk1_VMir
	dw SpikeTop_Walk2_VMir
	dw SpikeTop_SideWalk1_VMir
	dw SpikeTop_SideWalk2_VMir
	dw SpikeTop_Diag_VMir
	dw FenceKoopa
	dw RedPlatform
	dw RedPlatform
	dw GreenPlatform
	dw FuzzySpr
	dw FuzzySpr2
	dw OnOffSwitch_Off
	dw OnOffSwitch_On
	dw Chainsaw1
	dw Chainsaw2
	dw Chainsaw3
	dw Rope1
	dw Rope2
	dw Rope3
	dw LongRope1
	dw LongRope2
	dw LongRope3
; Unused upside-down sprites--->
	dw Chainsaw_VMir1
	dw Chainsaw_VMir2
	dw Chainsaw_VMir3
; <---
	dw Chainsaw1
	dw Chainsaw2
	dw Chainsaw3
	dw ofs2_8261
	dw PSwitchPlatform
	dw PSwitchDoor
PSwitchPlatform:
	db $06
	db $02
	db $A4
	db $32, $33, $32, $33, $32, $33
	db $34, $35, $34, $35, $34, $35
PSwitchDoor:
	db $02
	db $04
	db $AB
	db $38, $39
	db $3A, $3B
	db $3C, $3D
	db $3E, $3F
ofs2_80CE:
	db $01
	db $01
	db $95
	db $FF
Chainsaw1:
	db $02
	db $05
	db $95
	db $01, $02
	db $05, $06
	db $09, $0A
	db $0D, $0E
	db $13, $14
Chainsaw2:
	db $02
	db $05
	db $95
	db $03, $04
	db $07, $08
	db $0B, $0C
	db $0F, $10
	db $15, $16
Chainsaw3:
	db $02
	db $05
	db $95
	db $03, $04
	db $07, $08
	db $0B, $0C
	db $11, $12
	db $15, $16

; These 3 go unused
Chainsaw_VMir1:
	db $02
	db $05
	db $95
	db $13, $14
	db $0D, $0E
	db $09, $0A
	db $05, $06
	db $01, $02
Chainsaw_VMir2:
	db $02
	db $05
	db $95
	db $15, $16
	db $0F, $10
	db $0B, $0C
	db $07, $08
	db $03, $04
Chainsaw_VMir3:
	db $02
	db $05
	db $95
	db $15, $16
	db $11, $12
	db $0B, $0C
	db $07, $08
	db $03, $04

Rope1:
	db $02
	db $0A
	db $95
	db $1B, $1C
	db $13, $14
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
Rope2:
	db $02
	db $0A
	db $95
	db $17, $18
	db $15, $16
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
Rope3:
	db $02
	db $0A
	db $95
	db $19, $1A
	db $15, $16
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
LongRope1:
	db $02
	db $11
	db $95
	db $1B, $1C
	db $13, $14
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
LongRope2:
	db $02
	db $11
	db $95
	db $17, $18
	db $15, $16
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
LongRope3:
	db $02
	db $11
	db $95
	db $19, $1A
	db $15, $16
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1E, $FF
	db $1F, $FF
OnOffSwitch_Off:
	db $02
	db $02
	db $A4
	db $2E, $2F
	db $30, $31
OnOffSwitch_On:
	db $02
	db $02
	db $A4
	db $2A, $2B
	db $2C, $2D
RedPlatform:
	db $06
	db $02
	db $A4
	db $39, $3A, $3A, $3A, $3A, $3B
	db $3C, $3D, $3D, $3D, $3D, $3E
GreenPlatform:
	db $05
	db $02
	db $A4
	db $24, $25, $25, $25, $26
	db $27, $28, $28, $28, $29
FuzzySpr:
	db $03
	db $02
	db $A4
	db $01, $02, $FF
	db $0B, $0C, $0D
FuzzySpr2:
	db $03
	db $02
	db $A4
	db $03, $04, $FF
	db $0E, $0C, $0F
FenceKoopa:
	db $02
	db $04
	db $94
	db $14, $15
	db $20, $21
	db $2F, $30
	db $3B, $3C
SpikeTop_Walk1:
	db $02
	db $02
	db $97
	db $2C, $2D
	db $32, $33
SpikeTop_Walk2:
	db $02
	db $02
	db $97
	db $2E, $2F
	db $34, $35
SpikeTop_SideWalk1:
	db $02
	db $02
	db $97
	db $38, $39
	db $3C, $3D
SpikeTop_SideWalk2:
	db $02
	db $02
	db $97
	db $3A, $3B
	db $3E, $3F
; Unused--->
SpikeTop_Diag:
	db $02
	db $02
	db $97
	db $30, $31
	db $36, $37
; <---
SpikeTop_Walk1_VMir:
	db $02
	db $02
	db $97
	db $32, $33
	db $2C, $2D
SpikeTop_Walk2_VMir:
	db $02
	db $02
	db $97
	db $34, $35
	db $2E, $2F
SpikeTop_SideWalk1_VMir:
	db $02
	db $02
	db $97
	db $3C, $3D
	db $38, $39
SpikeTop_SideWalk2_VMir:
	db $02
	db $02
	db $97
	db $3E, $3F
	db $3A, $3B
; Unused--->
SpikeTop_Diag_VMir:
	db $02
	db $02
	db $97
	db $36, $37
	db $30, $31
; <---
ofs2_8261:
	db $04
	db $05
	db $B6
	db $80
	db $81
	db $82
	db $83
	db $8B
	db $8C
	db $8D
	db $8E
	db $99
	db $9A
	db $9B
	db $9C
	db $A7
	db $A8
	db $A9
	db $AA
	db $B2
	db $B3
	db $B3
	db $B4
ofs2_8278:
	db $04
	db $05
	db $B6
	db $84
	db $85
	db $86
	db $FF
	db $8F
	db $90
	db $91
	db $92
	db $9D
	db $9E
	db $9F
	db $A0
	db $AB
	db $AC
	db $AD
	db $AA
	db $B2
	db $B3
	db $B3
	db $B4
ofs2_828F:
	db $04
	db $05
	db $B6
	db $87
	db $88
	db $89
	db $8A
	db $93
	db $94
	db $95
	db $96
	db $A1
	db $A2
	db $A3
	db $A4
	db $AE
	db $AF
	db $B0
	db $B1
	db $B2
	db $B3
	db $B3
	db $B4
ofs2_82A6:
	db $02
	db $02
	db $B6
	db $97
	db $98
	db $A5
	db $A6
ofs2_82AD:
	db $02
	db $02
	db $B6
	db $A5
	db $A6
	db $97
	db $98
ofs2_82B4:
	db $04
	db $01
	db $B6
	db $B2
	db $B3
	db $B3
	db $B4
ofs2_82BB:
	db $04
	db $04
	db $B6
	db $80
	db $81
	db $82
	db $83
	db $8B
	db $8C
	db $8D
	db $8E
	db $99
	db $9A
	db $9B
	db $9C
	db $A7
	db $A8
	db $A9
	db $AA
Obj_h78:
	JSR sub5_82EC
	LDA frameCount
	AND #$00
	BNE bra5_82DC
	LDA #$2C
	JSR jmp_54_B11D
bra5_82DC:
	LDY #$03
	LDA objFrameCount
	AND #$04
	BEQ bra5_82E7
	LDY #$C4
bra5_82E7:
	TYA
	STA enemyAnimFrame,X
	RTS
sub5_82EC:
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
	BEQ bra5_830E
	CMP #$FF
	BEQ bra5_830E
	JMP Obj_RemoveObject
bra5_830E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc5_8350
	LDA objYDistHi,X
	BPL bra5_833F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8350
bra5_833F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc5_8350:
	LDA freezeFlag
	BEQ bra5_8356
	RTS
bra5_8356:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_836A,Y
	STA $32
	LDA tbl5_836A+1,Y
	STA $33
	JMP ($32)
tbl5_836A:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr10_8372
ptr10_8372:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
Obj_h77:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8397
	CMP #$FF
	BEQ bra5_8397
	JMP Obj_RemoveObject
bra5_8397:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_83D9
	LDA objYDistHi,X
	BPL bra5_83C8
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_83D9
bra5_83C8:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_83D9:
loc5_83D9:
	LDA freezeFlag
	BEQ bra5_83DF
	RTS
bra5_83DF:
	LDA objVar,X
	BPL bra5_844D
	LDA #$00
	STA reznorsDefeated
	STA objVar,X
	LDY objCount
	INC objCount
	INC objCount
	LDA #$18
	STA objVar,Y
	LDA #$40
	STA $0641,Y
	LDA #$0C
	STA $0579,Y
	LDA #$80
	STA $0642,Y
	LDA objXHi,X
	STA objXHi,Y
	STA objXHi+1,Y
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	LDA objXLo,X
	CLC
	ADC #$27
	STA objXLo,Y
	LDA objXLo,X
	SEC
	SBC #$2A
	STA objXLo+1,Y
	LDA objYLo,X
	CLC
	ADC #$45
	STA objYLo,Y
	STA objYLo+1,Y
	LDA #$77
	STA objSlot,Y
	STA objSlot+1,Y
	LDA #$00
	STA objState,Y
	STA objState+1,Y
	STA objAction,Y
	STA objAction+1,Y
	RTS
bra5_844D:
	JSR sub5_85C6
	LDA objAction,X
	ASL
	TAY
	LDA tbl5_8462,Y
	STA $32
	LDA tbl5_8462+1,Y
	STA $33
	JMP ($32)
tbl5_8462:
	dw ptr10_8470
	dw ptr10_8494
	dw ptr10_84B5
	dw ptr10_84E7
	dw ptr10_851D
	dw ptr10_8553
	dw ptr10_8564
ptr10_8470:
	LDA frameCount
	AND #$07
	BNE bra5_847B
	LDA #$2B
	JSR jmp_54_B470
bra5_847B:
	JSR sub5_8580
	LDA #$68
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BPL bra5_8493_RTS
	LDA #$00
	STA $0641,X
	INC objAction,X
	INC objAction,X
bra5_8493_RTS:
	RTS
ptr10_8494:
	LDA frameCount
	AND #$07
	BNE bra5_849F
	LDA #$2B
	JSR jmp_54_B470
bra5_849F:
	JSR sub5_8580
	LDA #$28
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra5_84B4_RTS
	LDA #$00
	STA $0641,X
	INC objAction,X
bra5_84B4_RTS:
	RTS
ptr10_84B5:
	LDA frameCount
	AND #$07
	BNE bra5_84C0
	LDA #$2B
	JSR jmp_54_B470
bra5_84C0:
	LDA #$02
	STA enemyAnimFrame,X
	LDA $0641,X
	CMP #$20
	BCS bra5_84D0
	INC $0641,X
	RTS
bra5_84D0:
	LDA objXDistHi,X
	BMI bra5_84DE
	LDA #$00
	STA objAction,X
	STA $0641,X
	RTS
bra5_84DE:
	LDA #$00
	STA $0641,X
	DEC objAction,X
	RTS
ptr10_84E7:
	LDA frameCount
	AND #$07
	BNE bra5_84F2
	LDA #$2B
	JSR jmp_54_B470
bra5_84F2:
	LDA #$41
	STA enemyAnimFrame,X
	INC $0641,X
	LDA $0641,X
	CMP #$20
	BEQ bra5_8514
	CMP #$40
	BCC bra5_8513_RTS
	LDA #$00
	STA $0641,X
	DEC objAction,X
	DEC objAction,X
	DEC objAction,X
bra5_8513_RTS:
	RTS
bra5_8514:
	JSR sub5_8599
	LDA #$40
	STA objState,Y
	RTS
ptr10_851D:
	LDA frameCount
	AND #$07
	BNE bra5_8528
	LDA #$2B
	JSR jmp_54_B470
bra5_8528:
	LDA #$01
	STA enemyAnimFrame,X
	INC $0641,X
	LDA $0641,X
	CMP #$20
	BEQ bra5_854A
	CMP #$40
	BCC bra5_854E_RTS
	LDA #$00
	STA $0641,X
	DEC objAction,X
	DEC objAction,X
	DEC objAction,X
bra5_854E_RTS:
	RTS
bra5_854A:
	JSR sub5_8599
	LDA #$00
	STA objState,Y
	RTS
ptr10_8553:
	LDA frameCount
	AND #$07
	BNE bra5_855E
	LDA #$2B
	JSR jmp_54_B470
bra5_855E:
	LDA #$05
	STA enemyAnimFrame,X
	RTS
ptr10_8564:
	LDA #$06
	STA enemyAnimFrame,X
	LDA reznorsDefeated
	CMP #$03
	BCC bra5_857F_RTS
	LDA objYLo,X
	CMP #$B0
	BCC bra5_857F_RTS
	LDA #$23
	STA sndMusic
	LDA #$09
	STA gameState
bra5_857F_RTS:
	RTS
sub5_8580:
	INC $0641,X
	LDA $0641,X
	CMP #$E0
	BCC bra5_8598_RTS
	LDA #$00
	STA $0641,X
	INC objAction,X
	INC objAction,X
	INC objAction,X
bra5_8598_RTS:
	RTS
sub5_8599:
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$78
	STA objSlot,Y
	LDA #$00
	STA objVar,Y
	STA $0641,Y
	STA objAction,Y
	RTS
sub5_85C6:
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
	BEQ bra5_85E8
	CMP #$FF
	BEQ bra5_85E8
	JMP Obj_RemoveObject
bra5_85E8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_862A
	LDA objYDistHi,X
	BPL bra5_8619
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_862A
bra5_8619:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_862A:
loc5_862A:
	LDA freezeFlag
	BEQ bra5_8630
	RTS
bra5_8630:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8644,Y
	STA $32
	LDA tbl5_8644+1,Y
	STA $33
	JMP ($32)
tbl5_8644:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr10_864E
	dw Obj_FlipKill
ptr10_864E:
	LDX $A4
	LDA objAction,X
	CMP #$05
	BCS bra5_86BC_RTS
	JSR sub5_86BD
	JSR sub5_86C6
	LDA playerMoveFlags
	AND #$04
	BEQ bra5_86BC_RTS
	LDA #$F7
	STA invincibilityTimer
	LDA playerMoveFlags
	AND #$FB
	STA playerMoveFlags
	LDA #$30
	STA playerYSpd
	LDA #$0F
	STA sndSfx
	LDA #$05
	STA objAction,X
	LDA #$00
	STA $0641,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYLo,X
	CLC
	ADC #$20
	STA objYLo,X
	LDA objXHi,X
	STA objXHi,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$77
	STA objSlot,Y
	LDA #$04
	STA objState,Y
	LDA #$00
	STA objVar,Y
	LDA #$06
	STA objAction,Y
	INC reznorsDefeated
bra5_86BC_RTS:
	RTS
sub5_86BD:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	PLA
	PLA
	RTS
sub5_86C6:
	LDA objXDistHi,X
	BPL bra5_86D8
	LDA #$08
	CLC
	ADC #$20
	CLC
	ADC objXDistLo,X
	BCS bra5_86DF
	BCC bra5_86FF
bra5_86D8:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_86FF
bra5_86DF:
	LDA objYDistHi,X
	BEQ bra5_86F5
	CMP #$FF
	BNE bra5_86FF
	LDA #$10
	CLC
	ADC #$28
	CLC
	ADC objYDistLo,X
	BCS bra5_86FC
	BCC bra5_86FF
bra5_86F5:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_86FF
bra5_86FC:
	CLC
	BCC bra5_8700
bra5_86FF:
	SEC
bra5_8700:
	BCC bra5_870C_RTS
	LDA objState,X
	AND #$E0
	STA objState,X
	PLA
	PLA
bra5_870C_RTS:
	RTS
Obj_h4A:
	LDX $A4
	LDA objVar,X
	BPL bra5_8786
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8730
	CMP #$FF
	BEQ bra5_8730
	JMP Obj_RemoveObject
bra5_8730:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8772
	LDA objYDistHi,X
	BPL bra5_8761
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8772
bra5_8761:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8772:
loc5_8772:
	LDA freezeFlag
	BEQ bra5_8778
	RTS
bra5_8778:
	LDA #$00
	STA objAction,X
	JSR Obj_FacePlayer
	LDA #$47
	STA enemyAnimFrame,X
	RTS
bra5_8786:
	JSR sub5_8A0D
	LDX $A4
	LDA objAction,X
	ASL
	TAY
	LDA tbl5_879D,Y
	STA $32
	LDA tbl5_879D+1,Y
	STA $33
	JMP ($32)
tbl5_879D:
	dw ptr10_87A5
	dw ptr10_8814
	dw ptr10_8889
	dw ptr10_88FA
ptr10_87A5:
	LDA enemyAnimFrame,X
	AND #$4F
	STA enemyAnimFrame,X
	LDA objState,X
	AND #$40
	BNE bra5_87E4
	LDA #$02
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$11
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$01
	STA objAction,X
	RTS
bra5_87D0:
	LDA #$0E
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_87E1
	LDA #$03
	STA objAction,X
	RTS
bra5_87E1:
	JMP loc5_89D4
bra5_87E4:
	LDA #$0E
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$FF
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$03
	STA objAction,X
	RTS
bra5_8800:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_8811
	LDA #$01
	STA objAction,X
	RTS
bra5_8811:
	JMP loc5_89B2
ptr10_8814:
	LDA enemyAnimFrame,X
	AND #$CF
	ORA #$40
	STA enemyAnimFrame,X
	LDA objState,X
	AND #$40
	BNE bra5_8855
	LDA #$FB
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$FB
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$02
	STA objAction,X
	RTS
bra5_8841:
	LDA #$08
	STA $36
	LDA #$10
	JSR sub3_B7A2
	BEQ bra5_8852
	LDA #$00
	STA objAction,X
	RTS
bra5_8852:
	JMP loc5_898B
bra5_8855:
	LDA #$FB
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$FB
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$00
	STA objAction,X
	RTS
bra5_8871:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8886
	LDA #$0E
	STA sndSfx
	LDA #$02
	STA objAction,X
	RTS
bra5_8886:
	JMP loc5_8969
ptr10_8889:
	LDA enemyAnimFrame,X
	AND #$CF
	ORA #$80
	STA enemyAnimFrame,X
	LDA objState,X
	AND #$40
	BNE bra5_88CA
	LDA #$10
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$FF
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$03
	STA objAction,X
	RTS
bra5_88B6:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88C7
	LDA #$01
	STA objAction,X
	RTS
bra5_88C7:
	JMP loc5_89B2
bra5_88CA:
	LDA #$00
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$0F
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$01
	STA objAction,X
	RTS
bra5_88E6:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88F7
	LDA #$03
	STA objAction,X
	RTS
bra5_88F7:
	JMP loc5_89D4
ptr10_88FA:
	LDA enemyAnimFrame,X
	AND #$8F
	STA enemyAnimFrame,X
	LDA objState,X
	AND #$40
	BNE bra5_8939
	LDA #$14
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$14
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$00
	STA objAction,X
	RTS
bra5_8925:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8936
	LDA #$02
	STA objAction,X
	RTS
bra5_8936:
	JMP loc5_8969
bra5_8939:
	LDA #$14
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$14
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$02
	STA objAction,X
	RTS
bra5_8955:
	LDA #$08
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BEQ bra5_8966
	LDA #$00
	STA objAction,X
	RTS
bra5_8966:
	JMP loc5_898B
loc5_8969:
	LDA objFrameCount
	AND #$01
	BNE bra5_8981
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
bra5_8981:
	LDY #$09
	LDA enemyAnimFrame,X
	AND #$40
	JMP loc5_89AC
loc5_898B:
	LDA objFrameCount
	AND #$01
	BNE bra5_89A3
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
bra5_89A3:
	LDY #$0E
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$80
loc5_89AC:
	STA enemyAnimFrame,X
	JMP loc5_89FD
loc5_89B2:
	LDA objFrameCount
	AND #$01
	BNE bra5_89CA
	LDA objXLo,X
	SEC
	SBC #$01
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
bra5_89CA:
	LDA enemyAnimFrame,X
	AND #$80
	ORA #$40
	JMP loc5_89F1
loc5_89D4:
	LDA objFrameCount
	AND #$01
	BNE bra5_89EC
	LDA objXLo,X
	CLC
	ADC #$01
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
bra5_89EC:
	LDA enemyAnimFrame,X
	AND #$80
loc5_89F1:
	STA enemyAnimFrame,X
	LDY #$07
	LDA objAction,X
	BEQ bra5_89FD
	LDY #$0C
bra5_89FD:
loc5_89FD:
	LDA objFrameCount
	AND #$04
	BEQ bra5_8A05
	INY
bra5_8A05:
	TYA
	ORA enemyAnimFrame,X
	STA enemyAnimFrame,X
	RTS
sub5_8A0D:
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
	BEQ bra5_8A2F
	CMP #$FF
	BEQ bra5_8A2F
	JMP Obj_RemoveObject
bra5_8A2F:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8A71
	LDA objYDistHi,X
	BPL bra5_8A60
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8A71
bra5_8A60:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8A71:
loc5_8A71:
	LDA freezeFlag
	BEQ bra5_8A77
	RTS
bra5_8A77:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8A8B,Y
	STA $32
	LDA tbl5_8A8B+1,Y
	STA $33
	JMP ($32)
tbl5_8A8B:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr10_8A95
	dw Obj_FlipKill
ptr10_8A95:
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
Obj_h4E:
	LDX $A4
	LDA objVar,X
	BMI bra5_8AA9
	JMP loc5_8B21
bra5_8AA9:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8AC5
	CMP #$FF
	BEQ bra5_8AC5
	JMP Obj_RemoveObject
bra5_8AC5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8B07
	LDA objYDistHi,X
	BPL bra5_8AF6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8B07
bra5_8AF6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8B07:
loc5_8B07:
	LDA freezeFlag
	BEQ bra5_8B0D
	RTS
bra5_8B0D:
	LDA objVar,X
	CMP #$80
	BNE bra5_8B1D
	JSR Obj_FacePlayer
	LDA #$11
	STA enemyAnimFrame,X
	RTS
bra5_8B1D:
	JSR sub_54_B4FC
	RTS
loc5_8B21:
	JSR sub5_8C27
	LDA objSlot,X
	CMP #$50
	BCS bra5_8B83
	LDA objState,X
	AND #$40
	BNE bra5_8B59
	LDA #$18
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B48
	LDA objState,X
	ORA #$40
	STA objState,X
	RTS
bra5_8B48:
	LDA objXLo,X
	CLC
	ADC #$01
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	JMP loc5_8B7D
bra5_8B59:
	LDA #$F8
	STA $36
	LDA #$18
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8B6F
	LDA objState,X
	AND #$BF
	STA objState,X
	RTS
bra5_8B6F:
	LDA objXLo,X
	SEC
	SBC #$01
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
loc5_8B7D:
	STA objXHi,X
	JMP loc5_8C17
bra5_8B83:
	LDA objState,X
	AND #$80
	BNE bra5_8BD2
	LDA #$08
	STA $36
	LDA #$28
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BA0
	LDA objState,X
	ORA #$80
	STA objState,X
	RTS
bra5_8BA0:
	LDA #$01
	BMI bra5_8BBD
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BB1
	CMP #$F0
	BCC bra5_8BCF
bra5_8BB1:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc5_8BCF
bra5_8BBD:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BCF
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra5_8BCF:
loc5_8BCF:
	JMP loc5_8C17
bra5_8BD2:
	LDA #$08
	STA $36
	LDA #$00
	JSR sub3_B7A2
	CMP #$02
	BEQ bra5_8BE8
	LDA objState,X
	AND #$7F
	STA objState,X
	RTS
bra5_8BE8:
	LDA #$FF
	BMI bra5_8C05
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8BF9
	CMP #$F0
	BCC bra5_8C17
bra5_8BF9:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc5_8C17
bra5_8C05:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra5_8C17
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra5_8C17:
loc5_8C17:
	LDA objFrameCount
	AND #$07
	BNE bra5_8C26_RTS
	LDA enemyAnimFrame,X
	EOR #$40
	STA enemyAnimFrame,X
bra5_8C26_RTS:
	RTS
sub5_8C27:
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
	BEQ bra5_8C49
	CMP #$FF
	BEQ bra5_8C49
	JMP Obj_RemoveObject
bra5_8C49:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8C8B
	LDA objYDistHi,X
	BPL bra5_8C7A
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8C8B
bra5_8C7A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8C8B:
loc5_8C8B:
	LDA freezeFlag
	BEQ bra5_8C91
	RTS ; unlogged
bra5_8C91:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8CA5,Y
	STA $32
	LDA tbl5_8CA5+1,Y
	STA $33
	JMP ($32)
tbl5_8CA5:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr10_8CAF
	dw Obj_FlipKill
ptr10_8CAF:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	LDA #SFX_ENEMYHIT2
	STA sndSfx
	LDA #$01
	JSR RewardPoints
	LDX $A4
	LDA #$81
	STA objVar,X
	LDA playerState
	CMP #$03
	BEQ bra5_8CDE
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
bra5_8CDE:
	PLA
	PLA
	RTS
Obj_h76:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8CFF
	CMP #$FF
	BEQ bra5_8CFF
	JMP Obj_RemoveObject
bra5_8CFF:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8D41
	LDA objYDistHi,X
	BPL bra5_8D30
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8D41
bra5_8D30:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8D41:
loc5_8D41:
	LDA freezeFlag
	BEQ bra5_8D47
	RTS
bra5_8D47:
	LDA objVar,X
	BPL bra5_8D5A
	LDA #$00
	STA objVar,X
	STA switchBlockFlag
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra5_8D5A:
	JSR sub5_8D67
	LDA switchBlockFlag
	CLC
	ADC #$57
	STA enemyAnimFrame,X
	RTS
sub5_8D67:
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
	BEQ bra5_8D89
	CMP #$FF
	BEQ bra5_8D89
	JMP Obj_RemoveObject
bra5_8D89:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8DCB
	LDA objYDistHi,X
	BPL bra5_8DBA
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8DCB
bra5_8DBA:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8DCB:
loc5_8DCB:
	LDA freezeFlag
	BEQ bra5_8DD1
	RTS
bra5_8DD1:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8DE5,Y
	STA $32
	LDA tbl5_8DE5+1,Y
	STA $33
	JMP ($32)
tbl5_8DE5:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr10_8DED
ptr10_8DED:
	LDA objXDistHi,X
	BPL bra5_8DFF
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_8E06
	BCC bra5_8E26
bra5_8DFF:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_8E26
bra5_8E06:
	LDA objYDistHi,X
	BEQ bra5_8E1C
	CMP #$FF
	BNE bra5_8E26
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_8E23
	BCC bra5_8E26
bra5_8E1C:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_8E26
bra5_8E23:
	CLC
	BCC bra5_8E27
bra5_8E26:
	SEC
bra5_8E27:
	BCC bra5_8E32
	LDA objState,X
	AND #$E0
	STA objState,X
	RTS
bra5_8E32:
	LDA playerMoveFlags
	AND #$04
	BEQ bra5_8E4E_RTS
	LDA switchBlockFlag
	EOR #$01
	STA switchBlockFlag
	LDA playerMoveFlags
	AND #$FB
	STA playerMoveFlags
	LDA #$20
	STA playerYSpd
	LDA #$16
	STA sndSfx
bra5_8E4E_RTS:
	RTS
Obj_h54:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8E6D
	CMP #$FF
	BEQ bra5_8E6D
	JMP Obj_RemoveObject
bra5_8E6D:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8EAF
	LDA objYDistHi,X
	BPL bra5_8E9E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8EAF
bra5_8E9E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8EAF:
loc5_8EAF:
	LDA freezeFlag
	BEQ bra5_8EB5
	RTS
bra5_8EB5:
	LDA objVar,X
	BMI bra5_8EBD
	JMP loc5_8F3F
bra5_8EBD:
	JSR Obj_FacePlayer
	LDA objSlot,X
	CMP #$55
	BCC bra5_8EEB
	CMP #$56
	BEQ bra5_8F25
	CMP #$57
	BCC bra5_8F0D
	BEQ bra5_8EE2
	LDA objXLo,X
	SEC
	SBC #$08
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
bra5_8EE2:
	LDA objYLo,X
	SEC
	SBC #$08
	JMP loc5_8F02
bra5_8EEB:
	LDA objXLo,X
	SEC
	SBC #$07
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$04
loc5_8F02:
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
bra5_8F0D:
	LDY objSlot,X
	CPY #$57
	BNE bra5_8F18
	LDY #$54
	BNE bra5_8F1E
bra5_8F18:
	CPY #$79
	BNE bra5_8F1E
	LDY #$57
bra5_8F1E:
	DEY
	DEY
	TYA
	STA enemyAnimFrame,X
	RTS
bra5_8F25:
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	JMP loc5_8F02
loc5_8F3F:
	LDY objSlot,X
	CPY #$79
	BEQ bra5_8F7E
	CPY #$57
	BNE bra5_8F4C
	LDY #$54
bra5_8F4C:
	DEY
	DEY
	TYA
	STA enemyAnimFrame,X
	LDA $058C,X
	LSR
	SEC
	SBC #$01
	TAY
	LDA tbl5_9263,Y
	CMP #$FF
	BNE bra5_8F62
	RTS
bra5_8F62:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$DA
	LDA objSlot,X
	CMP #$58
	BCS bra5_8F78
	SEC
	SBC #$54
	TAY
	LDA tbl5_8FA5,Y
	TAY
bra5_8F78:
	STY $25
	JSR sub5_93A8
	RTS
bra5_8F7E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$18
	TAY
	LDA tbl5_9297,Y
	CMP #$FF
	BNE bra5_8F91
	RTS
bra5_8F91:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$55
	LDA objFrameCount
	AND #$10
	BEQ bra5_8FA0
	INY
bra5_8FA0:
	TYA
	STA enemyAnimFrame,X
	RTS
tbl5_8FA5:
	db $CA
	db $CA
	db $D6
	db $CA
Obj_h5C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8FC7
	CMP #$FF
	BEQ bra5_8FC7
	JMP Obj_RemoveObject
bra5_8FC7:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc5_9009
	LDA objYDistHi,X
	BPL bra5_8FF8
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_9009
bra5_8FF8:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X

loc5_9009:
	LDA freezeFlag
	BEQ bra5_900F
	RTS
bra5_900F:
	LDA objVar,X
	BPL bra5_902C
	JSR Obj_FacePlayer
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056
	RTS
bra5_902C:
	LDA objFrameCount
	AND #$07
	BNE bra5_9037
	LDA #$1D
	STA sndSfx
bra5_9037:
	JSR sub5_92D7
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_904A
	RTS
bra5_904A:
	ASL
	TAY
	JSR jmp_54_B896
	JSR sub5_9522
	JSR sub5_9056
	RTS
sub5_9056:
	LDA objSlot,X
	AND #$FE
	CMP #$60
	BNE bra5_9063
	LDA #$E2
	BNE bra5_9074
bra5_9063:
	LDA objSlot,X
	AND #$FE
	SEC
	SBC #$5A
	STA $32
	LSR
	CLC
	ADC $32
	CLC
	ADC #$59
bra5_9074:
	STA $32
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA tbl5_9089,Y
	CLC
	ADC $32
	STA enemyAnimFrame,X
	RTS
tbl5_9089:
	db $00
	db $01
	db $00
	db $02
Obj_h5A:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_90AB
	CMP #$FF
	BEQ bra5_90AB
	JMP Obj_RemoveObject
bra5_90AB:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_90ED
	LDA objYDistHi,X
	BPL bra5_90DC
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_90ED
bra5_90DC:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_90ED:
loc5_90ED:
	LDA freezeFlag
	BEQ bra5_90F3
	RTS
bra5_90F3:
	LDA objVar,X
	BPL bra5_913D
	LDA objSlot,X
	CMP #$62
	BCS bra5_9117
	JSR Obj_FacePlayer
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056
	RTS
bra5_9117:
	LDA objXLo,X
	SEC
	SBC #$A0
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056
	RTS
bra5_913D:
	LDA objFrameCount
	AND #$07
	BNE bra5_9148
	LDA #SFX_CUTTER
	STA sndSfx
bra5_9148:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_915B
	RTS
bra5_915B:
	ASL
	TAY
	JSR jmp_54_B896
	JSR sub5_9056
	RTS

;----------------------------------------
; P-SWITCH GENERATED OBJECTS CODE ($9164)
;----------------------------------------
Obj_h66:
	LDX $A4 ; Get object index
	objDistCalc bra5_91CA

bra5_91CA:
	LDA pSwitchTimer
	BNE bra5_91D5 ; Branch if timer is still running
		LDA #$00
		STA enemyAnimFrame,X ; Make platform invisible if the P-Switch Timer runs out
		RTS

bra5_91D5:
	INC $067C ; Unused timer
	LDA objSlot,X
	CMP #OBJ_PDOOR
	BCS bra5_91F2 ; Branch if object is a P-Door
		LDA #OBJ_PSWITCHPLATFORM+3
		STA enemyAnimFrame,X ; Use turn block platform sprite if this object isn't a P-Door
		LDA #$00
		STA $28
		STA $2B
		LDA #$CA
		STA $25
		JSR sub5_93A8
		RTS

bra5_91F2:
	LDA #$6A
	STA enemyAnimFrame,X ; Use P-door sprite
	LDA objXDistHi,X
	BPL bra5_9209
	LDA #$00
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9210
	BCC bra5_9230
bra5_9209:
	LDA objXDistLo,X
	CMP #$00
	BCS bra5_9230
bra5_9210:
	LDA objYDistHi,X
	BEQ bra5_9226
	CMP #$FF
	BNE bra5_9230
	LDA #$14
	CLC
	ADC #$20
	CLC
	ADC objYDistLo,X
	BCS bra5_922D
	BCC bra5_9230
bra5_9226:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9230
bra5_922D:
	CLC
	BCC bra5_9231
bra5_9230:
	SEC
bra5_9231:
	BCS bra5_9262_RTS
	LDA $1E
	CMP #$08
	BNE bra5_9262_RTS
	LDA prgDataBank2
	CMP #$23
	BEQ bra5_9262_RTS
	LDA $1E
	CMP #$08
	BNE bra5_9262_RTS
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	ASL
	STA warpLvlNumber
	LDA #$03
	STA gameState
	LDA #$7E
	SEC
	SBC #$78
	ASL
	ASL
	ASL
	STA warpNumber
bra5_9262_RTS:
	RTS

tbl5_9263:
	db $26
	db $01
	db $26
	db $05
	db $03
	db $04
	db $05
	db $05
	db $06
	db $05
	db $05
	db $05
	db $06
	db $0B
	db $0C
	db $0D
	db $21
	db $21
	db $21
	db $21
	db $21
	db $22
	db $23
	db $23
	db $24
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $3E
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
tbl5_9297:
	db $07
	db $08
	db $09
	db $0A
	db $27
	db $28
	db $29
	db $2A
	db $2B
	db $2C
	db $2D
	db $2E
	db $2F
	db $30
	db $31
	db $32
	db $33
	db $34
	db $35
	db $FF
	db $2C
	db $2D
	db $2E
	db $2F
	db $30
	db $31
	db $32
	db $33
	db $41
	db $41
	db $41
	db $41
tbl5_92B7:
	db $0E
	db $0F
	db $10
	db $17
	db $17
	db $18
	db $18
	db $19
	db $19
	db $18
	db $1A
	db $FF
	db $FF
	db $FF
	db $1B
	db $1C
	db $1D
	db $1E
	db $1F
	db $20
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
sub5_92D7:
	LDA playerYoshiState
	BNE bra5_92E1_RTS
	LDA playerHoldFlag
	BEQ bra5_92E2
bra5_92E1_RTS:
	RTS
bra5_92E2:
	LDA $06DC
	BEQ bra5_9329
	LDA objXDistHi,X
	BPL bra5_92F9
	LDA #$05
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9300
	BCC bra5_9320
bra5_92F9:
	LDA objXDistLo,X
	CMP #$05
	BCS bra5_9320
bra5_9300:
	LDA objYDistHi,X
	BEQ bra5_9316
	CMP #$FF
	BNE bra5_9320
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_931D
	BCC bra5_9320
bra5_9316:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9320
bra5_931D:
	CLC
	BCC bra5_9321
bra5_9320:
	SEC
bra5_9321:
	BCS bra5_9329
	LDA #$01
	STA $06DD
	RTS
bra5_9329:
	LDY #$50
	LDA objSlot,X
	CMP #$5E
	BCC bra5_9334
	LDY #$88
bra5_9334:
	STY $38
	LDA objXDistHi,X
	BPL bra5_9348
	LDA #$04
	CLC
	ADC #$04
	CLC
	ADC objXDistLo,X
	BCS bra5_934F
	BCC bra5_936F
bra5_9348:
	LDA objXDistLo,X
	CMP #$00
	BCS bra5_936F
bra5_934F:
	LDA objYDistHi,X
	BEQ bra5_9365
	CMP #$FF
	BNE bra5_936F
	LDA #$10
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra5_936C
	BCC bra5_936F
bra5_9365:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_936F
bra5_936C:
	CLC
	BCC bra5_9370
bra5_936F:
	SEC
bra5_9370:
	BCS bra5_9395
	LDA $1E
	CMP #$0D
	BEQ bra5_9394_RTS
	CMP #$0E
	BEQ bra5_9394_RTS
	LDA btnHeld
	AND #$08
	BEQ bra5_9394_RTS
	LDA #$00
	STA playerYSpd
	STA playerXSpd
	LDA #$03
	STA playerState
	STA $06DC
	LDA #$0D
	STA playerAction
bra5_9394_RTS:
	RTS
bra5_9395:
	LDA $1E
	CMP #$0D
	BEQ bra5_939F
	CMP #$0E
	BNE bra5_93A7_RTS
bra5_939F:
	LDA #$00
	STA playerState
	LDA #$0A
	STA playerAction
bra5_93A7_RTS:
	RTS

sub5_93A8:
	LDX $A4
	LDA objState,X
	BMI bra5_93B2
	JMP loc5_94B2
bra5_93B2:
	LDA playerXLoDup
	CLC
	ADC $28
	STA playerXLoDup
	LDA $28
	BMI bra5_93C4
	LDA playerXHiDup
	ADC #$00
	JMP loc5_93C8
bra5_93C4:
	LDA playerXHiDup
	SBC #$00
loc5_93C8:
	STA playerXHiDup
	LDA $2B
	BMI bra5_93E3
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS bra5_93D9
	CMP #$F0
	BCC loc5_93FF
bra5_93D9:
	CLC
	ADC #$10
	STA playerYLoDup
	INC playerYHiDup
	JMP loc5_93FF
bra5_93E3:
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS loc5_93FF
	SEC
	SBC #$10
	STA playerYLoDup
	DEC playerYHiDup
	LDY vertScrollLock
	CPY playerYHiDup
	BNE loc5_93FF
	INY
	STY playerYHiDup
	LDA #$00
	STA playerYLoDup
loc5_93FF:
	objDistCalc bra5_9463

bra5_9463:
	LDA #$00
	STA objState,X
	LDA objXDistHi,X
	BEQ bra5_947A
	CMP #$FF
	BNE bra5_9481_RTS
	LDA objXDistLo,X
	CMP $25
	BCC bra5_9481_RTS
	BCS bra5_9482
bra5_947A:
	LDA objXDistLo,X
	CMP #$05
	BCC bra5_9482
bra5_9481_RTS:
	RTS
bra5_9482:
	LDA playerMoveFlags
	AND #$04
	BNE bra5_94A1_RTS
	LDA objYDistHi,X
	BNE bra5_9496
	LDA objYDistLo,X
	CMP #$08
	BCC bra5_94A2
	BCS bra5_94A1_RTS
bra5_9496:
	CMP #$FF
	BNE bra5_94A1_RTS
	LDA objYDistLo,X
	CMP #$FA
	BCS bra5_94A2
bra5_94A1_RTS:
	RTS
bra5_94A2:
	LDA #$00
	STA playerYSpd
	STA objYDistLo,X
	STA objYDistHi,X
	LDA #$80
	STA objState,X
	RTS
loc5_94B2:
	LDA objXDistHi,X
	BEQ bra5_94C4
	CMP #$FF
	BNE bra5_94CB_RTS
	LDA objXDistLo,X
	CMP $25
	BCC bra5_94CB_RTS
	BCS bra5_94CC
bra5_94C4:
	LDA objXDistLo,X
	CMP #$05
	BCC bra5_94CC
bra5_94CB_RTS:
	RTS
bra5_94CC:
	LDA playerMoveFlags
	AND #$04
	BNE bra5_94EB_RTS
	LDA objYDistHi,X
	BNE bra5_94E0
	LDA objYDistLo,X
	CMP #$08
	BCC bra5_94EC
	BCS bra5_94EB_RTS
bra5_94E0:
	CMP #$FF
	BNE bra5_94EB_RTS
	LDA objYDistLo,X
	CMP #$FA
	BCS bra5_94EC
bra5_94EB_RTS:
	RTS
bra5_94EC:
	LDA #$00
	STA playerYSpd
	STA objYDistLo,X
	STA objYDistHi,X
	LDA objYLo,X
	STA playerYLoDup
	LDA objYHi,X
	STA playerYHiDup
	LDY vertScrollLock
	CPY playerYHiDup
	BNE bra5_950E
	INY
	STY playerYHiDup
	LDA #$00
	STA playerYLoDup
bra5_950E:
	LDA #$00
	STA objYDistLo,X
	STA objYDistHi,X
	LDA #$80
	STA objState,X
	LDA #$01
	STA playerAction
	STA playerYSpd
	RTS
sub5_9522:
	LDA playerState
	CMP #$03
	BEQ bra5_9529
	RTS
bra5_9529:
	LDA #$00
	STA playerXSpd
	LDA playerXLoDup
	CLC
	ADC $28
	STA playerXLoDup
	LDA $28
	BMI bra5_953F
	LDA playerXHiDup
	ADC #$00
	JMP loc5_9543
bra5_953F:
	LDA playerXHiDup
	SBC #$00
loc5_9543:
	STA playerXHiDup
	LDA $2B
	BMI bra5_955E
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS bra5_9554
	CMP #$F0
	BCC bra5_957A
bra5_9554:
	CLC
	ADC #$10
	STA playerYLoDup
	INC playerYHiDup
	JMP loc5_957A
bra5_955E:
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS bra5_957A
	SEC
	SBC #$10
	STA playerYLoDup
	DEC playerYHiDup
	LDY vertScrollLock
	CPY playerYHiDup
	BNE bra5_957A
	INY
	STY playerYHiDup
	LDA #$00
	STA playerYLoDup
bra5_957A:
loc5_957A:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_9596
	CMP #$FF
	BEQ bra5_9596
	JMP Obj_RemoveObject
bra5_9596:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_95D8
	LDA objYDistHi,X
	BPL bra5_95C7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_95D8
bra5_95C7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_95D8:
loc5_95D8:
	LDA freezeFlag
	BEQ bra5_95DE_RTS
	RTS
bra5_95DE_RTS:
	RTS
Obj_h7E:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_95FD
	CMP #$FF
	BEQ bra5_95FD
	JMP Obj_RemoveObject
bra5_95FD:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_963F
	LDA objYDistHi,X
	BPL bra5_962E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_963F
bra5_962E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_963F:
loc5_963F:
	LDA freezeFlag
	BEQ bra5_9645
	RTS
bra5_9645:
	LDA objVar,X
	BPL bra5_964E
	JSR Obj_FacePlayer
	RTS
bra5_964E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$24
	TAY
	LDA tbl5_9667,Y
	CMP #$FF
	BNE bra5_9661
	RTS
bra5_9661:
	ASL
	TAY
	JSR jmp_54_B896
	RTS
tbl5_9667:
	db $3A
	db $3B
	db $3C
	db $3D
	db $3C
	db $3C
	db $3B
	db $3B
	db $3D
ptr6_9670:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra5_967C
	INY
bra5_967C:
	TYA
	ASL
	TAX
	LDA tbl5_96A1,X
	STA $32
	LDA tbl5_96A1+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_9696
	LDY #$C0
bra5_9696:
	STY $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_96A1:
	dw WallUrchin1
	dw WallUrchin2
WallUrchin1:
	db $04
	db $04
	db $A8
	db $09, $0A, $0B, $0C
	db $0D, $0E, $0F, $10
	db $13, $14, $15, $16
	db $19, $1A, $1B, $1C
WallUrchin2:
	db $04
	db $04
	db $A8
	db $09, $0A, $0B, $0C
	db $0D, $11, $12, $10
	db $13, $17, $18, $16
	db $19, $1A, $1B, $1C
ptr6_96CB:
	LDX $A4
	LDA enemyAnimFrame,X
	ASL
	TAX
	LDA tbl5_96EB,X
	STA $32
	LDA tbl5_96EB+1,X
	STA $33
	LDA #$80
	STA $36
	LDX $A4
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl5_96EB:
	dw GrassPlatform1
	dw GrassPlatform2
	dw GrassPlatform3
	dw GrassPlatform4
	dw GrassPlatform5
GrassPlatform1:
	db $04
	db $02
	db $CE
	db $9A
	db $9B
	db $9E
	db $9F
	db $9C
	db $9D
	db $A0
	db $A1
GrassPlatform2:
	db $04
	db $02
	db $CE
	db $9A
	db $A2
	db $A3
	db $9F
	db $9C
	db $A4
	db $A5
	db $A1
GrassPlatform3:
	db $04
	db $02
	db $CE
	db $9A
	db $AD
	db $AE
	db $9F
	db $9C
	db $AF
	db $B0
	db $A1
GrassPlatform4:
	db $04
	db $02
	db $CE
	db $9A
	db $B1
	db $B2
	db $9F
	db $9C
	db $B3
	db $B4
	db $A1
GrassPlatform5:
	db $04
	db $02
	db $CE
	db $9A
	db $B5
	db $B6
	db $9F
	db $9C
	db $B7
	db $B8
	db $A1
Obj_hFA:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_974A
	CMP #$FF
	BEQ bra5_974A
	JMP Obj_RemoveObject
bra5_974A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_978C
	LDA objYDistHi,X
	BPL bra5_977B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_978C
bra5_977B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_978C:
loc5_978C:
	LDA freezeFlag
	BEQ bra5_9792
	RTS
bra5_9792:
	LDA objVar,X
	BMI bra5_979A
	JMP loc5_97D3
bra5_979A:
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	SEC
	SBC #$08
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	LDY #$01
	LDA objSlot,X
	AND #$FE
	CMP #$FE
	BNE bra5_97CE
	LDY #$04
bra5_97CE:
	TYA
	STA enemyAnimFrame,X
	RTS
loc5_97D3:
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_97F0,Y
	CMP #$FF
	BNE bra5_97E3
	RTS
bra5_97E3:
	ASL
	TAY
	JSR jmp_54_B896
	LDA #$DA
	STA $25
	JSR sub5_93A8
	RTS
tbl5_97F0:
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
Obj_hED:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_982F
	CMP #$FF
	BEQ bra5_982F
	JMP Obj_RemoveObject
bra5_982F:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_9871
	LDA objYDistHi,X
	BPL bra5_9860
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_9871
bra5_9860:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_9871:
loc5_9871:
	LDA freezeFlag
	BEQ bra5_9877
	RTS
bra5_9877:
	LDA objVar,X
	BPL bra5_98A4
	LDA #$00
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
	ADC #$08
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
	RTS
bra5_98A4:
	LDA gameState
	CMP #$02
	BNE bra5_9920_RTS
	LDA objXDistHi,X
	BPL bra5_98BC
	LDA #$00
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_98C3
	BCC bra5_98E3
bra5_98BC:
	LDA objXDistLo,X
	CMP #$00
	BCS bra5_98E3
bra5_98C3:
	LDA objYDistHi,X
	BEQ bra5_98D9
	CMP #$FF
	BNE bra5_98E3
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_98E0
	BCC bra5_98E3
bra5_98D9:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_98E3
bra5_98E0:
	CLC
	BCC bra5_98E4
bra5_98E3:
	SEC
bra5_98E4:
	BCS bra5_9920_RTS
	LDA objSlot,X
	CMP #$F0
	BEQ bra5_98F6
	CMP #$F1
	BEQ bra5_98F6
	LDA playerYoshiState
	BNE bra5_9920_RTS
bra5_98F6:
	LDY #$06
	LDA playerMoveFlags
	AND #$40
	BEQ bra5_9900
	LDY #$0A
bra5_9900:
	STY $25
	LDA objSlot,X
	SEC
	SBC #$EF
	TAY
	LDA objSlot,X
	CMP #$F5
	BEQ bra5_9940
	CMP #$EF
	BNE bra5_9921
	LDA #$01
	STA $06E9
	LDA btnHeld
	AND #$08
	BNE bra5_992C
bra5_9920_RTS:
	RTS
bra5_9921:
	LDA #$00
	STA $06E9
	LDA $1E
	CMP #$07
	BNE bra5_9920_RTS
bra5_992C:
	LDA objXLo,X
	CLC
	ADC $25
	STA playerXLoDup
	LDA objXHi,X
	ADC #$00
	STA playerXHiDup
	LDA #$20
	STA $06E0
bra5_9940:
	LDA tbl5_994A,Y
	STA gameState
	LDA #$00
	STA gameSubstate
	RTS
tbl5_994A:
	db $13
	db $0F
	db $11
	db $FF
	db $FF
	db $0B
	db $0D
ptr6_9951:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra5_9971
	LDY #$C0
bra5_9971:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR sub_52_ADAF
	RTS
tbl5_997F:
	dw ofs_9989 ; Bonus ? Block
	dw ofs_9990
	dw ofs_9997
	dw ofs_999E
	dw ofs_99A5
ofs_9989:
	db $02
	db $02
	db $CC
	db $00
	db $01
	db $02
	db $03
ofs_9990:
	db $02
	db $02
	db $CC
	db $04
	db $05
	db $06
	db $07
ofs_9997:
	db $02
	db $02
	db $CC
	db $08
	db $09
	db $0A
	db $0B
ofs_999E:
	db $02
	db $02
	db $CC
	db $0C
	db $0D
	db $0E
	db $0F
ofs_99A5:
	db $02
	db $02
	db $90
	db $27
	db $28
	db $29
	db $2A
Obj_hE7:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_99CA
	CMP #$FF
	BEQ bra5_99CA
	JMP Obj_RemoveObject
bra5_99CA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_9A0C
	LDA objYDistHi,X
	BPL bra5_99FB
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_9A0C
bra5_99FB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_9A0C:
loc5_9A0C:
	LDA freezeFlag
	BEQ bra5_9A12
	RTS
bra5_9A12:
	LDA #$03
	STA enemyAnimFrame,X
	LDA objAction,X
	ASL
	TAY
	LDA tbl5_9A29,Y
	STA $32
	LDA tbl5_9A29+1,Y
	STA $33
	JMP ($32)
tbl5_9A29:
	dw ptr10_9A2D
	dw ptr10_9A45
ptr10_9A2D:
	LDA frameCount
	AND #$00
	BNE bra5_9A38
	LDA #$49
	JSR jmp_54_B470
bra5_9A38:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BNE bra5_9A44_RTS
	INC objAction,X
bra5_9A44_RTS:
	RTS
ptr10_9A45:
	LDA #$00
	STA objSlot,X
	RTS
Obj_hE8:
	LDX $A4 ; Get index for current object?
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Calculate horizontal distance between the player and the object
	STA $28
	BEQ bra5_9A69
	CMP #$FF
	BEQ bra5_9A69
	JMP Obj_RemoveObject
bra5_9A69:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X ; Calculate vertical distance between the player and the object
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_9AAB
	LDA objYDistHi,X
	BPL bra5_9A9A
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_9AAB
bra5_9A9A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_9AAB:
loc5_9AAB:
	LDA freezeFlag
	BEQ bra5_9AB1
	RTS
bra5_9AB1:
	LDA objAction,X
	ASL
	TAY ; Get pointer for current action
	LDA tbl5_9AC3,Y
	STA $32 ; Load lower byte
	LDA tbl5_9AC3+1,Y
	STA $33 ; Load upper byte
	JMP ($32) ; Jump to loaded pointer
tbl5_9AC3:
	dw ptr10_9AD1
	dw ptr10_9B30
	dw ptr10_9B48
	dw ptr10_9B6C
	dw ptr10_9B8B
	dw ptr10_9B8C
	dw ptr10_9BEC
ptr10_9AD1:
	LDA #$40
	STA enemyAnimFrame,X
	LDY #$22
	LDA playerPowerup
	BNE bra5_9AE4 ; Branch ahead if the player has no powerup
	LDA playerYoshiState
	BNE bra5_9AE4 ; Branch ahead if the player is riding Yoshi
	LDY #$18
bra5_9AE4:
	STY $25
	LDA objXDistHi,X
	BPL bra5_9AF8
	LDA #$06
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9AFF
	BCC bra5_9B1F
bra5_9AF8:
	LDA objXDistLo,X
	CMP #$06
	BCS bra5_9B1F
bra5_9AFF:
	LDA objYDistHi,X
	BEQ bra5_9B15
	CMP #$FF
	BNE bra5_9B1F
	LDA $25
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_9B1C
	BCC bra5_9B1F
bra5_9B15:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9B1F
bra5_9B1C:
	CLC
	BCC bra5_9B20
bra5_9B1F:
	SEC
bra5_9B20:
	BCS bra5_9B2F_RTS
	LDA playerYSpd
	BEQ bra5_9B2F_RTS
	LDA playerMoveFlags
	AND #$04
	BEQ bra5_9B2F_RTS
	INC objAction,X
bra5_9B2F_RTS:
	RTS
ptr10_9B30:
	LDA frameCount
	AND #$00
	BNE bra5_9B3B
	LDA #$48
	JSR jmp_54_B470
bra5_9B3B:
	LDA objVar,X
	AND #$0F
	CMP #$09
	BNE bra5_9B47_RTS
	INC objAction,X
bra5_9B47_RTS:
	RTS
ptr10_9B48:
	LDA $06EA
	BMI bra5_9B68
	LDA objSlot,X
	SEC
	SBC #$EA
	TAY
	LDA $06EA,Y
	CMP #$02
	BEQ bra5_9B62
	JSR jmp_54_B785
	AND #$01
	BNE bra5_9B68
bra5_9B62:
	INC objAction,X
	INC objAction,X
bra5_9B68:
	INC objAction,X
	RTS
ptr10_9B6C:
	LDA objSlot,X
	STA $25
	LDY #$FF
bra5_9B73:
	INY
	LDA objSlot,Y
	CMP $25
	BNE bra5_9B87
	LDA objAction,Y
	CMP #$05
	BCS bra5_9B87
	LDA #$00
	STA objSlot,Y
bra5_9B87:
	CPY objCount
	BCC bra5_9B73
ptr10_9B8B:
	RTS
ptr10_9B8C:
	LDA objSlot,X
	SEC
	SBC #$EA
	TAY
	LDA $06EA,Y
	CLC
	ADC #$01
	STA $06EA,Y
	STA $25
	LDA #$01
	STA enemyAnimFrame,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$00
	STA objAction,Y
	STA objState,Y
	LDA #$80
	STA objVar,Y
	LDA $25
	CMP #$03
	BNE bra5_9BDA
	LDA #SFX_BLOCKRELEASE
	STA sndSfx ; Play block release sound
	LDA #$E8
	BNE bra5_9BE5 ; Spawn 1UP
bra5_9BDA:
	LDA #$00
	JSR RewardPoints ; Give the player 100 points
	LDA #SFX_COIN
	STA sndSfx ; Play coin sound
	LDA #$E9 ; Spawn coin sprite
bra5_9BE5:
	STA objSlot,Y ; Store sprite in memory
	INC objAction,X
	RTS
ptr10_9BEC:
	RTS
ptr6_9BED:
	LDA #$04
	ASL
	TAX
	LDA tbl5_997F,X
	STA $32
	LDA tbl5_997F+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$20
	STA $05F0
	STA $06E1
	JSR sub_52_ADAF
	LDA #$00
	STA $06E1
	RTS
Obj_hE6:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_9C2E
	CMP #$FF
	BEQ bra5_9C2E
	JMP Obj_RemoveObject
bra5_9C2E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_9C70
	LDA objYDistHi,X
	BPL bra5_9C5F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_9C70
bra5_9C5F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_9C70:
loc5_9C70:
	LDA freezeFlag
	BEQ bra5_9C76
	RTS
bra5_9C76:
	LDA objAction,X
	BNE bra5_9C9B
	LDA frameCount
	AND #$00
	BNE bra5_9C86
	LDA #$4A
	JSR jmp_54_B470
bra5_9C86:
	LDA objVar,X
	AND #$1F
	CMP #$0F
	BCC bra5_9C9A_RTS
	INC objAction,X
	LDA #$00
	STA objVar,X
	STA objState,X
bra5_9C9A_RTS:
	RTS
bra5_9C9B:
	LDA frameCount
	AND #$00
	BNE bra5_9CA6
	LDA #$0B
	JSR GetMovementData
bra5_9CA6:
	LDA objXDistHi,X
	BPL bra5_9CB8
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9CBF
	BCC bra5_9CDF
bra5_9CB8:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_9CDF
bra5_9CBF:
	LDA objYDistHi,X
	BEQ bra5_9CD5
	CMP #$FF
	BNE bra5_9CDF
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_9CDC
	BCC bra5_9CDF
bra5_9CD5:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9CDF
bra5_9CDC:
	CLC
	BCC bra5_9CE0
bra5_9CDF:
	SEC
bra5_9CE0:
	BCS bra5_9CF3_RTS
	INC playerLives
	LDA #$07
	STA sndSfx
	LDA #$00
	STA objSlot,X
	LDA #$03
	JSR RewardPoints
bra5_9CF3_RTS:
	RTS
	db $01
	db $00
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FF
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $00
	db $01
	db $00
	db $01
	db $02
	db $01
	db $02
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
	db $80
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
	db $02
	db $81
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
	db $FE
	db $81
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
