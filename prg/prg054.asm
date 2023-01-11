;disassembled by BZK 6502 Disassembler
jmp_54_A000:
	LDA YoshiUnmountedState
	BNE bra3_A006	;If riding Yoshi, branch
	RTS
bra3_A006:
	LDA Event
	CMP #$04
	BEQ bra3_A023	;If the player is dying, branch
	LDA #$35
	STA ObjectPRGBank	;Set current object bank to 53
	LDA ObjectPRGBank
	STA M90_PRG0	;Swap the current object bank in
	LDA #$33
	STA M90_PRG3	;Swap bank 51 into the 4th PRG slot
	JSR obj_h36	;Jump
	LDA #$3F
	STA M90_PRG3	;Swap bank 63 back in
	RTS
bra3_A023:
	LDA YoshiXPos
	SEC
	SBC PlayerXPosDup
	STA YoshiXDistance
	LDA YoshiXScreen
	SBC PlayerXScreenDup
	STA YoshiXScreenDist
	BEQ bra3_A03B
	CMP #$FF
	BEQ bra3_A03B
	RTS
bra3_A03B:
	LDA YoshiYPos
	SEC
	SBC PlayerYPosDup	;Yoshi Y position - Player Y position =
	STA YoshiYDistance	;vertical distance between the player and Yoshi
	LDA YoshiYScreen
	SBC PlayerYScreenDup	;Yoshi Y screen - player Y screen =
	STA YoshiYScreenDist	;vertical screen distance between the player and Yoshi
	LDA PlayerYScreenDup
	CMP YoshiYScreen
	BEQ bra3_A07D_RTS	;If the player and Yoshi are on the same vertical screen, branch
	LDA YoshiYScreenDist
	BPL bra3_A06C	;Branch if Yoshi is at a higher vertical screen than the player
	LDA YoshiYDistance
	CLC
	ADC #$10
	STA YoshiYDistance	;Add 16 to Yoshi's vertical distance
	LDA YoshiYScreenDist
	ADC #$00
	STA YoshiYScreenDist	;Add (nothing?) to Yoshi's vertical screen distance
	JMP loc3_A07D_RTS	;Jump
bra3_A06C:
	LDA YoshiYDistance
	SEC
	SBC #$10
	STA YoshiYDistance
	LDA YoshiYScreenDist
	SBC #$00
	STA YoshiYScreenDist
bra3_A07D_RTS:
loc3_A07D_RTS:
	RTS
jmp_54_A07E:
	LDX #$00
bra3_A080:
	STX $A4
	LDA ObjectSlot,X
	BEQ bra3_A08F
	LDA #$33
	STA M90_PRG3
	JSR sub3_A09C
bra3_A08F:
	LDX $A4
	INX
	CPX ObjectCount
	BCC bra3_A080
	LDA #$3F
	STA M90_PRG3
	RTS
sub3_A09C:
	LDY ObjectSlot,X
	BMI bra3_A0A6
	LDA tbl3_A3B5,Y
	BNE bra3_A0AE
bra3_A0A6:
	TYA
	SEC
	SBC #$80
	TAY
	LDA tbl3_A635,Y
bra3_A0AE:
	STA ObjectPRGBank
	LDA ObjectPRGBank
	STA M90_PRG0
	LDA ObjectSlot,X
	BMI bra3_A0C9
	ASL
	TAX
	LDA tbl3_A1B5,X
	STA $32
	LDA tbl3_A1B5+1,X
	STA $33
	JMP ($32)
bra3_A0C9:
	ASL
	TAX
	LDA tbl3_A435,X
	STA $32
	LDA tbl3_A435+1,X
	STA $33
	JMP ($32)
ptr4_A0D8:
	RTS
jmp_54_A0D9:
	LDX #$00
bra3_A0DB:
	STX $A4
	LDA ObjectSlot,X
	BEQ bra3_A148
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra3_A100
	CMP #$FF
	BEQ bra3_A100
	JMP loc3_A6B5
bra3_A100:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra3_A142
jmp_54_A118:
	LDA ObjYScreenDistance,X
	BPL bra3_A131
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc3_A142
bra3_A131:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra3_A142:
loc3_A142:
	LDA FreezeFlag
	BEQ bra3_A148
	RTS
bra3_A148:
	LDX $A4
	INX
	CPX ObjectCount
	BCC bra3_A0DB
	RTS
jmp_54_A150:
	LDX #$00
bra3_A152:
	LDA ObjectSlot,X
	BEQ bra3_A15D
	INX
	CPX ObjectCount
	BCC bra3_A152
	RTS
bra3_A15D:
	TXA
	TAY
	INY
bra3_A160:
	LDA ObjectSlot,Y
	BEQ bra3_A1AD
	LDA ObjectXPos,Y
	STA ObjectXPos,X
	LDA ObjectXScreen,Y
	STA ObjectXScreen,X
	LDA ObjectYPos,Y
	STA ObjectYPos,X
	LDA ObjectYScreen,Y
	STA ObjectYScreen,X
	LDA ObjectSlot,Y
	STA ObjectSlot,X
	LDA ObjectState,Y
	STA ObjectState,X
	LDA ObjectVariables,Y
	STA ObjectVariables,X
	LDA $058C,Y
	STA $058C,X
	LDA $0641,Y
	STA $0641,X
	LDA EnemyAnimFrame,Y
	STA EnemyAnimFrame,X
	LDA ObjectAction,Y
	STA ObjectAction,X
	LDA #$00
	STA ObjectSlot,Y
	INX
bra3_A1AD:
	INY
	CPY ObjectCount
	BCC bra3_A160
	STX ObjectCount
	RTS
tbl3_A1B5:
	.word ptr4_A0D8
	.word obj_h01
	.word obj_h02
	.word obj_h03
	.word obj_h04
	.word obj_h05
	.word obj_h06
	.word obj_h07
	.word obj_h08
	.word obj_h09
	.word obj_h0A
	.word obj_h0B
	.word obj_h0C
	.word obj_h0D
	.word obj_h0E
	.word obj_h0F
	.word obj_h10
	.word obj_h10
	.word obj_h12
	.word obj_h12
	.word obj_h14
	.word obj_h14
	.word obj_h16
	.word obj_h16
	.word obj_h16
	.word obj_h16
	.word obj_h1A
	.word obj_h1A
	.word obj_h1C
	.word obj_h1C
	.word obj_h1E
	.word obj_h1E
	.word obj_h1E
	.word obj_h1E
	.word obj_h1E
	.word obj_h1E
	.word obj_h24
	.word obj_h24
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h26
	.word obj_h2E
	.word obj_h2E
	.word obj_h30
	.word obj_h30
	.word obj_h30
	.word obj_h30
	.word obj_h30
	.word obj_h30
	.word obj_h36
	.word obj_h36
	.word obj_h38
	.word obj_h0B
	.word obj_h3A
	.word obj_h3A
	.word obj_h3C
	.word obj_h3C
	.word obj_h3C
	.word obj_h3C
	.word obj_h3C
	.word obj_h3C
	.word obj_h42
	.word obj_h42
	.word obj_h44
	.word obj_h44
	.word obj_h38
	.word obj_h38
	.word obj_h48
	.word obj_h49
	.word obj_h4A
	.word obj_h4A
	.word obj_h4C
	.word obj_h4C
	.word obj_h4E
	.word obj_h4E
	.word obj_h4E
	.word obj_h4E
	.word obj_h30
	.word obj_h30
	.word obj_h54
	.word obj_h54
	.word obj_h54
	.word obj_h54
	.word obj_h58
	.word obj_h58
	.word obj_h5A
	.word obj_h5A
	.word obj_h5C
	.word obj_h5C
	.word obj_h5C
	.word obj_h5C
	.word obj_h5A
	.word obj_h5A
	.word obj_h5A
	.word obj_h5A
	.word obj_h64
	.word obj_h64
	.word obj_h66
	.word obj_h66
	.word obj_h66
	.word obj_h66
	.word obj_h6A
	.word obj_h6B
	.word obj_h6C
	.word obj_h6C
	.word obj_h6E
	.word obj_h6E
	.word obj_h70
	.word obj_h64
	.word obj_h72
	.word obj_h72
	.word obj_h74
	.word obj_h72
	.word obj_h76
	.word obj_h77
	.word obj_h78
	.word obj_h54
	.word obj_h7A
	.word obj_h7A
	.word obj_h7C
	.word obj_h7D
	.word obj_h7E
	.word obj_h7E
	.word ptr4_A0D8	;Unused excess pointers
	.byte $62
	.byte $95
	.byte $90
	.byte $95
	.byte $30
	.byte $96
	.byte $60
	.byte $96
	.byte $B7
	.byte $96
	.byte $D5
	.byte $96
	.byte $D5
	.byte $96
	.byte $F8
	.byte $96
	.byte $F8
	.byte $96
	.byte $F8
	.byte $96
	.byte $24
	.byte $97
	.byte $42
	.byte $97
	.byte $69
	.byte $97
	.byte $9C
	.byte $97
	.byte $C3
	.byte $97
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $57
	.byte $86
	.byte $57
	.byte $86
	.byte $5B
	.byte $86
	.byte $5B
	.byte $86
	.byte $4B
	.byte $88
	.byte $4B
	.byte $88
	.byte $12
	.byte $89
	.byte $12
	.byte $89
	.byte $A0
	.byte $8A
	.byte $A0
	.byte $8A
	.byte $A0
	.byte $8A
	.byte $A0
	.byte $8A
	.byte $A0
	.byte $8A
	.byte $A0
	.byte $8A
	.byte $DE
	.byte $8C
	.byte $DE
	.byte $8C
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $17
	.byte $8E
	.byte $90
	.byte $8F
	.byte $90
	.byte $8F
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $60
	.byte $96
	.byte $24
	.byte $97
	.byte $49
	.byte $93
	.byte $49
	.byte $93
	.byte $B5
	.byte $95
	.byte $B5
	.byte $95
	.byte $B5
	.byte $95
	.byte $B5
	.byte $95
	.byte $B5
	.byte $95
	.byte $B5
	.byte $95
	.byte $CD
	.byte $99
	.byte $CD
	.byte $99
	.byte $11
	.byte $9A
	.byte $11
	.byte $9A
	.byte $68
	.byte $9A
	.byte $68
	.byte $9A
	.word ptr5_9DA5
	.byte $B7
	.byte $96
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $FB
	.byte $9B
	.byte $FB
	.byte $9B
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $18
	.byte $91
	.byte $18
	.byte $91
	.byte $39
	.byte $80
	.byte $39
	.byte $80
	.byte $39
	.byte $80
	.byte $39
	.byte $80
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $89
	.byte $93
	.byte $89
	.byte $93
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $08
	.byte $80
	.byte $8D
	.byte $95
	.byte $27
	.byte $97
	.byte $A9
	.byte $99
	.byte $A9
	.byte $99
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $A2
	.byte $8C
	.byte $64
	.byte $93
	.byte $DB
	.byte $8C
	.byte $DB
	.byte $8C
	.byte $DB
	.byte $9B
	.byte $DB
	.byte $8C
	.byte $39
	.byte $80
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $39
	.byte $80
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $70
	.byte $96
	.byte $70
	.byte $96
tbl3_A3B5:
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $35
	.byte $35
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $37
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $35
	.byte $31
	.byte $31
	.byte $35
	.byte $35
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $32
	.byte $32
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $35
	.byte $35
	.byte $32
	.byte $32
	.byte $37
	.byte $37
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $35
	.byte $32
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $35
	.byte $37
	.byte $31
	.byte $31
tbl3_A435:
	.word obj_h80
	.word obj_h80
	.word obj_h82
	.word obj_h82
	.word obj_h84
	.word obj_h84
	.word obj_h86
	.word obj_h86
	.word obj_h88
	.word obj_h88
	.word obj_h8A
	.word obj_h8A
	.word obj_h8C
	.word obj_h8C
	.word obj_h8E
	.word obj_h8E
	.word obj_h90
	.word obj_h90
	.word obj_h92
	.word obj_h92
	.word obj_h94
	.word obj_h94
	.word obj_h96
	.word obj_h96
	.word obj_h98
	.word obj_h98
	.word obj_h9A
	.word obj_h9A
	.word obj_h9C
	.word obj_h9C
	.word obj_h9E
	.word obj_h9E
	.word obj_hA0
	.word obj_hA0
	.word obj_hA2
	.word obj_hA2
	.word obj_hA4
	.word obj_hA4
	.word obj_hA6
	.word obj_hA6
	.word obj_hA8
	.word obj_hA8
	.word obj_hA8
	.word obj_hA8
	.word obj_hAA
	.word obj_hAA
	.word obj_hAC
	.word obj_hAC
	.word obj_hAE
	.word obj_hAE
	.word obj_hB0
	.word obj_hB0
	.word obj_hB2
	.word obj_hB2
	.word obj_hB4
	.word obj_hB4
	.word obj_hB6
	.word ptr4_A0D8
	.word obj_hB8
	.word ptr4_A0D8
	.word obj_hBA
	.word ptr4_A0D8
	.word ptr4_A0D8
	.word obj_hBD
	.word obj_hBE
	.word obj_hBE
	.word obj_hC0
	.word obj_hC0
	.word obj_hC2
	.word obj_hC2
	.word obj_hBE
	.word obj_hBE
	.word obj_hC0
	.word obj_hC0
	.word obj_hC2
	.word obj_hC2
	.word obj_hBE
	.word obj_hBE
	.word obj_hC0
	.word obj_hC0
	.word obj_hCE
	.word obj_hCE
	.word obj_hD0
	.word obj_hD0
	.word obj_hD2
	.word obj_hD2
	.word obj_hD4
	.word obj_hD5
	.word obj_hD6
	.word obj_hD6
	.word obj_hD8
	.word obj_hD8
	.word obj_hDA
	.word obj_hDA
	.word obj_hDC
	.word obj_hDC
	.word obj_hDE
	.word obj_hDF
	.word obj_hE0
	.word obj_hE0
	.word obj_hE2
	.word obj_hE2
	.word obj_hE4
	.word obj_hE4
	.word obj_hE6
	.word obj_hE7
	.word obj_hE8
	.word obj_hE8
	.word obj_hE8	;1st bonus block
	.word obj_hE8
	.word obj_hE8	;2nd bonus block
	.word obj_hED
	.word obj_hED	;3rd bonus block
	.word obj_hED
	.word obj_hF0
	.word obj_hF0
	.word obj_hED
	.word obj_hED
	.word obj_hF4
	.word obj_hF4
	.word obj_hF4
	.word obj_hF4
	.word obj_h58
	.word obj_h58
	.word obj_hFA
	.word obj_hFA
	.word obj_hFA
	.word obj_hFA
	.byte $F1
	.byte $8B
	.byte $F1
	.byte $8B
	.byte $93
	.byte $90
	.byte $93
	.byte $90
	.byte $B3
	.byte $83
	.byte $B3
	.byte $83
	.byte $FE
	.byte $87
	.byte $FE
	.byte $87
	.byte $7B
	.byte $81
	.byte $7B
	.byte $81
	.byte $19
	.byte $95
	.byte $19
	.byte $95
	.byte $32
	.byte $96
	.byte $32
	.byte $96
	.byte $44
	.byte $85
	.byte $44
	.byte $85
	.byte $44
	.byte $85
	.byte $44
	.byte $85
	.byte $FE
	.byte $87
	.byte $FE
	.byte $87
	.byte $E0
	.byte $88
	.byte $E0
	.byte $88
	.byte $97
	.byte $88
	.byte $97
	.byte $88
	.byte $17
	.byte $85
	.byte $17
	.byte $85
	.byte $5E
	.byte $8A
	.byte $5E
	.byte $8A
	.byte $95
	.byte $8D
	.byte $95
	.byte $8D
	.byte $15
	.byte $8F
	.byte $15
	.byte $8F
	.byte $C7
	.byte $82
	.byte $C7
	.byte $82
	.byte $80
	.byte $99
	.byte $80
	.byte $99
	.byte $80
	.byte $99
	.byte $80
	.byte $99
	.byte $79
	.byte $9B
	.byte $79
	.byte $9B
	.byte $87
	.byte $9A
	.byte $87
	.byte $9A
	.byte $87
	.byte $9A
	.byte $87
	.byte $9A
	.byte $79
	.byte $92
	.byte $79
	.byte $92
	.byte $B7
	.byte $93
	.byte $B7
	.byte $93
	.byte $71
	.byte $8B
	.byte $71
	.byte $8B
	.byte $28
	.byte $8E
	.byte $28
	.byte $8E
	.byte $C4
	.byte $90
	.byte $C4
	.byte $90
	.byte $0E
	.byte $99
	.byte $0E
	.byte $99
	.byte $CE
	.byte $8E
	.byte $D8
	.byte $A0
	.byte $2E
	.byte $8F
	.byte $D8
	.byte $A0
	.byte $2E
	.byte $8F
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $49
	.byte $83
	.word ptr9_843B
	.word ptr9_843B
	.byte $40
	.byte $86
	.byte $40
	.byte $86
	.byte $C8
	.byte $87
	.byte $C8
	.byte $87
	.byte $3B
	.byte $84
	.byte $3B
	.byte $84
	.byte $40
	.byte $86
	.byte $40
	.byte $86
	.byte $C8
	.byte $87
	.byte $C8
	.byte $87
	.word ptr9_843B
	.word ptr9_843B
	.byte $40
	.byte $86
	.byte $40
	.byte $86
	.byte $81
	.byte $8A
	.byte $81
	.byte $8A
	.byte $59
	.byte $8D
	.byte $59
	.byte $8D
	.byte $1A
	.byte $90
	.byte $1A
	.byte $90
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $86
	.byte $92
	.byte $86
	.byte $92
	.byte $E1
	.byte $98
	.byte $E1
	.byte $98
	.byte $B7
	.byte $98
	.byte $B7
	.byte $98
	.byte $BE
	.byte $98
	.byte $BE
	.byte $98
	.byte $D1
	.byte $88
	.byte $F9
	.byte $88
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $75
	.byte $84
	.byte $75
	.byte $84
	.byte $75
	.byte $84
	.byte $75
	.byte $84
	.byte $ED
	.byte $9B
	.byte $51
	.byte $99
	.byte $51
	.byte $99
	.byte $51
	.byte $99
	.byte $51
	.byte $99
	.byte $51
	.byte $99
	.byte $51
	.byte $99
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $D8
	.byte $A0
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $00
	.byte $80
	.byte $0E
	.byte $82
	.byte $0E
	.byte $82
	.byte $CB
	.byte $96
	.byte $CB
	.byte $96
	.byte $CB
	.byte $96
	.byte $CB
	.byte $96
tbl3_A635:
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $32
	.byte $32
	.byte $32
	.byte $32
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $38
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $25
	.byte $30
	.byte $25
	.byte $30
	.byte $30
	.byte $25
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $30
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $31
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $25
	.byte $25
	.byte $25
	.byte $25
	.byte $37
	.byte $37
	.byte $31
	.byte $31
	.byte $31
	.byte $31
loc3_A6B5:
	LDA #$00
	STA ObjectAction,X
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X ;Wipe object from memory
	LDA $058C,X
	TAY
	LDX tbl_51_FC80,Y
	LDA $03CE,X
	AND tbl_51_FD80,Y
	STA $03CE,X
	RTS
jmp_54_A6D4:
	LDA Player1YoshiStatus
	BNE bra3_A6E0_RTS
	LDA PlayerPowerup
	CMP #$03
	BCS bra3_A6E1
bra3_A6E0_RTS:
	RTS
bra3_A6E1:
	LDA $1E
	CMP #$05
	BNE bra3_A6E0_RTS
	LDX $A4
	LDY ObjectSlot,X
	LDA tbl3_A87B,Y
	STA $36
	LDA tbl3_A97B,Y
	STA $38
	LDA ObjXScreenDistance,X
	BPL bra3_A708
	LDA #$10
	CLC
	ADC $36
	CLC
	ADC ObjectXDistance,X
	BCS bra3_A70F
	BCC bra3_A72F
bra3_A708:
	LDA ObjectXDistance,X
	CMP #$10
	BCS bra3_A72F
bra3_A70F:
	LDA ObjYScreenDistance,X
	BEQ bra3_A725
	CMP #$FF
	BNE bra3_A72F
	LDA #$18
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra3_A72C
	BCC bra3_A72F
bra3_A725:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_A72F
bra3_A72C:
	CLC
	BCC bra3_A730
bra3_A72F:
	SEC
bra3_A730:
	BCS bra3_A74C_RTS
	LDA ObjectState,X
	AND #$E0
	ORA #$04
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	LDA #$01
	JSR sub3_BCD4
	LDA #sfxEnemyHit2
	STA SFXRegister
	PLA
	PLA
bra3_A74C_RTS:
	RTS
jmp_54_A74D:
	LDA Player1YoshiStatus
	BNE bra3_A758
	LDA $1E
	CMP #$05
	BNE bra3_A772_RTS
bra3_A758:
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	PLA
	PLA
bra3_A772_RTS:
	RTS
jmp_54_A773:
	LDA ObjXScreenDistance,X
	BPL bra3_A785	;Branch if the player is a screen ahead of the object
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra3_A78C
	BCC bra3_A7AC
bra3_A785:
	LDA ObjectXDistance,X
	CMP #$08
	BCS bra3_A7AC	;Branch if the player isn't within 8 horizontal pixels of the object's hitbox
bra3_A78C:
	LDA ObjYScreenDistance,X
	BEQ bra3_A7A2	;Branch if the player is to the left of the object
	CMP #$FF
	BNE bra3_A7AC	;Branch if the player isn't to the right of the object
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra3_A7A9
	BCC bra3_A7AC
bra3_A7A2:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_A7AC	;Branch if the player is above the object's hitbox?
bra3_A7A9:
	CLC
	BCC bra3_A7AD
bra3_A7AC:
	SEC
bra3_A7AD:
	BCC bra3_A7BA_RTS
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	PLA
	PLA
	RTS
bra3_A7BA_RTS:
	RTS
ptr_A7BB:
	LDA $25
	CMP #$07
	BNE bra3_A7C4 ;Branch if the object is completely inedible
	JMP loc3_A852 ;Otherwise, jump
bra3_A7C4:
	LDA YoshiTongueState
	CMP #$01
	BEQ bra3_A7CE ;Branch if there's nothing on Yoshi's tongue already
bra3_A7CB:
	JMP loc3_A852 ;If there is, jump
bra3_A7CE:
	LDX $A4	;Get index for current object
	LDA PlayerState
	CMP #$09
	BCC bra3_A7CB ;Branch (to a jump) if Yoshi's tongue isn't out
	LDA PlayerMovement
	AND #$40
	BNE bra3_A7E3 ;Branch if the player is facing left
	LDA ObjXScreenDistance,X
	BMI bra3_A7CB ;Branch (to a jump) if the player is right of the object
	BPL bra3_A7E8 ;Branch if the player is left of the object
bra3_A7E3:
	LDA ObjXScreenDistance,X
	BPL bra3_A7CB	;Branch if the player is left of the object
bra3_A7E8:
	LDX PlayerAnimationFrame
	CPX #$06
	BCC bra3_A852	;Make sure the player is on the 6th or less frame of their current animation?
	LDA tbl3_A85F,X
	STA $32	;Store pointer based off the player's animation frame
	LDY $A4	;Get index for current object
	LDX ObjectSlot,Y
	LDA tbl3_A87B,X
	STA $36	;Load pointer for object into memory
	LDA tbl3_A97B,X
	STA $38
	LDX $A4
	LDA ObjXScreenDistance,X
	BPL bra3_A816
	LDA $32
	CLC
	ADC $36	;Add [unknown1] to [unknown2]
	CLC
	ADC ObjectXDistance,X
	BCS bra3_A81D
	BCC bra3_A83D
bra3_A816:
	LDA ObjectXDistance,X
	CMP $32
	BCS bra3_A83D
bra3_A81D:
	LDA ObjYScreenDistance,X
	BEQ bra3_A833
	CMP #$FF
	BNE bra3_A83D
	LDA #$10
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra3_A83A
	BCC bra3_A83D
bra3_A833:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_A83D
bra3_A83A:
	CLC
	BCC bra3_A83E
bra3_A83D:
	SEC
bra3_A83E:
	BCS bra3_A852
	LDX PlayerAnimationFrame
	LDA tbl3_A86D,X
	STA PlayerAnimationFrame
	LDX $A4
	INC ObjectState,X
	LDA $25
	STA YoshiTongueState
	RTS
bra3_A852:
loc3_A852:
	LDX $A4
	LDA ObjectState,X
	AND #$E0	;Mask out the lower 5 bits
	ORA #$03
	STA ObjectState,X	;Set the lower 2 bits, changing the collision state to make the object vulnerable to Yoshi's tongue(?)
	RTS
tbl3_A85F:
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $18
	.byte $20
	.byte $28
	.byte $30
	.byte $28
	.byte $20
	.byte $18
	.byte $18
tbl3_A86D:
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $0B
	.byte $0B
	.byte $0A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $0D
tbl3_A87B:
	.byte $00
	.byte $00
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $30
	.byte $30
	.byte $30
	.byte $12
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $30
	.byte $30
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $18
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $08
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $30
	.byte $30
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
tbl3_A97B:
	.byte $00
	.byte $00
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $28
	.byte $28
	.byte $50
	.byte $50
	.byte $88
	.byte $88
	.byte $28
	.byte $28
	.byte $28
	.byte $28
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $10
	.byte $20
	.byte $18
	.byte $03
	.byte $18
	.byte $10
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $18
	.byte $18
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $08
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $18
	.byte $18
	.byte $08
	.byte $38
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $08
	.byte $28
	.byte $40
	.byte $40
	.byte $20
	.byte $20
	.byte $10
	.byte $10
	.byte $10
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
ptr_AA7B:
	LDY $A4 ;Get index for the current object
	LDX PlayerAnimationFrame
	CPX #$0C
	BCC bra3_AA8D
	LDA ObjectState,Y
	CLC
	ADC #$01
	STA ObjectState,Y ;Move to next object state
	RTS
bra3_AA8D:
	LDA tbl3_AB0D,X
	STA $37
	LDA tbl3_AB1B,X
	STA $34
	LDX ObjectSlot,Y
	LDA tbl3_A87B,X
	LSR
	CLC
	ADC $37
	STA $32
	LDA tbl3_A97B,X
	CLC
	ADC #$04
	EOR #$FF
	STA $36
	LDA PlayerMovement
	AND #$40
	BNE bra3_AAC2
	LDA PlayerXPosDup
	CLC
	ADC $34
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc3_AACE
bra3_AAC2:
	LDA PlayerXPosDup
	SEC
	SBC $32
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc3_AACE:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA $36
	BMI bra3_AAF5
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS $AAE6
	CMP #$F0
	BCC $AB0C
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP jmp_54_AB09
bra3_AAF5:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_AB0C_RTS
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
jmp_54_AB09:
	STA ObjectYScreen,Y
bra3_AB0C_RTS:
	RTS
tbl3_AB0D:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $18
	.byte $28
	.byte $30
	.byte $28
	.byte $18
	.byte $00
	.byte $00
tbl3_AB1B:
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $10
	.byte $10
	.byte $20
	.byte $28
	.byte $20
	.byte $10
	.byte $10
	.byte $10
ptr_AB29:
	LDA $25
	CMP #$06
	BNE bra3_AB33
	LDA #sfxYoshiSwallow
	STA SFXRegister
bra3_AB33:
	JSR sub3_AE37
	CPX #$05
	BNE bra3_AB4C
	LDY CurrentPlayer
	LDA Player1Lives,Y
	CLC
	ADC #$01
	STA Player1Lives,Y
	LDA #$07
	STA SFXRegister
	BNE bra3_AB55
bra3_AB4C:
	CPX #$0E
	BNE bra3_AB55
	LDA #$01
	STA InvincibilityTimer
bra3_AB55:
	LDX $A4
	LDA #$00
	STA ObjectSlot,X
	RTS
ptr_AB5D:
	LDX $A4 ;Get index for object
	LDA $058C,X
	STA $0632
	LDA #$00
	STA ObjectSlot,X ;Remove object
	RTS
jmp_54_AB6B:
	LDA Player1YoshiStatus
	BNE bra3_AB91_RTS	;Make sure the player isn't riding Yoshi
	LDA PlayerHoldFlag
	BNE bra3_AB91_RTS	;Stop if the player is already carrying something
	LDA PlayerAction+1
	CMP #$04
	BCS bra3_AB91_RTS	;Only continue if player is either walking, running, or doing nothing
	LDA ButtonsHeld
	AND #buttonB
	BEQ bra3_AB91_RTS	;Make sure the B button is held
	STA PlayerHoldFlag
	LDY $A4
	LDA ObjectState,Y
	ORA #$80
	STA ObjectState,Y	;Set object to "held"
	PLA
	PLA
bra3_AB91_RTS:
	RTS
	
;This routine handles carrying objects
jmp_54_AB92:
	LDY $A4
	LDA ObjectState,Y
	AND #$80
	BNE bra3_AB9C ;Branch if the object is being carried
	RTS ;Otherwise, stop
bra3_AB9C:
	LDA ButtonsHeld
	AND #buttonB
	STA PlayerHoldFlag ;Set the player's carrying flag if the B button is held
	BEQ bra3_AC08 ;Branch if the B button isn't being held
	LDA PlayerMovement
	AND #$40
	BNE bra3_ABBB ;Branch if the player is facing left
	LDA PlayerXPosDup
	CLC
	ADC #$06
	STA ObjectXPos,Y ;Offset the object's 
	LDA PlayerXScreenDup
	ADC #$00 ;Update the X screen if needed (high byte)
	JMP loc3_ABC7
bra3_ABBB:
	LDA PlayerXPosDup
	SEC
	SBC #$16
	STA ObjectXPos,Y ;Offset the carried object's position by 38 pixels
	LDA PlayerXScreenDup
	SBC #$00
loc3_ABC7:
	STA ObjectXScreen,Y ;Update the X screen if needed (high byte)
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$EC
	BMI bra3_ABEE
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_ABDF
	CMP #$F0
	BCC bra3_AC05
bra3_ABDF:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP jmp_54_AC02
bra3_ABEE:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_AC05
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
jmp_54_AC02:
	STA ObjectYScreen,Y
bra3_AC05:
	PLA
	PLA
	RTS
bra3_AC08:
	LDA PlayerMovement
	AND #$40
	ORA #$05
	TAY
	LDA ButtonsHeld
	AND #$08
	BEQ bra3_AC17
	INY
bra3_AC17:
	TYA
	LDY $A4
	STA ObjectState,Y
	PLA
	PLA
	RTS
jmp_54_AC20:
	LDA Player1YoshiStatus
	BNE bra3_ACA1_RTS
	LDY $A4
	LDA ObjectState,Y
	AND #$80
	BEQ bra3_ACA1_RTS
	LDA ButtonsHeld
	AND #$40
	STA PlayerHoldFlag
	BEQ bra3_ACA2
	LDA PlayerMovement
	AND #$40
	BNE bra3_AC4D
	LDA PlayerXPosDup
	CLC
	ADC #$06
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc3_AC59
bra3_AC4D:
	LDA PlayerXPosDup
	SEC
	SBC #$16
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc3_AC59:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$EC
	BMI bra3_AC80
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS $AC71
	CMP #$F0
	BCC $AC97
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA $0550,Y
	CLC
	ADC #$01
	JMP jmp_54_AC94
bra3_AC80:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_AC97
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
jmp_54_AC94:
	STA ObjectYScreen,Y
bra3_AC97:
loc3_AC97:
	LDA #$10
	JSR sub3_AEA8
	JSR sub3_AD3D
	PLA
	PLA
bra3_ACA1_RTS:
	RTS
bra3_ACA2:
	LDA ObjectState,Y
	AND #$7F
	STA ObjectState,Y
	LDA ButtonsHeld
	AND #$08
	BEQ bra3_ACC2_RTS
	LDA ObjectState,Y
	AND #$F0
	ORA #$07
	STA ObjectState,Y
	LDA #$00
	STA ObjectVariables,Y
	PLA
	PLA
bra3_ACC2_RTS:
	RTS
jmp_54_ACC3:
	LDA Player1YoshiStatus
	BNE bra3_ACA1_RTS
	LDY $A4
	LDA ObjectState,Y
	AND #$80
	BEQ bra3_ACA1_RTS
	LDA ButtonsHeld
	AND #$40
	STA PlayerHoldFlag
	BEQ bra3_ACA2
	LDA PlayerMovement
	AND #$40
	BNE bra3_ACF0
	LDA PlayerXPosDup
	CLC
	ADC #$00
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	ADC #$00
	JMP loc3_ACFC
bra3_ACF0:
	LDA PlayerXPosDup
	SEC
	SBC #$16
	STA ObjectXPos,Y
	LDA PlayerXScreenDup
	SBC #$00
loc3_ACFC:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$E0
	BMI bra3_AD23
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS $AD14
	CMP #$F0
	BCC $AD3A
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP jmp_54_AD37
bra3_AD23:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_AD3A
	SEC
	SBC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	SEC
	SBC #$01
jmp_54_AD37:
	STA ObjectYScreen,Y
bra3_AD3A:
	JMP loc3_AC97
sub3_AD3D:
	LDA ObjectState,Y
	AND #$40
	PHA
	ORA #$06
	STA ObjectState,Y
	LDA #$00
	STA PlayerHoldFlag
	STA ObjectVariables,Y
	PLA
	JMP loc3_AD5C
jmp_54_AD54:
	JSR sub3_BD03
	LDA ObjectState,Y
	AND #$40
loc3_AD5C:
	EOR #$40
	STA $34
	LDA ObjectState,X
	AND #$80
	ORA $34
	ORA #$04
	STA ObjectState,X
	LDA ObjectSlot,X
	CMP #$E1
	BEQ bra3_AD78_RTS
	LDA #$00
	STA ObjectVariables,X
bra3_AD78_RTS:
	RTS
ptr_AD79:
	LDY #$FE
	LDX $A4
	LDA ObjectState,X
	AND #$40
	BEQ bra3_AD95
	LDY #$02
	BNE bra3_AD95
ptr_AD88:
	LDY #$02
	LDX $A4
	LDA ObjectState,X
	AND #$40
	BNE bra3_AD95
	LDY #$FE
bra3_AD95:
	TYA
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_ADA8
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_ADAD
bra3_ADA8:
	LDA ObjectXScreen,X
	SBC #$00
bra3_ADAD:
	STA ObjectXScreen,X
	LDA ObjectYPos,X
	CMP #$E0
	BCC bra3_ADC3
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X
	RTS
bra3_ADC3:
	LDA ObjectVariables,X
	TAY
	LDA tbl3_AE0F,Y
	STA $32
	CMP #$FF
	BNE bra3_ADD6
	LDA #$07
	STA $32
	BNE bra3_ADDF
bra3_ADD6:
	LDA FrameCount
	AND #$03
	BNE bra3_ADDF
	INC ObjectVariables,X
bra3_ADDF:
	LDA $32
	BMI bra3_ADFC
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_ADF0
	CMP #$F0
	BCC bra3_AE0E_RTS
bra3_ADF0:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_AE0E_RTS
bra3_ADFC:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_AE0E_RTS
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_AE0E_RTS:
loc3_AE0E_RTS:
	RTS
tbl3_AE0F:
	.byte $FC
	.byte $FD
	.byte $FE
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $FF
ptr_AE17:
	LDA ObjXScreenDistance,X
	BPL bra3_AE23
	LDA ObjectState,X
	ORA #$40
	BNE bra3_AE28
bra3_AE23:
	LDA ObjectState,X
	AND #$BF
bra3_AE28:
	STA ObjectState,X
	LDA FrameCount
	AND #$00
	BNE bra3_AE36_RTS
	LDA #$24
	JSR GetMovementData
bra3_AE36_RTS:
	RTS
sub3_AE37:
	LDA $25
	CMP #$06
	BNE bra3_AE97_RTS
jmp_54_AE3D:
	LDY $A4
	LDA PlayerPowerup
	CMP #$04
	BNE bra3_AE48
	LDA #$03
bra3_AE48:
	STA $32
	LDX ObjectSlot,Y
	CPX #$10
	BCC bra3_AE5F
	CPX #$6B
	BEQ bra3_AE5D
	CPX #$BF
	BEQ bra3_AE5D
	CPX #$39
	BNE bra3_AE97_RTS
bra3_AE5D:
	LDX #$0B
bra3_AE5F:
	LDA tbl3_AE98,X
	BEQ bra3_AE97_RTS
	CMP #$01
	BNE bra3_AE74
	LDY PlayerPowerup
	BEQ bra3_AE74
	LDY ItemBox
	BEQ bra3_AE7B
	BNE bra3_AE7E
bra3_AE74:
	STA PlayerPowerup
	LDA $32
	BEQ bra3_AE7E
bra3_AE7B:
	STA ItemBox
bra3_AE7E:
	LDA #sfxPowerup
	STA SFXRegister
	LDA #$01
	CPX #$0D
	BNE bra3_AE8E
	LDA #$0E
	STA SFXRegister
	LDA #$81
bra3_AE8E:
	STA PlayerPowerupBuffer
	LDA #$07
	STA Event
	LDY $A4
bra3_AE97_RTS:
	RTS
tbl3_AE98:
	.byte $00
	.byte $00
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
	.byte $02
	.byte $03
	.byte $00
	.byte $00
sub3_AEA8:
	STA $38
	LDX #$FF
bra3_AEAC:
loc3_AEAC:
	INX
	LDY ObjectSlot,X
	BMI bra3_AEBE
	LDA tbl3_AF43,Y
	BNE bra3_AECF
	CPX ObjectCount
	BCC bra3_AEAC
	PLA
	PLA
	RTS
bra3_AEBE:
	TYA
	SEC
	SBC #$80
	TAY
	LDA tbl3_AFC3,Y
	BNE bra3_AECF
	CPX ObjectCount
	BCC bra3_AEAC
	PLA
	PLA
	RTS
bra3_AECF:
	LDA tbl3_A87B,Y
	STA $36
	LDA tbl3_A97B,Y
	STA $37
	LDY $A4
	STY $32
	CPX $32
	BEQ bra3_AEAC
	LDA ObjectXPos,X
	SEC
	SBC ObjectXPos,Y
	STA $32
	LDA ObjectXScreen,X
	SBC ObjectXScreen,Y
	STA $33
	LDA ObjectYPos,X
	SEC
	SBC ObjectYPos,Y
	STA $34
	LDA ObjectYScreen,X
	SBC ObjectYScreen,Y
	STA $35
	LDA $33
	BPL bra3_AF17
	CMP #$FF
	BNE bra3_AEAC
	LDA #$00
	CLC
	ADC $36
	CLC
	ADC $32
	BCS bra3_AF1F
	BCC bra3_AEAC
bra3_AF17:
	BNE bra3_AEAC
	LDA $32
	CMP $38
	BCS bra3_AEAC
bra3_AF1F:
	LDA $35
	BPL bra3_AF34
	CMP #$FF
	BNE bra3_AEAC
	LDA #$00
	CLC
	ADC $37
	CLC
	ADC $34
	BCS bra3_AF42_RTS
	JMP loc3_AEAC
bra3_AF34:
	BEQ bra3_AF39
	JMP loc3_AEAC
bra3_AF39:
	LDA $34
	CMP $38
	BCC bra3_AF42_RTS
	JMP loc3_AEAC
bra3_AF42_RTS:
	RTS
tbl3_AF43:
	.byte $00
	.byte $00
	.byte $00
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
	.byte $00
	.byte $01
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
tbl3_AFC3:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
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
sub3_B043:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA #$08
	STA $36
	LDA tbl3_A97B,Y
	CLC
	ADC #$04
	JMP loc3_B08D
sub3_B057:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B069
	LDA #$00
	BEQ bra3_B06C
bra3_B069:
	LDA tbl3_A87B,Y
bra3_B06C:
	STA $36
	LDA tbl3_A97B,Y
	SEC
	SBC #$08
	JMP loc3_B08D
sub3_B077:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B088
	LDA tbl3_A87B,Y
bra3_B088:
	STA $36
	LDA tbl3_A97B,Y
loc3_B08D:
	STA $38
	LDA ObjectXPos,X
	CLC
	ADC $36
	STA $A8
	LDA ObjectXScreen,X
	ADC #$00
	STA $A9
	LDA ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	STA $AB
loc3_B0A8:
	LDA $38
	BMI bra3_B0C1
	CLC
	ADC $AA
	STA $AA
	BCS bra3_B0B7
	CMP #$F0
	BCC bra3_B0CF
bra3_B0B7:
	CLC
	ADC #$10
	STA $AA
	INC $AB
	JMP loc3_B0CF
bra3_B0C1:
	CLC
	ADC $AA
	STA $AA
	BCS bra3_B0CF
	SEC
	SBC #$10
	STA $AA
	DEC $AB
bra3_B0CF:
loc3_B0CF:
	LDA $AA
	CMP #$D8
	BCC bra3_B0D8
	LDA #$00
	RTS
bra3_B0D8:
	LDY $AB
	LDA LevelTopScreenOffset,Y
	CLC
	ADC $A9
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($8C),Y
	TAY
	AND #$1F
	ORA #$80
	STA $35
	LDA #$00
	STA $34
	LDY $A8
	LDA $AA
	AND #$F0
	ORA $FE00,Y
	TAY
	LDA DataBank1
	STA M90_PRG0
	LDA ($34),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	TAY
	LDA $FF00,Y
	PHA
	LDA ObjectPRGBank
	STA M90_PRG0
	LDY $2B
	PLA
	RTS
jmp_54_B11D:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B132
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS
sub3_B132:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B14C
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc3_B14E
bra3_B14C:
	LDA ($32),Y
loc3_B14E:
	STA $06E2
	INY
	LDA ($32),Y
	STA $06E3
	LDA InterruptMode
	CMP #$04
	BEQ bra3_B1AB
	LDA $06E2
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B173
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B178
bra3_B173:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B178:
	STA ObjectXScreen,X
	LDA $06E3
	BMI bra3_B199
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B18D
	CMP #$F0
	BCC bra3_B1AB
bra3_B18D:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B1AB
bra3_B199:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B1AB
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B1AB:
loc3_B1AB:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B1BD
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
	JMP loc3_B1D6
bra3_B1BD:
	AND #$F0
	BEQ bra3_B1D6
	LDA ($32),Y
	AND #$3F
	BNE bra3_B1CB
	STA ObjectVariables,X
	RTS
bra3_B1CB:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra3_B1D6:
loc3_B1D6:
	INC ObjectVariables,X
	RTS
GetMovementData:
	ASL
	TAY ;Get pointer index
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33 ;Store movement data pointer in memory
	JSR sub3_B1EF
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS
sub3_B1EF:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	LDA ObjectState,X
	AND #$20
	BNE bra3_B202
	JMP loc3_B2B4
bra3_B202:
	JSR sub3_B077
	BEQ bra3_B212
	CMP #$02
	BEQ bra3_B212
	CMP #$03
	BEQ bra3_B212
	JMP loc3_B28A
bra3_B212:
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra3_B21E
	INC ObjectVariables,X
bra3_B21E:
	TAY
	BMI bra3_B23A
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B22E
	CMP #$F0
	BCC bra3_B24C
bra3_B22E:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B24C
bra3_B23A:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS $B24C
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B24C:
loc3_B24C:
	JSR sub3_B057
	BEQ bra3_B25D
	CMP #$02
	BEQ bra3_B25D
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra3_B25D:
	LDY #$00	;Clear Y reg
	LDA ($32),Y	;Load movement data
	TAY	;Copy it to the Y reg
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B26E	;Branch if the object is facing right
	TYA	;Load the movement data
	EOR #$FF	;Negate the value
	TAY	;Copy it back to the Y register
	INY	;Increase it by 1
bra3_B26E:
	TYA	;Copy it back to the accumulator
	PHA	;Push into stack
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X	;Move the object by adding to its position
	PLA	;Pull the value that was just added
	BMI bra3_B281	;Branch if it's negative
	LDA ObjectXScreen,X
	ADC #$00	;Update the horizontal screen (if the object is going left?)
	BPL bra3_B286	;Branch if the screen is negative?
bra3_B281:
	LDA ObjectXScreen,X
	SBC #$00	;Update the horizontal screen (if the object is going right?)
bra3_B286:
	STA ObjectXScreen,X	;Update it in memory
	RTS
loc3_B28A:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA ObjectYPos,X
	SEC
	SBC $25
	BCS bra3_B2A0
	DEC ObjectYScreen,X
	SEC
	SBC #$10
bra3_B2A0:
	STA ObjectYPos,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
loc3_B2B4:
	INY
	LDA ($32),Y	;Load movement data
	BMI bra3_B2D3	;Branch if bit 7 of is set
	JSR sub3_B077	;Otherwise, jump
	BEQ bra3_B2C2
	CMP #$02
	BNE bra3_B2F8
bra3_B2C2:
	LDA ObjectState,X
	ORA #$20
	STA ObjectState,X
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra3_B2D3:
	LDA ObjectSlot,X
	CMP #$06
	BEQ bra3_B2F8
	CMP #$07
	BEQ bra3_B2F8
	LDA #$00
	STA $36
	LDA #$00
	JSR sub3_B7A2
	CMP #$68
	BEQ bra3_B2C2
	LDA #$0F
	STA $36
	LDA #$00
	JSR sub3_B7A2
	CMP #$68
	BEQ bra3_B2C2
bra3_B2F8:
	DEY
	JSR sub3_B057
	BEQ bra3_B30A
	CMP #$02
	BEQ bra3_B30A
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
bra3_B30A:
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B31B
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc3_B31D
bra3_B31B:
	LDA ($32),Y
loc3_B31D:
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B32F
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B334
bra3_B32F:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B334:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	BMI bra3_B355
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B349
	CMP #$F0
	BCC bra3_B367
bra3_B349:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B367
bra3_B355:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B367
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B367:
loc3_B367:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B379
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
	JMP loc3_B397
bra3_B379:
	AND #$F0
	BEQ bra3_B397
	LDA ($32),Y
	AND #$3F
	BNE bra3_B38C
	LDA ObjectVariables,X
	AND #$80
	STA ObjectVariables,X
	RTS
bra3_B38C:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra3_B397:
loc3_B397:
	INC ObjectVariables,X
	RTS
jmp_54_B39B:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	JSR sub3_B043
	BEQ bra3_B3AE
	JSR sub3_B057
	BEQ bra3_B3B1
bra3_B3AE:
	JMP loc3_B3DC
bra3_B3B1:
	JMP loc3_B3E4
sub_54_B3B4:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B3C9
	LDA ObjectPRGBank
	STA M90_PRG0	;Swap PRG bank out for current object
	RTS
sub3_B3C9:
	LDX $A4
	LDA ObjectVariables,X
	AND #$7F
	ASL
	TAY
	JSR sub3_B043
	BEQ bra3_B3DC
	JSR sub3_B057
	BEQ bra3_B3E4
bra3_B3DC:
loc3_B3DC:
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X	;Flip the object horizontally
bra3_B3E4:
loc3_B3E4:
	LDA ObjectState,X
	AND #%01000000
	BEQ bra3_B3F5	;If the object is facing right, branch
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc3_B3F7
bra3_B3F5:
	LDA ($32),Y
loc3_B3F7:
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B409
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B40E
bra3_B409:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B40E:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	BMI bra3_B42F
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B423
	CMP #$F0
	BCC bra3_B441
bra3_B423:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP bra3_B441
bra3_B42F:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS $B441
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B441:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B453
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X
	JMP bra3_B46C
bra3_B453:
	AND #$F0
	BEQ bra3_B46C
	LDA ($32),Y
	AND #$3F
	BNE bra3_B461
	STA ObjectVariables,X
	RTS
bra3_B461:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra3_B46C:
	INC ObjectVariables,X
	RTS
jmp_54_B470:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B485
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS
sub3_B485:
	LDX $A4
	LDA ObjectVariables,X
	ASL
	TAY
	LDA ($32),Y
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B4A0
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B4A5
bra3_B4A0:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B4A5:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	BMI bra3_B4C6
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B4BA
	CMP #$F0
	BCC bra3_B4D8
bra3_B4BA:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B4D8
bra3_B4C6:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B4D8
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B4D8:
loc3_B4D8:
	INY
	LDA ($32),Y
	AND #$F0
	BEQ bra3_B4F8
	CMP #$F0
	BEQ bra3_B4F8
	LDA ($32),Y
	AND #$3F
	BNE bra3_B4ED
	STA ObjectVariables,X
	RTS
bra3_B4ED:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra3_B4F8:
	INC ObjectVariables,X
	RTS
sub_54_B4FC:
	LDA FrameCount
	AND #$01
	BNE bra3_B556
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra3_B50E
	INC ObjectVariables,X
bra3_B50E:
	TAY
	BMI bra3_B52A
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B51E
	CMP #$F0
	BCC bra3_B53C
bra3_B51E:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B53C
bra3_B52A:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS $B53C
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B53C:
loc3_B53C:
	LDA ObjectYScreen,X
	CMP YScreenCount
	BCC bra3_B556
	LDA ObjectYPos,X
	CMP #$E0
	BCC bra3_B556
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X
bra3_B556:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra3_B572
	CMP #$FF
	BEQ bra3_B572
	JMP loc3_A6B5
bra3_B572:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra3_B5B4
	LDA ObjYScreenDistance,X
	BPL bra3_B5A3
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP bra3_B5B4
bra3_B5A3:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra3_B5B4:
	LDA FreezeFlag
	BEQ bra3_B5BA_RTS
	RTS
bra3_B5BA_RTS:
	RTS
jmp_54_B5BB:
	LDA #$00
	STA ObjectVariables,X
	TAY
	LDA ObjXScreenDistance,X
	BMI bra3_B5C8
	LDY #$40
bra3_B5C8:
	TYA
	STA ObjectState,X
	RTS
sub_54_B5CD:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B5E2
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS
sub3_B5E2:
	LDA $05F7
	AND #$7F
	ASL
	TAY
	LDA $05F6
	AND #$20
	BNE bra3_B5F3
	JMP loc3_B689
bra3_B5F3:
	JSR sub3_B758
	BNE bra3_B65F
	LDA $05F7
	AND #$7F
	CMP #$07
	BCS bra3_B604
	INC $05F7
bra3_B604:
	TAY
	BMI bra3_B620
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra3_B614
	CMP #$F0
	BCC bra3_B632
bra3_B614:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc3_B632
bra3_B620:
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS $B632
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
bra3_B632:
loc3_B632:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_B643
	TYA
	EOR #$FF
	TAY
	INY
bra3_B643:
	TYA
	PHA
	CLC
	ADC YoshiXPos
	STA YoshiXPos
	PLA
	BMI bra3_B656
	LDA YoshiXScreen
	ADC #$00
	BPL bra3_B65B
bra3_B656:
	LDA YoshiXScreen
	SBC #$00
bra3_B65B:
	STA YoshiXScreen
	RTS
bra3_B65F:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA YoshiYPos
	SEC
	SBC $25
	BCS bra3_B675
	DEC YoshiYScreen
	SEC
	SBC #$10
bra3_B675:
	STA YoshiYPos
	LDA $05F6
	AND #$C0
	STA $05F6
	LDA $05F7
	AND #$80
	STA $05F7
	RTS
loc3_B689:
	INY
	LDA ($32),Y
	BMI bra3_B6A4
	JSR sub3_B758
	BNE bra3_B6A4
	LDA $05F6
	ORA #$20
	STA $05F6
	LDA $05F7
	AND #$80
	STA $05F7
	RTS
bra3_B6A4:
	DEY
	JSR sub3_B743
	BEQ bra3_B6B2
	LDA YoshiIdleMovement
	EOR #$40
	STA YoshiIdleMovement
bra3_B6B2:
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_B6C3
	LDA ($32),Y
	EOR #$FF
	CLC
	ADC #$01
	JMP loc3_B6C5
bra3_B6C3:
	LDA ($32),Y
loc3_B6C5:
	PHA
	CLC
	ADC YoshiXPos
	STA YoshiXPos
	PLA
	BMI bra3_B6D7
	LDA YoshiXScreen
	ADC #$00
	BPL bra3_B6DC
bra3_B6D7:
	LDA YoshiXScreen
	SBC #$00
bra3_B6DC:
	STA YoshiXScreen
	INY
	LDA ($32),Y
	BMI bra3_B6FD
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra3_B6F1
	CMP #$F0
	BCC bra3_B70F
bra3_B6F1:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc3_B70F
bra3_B6FD:
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra3_B70F
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
bra3_B70F:
loc3_B70F:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B721
	LDA YoshiIdleMovement
	EOR #$40
	STA YoshiIdleMovement
	JMP bra3_B73F
bra3_B721:
	AND #$F0
	BEQ bra3_B73F
	LDA ($32),Y
	AND #$3F
	BNE bra3_B734
	LDA $05F7
	AND #$80
	STA $05F7
	RTS
bra3_B734:
	STA $32
	LDA $05F7
	SEC
	SBC $32
	STA $05F7
bra3_B73F:
	INC $05F7
	RTS
sub3_B743:
	STY $2B
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_B750
	LDA #$00
	BEQ bra3_B752
bra3_B750:
	LDA #$20
bra3_B752:
	STA $36
	LDA #$16
	BNE bra3_B767
sub3_B758:
	STY $2B
	LDA YoshiIdleMovement
	AND #$40
	BEQ bra3_B763
	LDA #$20
bra3_B763:
	STA $36
	LDA #$22
bra3_B767:
	STA $38
	LDA YoshiXPos
	CLC
	ADC $36
	STA $A8
	LDA YoshiXScreen
	ADC #$00
	STA $A9
	LDA YoshiYPos
	STA $AA
	LDA YoshiYScreen
	STA $AB
	JMP loc3_B0A8
jmp_54_B785:
	TXA
	ADC $E4
	STA $E4
	AND #$01
	BNE bra3_B797
	TXA
	ADC $E4
	TYA
	ADC $E4
	STA $E4
	RTS
bra3_B797:
	ADC $E4
	STA $E4
	ROR
	ROR
	ADC $E4
	STA $E4
	RTS
sub3_B7A2:
	STY $2B
	TAY
	LDA ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	STA $AB
	TYA
	BMI bra3_B7C7
	CLC
	ADC $AA
	STA $AA
	BCS bra3_B7BD
	CMP #$F0
	BCC bra3_B7D5
bra3_B7BD:
	CLC
	ADC #$10
	STA $AA
	INC $AB
	JMP loc3_B7D5
bra3_B7C7:
	CLC
	ADC $AA
	STA $AA
	BCS bra3_B7D5
	SEC
	SBC #$10
	STA $AA
	DEC $AB
bra3_B7D5:
loc3_B7D5:
	LDA $36
	TAY
	CLC
	ADC ObjectXPos,X
	STA $A8
	TYA
	BMI bra3_B7E8
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B7ED
bra3_B7E8:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B7ED:
	STA $A9
	JMP loc3_B0CF
sub3_B7F2:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B807
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS
sub3_B807:
	LDX $A4
	LDA $0641,X
	ASL
	TAY
	LDA InterruptMode
	CMP #$04
	BNE bra3_B833
	LDA ($32),Y
	STA $06E2
	INY
	LDA ($32),Y
	STA $06E3
	INY
	LDA ($32),Y
	CMP #$80
	BNE bra3_B82F
	INC ObjectAction,X
	LDA #$FF
	STA $0641,X
bra3_B82F:
	INC $0641,X
	RTS
bra3_B833:
	LDA ($32),Y
	STA $28
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B849
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B84E
bra3_B849:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B84E:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	STA $2B
	BMI bra3_B871
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B865
	CMP #$F0
	BCC bra3_B883
bra3_B865:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B883
bra3_B871:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B883
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B883:
loc3_B883:
	INY
	LDA ($32),Y
	CMP #$80
	BNE bra3_B892
	INC ObjectAction,X
	LDA #$FF
	STA $0641,X
bra3_B892:
	INC $0641,X
	RTS
jmp_54_B896:
	LDA tbl_51_F000,Y
	STA $34
	LDA tbl_51_F000+1,Y
	STA $35
	LDA ObjectAction,X
	ASL
	ASL	;Multiply the object's action value by 4
	STA $3F	;Back up in RAM
	TAY	;Use as pointer index
	LDA ($34),Y ;Load value pointer 
	ASL
	TAY	;Get the index for the previously loaded value
	LDA tbl3_B8BF,Y
	STA $32
	LDA tbl3_B8BF+1,Y
	STA $33	;Store the pointer in RAM
	LDA #$00
	STA $28
	STA $2B
	JMP ($32)	;Jump to the pointer
tbl3_B8BF:
	.word ptr11_B8DB
	.word ptr11_B968
	.word ptr11_B983
	.word ptr11_B989
	.word ptr11_B99B
	.word ptr11_B99C
	.word ptr11_B9D6
	.word ptr11_BA1C
	.word ptr11_BA6B
	.word ptr11_BA78
	.word ptr11_BA81
	.word ptr11_BA96
	.word ptr11_BAA2
	.word ptr11_B9DF
ptr11_B8DB:
	LDY $3F
	INY
	LDA InterruptMode
	CMP #$04
	BNE bra3_B904
	LDA ($34),Y
	STA $06E2
	INY
	LDA ($34),Y
	STA $06E3
	INC $0641,X
	LDA $0641,X
	INY
	CMP ($34),Y
	BCC $B903
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
	RTS
bra3_B904:
	LDA ($34),Y
	STA $28
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_B91A
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_B91F
bra3_B91A:
	LDA ObjectXScreen,X
	SBC #$00
bra3_B91F:
	STA ObjectXScreen,X
	INY
	LDA ($34),Y
	STA $2B
	BMI bra3_B942
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B936
	CMP #$F0
	BCC bra3_B954
bra3_B936:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B954
bra3_B942:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B954
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B954:
loc3_B954:
	INC $0641,X
	LDA $0641,X
	INY
	CMP ($34),Y
	BCC bra3_B967_RTS
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
bra3_B967_RTS:
	RTS
ptr11_B968:
	LDY $3F
	INY
	LDA ($34),Y
	CLC
	ADC #$2C
	STA $25
	INY
	LDA ($34),Y
	STA $26
	LDA FrameCount
	AND $26
	BNE bra3_B982_RTS
	LDA $25
	JSR sub3_B7F2
bra3_B982_RTS:
	RTS
ptr11_B983:
	LDA #$00
	STA ObjectAction,X
	RTS
ptr11_B989:
	LDA $0668
	BNE bra3_B992
	INC ObjectAction,X
	RTS
bra3_B992:
	LDY $3F
	INY
	LDA ($34),Y
	STA ObjectAction,X
	RTS
ptr11_B99B:
	RTS
ptr11_B99C:
	LDA ObjectVariables,X
	AND #$7F
	CMP #$07
	BCS bra3_B9A8
	INC ObjectVariables,X
bra3_B9A8:
	BMI bra3_B9C3
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_B9B7
	CMP #$F0
	BCC bra3_B9D5_RTS
bra3_B9B7:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_B9D5_RTS
bra3_B9C3:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS $B9D5
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_B9D5_RTS:
loc3_B9D5_RTS:
	RTS
ptr11_B9D6:
	LDY $3F
	INY
	LDA ($34),Y
	STA ObjectAction,X
	RTS
ptr11_B9DF:
	LDA ObjXScreenDistance,X
	BPL bra3_B9F1
	LDA #$05
	CLC
	ADC #$20
	CLC
	ADC ObjectXDistance,X
	BCS bra3_B9F8
	BCC bra3_BA18
bra3_B9F1:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra3_BA18
bra3_B9F8:
	LDA ObjYScreenDistance,X
	BEQ bra3_BA0E
	CMP #$FF
	BNE bra3_BA18
	LDA #$10
	CLC
	ADC #$0C
	CLC
	ADC ObjectYDistance,X
	BCS bra3_BA15
	BCC bra3_BA18
bra3_BA0E:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_BA18
bra3_BA15:
	CLC
	BCC bra3_BA19
bra3_BA18:
	SEC
bra3_BA19:
	JMP loc3_BA56
ptr11_BA1C:
	LDA ObjXScreenDistance,X
	BPL bra3_BA2E
	LDA #$05
	CLC
	ADC #$30
	CLC
	ADC ObjectXDistance,X
	BCS bra3_BA35
	BCC bra3_BA55
bra3_BA2E:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra3_BA55
bra3_BA35:
	LDA ObjYScreenDistance,X
	BEQ bra3_BA4B
	CMP #$FF
	BNE bra3_BA55
	LDA #$10
	CLC
	ADC #$0C
	CLC
	ADC ObjectYDistance,X
	BCS bra3_BA52
	BCC bra3_BA55
bra3_BA4B:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_BA55
bra3_BA52:
	CLC
	BCC bra3_BA56
bra3_BA55:
	SEC
bra3_BA56:
loc3_BA56:
	BCS bra3_BA6A_RTS
	LDA PlayerYSpeed
	BEQ bra3_BA6A_RTS
	LDA PlayerMovement
	AND #$04
	BNE bra3_BA6A_RTS
	LDY $3F
	INY
	LDA ($34),Y
	STA ObjectAction,X
bra3_BA6A_RTS:
	RTS
ptr11_BA6B:
	LDY $3F
	INY
	LDA ($34),Y
	CLC
	ADC ObjectAction,X
	STA ObjectAction,X
	RTS
ptr11_BA78:
	LDA $06DC
	BEQ bra3_BA80_RTS
	INC ObjectAction,X
bra3_BA80_RTS:
	RTS
ptr11_BA81:
	LDY $3F
	LDA ObjectXDistance,X
	CMP #$E8
	BCC bra3_BA8B
	INY
bra3_BA8B:
	INY
	LDA ($34),Y
	CLC
	ADC ObjectAction,X
	STA ObjectAction,X
	RTS
ptr11_BA96:
	INC $05F7
	LDA #$00
	STA ObjectAction,X
	STA $05F6
	RTS
ptr11_BAA2:
	LDA #$01
	STA $28
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_BAB8
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_BABD
bra3_BAB8:
	LDA ObjectXScreen,X
	SBC #$00
bra3_BABD:
	STA ObjectXScreen,X
	LDA #$00
	STA $2B
	INC ObjectVariables,X
	LDA ObjectVariables,X
	CMP #$50
	BCC bra3_BADB_RTS
	LDA #$00
	STA ObjectVariables,X
	DEC EnemyAnimFrame,X
	BNE bra3_BADB_RTS
	INC ObjectAction,X
bra3_BADB_RTS:
	RTS
	LDX $A4
	LDA ObjectVariables,X
	ASL
	TAY
	LDA ($32),Y
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_BAF7
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_BAFC
bra3_BAF7:
	LDA ObjectXScreen,X
	SBC #$00
bra3_BAFC:
	STA ObjectXScreen,X
	INY
	LDA ($32),Y
	BMI bra3_BB1D
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_BB11
	CMP #$F0
	BCC bra3_BB2F
bra3_BB11:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP bra3_BB2F
bra3_BB1D:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_BB2F
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_BB2F:
	INY
	LDA FrameCount
	AND $25
	BNE bra3_BB49
	LDA ($32),Y
	AND #$F0
	BEQ bra3_BB55
	CMP #$F0
	BEQ bra3_BB55
	LDA ($32),Y
	AND #$3F
	BNE bra3_BB4A
	STA ObjectVariables,X
bra3_BB49:
	RTS
bra3_BB4A:
	STA $32
	LDA ObjectVariables,X
	SEC
	SBC $32
	STA ObjectVariables,X
bra3_BB55:
	INC ObjectVariables,X
	RTS
sub_54_BB59:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA tbl3_A97B,Y
	CLC
	ADC ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	ADC #$00
	STA $AB
	JMP loc3_BB81
sub_54_BB73:
	STY $2B
	LDX $A4
	LDA ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	STA $AB
loc3_BB81:
	LDA ObjectXPos,X
	STA $A8
	LDA ObjectXScreen,X
	STA $A9
	JMP loc3_B0CF
sub_54_BB8E:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA tbl3_A87B,Y
	CLC
	ADC ObjectXPos,X
	STA $A8
	LDA ObjectXScreen,X
	ADC #$00
	STA $A9
	JMP loc3_BBB6
sub_54_BBA8:
	STY $2B
	LDX $A4
	LDA ObjectXPos,X
	STA $A8
	LDA ObjectXScreen,X
	STA $A9
loc3_BBB6:
	LDA ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	STA $AB
	JMP loc3_B0CF
jmp_54_BBC3:
	LDA ObjectVariables,X
	AND #$1F
	TAY
	LDA tbl3_BC1E,Y
	PHA
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X
	PLA
	BMI bra3_BBDE
	LDA ObjectXScreen,X
	ADC #$00
	BPL bra3_BBE3
bra3_BBDE:
	LDA ObjectXScreen,X
	SBC #$00
bra3_BBE3:
	STA ObjectXScreen,X
	TYA
	CLC
	ADC #$08
	AND #$1F
	TAY
	LDA tbl3_BC1E,Y
	BMI bra3_BC0B
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_BBFF
	CMP #$F0
	BCC bra3_BC1D_RTS
bra3_BBFF:
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
	JMP loc3_BC1D_RTS
bra3_BC0B:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X
	BCS bra3_BC1D_RTS
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
bra3_BC1D_RTS:
loc3_BC1D_RTS:
	RTS
tbl3_BC1E:
	.byte $FC
	.byte $FC
	.byte $FD
	.byte $FD
	.byte $FE
	.byte $FE
	.byte $FF
	.byte $FF
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $03
	.byte $03
	.byte $02
	.byte $02
	.byte $01
	.byte $01
	.byte $FF
	.byte $FF
	.byte $FE
	.byte $FE
	.byte $FD
	.byte $FD
	.byte $FC
	.byte $FC
jmp_54_BC3E:
	LDX $A4
	LDY ObjectSlot,X
	LDA tbl3_A87B,Y
	STA $36
	LDA tbl3_A97B,Y
	STA $38
	LDY #$10
	LDA PlayerPowerup
	BEQ bra3_BC56
	LDY #$18
bra3_BC56:
	LDA PlayerAction
	CMP #$07
	BNE bra3_BC5E
	LDY #$08
bra3_BC5E:
	STY $32
	LDA ObjXScreenDistance,X
	BPL bra3_BC72
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC ObjectXDistance,X
	BCS bra3_BC79
	BCC bra3_BC99
bra3_BC72:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra3_BC99
bra3_BC79:
	LDA ObjYScreenDistance,X
	BEQ bra3_BC8F
	CMP #$FF
	BNE bra3_BC99
	LDA $32
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra3_BC96
	BCC bra3_BC99
bra3_BC8F:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_BC99
bra3_BC96:
	CLC
	BCC bra3_BC9A
bra3_BC99:
	SEC
bra3_BC9A:
	BCC bra3_BCA6_RTS
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	PLA
	PLA
bra3_BCA6_RTS:
	RTS
sub_54_BCA7:
	LDA #sfxEnemyHit2
	STA SFXRegister
	LDA #$30
	STA PlayerYSpeed
	STA PlayerXSpeed
	LDA PlayerMovement
	ORA #$04
	AND #$BE
	STA PlayerMovement
	LDA #$01
	JMP loc3_BCD4
jmp_54_BCBE:
	LDA #sfxEnemyHit2
	STA SFXRegister
jmp_54_BCC2:
	LDA #$08
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	EOR #$01
	STA PlayerMovement
	LDA #$08
	STA PlayerXSpeed
	LDA #$01
sub3_BCD4:
loc3_BCD4:
	ASL
	STY $2B
	STX $28
	TAY
	LDA CurrentPlayer
	ASL
	TAX
	LDA ScoreTbl+1,Y
	STA $32
	LDA ScoreTbl,Y
	CLC
	ADC P1Score,X
	STA P1Score,X
	LDA P1Score+1,X
	ADC $32
	STA P1Score+1,X
	LDY $2B
	LDX $28
	RTS
ScoreTbl:
	.byte $0A
	.byte $00
	.byte $14
	.byte $00
	.byte $32
	.byte $00
	.byte $64
	.byte $00
sub3_BD03:
	LDA ObjectSlot,X
	CMP #$E1
	BEQ bra3_BD17_RTS
	STY $2B
	STX $28
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BNE bra3_BD18
bra3_BD17_RTS:
	RTS
bra3_BD18:
	LDA #$00
	STA $4B
	LDA $4A
	CMP #$06
	BCC bra3_BD2C
	LDX CurrentPlayer
	INC Player1Lives,X
	LDA #$07
	BNE bra3_BD31
bra3_BD2C:
	INC $4A
	CLC
	ADC #$11
bra3_BD31:
	STA SFXRegister
	LDY $2B
	LDX $28
	LDA #$01
	JSR sub3_BCD4
	RTS
jmp_54_BD3D:
	LDA ObjectVariables,X
	BPL bra3_BD6B_RTS
	AND #$7F
	BEQ bra3_BD6C
	CMP #$40
	BCC bra3_BD66
	LDA ObjectSlot,X
	AND #$FE
	CMP #$6C
	BNE bra3_BD56
	PLA
	PLA
	RTS
bra3_BD56:
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectAction,X
	LDA #$FF
	STA ObjectVariables,X
bra3_BD66:
	INC ObjectVariables,X
	PLA
	PLA
bra3_BD6B_RTS:
	RTS
bra3_BD6C:
	LDA #$F2
	STA ObjectAction,X
	LDY #$22
	LDA PlayerPowerup
	BNE bra3_BD7F
	LDA Player1YoshiStatus
	BNE bra3_BD7F
	LDY #$18
bra3_BD7F:
	STY $25
	LDA ObjXScreenDistance,X
	BPL bra3_BD93
	LDA #$06
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra3_BD9A
	BCC bra3_BDBA
bra3_BD93:
	LDA ObjectXDistance,X
	CMP #$06
	BCS bra3_BDBA
bra3_BD9A:
	LDA ObjYScreenDistance,X
	BEQ bra3_BDB0
	CMP #$FF
	BNE bra3_BDBA
	LDA $25
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra3_BDB7
	BCC bra3_BDBA
bra3_BDB0:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_BDBA
bra3_BDB7:
	CLC
	BCC bra3_BDBB
bra3_BDBA:
	SEC
bra3_BDBB:
	BCS bra3_BE27
	LDA ObjectSlot,X
	CMP #$39
	BEQ bra3_BDCE
	LDA PlayerYSpeed
	BEQ bra3_BE27
	LDA PlayerMovement
	AND #$04
	BEQ bra3_BE27
bra3_BDCE:
loc3_BDCE:
	INC ObjectVariables,X
	LDA PlayerPowerup
	BNE bra3_BDE6
	LDA ObjectSlot,X
	CMP #$0C
	BEQ bra3_BDE1
	CMP #$0D
	BNE bra3_BDE6
bra3_BDE1:
	LDA #$0B
	STA ObjectSlot,X	;Spawn a mushroom in
bra3_BDE6:
	LDA #sfxBlockRelease
	STA SFXRegister	;Play the block release sound
	LDY ObjectCount
	INC ObjectCount	;Set the index for the new object
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y	;Copy the coordinate data over to the spawned mushroom
	LDA ObjectSlot,X
	STA ObjectSlot,Y	;Copy the slot value to the mushroom
	LDA #$00
	STA ObjectVariables,Y
	STA ObjectAction,Y
	STA ObjActionTimer,Y
	STA EnemyAnimFrame,Y
	LDA ObjectState,Y
	AND #$E0
	ORA #$04
	STA ObjectState,Y
	PLA
	PLA
	RTS
bra3_BE27:
	LDX #$FF
bra3_BE29:
loc3_BE29:
	INX
	LDA ObjectSlot,X
	CMP #$38
	BEQ bra3_BE46
	CMP #$46
	BEQ bra3_BE46
	CMP #$47
	BEQ bra3_BE46
	CMP #$04
	BNE bra3_BE4D
	LDA ObjectState,X
	AND #$0F
	CMP #$07
	BNE bra3_BE4D
bra3_BE46:
	LDA ObjectState,X
	AND #$20
	BEQ bra3_BE54
bra3_BE4D:
	CPX ObjectCount
	BCC bra3_BE29
	PLA
	PLA
	RTS
bra3_BE54:
	LDY $A4
	STY $32
	CPX $32
	BEQ bra3_BE29
	LDA ObjectXPos,X
	SEC
	SBC ObjectXPos,Y
	STA $32
	LDA ObjectXScreen,X
	SBC ObjectXScreen,Y
	STA $33
	LDA ObjectYPos,X
	SEC
	SBC ObjectYPos,Y
	STA $34
	LDA ObjectYScreen,X
	SBC ObjectYScreen,Y
	STA $35
	LDA $33
	BPL bra3_BE8F
	CMP #$FF
	BNE bra3_BE29
	LDA #$10
	CLC
	ADC $32
	BCS bra3_BE97
	BCC bra3_BE29
bra3_BE8F:
	BNE bra3_BE29
	LDA $32
	CMP #$10
	BCS bra3_BE29
bra3_BE97:
	LDA $35
	BPL bra3_BEA9
	CMP #$FF
	BNE bra3_BE29
	LDA #$10
	CLC
	ADC $34
	BCS bra3_BEB7
	JMP loc3_BE29
bra3_BEA9:
	BEQ bra3_BEAE
	JMP loc3_BE29
bra3_BEAE:
	LDA $34
	CMP #$12
	BCC bra3_BEB7
	JMP loc3_BE29
bra3_BEB7:
	LDX $A4
	JMP loc3_BDCE
jmp_54_BEBC:
	LDX $A4
	LDY ObjectSlot,X
	LDA tbl3_A87B,Y
	STA $36
	LDA tbl3_A97B,Y
	STA $38
	LDY #$10
	LDA PlayerPowerup
	BEQ bra3_BED4
	LDY #$18
bra3_BED4:
	LDA PlayerAction
	CMP #$07
	BNE bra3_BEDC
	LDY #$08
bra3_BEDC:
	STY $32
	LDA ObjXScreenDistance,X
	BPL bra3_BEF0
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC ObjectXDistance,X
	BCS bra3_BEF7
	BCC bra3_BF17
bra3_BEF0:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra3_BF17
bra3_BEF7:
	LDA ObjYScreenDistance,X
	BEQ bra3_BF0D
	CMP #$FF
	BNE bra3_BF17
	LDA $32
	CLC
	ADC $38
	CLC
	ADC ObjectYDistance,X
	BCS bra3_BF14
	BCC bra3_BF17
bra3_BF0D:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_BF17
bra3_BF14:
	CLC
	BCC bra3_BF18
bra3_BF17:
	SEC
bra3_BF18:
	BCC bra3_BF25
bra3_BF1A:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	PLA
	PLA
	RTS
bra3_BF25:
	LDA ObjYScreenDistance,X
	BPL bra3_BF51
	LDA ObjectYDistance,X
	CMP #$F2
	BCC bra3_BF51
	LDA PlayerAction
	CMP #$0D
	BEQ bra3_BF41
	CMP #$0E
	BEQ bra3_BF41
	LDA PlayerMovement
	AND #$04
	BNE bra3_BF51
bra3_BF41:
	LDA InvincibilityTimer
	BNE bra3_BF4B
	LDA #$F6
	STA InvincibilityTimer
bra3_BF4B:
	LDA #$01
	JSR sub3_BCD4
	RTS
bra3_BF51:
	LDA InvincibilityTimer
	BEQ bra3_BF6E
	CMP #$D0
	BCS bra3_BF1A
	LDX $A4
	LDA ObjectState,X
	AND #$E0
	ORA #$04
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	PLA
	PLA
	RTS
bra3_BF6E:
	JSR sub3_BF7A
	PLA
	PLA
	RTS
jmp_54_BF74:
	LDA InvincibilityTimer
	BEQ bra3_BF7A
	RTS
bra3_BF7A:
sub3_BF7A:
	LDX $A4
	LDA ObjectSlot,X
	CMP #$48
	BCC bra3_BF87
	CMP #$4C
	BCC bra3_BF9B
bra3_BF87:
	LDA ObjXScreenDistance,X
	BMI bra3_BF93
	LDA ObjectState,X
	ORA #$40
	BNE bra3_BF98
bra3_BF93:
	LDA ObjectState,X
	AND #$BF
bra3_BF98:
	STA ObjectState,X
bra3_BF9B:
	LDA #$00
	STA PlayerHoldFlag
	LDA Player1YoshiStatus
	BEQ bra3_BFAD
	LDA #$01
	STA HurtFlag
	JMP loc3_BFC0
bra3_BFAD:
	LDA PlayerPowerup
	BEQ bra3_BFD2
	LDA #$00
	STA PlayerPowerup
	LDA #$01
	STA PlayerPowerupBuffer
	LDA #$07
	STA Event
loc3_BFC0:
	LDA #$D0
	STA InvincibilityTimer
	LDA #$0C
	STA SFXRegister
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra3_BFD2:
	LDA #$04
	STA Event
	LDA #$00
	STA EventPart
	STA PlayerState
	STA $06DC
	STA $06DD
	RTS
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
