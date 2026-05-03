.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

sub_8E78:
	LDA $06E3
	BMI bra_8E96
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E8A
	CMP #$F0
	BCC bra_8EA8
bra_8E8A:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8EA8
bra_8E96:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8EA8
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra_8EA8:
loc_8EA8:
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8EBD
	LDA objXHi,X
	ADC #$00
	BPL bra_8EC2
bra_8EBD:
	LDA objXHi,X
	SBC #$00
bra_8EC2:
	STA objXHi,X
	LDA #$00
	STA $06E2
	STA $06E3
	RTS
.export ptr6_8ECE
ptr6_8ECE:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8EFC,X
	STA $32
	LDA tbl_8EFC+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8EEE
	LDY #$C0
bra_8EEE:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	JSR jmp_54_A118
	RTS
.export tbl_8EFC
tbl_8EFC:
	.word ofs_8F00
	.word ofs_8F17
ofs_8F00:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
ofs_8F17:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CE
	.byte $CF
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
.export ptr6_8F2E
ptr6_8F2E:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl_8F66,X
	STA $32
	LDA tbl_8F66+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8F4E
	LDY #$C0
bra_8F4E:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	STA $05F0
	LDA #$00
	STA $06E1
	JSR jmp_54_A118
	LDA #$20
	STA $06E1
	RTS
.export tbl_8F66
tbl_8F66:
	.word ofs_8F76
	.word ofs_8F82
	.word ofs_8F8E
	.word ofs_8F9A
	.word ofs_8FA6
	.word ofs_8FB2
	.word ofs_8FBE
	.word ofs_8FCA
ofs_8F76:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C2
	.byte $C3
	.byte $C4
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $DD
	.byte $DE
	.byte $DF
ofs_8F82:
	.byte $03
	.byte $03
	.byte $E1
	.byte $51
	.byte $52
	.byte $53
	.byte $5E
	.byte $5F
	.byte $60
	.byte $FF
	.byte $6C
	.byte $6D
ofs_8F8E:
	.byte $03
	.byte $03
	.byte $E1
	.byte $54
	.byte $55
	.byte $FF
	.byte $61
	.byte $62
	.byte $63
	.byte $FF
	.byte $6E
	.byte $6F
ofs_8F9A:
	.byte $03
	.byte $03
	.byte $E3
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C5
ofs_8FA6:
	.byte $03
	.byte $03
	.byte $E3
	.byte $DD
	.byte $DE
	.byte $DF
	.byte $D0
	.byte $D1
	.byte $D2
	.byte $C2
	.byte $C3
	.byte $C4
ofs_8FB2:
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6C
	.byte $6D
	.byte $5E
	.byte $5F
	.byte $60
	.byte $51
	.byte $52
	.byte $53
ofs_8FBE:
	.byte $03
	.byte $03
	.byte $E1
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $61
	.byte $62
	.byte $63
	.byte $54
	.byte $55
	.byte $FF
ofs_8FCA:
	.byte $03
	.byte $03
	.byte $E3
	.byte $FF
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $C5
	.byte $FF
	.byte $C5
	.byte $FF
	.byte $FF
.export obj0xBA
obj0xBA:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8FF4
	CMP #$FF
	BEQ bra_8FF4
	JMP objRemoveObject
bra_8FF4:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_9036
	LDA objYDistHi,X
	BPL bra_9025
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_9036
bra_9025:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_9036:
loc_9036:
	LDA freezeFlag
	BEQ bra_903C
	RTS
bra_903C:
	LDA objState,X
	CLC
	ADC #$50
	STA $25
	LDA frameCount
	AND #$00
	BNE bra_904F
	LDA $25
	JSR parseMovementData
bra_904F:
	LDX $A4
	LDA objVar,X
	CMP #$0C
	BCC bra_907C_RTS
	LDA objFrameCount
	AND #$07
	BNE bra_907C_RTS
	LDA enemyAnimFrame,X
	AND #$03
	CMP #$03
	BCS bra_906C
	INC enemyAnimFrame,X
	RTS
bra_906C:
	LDA objState,X
	BNE bra_9074
	INC bowserState
bra_9074:
	LDA #$00
	STA objSlot,X
	STA $05F6
bra_907C_RTS:
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
	BEQ bra_909B
	CMP #$FF
	BEQ bra_909B
	JMP objRemoveObject
bra_909B:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_90DD
	LDA objYDistHi,X
	BPL bra_90CC
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_90DD
bra_90CC:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_90DD:
loc_90DD:
	LDA freezeFlag
	BEQ bra_90E3_RTS
	RTS
bra_90E3_RTS:
	RTS
.export obj0xDF
obj0xDF:
	LDX $A4
	JSR sub_8E78
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_9105
	CMP #$FF
	BEQ bra_9105
	JMP objRemoveObject
bra_9105:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_9147
	LDA objYDistHi,X
	BPL bra_9136
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_9147
bra_9136:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_9147:
loc_9147:
	LDA freezeFlag
	BEQ bra_914D
	RTS
bra_914D:
	JSR sub_9159
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	RTS
sub_9159:
	LDX $A4
	LDA bowserState
	ASL
	TAY
	LDA tbl_916D,Y
	STA $32
	LDA tbl_916D+1,Y
	STA $33
	JMP ($32)
.export tbl_916D
tbl_916D:
	.word ptr7_91DA
	.word ptr7_91F7
	.word ptr7_9238
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_9336
	.word ptr7_9372
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_94F6
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_955F
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_956A
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_95D8
	.word ptr7_95E3
	.word ptr7_95E3
	.word ptr7_970C
	.word ptr7_93B9
	.word ptr7_9763
sub_91B5:
	LDA objFlags,X
	AND #$1F
	CMP #$04
	BNE bra_91D9_RTS
	LDA #$06
	STA bowserState
	LDA #$00
	STA $05F6
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	LDA objXLo,X
	SEC
	SBC #$04
	STA objXLo,X
bra_91D9_RTS:
	RTS
.export ptr7_91DA
ptr7_91DA:
	LDA #$01
	STA $06E3
	LDA #$04
	STA enemyAnimFrame,X
	INC $05F6
	LDA $05F6
	CMP #$70
	BCC bra_91F6_RTS
	LDA #$00
	STA $05F6
	INC bowserState
bra_91F6_RTS:
	RTS
.export ptr7_91F7
ptr7_91F7:
	LDA objFrameCount
	AND #$07
	BNE bra_921C_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_921D
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_921C_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_921C_RTS:
	RTS
bra_921D:
	LDA #$00
	STA $05F6
	INC bowserState
	LDA #$37
	STA yoshiXLo
	LDA #$38
	STA yoshiXHi
	RTS
.export tbl_9230
tbl_9230:
	.byte $04
	.byte $0A
	.byte $09
	.byte $08
	.byte $07
	.byte $06
	.byte $05
	.byte $FF
.export ptr7_9238
ptr7_9238:
	JSR sub_91B5
	LDA yoshiXLo
	ASL
	TAY
	JSR jmp_54_B896
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9260_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9260_RTS:
	RTS
.export tbl_9261
tbl_9261:
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $07
	.byte $06
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
.export ptr7_9271
ptr7_9271:
	LDA objFrameCount
	AND #$07
	BNE bra_9296_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_92A8,Y
	CMP #$FF
	BEQ bra_9297
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9296_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9296_RTS:
	RTS
bra_9297:
	LDA #$00
	STA $05F6
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	INC bowserState
	RTS
.export tbl_92A8
tbl_92A8:
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $04
	.byte $FF
.export ptr7_92B0
ptr7_92B0:
	INC $05F6
	LDA $05F6
	CMP #$01
	BNE bra_9329
	LDY #$FF
bra_92BC:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_92C8
	CMP #$42
	BCC bra_92F8
bra_92C8:
	CPY objCount
	BCC bra_92BC
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
	STA objFlags,Y
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
bra_92F8:
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
	LDA #$40
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
	RTS
bra_9329:
	CMP #$30
	BCC bra_9335_RTS
	LDA #$00
	STA $05F6
	INC bowserState
bra_9335_RTS:
	RTS
.export ptr7_9336
ptr7_9336:
	LDA objFrameCount
	AND #$07
	BNE bra_935B_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_935C
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_935B_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_935B_RTS:
	RTS
bra_935C:
	LDA #$00
	STA $05F6
	LDA #$02
	STA bowserState
	LDA yoshiXHi
	EOR #$01
	STA yoshiXHi
	STA yoshiXLo
	RTS
.export ptr7_9372
ptr7_9372:
	INC $05F6
	LDA $05F6
	CMP #$70
	BNE bra_939B
	LDA #$00
	STA $05F6
	INC bowserHitCount
	LDY bowserHitCount
	LDA tbl_93AF,Y
	STA bowserState
	CMP #$1F
	BEQ bra_939A_RTS
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
bra_939A_RTS:
	RTS
bra_939B:
	LDY #$0B
	LDA objFrameCount
	AND #$10
	BNE bra_93A5
	INY
bra_93A5:
	TYA
	STA enemyAnimFrame,X
	LDA #$02
	STA clownCarFace
	RTS
.export tbl_93AF
tbl_93AF:
	.byte $00 ; phase if no hits
	.byte $02 ; phase after 1 or 2 hits
	.byte $02
	.byte $07 ; phase after 3 hits
	.byte $0E ; phase after 4 or 5 hits 
	.byte $0E
	.byte $13 ; phase after 6 hits
	.byte $1A ; phase after 7 or 8 hits
	.byte $1A
	.byte $1F
.export ptr7_93B9
ptr7_93B9:
	LDA #$FF
	STA $06E3
	LDA objYLo,X
	CMP #$90
	BNE bra_93C8_RTS
	INC bowserState
bra_93C8_RTS:
	RTS
.export ptr7_93C9
ptr7_93C9:
	LDA #$01
	STA $06E2
	LDA objXLo,X
	CMP #$C0
	BNE bra_93D8_RTS
	INC bowserState
bra_93D8_RTS:
	RTS
.export ptr7_93D9
ptr7_93D9:
	INC bowserState
	LDA #$00
	STA $05F6
.export obj0xB8
obj0xB8:
	STA objState,X
	STA objStateTimer,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,X
	RTS
.export ptr7_93FD
ptr7_93FD:
	INC $05F6
	LDA $05F6
	CMP #$08
	BCS bra_9410
	DEC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_9410:
	CMP #$10
	BCS bra_941D
	DEC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_941D:
	CMP #$18
	BCS bra_942A
	DEC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_942A:
	CMP #$70
	BNE bra_9464
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$BF
	STA objSlot,Y
	LDA #$00
	STA objState,Y
	LDA #$80
	STA objVar,Y
	LDA #$40
	STA objFlags,Y
	RTS
bra_9464:
	CMP #$D0
	BCS bra_9477
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	CLC
	ADC #$51
	STA enemyAnimFrame,X
	RTS
bra_9477:
	CMP #$D8
	BCS bra_9484
	INC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_9484:
	CMP #$E0
	BCS bra_9491
	INC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_9491:
	CMP #$E8
	BCS bra_949E
	INC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_949E:
	INC bowserState
	LDA #$04
	STA enemyAnimFrame,X
	LDA #$00
	STA $05F6
	STA objState,X
	STA objStateTimer,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	SEC
	SBC #$19
	STA objYLo,X
	RTS
.export ptr7_94C7
ptr7_94C7:
	LDA objFrameCount
	AND #$07
	BNE bra_94EC_RTS
	INC $05F6
	LDA $05F6
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_94ED
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_94EC_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_94EC_RTS:
	RTS
bra_94ED:
	LDA #$00
	STA $05F6
	INC bowserState
	RTS
.export ptr7_94F6
ptr7_94F6:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_9506
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_9506:
	LDA frameCount
	AND #$01
	BNE bra_9511
	LDA #$4D
	JSR jmp_54_B11D
bra_9511:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA objXLo,X
	CMP #$40
	BCC bra_955E_RTS
	CMP #$50
	BCC bra_9545
	CMP #$A0
	BCC bra_955E_RTS
	CMP #$B0
	BCS bra_955E_RTS
bra_9545:
	INC $05F6
	LDA $05F6
	CMP #$50
	BCC bra_955E_RTS
	JSR updateRng
	AND #$03
	BNE bra_955E_RTS
	INC bowserState
	LDA #$00
	STA $05F6
bra_955E_RTS:
	RTS
.export ptr7_955F
ptr7_955F:
	LDA #$0E
	STA bowserState
	LDA #$00
	STA $05F6
	RTS
.export ptr7_956A
ptr7_956A:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_957A
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_957A:
	LDA frameCount
	AND #$01
	BNE bra_9585
	LDA #$4E
	JSR jmp_54_B11D
bra_9585:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA #$03
	STA clownCarFace
	LDA objXLo,X
	CMP #$40
	BCC bra_95D7_RTS
	CMP #$50
	BCC bra_95BE
	CMP #$A0
	BCC bra_95D7_RTS
	CMP #$B0
	BCS bra_95D7_RTS
bra_95BE:
	INC $05F6
	LDA $05F6
	CMP #$50
	BCC bra_95D7_RTS
	JSR updateRng
	AND #$03
	BNE bra_95D7_RTS
	INC bowserState
	LDA #$00
	STA $05F6
bra_95D7_RTS:
	RTS
.export ptr7_95D8
ptr7_95D8:
	LDA #$1A
	STA bowserState
	LDA #$00
	STA $05F6
	RTS
.export ptr7_95E3
ptr7_95E3:
	LDA #$02
	STA clownCarFace
	LDA $05F6
	BNE bra_9612
	INC $05F6
	LDA #$18
	STA enemyAnimFrame,X
	LDY #$FF
bra_95F7:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_960D
	CMP #$42
	BCS bra_960D
	LDA #playerXLoDup
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
bra_960D:
	CPY objCount
	BCC bra_95F7
	RTS
bra_9612:
	CMP #$01
	BEQ bra_9619
	JMP loc_970B_RTS
bra_9619:
	LDA #$10
	STA sndSfx
	INC $05F6
	LDY objCount
	INC objCount
	INC objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$00
	STA objVar,Y
	LDA #$BC
	STA objSlot,Y
	LDA #$C4
	STA enemyAnimFrame,Y
	LDA #$00
	STA objState,Y
	STA objFlags,Y
	LDA objXLo,X
	STA objXLo+1,Y
	LDA objXHi,X
	STA objXHi+1,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+1,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+1,Y
	LDA #$00
	STA objVar+1,Y
	LDA #$BC
	STA objSlot+1,Y
	LDA #$40
	STA enemyAnimFrame+1,Y
	LDA #$01
	STA objState+1,Y
	LDA #$00
	STA objFlags+1,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+2,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+2,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo+2,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+2,Y
	LDA #$00
	STA $057A,Y
	LDA #$BC
	STA objSlot+2,Y
	LDA #$84
	STA enemyAnimFrame+2,Y
	LDA #$02
	STA objState+2,Y
	LDA #$00
	STA objFlags+2,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+3,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+3,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+3,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+3,Y
	LDA #$00
	STA objVar+3,Y
	LDA #$BC
	STA objSlot+3,Y
	LDA #$00
	STA enemyAnimFrame+3,Y
	LDA #$03
	STA objState+3,Y
	LDA #$00
	STA objFlags+3,Y
	RTS
loc_970B_RTS:
	RTS
.export ptr7_970C
ptr7_970C:
	LDA $05F6
	BNE bra_9762_RTS
	INC $05F6
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
	ADC #$28
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$B8
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
	STA objVar,Y
	STA objState,Y
	STA enemyAnimFrame,Y
	LDA #$01
	STA $06E6
	LDY #$41
	LDA objXDistHi,X
	BMI bra_975B
	LDY #$00
bra_975B:
	STY playerMoveFlags
	LDA #MUS_ENDING
	STA sndMusic
	RTS
bra_9762_RTS:
	RTS
.export ptr7_9763
ptr7_9763:
	RTS
.export obj0xB6
obj0xB6:
	LDX $A4
	objDistCalc bra_97CA

bra_97CA:
	LDA objState,X
	ASL
	TAY
	LDA tbl_97DC,Y
	STA $32
	LDA tbl_97DC+1,Y
	STA $33
	JMP ($32)
.export tbl_97DC
tbl_97DC:
	.word ptr7_97E2
	.word ptr7_9811
	.word ptr7_9840
.export ptr7_97E2
ptr7_97E2:
	LDA objFrameCount
	AND #$03
	BNE bra_97F6_RTS
	LDA objVar,X
	CMP #$28
	BCC bra_97F7
	INC objState,X
	INC bowserState
bra_97F6_RTS:
	RTS
bra_97F7:
	INC objVar,X
	LDA #$20
	STA $06E1
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	RTS
.export ptr7_9811
ptr7_9811:
	LDY #$00
	LDA objYLo,X
	CMP #$A0
	BCS bra_983C
	CMP #$90
	BCC bra_9820
	LDY #$20
bra_9820:
	STY $06E1
	LDA objFrameCount
	AND #$03
	BNE bra_983B_RTS
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
bra_983B_RTS:
	RTS
bra_983C:
	INC objState,X
	RTS
.export ptr7_9840
ptr7_9840:
	LDA #$09
	STA gameState
	LDA objXDistHi,X
	BPL bra_9852
	LDA objXDistLo,X
	CMP #$E8
	BCC bra_9859
	BCS bra_9862
bra_9852:
	LDA objXDistLo,X
	CMP #$01
	BCC bra_9862
bra_9859:
	LDA #$10
	STA playerXSpd
	LDA #$01
	STA playerAction
	RTS
bra_9862:
	LDA #$00
	STA playerXSpd
	STA playerAction
	RTS
	.byte $34
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BE
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $08
	.byte $45
	.byte $49
	.byte $52
	.byte $10
	.byte $52
	.byte $52
	.byte $52
	.byte $54
	.byte $FF
	.byte $04
	.byte $06
	.byte $4F
	.byte $51
	.byte $53
	.byte $10
	.byte $11
	.byte $14
	.byte $18
	.byte $1A
	.byte $1C
	.byte $5C
	.byte $5E
	.byte $60
	.byte $02
	.byte $27
	.byte $28
	.byte $2C
	.byte $2E
	.byte $30
	.byte $34
	.byte $37
	.byte $3B
	.byte $3F
	.byte $43
	.byte $47
	.byte $4B
	.byte $FF
	.byte $9A
	.byte $FF
	.byte $9F
	.byte $A8
	.byte $A8
	.byte $71
	.byte $75
	.byte $A8
	.byte $FF
	.byte $89
	.byte $8A
	.byte $89
	.byte $8F
	.byte $91
	.byte $95
	.byte $97
	.byte $FF
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6D
	.byte $66
	.byte $77
	.byte $7B
	.byte $A8
	.byte $FF
	.byte $FF
	.byte $A1
	.byte $A3
	.byte $91
	.byte $2A
	.byte $2E
	.byte $2E
	.byte $AD
	.byte $FF
	.byte $A8
	.byte $66
	.byte $66
	.byte $66
	.byte $7C
	.byte $88
	.byte $A8
	.byte $A8
	.byte $FF
	.byte $AA
	.byte $C9
	.byte $B0
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $68
	.byte $66
	.byte $66
	.byte $66
	.byte $82
	.byte $7C
	.byte $A8
	.byte $32
	.byte $AD
	.byte $AB
	.byte $AB
	.byte $AB
	.byte $B0
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $FF
	.byte $BC
	.byte $BF
	.byte $B5
	.byte $91
	.byte $B5
	.byte $32
	.byte $B2
	.byte $AD
	.byte $32
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BF
	.byte $BA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $4F
	.byte $47
	.byte $4B
	.byte $53
	.byte $0A
	.byte $53
	.byte $53
	.byte $53
	.byte $10
	.byte $FF
	.byte $4D
	.byte $4E
	.byte $09
	.byte $0B
	.byte $0D
	.byte $0E
	.byte $56
	.byte $13
	.byte $17
	.byte $59
	.byte $5B
	.byte $1F
	.byte $21
	.byte $23
	.byte $01
	.byte $25
	.byte $63
	.byte $2B
	.byte $2F
	.byte $2F
	.byte $33
	.byte $38
	.byte $3A
	.byte $3E
	.byte $42
	.byte $46
	.byte $4A
	.byte $FF
	.byte $91
	.byte $9C
	.byte $9E
	.byte $A8
	.byte $A8
	.byte $6F
	.byte $73
	.byte $79
	.byte $FF
	.byte $8B
	.byte $8B
	.byte $8E
	.byte $90
	.byte $93
	.byte $91
	.byte $91
	.byte $99
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6B
	.byte $66
	.byte $66
	.byte $7C
	.byte $7D
	.byte $FF
	.byte $FF
	.byte $A8
	.byte $A8
	.byte $A6
	.byte $B0
	.byte $2D
	.byte $2F
	.byte $31
	.byte $FF
	.byte $A8
	.byte $69
	.byte $66
	.byte $66
	.byte $7F
	.byte $7C
	.byte $A8
	.byte $A9
	.byte $FF
	.byte $AB
	.byte $AE
	.byte $AF
	.byte $AD
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $65
	.byte $66
	.byte $66
	.byte $66
	.byte $81
	.byte $84
	.byte $85
	.byte $B1
	.byte $35
	.byte $AF
	.byte $AC
	.byte $AD
	.byte $AC
	.byte $AC
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $B8
	.byte $B5
	.byte $B5
	.byte $C1
	.byte $C3
	.byte $C5
	.byte $B0
	.byte $35
	.byte $35
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $09
	.byte $46
	.byte $4A
	.byte $0D
	.byte $0F
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $FF
	.byte $64
	.byte $07
	.byte $50
	.byte $0C
	.byte $0D
	.byte $0F
	.byte $12
	.byte $15
	.byte $58
	.byte $5A
	.byte $1D
	.byte $5D
	.byte $22
	.byte $24
	.byte $03
	.byte $26
	.byte $29
	.byte $2D
	.byte $2F
	.byte $31
	.byte $35
	.byte $38
	.byte $3C
	.byte $40
	.byte $44
	.byte $48
	.byte $4C
	.byte $FF
	.byte $91
	.byte $9D
	.byte $9F
	.byte $A8
	.byte $6E
	.byte $70
	.byte $76
	.byte $7A
	.byte $FF
	.byte $8B
	.byte $8C
	.byte $8B
	.byte $91
	.byte $91
	.byte $91
	.byte $98
	.byte $FF
	.byte $91
	.byte $A8
	.byte $A8
	.byte $6C
	.byte $66
	.byte $78
	.byte $7C
	.byte $A8
	.byte $FF
	.byte $FF
	.byte $A8
	.byte $A7
	.byte $A5
	.byte $2B
	.byte $2F
	.byte $2F
	.byte $AE
	.byte $FF
	.byte $A8
	.byte $66
	.byte $66
	.byte $66
	.byte $7C
	.byte $87
	.byte $A8
	.byte $A8
	.byte $FF
	.byte $C8
	.byte $AF
	.byte $B1
	.byte $AB
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $66
	.byte $66
	.byte $66
	.byte $66
	.byte $83
	.byte $84
	.byte $A8
	.byte $33
	.byte $AE
	.byte $AF
	.byte $AB
	.byte $AB
	.byte $B0
	.byte $B0
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $B9
	.byte $BD
	.byte $B5
	.byte $B5
	.byte $91
	.byte $B5
	.byte $33
	.byte $AD
	.byte $AD
	.byte $33
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B5
	.byte $FF
	.byte $C6
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $50
	.byte $48
	.byte $4C
	.byte $0D
	.byte $0B
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0F
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $AA
	.byte $AA
	.byte $AA
	.byte $AA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $55
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $78
