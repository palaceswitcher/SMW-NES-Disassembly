;disassembled by BZK 6502 Disassembler
jmp_54_A000:
	LDA YoshiUnmountedState
	BNE bra3_A006 ;If riding Yoshi, branch
	RTS
bra3_A006:
	LDA Event
	CMP #$04
	BEQ bra3_A023 ;If the player is dying, branch
	LDA #$35
	STA ObjectPRGBank ;Set current object bank to 53
	LDA ObjectPRGBank
	STA M90_PRG0 ;Swap the current object bank in
	LDA #$33
	STA M90_PRG3 ;Swap bank 51 into the 4th PRG slot
	JSR obj_h36 ;Jump
	LDA #$3F
	STA M90_PRG3 ;Swap bank 63 back in
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
;Calculate distance between the player and Yoshi
	LDA YoshiYPos
	SEC
	SBC PlayerYPosDup
	STA YoshiYDistance
	LDA YoshiYScreen
	SBC PlayerYScreenDup
	STA YoshiYScreenDist

	LDA PlayerYScreenDup
	CMP YoshiYScreen
	BEQ loc3_A07D_RTS ;Stop if the player and Yoshi are on the same vertical screen
	LDA YoshiYScreenDist
	BPL bra3_A06C ;Move Yoshi up if he's at a higher screen than the player
;Move Yoshi 16 pixels down (If on a lower vertical screen)
	LDA YoshiYDistance
	CLC
	ADC #$10
	STA YoshiYDistance
	LDA YoshiYScreenDist
	ADC #$00
	STA YoshiYScreenDist

	JMP loc3_A07D_RTS ;Jump

;Move Yoshi 16 pixels up
bra3_A06C:
	LDA YoshiYDistance
	SEC
	SBC #$10
	STA YoshiYDistance
	LDA YoshiYScreenDist
	SBC #$00
	STA YoshiYScreenDist
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
	dw ptr4_A0D8
	dw obj_h01
	dw obj_h02
	dw obj_h03
	dw obj_h04
	dw obj_h05
	dw obj_h06
	dw obj_h07
	dw obj_h08
	dw obj_h09
	dw obj_h0A
	dw obj_h0B
	dw obj_h0C
	dw obj_h0D
	dw obj_h0E
	dw obj_h0F
	dw obj_h10
	dw obj_h10
	dw obj_h12
	dw obj_h12
	dw obj_h14
	dw obj_h14
	dw obj_h16
	dw obj_h16
	dw obj_h16
	dw obj_h16
	dw obj_h1A
	dw obj_h1A
	dw obj_h1C
	dw obj_h1C
	dw obj_h1E
	dw obj_h1E
	dw obj_h1E
	dw obj_h1E
	dw obj_h1E
	dw obj_h1E
	dw obj_h24
	dw obj_h24
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h26
	dw obj_h2E
	dw obj_h2E
	dw obj_h30
	dw obj_h30
	dw obj_h30
	dw obj_h30
	dw obj_h30
	dw obj_h30
	dw obj_h36
	dw obj_h36
	dw obj_h38
	dw obj_h0B
	dw obj_h3A
	dw obj_h3A
	dw obj_h3C
	dw obj_h3C
	dw obj_h3C
	dw obj_h3C
	dw obj_h3C
	dw obj_h3C
	dw obj_h42
	dw obj_h42
	dw obj_h44
	dw obj_h44
	dw obj_h38
	dw obj_h38
	dw obj_h48
	dw obj_h49
	dw obj_h4A
	dw obj_h4A
	dw obj_h4C
	dw obj_h4C
	dw obj_h4E
	dw obj_h4E
	dw obj_h4E
	dw obj_h4E
	dw obj_h30
	dw obj_h30
	dw obj_h54
	dw obj_h54
	dw obj_h54
	dw obj_h54
	dw obj_h58
	dw obj_h58
	dw obj_h5A
	dw obj_h5A
	dw obj_h5C
	dw obj_h5C
	dw obj_h5C
	dw obj_h5C
	dw obj_h5A
	dw obj_h5A
	dw obj_h5A
	dw obj_h5A
	dw obj_h64
	dw obj_h64
	dw obj_h66
	dw obj_h66
	dw obj_h66
	dw obj_h66
	dw obj_h6A
	dw obj_h6B
	dw obj_h6C
	dw obj_h6C
	dw obj_h6E
	dw obj_h6E
	dw obj_h70
	dw obj_h64
	dw obj_h72
	dw obj_h72
	dw obj_h74
	dw obj_h72
	dw obj_h76
	dw obj_h77
	dw obj_h78 ;Object 0x78 (Reznor Fire)
	dw obj_h54 ;Object 0x79 (Fuzzy)
	dw obj_h7A
	dw obj_h7A
	dw obj_h7C
	dw obj_h7D
	dw obj_h7E
	dw obj_h7E ;Object 0x7F (Urchin)
	dw ptr4_A0D8 ;Unused excess pointers
	db $62
	db $95
	db $90
	db $95
	db $30
	db $96
	db $60
	db $96
	db $B7
	db $96
	db $D5
	db $96
	db $D5
	db $96
	db $F8
	db $96
	db $F8
	db $96
	db $F8
	db $96
	db $24
	db $97
	db $42
	db $97
	db $69
	db $97
	db $9C
	db $97
	db $C3
	db $97
	db $0E
	db $82
	db $0E
	db $82
	db $0E
	db $82
	db $0E
	db $82
	db $0E
	db $82
	db $0E
	db $82
	db $57
	db $86
	db $57
	db $86
	db $5B
	db $86
	db $5B
	db $86
	db $4B
	db $88
	db $4B
	db $88
	db $12
	db $89
	db $12
	db $89
	db $A0
	db $8A
	db $A0
	db $8A
	db $A0
	db $8A
	db $A0
	db $8A
	db $A0
	db $8A
	db $A0
	db $8A
	db $DE
	db $8C
	db $DE
	db $8C
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $17
	db $8E
	db $90
	db $8F
	db $90
	db $8F
	db $18
	db $91
	db $18
	db $91
	db $18
	db $91
	db $18
	db $91
	db $18
	db $91
	db $18
	db $91
	db $0E
	db $82
	db $0E
	db $82
	db $60
	db $96
	db $24
	db $97
	db $49
	db $93
	db $49
	db $93
	db $B5
	db $95
	db $B5
	db $95
	db $B5
	db $95
	db $B5
	db $95
	db $B5
	db $95
	db $B5
	db $95
	db $CD
	db $99
	db $CD
	db $99
	db $11
	db $9A
	db $11
	db $9A
	db $68
	db $9A
	db $68
	db $9A
	dw ptr5_9DA5
	db $B7
	db $96
	db $08
	db $80
	db $08
	db $80
	db $FB
	db $9B
	db $FB
	db $9B
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $18
	db $91
	db $18
	db $91
	db $39
	db $80
	db $39
	db $80
	db $39
	db $80
	db $39
	db $80
	db $0E
	db $82
	db $0E
	db $82
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $89
	db $93
	db $89
	db $93
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $08
	db $80
	db $8D
	db $95
	db $27
	db $97
	db $A9
	db $99
	db $A9
	db $99
	db $0E
	db $82
	db $0E
	db $82
	db $A2
	db $8C
	db $64
	db $93
	db $DB
	db $8C
	db $DB
	db $8C
	db $DB
	db $9B
	db $DB
	db $8C
	db $39
	db $80
	db $00
	db $80
	db $00
	db $80
	db $39
	db $80
	db $0E
	db $82
	db $0E
	db $82
	db $D8
	db $A0
	db $D8
	db $A0
	db $70
	db $96
	db $70
	db $96
tbl3_A3B5:
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $35
	db $35
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $37
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $35
	db $31
	db $31
	db $35
	db $35
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $32
	db $32
	db $31
	db $31
	db $31
	db $31
	db $35
	db $35
	db $32
	db $32
	db $37
	db $37
	db $32
	db $32
	db $32
	db $32
	db $35
	db $32
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $35
	db $37
	db $31
	db $31
tbl3_A435:
	dw obj_h80
	dw obj_h80
	dw obj_h82
	dw obj_h82
	dw obj_h84
	dw obj_h84
	dw obj_h86
	dw obj_h86
	dw obj_h88
	dw obj_h88
	dw obj_h8A
	dw obj_h8A
	dw obj_h8C
	dw obj_h8C
	dw obj_h8E
	dw obj_h8E
	dw obj_h90
	dw obj_h90
	dw obj_h92
	dw obj_h92
	dw obj_h94
	dw obj_h94
	dw obj_h96
	dw obj_h96
	dw obj_h98
	dw obj_h98
	dw obj_h9A
	dw obj_h9A
	dw obj_h9C
	dw obj_h9C
	dw obj_h9E
	dw obj_h9E
	dw obj_hA0
	dw obj_hA0
	dw obj_hA2
	dw obj_hA2
	dw obj_hA4
	dw obj_hA4
	dw obj_hA6
	dw obj_hA6
	dw obj_hA8
	dw obj_hA8
	dw obj_hA8
	dw obj_hA8
	dw obj_hAA
	dw obj_hAA
	dw obj_hAC
	dw obj_hAC
	dw obj_hAE
	dw obj_hAE
	dw obj_hB0
	dw obj_hB0
	dw obj_hB2
	dw obj_hB2
	dw obj_hB4
	dw obj_hB4
	dw obj_hB6
	dw ptr4_A0D8
	dw obj_hB8
	dw ptr4_A0D8
	dw obj_hBA
	dw ptr4_A0D8
	dw ptr4_A0D8
	dw obj_hBD
	dw obj_hBE
	dw obj_hBE
	dw obj_hC0
	dw obj_hC0
	dw obj_hC2
	dw obj_hC2
	dw obj_hBE
	dw obj_hBE
	dw obj_hC0
	dw obj_hC0
	dw obj_hC2
	dw obj_hC2
	dw obj_hBE
	dw obj_hBE
	dw obj_hC0
	dw obj_hC0
	dw obj_hCE
	dw obj_hCE
	dw obj_hD0
	dw obj_hD0
	dw obj_hD2
	dw obj_hD2
	dw obj_hD4
	dw obj_hD5
	dw obj_hD6
	dw obj_hD6
	dw obj_hD8
	dw obj_hD8
	dw obj_hDA
	dw obj_hDA
	dw obj_hDC
	dw obj_hDC
	dw obj_hDE
	dw obj_hDF
	dw obj_hE0
	dw obj_hE0
	dw obj_hE2
	dw obj_hE2
	dw obj_hE4
	dw obj_hE4
	dw obj_hE6
	dw obj_hE7
	dw obj_hE8
	dw obj_hE8
	dw obj_hE8 ;1st bonus block
	dw obj_hE8
	dw obj_hE8 ;2nd bonus block
	dw obj_hED
	dw obj_hED ;3rd bonus block
	dw obj_hED
	dw obj_hF0
	dw obj_hF0
	dw obj_hED
	dw obj_hED
	dw obj_hF4
	dw obj_hF4
	dw obj_hF4
	dw obj_hF4
	dw obj_h58
	dw obj_h58
	dw obj_hFA
	dw obj_hFA
	dw obj_hFA
	dw obj_hFA
	db $F1
	db $8B
	db $F1
	db $8B
	db $93
	db $90
	db $93
	db $90
	db $B3
	db $83
	db $B3
	db $83
	db $FE
	db $87
	db $FE
	db $87
	db $7B
	db $81
	db $7B
	db $81
	db $19
	db $95
	db $19
	db $95
	db $32
	db $96
	db $32
	db $96
	db $44
	db $85
	db $44
	db $85
	db $44
	db $85
	db $44
	db $85
	db $FE
	db $87
	db $FE
	db $87
	db $E0
	db $88
	db $E0
	db $88
	db $97
	db $88
	db $97
	db $88
	db $17
	db $85
	db $17
	db $85
	db $5E
	db $8A
	db $5E
	db $8A
	db $95
	db $8D
	db $95
	db $8D
	db $15
	db $8F
	db $15
	db $8F
	db $C7
	db $82
	db $C7
	db $82
	db $80
	db $99
	db $80
	db $99
	db $80
	db $99
	db $80
	db $99
	db $79
	db $9B
	db $79
	db $9B
	db $87
	db $9A
	db $87
	db $9A
	db $87
	db $9A
	db $87
	db $9A
	db $79
	db $92
	db $79
	db $92
	db $B7
	db $93
	db $B7
	db $93
	db $71
	db $8B
	db $71
	db $8B
	db $28
	db $8E
	db $28
	db $8E
	db $C4
	db $90
	db $C4
	db $90
	db $0E
	db $99
	db $0E
	db $99
	db $CE
	db $8E
	db $D8
	db $A0
	db $2E
	db $8F
	db $D8
	db $A0
	db $2E
	db $8F
	db $D8
	db $A0
	db $D8
	db $A0
	db $49
	db $83
	dw ptr9_843B
	dw ptr9_843B
	db $40
	db $86
	db $40
	db $86
	db $C8
	db $87
	db $C8
	db $87
	db $3B
	db $84
	db $3B
	db $84
	db $40
	db $86
	db $40
	db $86
	db $C8
	db $87
	db $C8
	db $87
	dw ptr9_843B
	dw ptr9_843B
	db $40
	db $86
	db $40
	db $86
	db $81
	db $8A
	db $81
	db $8A
	db $59
	db $8D
	db $59
	db $8D
	db $1A
	db $90
	db $1A
	db $90
	db $D8
	db $A0
	db $D8
	db $A0
	db $86
	db $92
	db $86
	db $92
	db $E1
	db $98
	db $E1
	db $98
	db $B7
	db $98
	db $B7
	db $98
	db $BE
	db $98
	db $BE
	db $98
	db $D1
	db $88
	db $F9
	db $88
	db $00
	db $80
	db $00
	db $80
	db $75
	db $84
	db $75
	db $84
	db $75
	db $84
	db $75
	db $84
	db $ED
	db $9B
	db $51
	db $99
	db $51
	db $99
	db $51
	db $99
	db $51
	db $99
	db $51
	db $99
	db $51
	db $99
	db $D8
	db $A0
	db $D8
	db $A0
	db $D8
	db $A0
	db $D8
	db $A0
	db $D8
	db $A0
	db $D8
	db $A0
	db $D8
	db $A0
	db $00
	db $80
	db $00
	db $80
	db $00
	db $80
	db $00
	db $80
	db $0E
	db $82
	db $0E
	db $82
	db $CB
	db $96
	db $CB
	db $96
	db $CB
	db $96
	db $CB
	db $96
tbl3_A635:
	db $38
	db $38
	db $38
	db $38
	db $32
	db $32
	db $32
	db $32
	db $32
	db $32
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $32
	db $32
	db $32
	db $32
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $38
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $25
	db $30
	db $25
	db $30
	db $30
	db $25
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $30
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $25
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $31
	db $37
	db $37
	db $31
	db $31
	db $25
	db $25
	db $25
	db $25
	db $37
	db $37
	db $31
	db $31
	db $31
	db $31
loc3_A6B5:
	LDA #$00
	STA ObjectAction,X
	STA ObjectSlot,X
	STA ObjectState,X
	STA ObjectVariables,X ;Wipe the object from memory
	LDA $058C,X
	TAY
	LDX tbl_51_FC80,Y
	LDA $03CE,X
	AND tbl_51_FD80,Y
	STA $03CE,X
	RTS

;-----OBJECT FUNCTION-----
;Address: $A6D4
;-------------------------
jmp_54_A6D4:
	LDA Player1YoshiStatus
	BNE --- ;Stop if the player is riding Yoshi
		LDA PlayerPowerup
		CMP #$03
		BCS ++ ;Only continue if the player has a cape
---	RTS

++	LDA PlayerPrevAction
	CMP #$05
	BNE --- ;Branch if the player wasn't spinning
		LDX $A4
		LDY ObjectSlot,X
		LDA ObjectXHitBoxSizes,Y
		STA $36
		LDA ObjectYHitBoxSizes,Y
		STA $38
		LDA ObjXScreenDistance,X
		BPL bra3_A708 ;Branch if the player is to the left of the object
		;If player is to the right of the object:
			LDA #16
			CLC
			ADC $36
			CLC
			ADC ObjectXDistance,X ;X Hitbox + 16 + X Distance > 255
			BCS bra3_A70F ;Branch if the player is within 16 pixels of the object's hitbox (cape distance)
			BCC bra3_A72F ;Otherwise, set carry and stop

bra3_A708:
	LDA ObjectXDistance,X
	CMP #$10
	BCS bra3_A72F
bra3_A70F:
	LDA ObjYScreenDistance,X
	BEQ bra3_A725 ;Skip these checks if the player's origin is already above or at the object's origin
	CMP #$FF
	;If neither conditions are met, the player's origin must be below the object's
	BNE bra3_A72F ;Don't kill the object if it's off screen?
		LDA #24
		CLC
		ADC $38
		CLC
		ADC ObjectYDistance,X ;Y hitbox + 24 + Y Distance > 255
		BCS + ;Kill the object if the player is within 24 vertical pixels of the object's hitbox
		BCC bra3_A72F ;Otherwise, don't kill it and stop
bra3_A725:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra3_A72F ;Don't kill the object if the player is above its hitbox
;Otherwise, continue and kill the object 
+	CLC
	BCC + ;Clear the carry and continue
bra3_A72F:
	SEC
+	BCS +++ ;Stop if the carry flag was set
		LDA ObjectState,X
		AND #%11100000 ;Clear lower 5 bits of object's status
		ORA #%00000100 ;Enable collision check
		STA ObjectState,X
		LDA #$00
		STA ObjectVariables,X ;Reset object animation(?)
		LDA #$01
		JSR RewardPoints ;Give 200 points
		LDA #sfxEnemyHit2
		STA SFXRegister ;Play hit sound
		PLA
		PLA ;Discard previous return address go back two calls, since this object is no longer active.
+++	RTS

jmp_54_A74D:
	LDA Player1YoshiStatus
	BNE bra3_A758
	LDA PlayerPrevAction
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
	BPL bra3_A785 ;Branch if the player is a screen ahead of the object
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
	BCS bra3_A7AC ;Branch if the player isn't within 8 horizontal pixels of the object's hitbox
bra3_A78C:
	LDA ObjYScreenDistance,X
	BEQ bra3_A7A2 ;Branch if the player is to the left of the object
	CMP #$FF
	BNE bra3_A7AC ;Branch if the player isn't to the right of the object
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
	BCS bra3_A7AC ;Branch if the player is above the object's hitbox?
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
	LDX $A4 ;Get index for current object
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
	BPL bra3_A7CB ;Branch if the player is left of the object
bra3_A7E8:
	LDX PlayerAnimationFrame
	CPX #$06
	BCC bra3_A852 ;Make sure the player is on the 6th or less frame of their current animation?
	LDA tbl3_A85F,X
	STA $32 ;Store pointer based off the player's animation frame
	LDY $A4 ;Get index for current object
	LDX ObjectSlot,Y
	LDA ObjectXHitBoxSizes,X
	STA $36 ;Load pointer for object into memory
	LDA ObjectYHitBoxSizes,X
	STA $38
	LDX $A4
	LDA ObjXScreenDistance,X
	BPL bra3_A816
	LDA $32
	CLC
	ADC $36 ;Add [unknown1] to [unknown2]
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
	AND #$E0 ;Mask out the lower 5 bits
	ORA #$03
	STA ObjectState,X ;Set the lower 2 bits, changing the collision state to make the object vulnerable to Yoshi's tongue(?)
	RTS
tbl3_A85F:
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $18
	db $20
	db $28
	db $30
	db $28
	db $20
	db $18
	db $18
tbl3_A86D:
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $0B
	db $0B
	db $0A
	db $09
	db $0A
	db $0B
	db $0C
	db $0D
;A87B
ObjectXHitBoxSizes:
	db $00
	db $00
	db $10
	db $10
	db $10 ;Koopa shell
	db $10
	db $08
	db $08
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10 ;Koopa
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $20
	db $20
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $18
	db $18
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $18
	db $18
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $30
	db $30
	db $30
	db $12
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $30
	db $30
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $18
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $18
	db $18
	db $20
	db $20
	db $10
	db $10
	db $18
	db $18
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $18
	db $18
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $18
	db $18
	db $18
	db $18
	db $10
	db $10
	db $18
	db $18
	db $18
	db $18
	db $10
	db $10
	db $10
	db $10
	db $08
	db $08
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $10
	db $18
	db $18
	db $20
	db $20
	db $18
	db $18
	db $18
	db $18
	db $20
	db $20
	db $18
	db $18
	db $18
	db $18
	db $20
	db $20
	db $18
	db $18
	db $18
	db $18
	db $20
	db $20
	db $08
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $30
	db $30
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
;A97B
ObjectYHitBoxSizes:
	db $00
	db $00
	db $10
	db $10
	db $10 ;Koopa shell
	db $10
	db $08
	db $08
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20 ;Koopa
	db $20
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $10
	db $10
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $18
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $08
	db $08
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $28
	db $28
	db $50
	db $50
	db $88
	db $88
	db $28
	db $28
	db $28
	db $28
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $10
	db $20
	db $18
	db $03
	db $18
	db $10
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $18
	db $18
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $10
	db $10
	db $10
	db $10
	db $08
	db $08
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $18
	db $18
	db $08
	db $38
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $10
	db $08
	db $28
	db $40
	db $40
	db $20
	db $20
	db $10
	db $10
	db $10
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $40
	db $40
	db $40
	db $40
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
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
	LDA ObjectXHitBoxSizes,X
	LSR
	CLC
	ADC $37
	STA $32
	LDA ObjectYHitBoxSizes,X
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
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $18
	db $28
	db $30
	db $28
	db $18
	db $00
	db $00
tbl3_AB1B:
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $10
	db $10
	db $20
	db $28
	db $20
	db $10
	db $10
	db $10
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

;----------------------------------------
;SUBROUTINE
;Updates player and object values when an object is picked up.
;----------------------------------------
SetObjectCarryState:
	LDA Player1YoshiStatus
	BNE SetObjectCarryStateDone ;Make sure the player isn't riding Yoshi
	LDA PlayerHoldFlag
	BNE SetObjectCarryStateDone ;Stop if the player is already carrying something
	LDA PlayerAction+1
	CMP #$04
	BCS SetObjectCarryStateDone ;Only continue if player is either walking, running, or doing nothing
	LDA ButtonsHeld
	AND #buttonB
	BEQ SetObjectCarryStateDone ;Make sure the B button is held
	STA PlayerHoldFlag
	LDY $A4 ;Get index for current object
	LDA ObjectState,Y
	ORA #$80
	STA ObjectState,Y ;Set object to "held"
	PLA
	PLA ;Add 2 to stack pointer? The accumulator is overwritten after every call to this routine, so this is seemingly useless.
SetObjectCarryStateDone:
	RTS
	
;----------------------------------------
;SUBROUTINE
;Positions carried objects.
;----------------------------------------
PositionCarriedObject:
	LDY $A4
	LDA ObjectState,Y
	AND #$80
	BNE bra3_AB9C ;Branch if the object is being carried
	;Otherwise, stop
		RTS
bra3_AB9C:
	LDA ButtonsHeld
	AND #buttonB
	STA PlayerHoldFlag ;Set the player's carrying flag if the B button is held
	BEQ bra3_AC08 ;Branch if the B button isn't being held
	LDA PlayerMovement
	AND #$40
	BNE bra3_ABBB ;Branch if the player is facing left
	;Otherwise, offset the carried sprite to the right
		LDA PlayerXPosDup
		CLC
		ADC #$06
		STA ObjectXPos,Y ;Offset the object 6 pixels right of the player
		LDA PlayerXScreenDup
		ADC #$00 ;Update the X screen if needed (high byte)
		JMP loc3_ABC7

bra3_ABBB:
	LDA PlayerXPosDup
	SEC
	SBC #$16
	STA ObjectXPos,Y ;Offset the carried object's X position by 22 ($16) pixels
	LDA PlayerXScreenDup
	SBC #$00

loc3_ABC7:
	STA ObjectXScreen,Y ;Update the X screen when needed (high byte)
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y
	LDA #$EC ;Offset object -20 pixels vertically, or 20 pixels up from the player's sprite
	BMI bra3_ABEE ;Always branch
;This code is skipped due to the branch above
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y
	BCS bra3_ABDF
	CMP #$F0
	BCC PositionCarriedObjectDone
bra3_ABDF:
	CLC
	ADC #$10
	STA ObjectYPos,Y
	LDA ObjectYScreen,Y
	CLC
	ADC #$01
	JMP jmp_54_AC02

;Continue here
bra3_ABEE:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y ;Offset object 20 pixels above the origin of the player's sprite
	BCS PositionCarriedObjectDone ;Stop if adding overflows and subtracts 20, which occurs for values 20 ($14) and higher
	;If it doesn't overflow and subtract properly, subtract 16 ($10) and decrement the upper byte
		SEC
		SBC #$10
		STA ObjectYPos,Y ;Subtract 16
		LDA ObjectYScreen,Y
		SEC
		SBC #$01 ;Decrement upper byte
;--------------------
;SUB-SUBROUTINE
;Sets current object's Y screen.
;--------------------
jmp_54_AC02:
	STA ObjectYScreen,Y
PositionCarriedObjectDone:
	PLA
	PLA ;Add 2 to stack pointer? Seemingly useless.
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
	db $FC
	db $FD
	db $FE
	db $01
	db $02
	db $03
	db $04
	db $FF
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
	db $00
	db $00
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
	db $02
	db $03
	db $00
	db $00
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
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	db $00
	db $00
	db $00
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
	db $00
	db $01
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
tbl3_AFC3:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
sub3_B043:
	STY $2B
	LDX $A4
	LDY ObjectSlot,X
	LDA #$08
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	LDA ObjectXHitBoxSizes,Y
bra3_B06C:
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	LDA ObjectXHitBoxSizes,Y
bra3_B088:
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	BCC loc3_B0CF
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
	BCS loc3_B0CF
	SEC
	SBC #$10
	STA $AA
	DEC $AB
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
	ORA tbl_51_FE00,Y
	TAY
	LDA DataBank1
	STA M90_PRG0
	LDA ($34),Y
	TAY
	LDA DataBank2
	STA M90_PRG0
	LDA ($DA),Y
	TAY
	LDA tbl_51_FF00,Y
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
	JSR GetSpeedData
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS

;----------------------------------------
;SUBROUTINE
;Loads speed data from a table and updates the object's variable accordingly.
; Parameters:
; > $0032: Speed table pointer
; > Object Variable: Used to determine which speed values to load from the table
;----------------------------------------
GetSpeedData:
	LDX $A4 ;Get index of current object
	LDA ObjectVariables,X
	AND #%01111111 ;Clear upper bit of object variable
	ASL
	TAY ;Get speed data index
	LDA ObjectState,X
	AND #$40
	BEQ LoadObjSpeedRight ;Branch if object is facing right
	;If the object is facing left, invert its X speed value
		LDA ($32),Y
		EOR #$FF
		CLC
		ADC #$01 ;(x XOR 255) + 1 == -x
		JMP StoreObjSpeedData ;Continue
	;If object is facing right, load X speed value as normal
	LoadObjSpeedRight:
		LDA ($32),Y

StoreObjSpeedData:
	STA $06E2 ;Store X speed

;Load Y speed from next byte in table
	INY
	LDA ($32),Y
	STA $06E3

	LDA InterruptMode
	CMP #$04
	BEQ ChangeObjDirection ;Branch if in the bowser fight
	;Otherwise, add X speed to the object's position
		LDA $06E2
		PHA ;Backup object X speed
		CLC
		ADC ObjectXPos,X
		STA ObjectXPos,X ;Add X speed value to object's horizontal position
		PLA ;Get X speed
		BMI ObjNegXSpeedCalcHi ;Branch if speed is negative, subtracting upper byte of X position
		LDA ObjectXScreen,X
		ADC #$00 ;Otherwise, if speed is positive, add the upper byte of the X position
		BPL StoreObjXSpeedCalc ;Continue if the position doesn't overflow
		;Subtract upper byte of object's horizontal position
		ObjNegXSpeedCalcHi:
			LDA ObjectXScreen,X
			SBC #$00

StoreObjXSpeedCalc:
	STA ObjectXScreen,X ;Store upper byte of object's horizontal position

;Add positive vertical speed
	LDA $06E3
	BMI ObjNegYSpeedCalc ;Branch if object's Y speed is negative (moving upwards)
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Otherwise, if speed is positive, add to low byte
	BCS ObjYSpeedCalcHi ;Branch if it carries over (crossing vertical screen boundary)
	CMP #$F0
	BCC ChangeObjDirection ;If adding 10 wouldn't doesn't carry over, branch
	;Add high byte and move 16 bytes down if addition carries over
	ObjYSpeedCalcHi:
		CLC
		ADC #$10
		STA ObjectYPos,X
		INC ObjectYScreen,X ;Carry over addition and add 16 ($10)
		JMP ChangeObjDirection

;Subtract negative vertical speed (if speed value is negative)
ObjNegYSpeedCalc:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Subtract low byte
	BCS ChangeObjDirection ;Branch if subtraction doesn't carry over to high byte
	;Otherwise, carry over subtraction and subtract 16 ($10)
		SEC
		SBC #$10
		STA ObjectYPos,X
		DEC ObjectYScreen,X

;Change object's direction if needed and update X/Y speed table index
ChangeObjDirection:
	INY ;Move to next byte
	LDA ($32),Y
	CMP #$FF
	BNE UpdateObjSpeedDataIndex ;Branch if next byte isn't a direction change
	;If it does change direction, turn the object around
		LDA ObjectState,X
		EOR #%01000000
		STA ObjectState,X ;Turn object around
		JMP GetSpeedDataDone
	;If the next X speed byte doesn't change direction, change object variable accordingly
	UpdateObjSpeedDataIndex:
		AND #%11110000
		BEQ GetSpeedDataDone ;Branch if upper nybble of next byte is clear, moving to the next set of speed values from the table
		;Otherwise, check if lower 6 bits are clear
			LDA ($32),Y
			AND #%00111111
			BNE SubObjXYSpeedIndex ;Branch if bits 0 - 5 aren't clear
			STA ObjectVariables,X ;If they are clear, set the X/Y speed index directly
			RTS
		;If bits 0 - 5 of the next byte aren't clear, subtract the X/Y speed set index by the lower 6 bits of the next byte
		SubObjXYSpeedIndex:
			STA $32 ;Save lower 6 bits of next byte
			LDA ObjectVariables,X
			SEC
			SBC $32
			STA ObjectVariables,X ;Move back the amount of X/Y speed sets in the lower 6 bits (highest bit of the subtrahend will be cleared)

;Move to next set of X/Y speeds in the table
GetSpeedDataDone:
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
	LDY #$00 ;Clear Y reg
	LDA ($32),Y ;Load movement data
	TAY ;Copy it to the Y reg
	LDA ObjectState,X
	AND #$40
	BEQ bra3_B26E ;Branch if the object is facing right
	TYA ;Load the movement data
	EOR #$FF ;Negate the value
	TAY ;Copy it back to the Y register
	INY ;Increase it by 1
bra3_B26E:
	TYA ;Copy it back to the accumulator
	PHA ;Push into stack
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X ;Move the object by adding to its position
	PLA ;Pull the value that was just added
	BMI bra3_B281 ;Branch if it's negative
	LDA ObjectXScreen,X
	ADC #$00 ;Update the horizontal screen (if the object is going left?)
	BPL bra3_B286 ;Branch if the screen is negative?
bra3_B281:
	LDA ObjectXScreen,X
	SBC #$00 ;Update the horizontal screen (if the object is going right?)
bra3_B286:
	STA ObjectXScreen,X ;Update it in memory
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
	LDA ($32),Y ;Load movement data
	BMI bra3_B2D3 ;Branch if bit 7 of is set
	JSR sub3_B077 ;Otherwise, jump
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
	STA M90_PRG0 ;Swap PRG bank out for current object
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
	STA ObjectState,X ;Flip the object horizontally
bra3_B3E4:
loc3_B3E4:
	LDA ObjectState,X
	AND #%01000000
	BEQ bra3_B3F5 ;If the object is facing right, branch
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
	STA ObjectVariables,X ;Clear object variable
	TAY ;Set object direction to right
	LDA ObjXScreenDistance,X
	BMI bra3_B5C8 ;Branch if the object is behind the player, setting its direction to right
	LDY #$40 ;If the object is ahead of the player, set object direction to left
bra3_B5C8:
	TYA
	STA ObjectState,X ;Store object direction
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
	ASL ;Multiply the object's action value by 4
	STA $3F ;Back up in RAM
	TAY ;Use as pointer index
	LDA ($34),Y ;Load value pointer 
	ASL
	TAY ;Get the index for the previously loaded value
	LDA tbl3_B8BF,Y
	STA $32
	LDA tbl3_B8BF+1,Y
	STA $33 ;Store the pointer in RAM
	LDA #$00
	STA $28
	STA $2B
	JMP ($32) ;Jump to the pointer
tbl3_B8BF:
	dw ptr11_B8DB
	dw ptr11_B968
	dw ptr11_B983
	dw ptr11_B989
	dw ptr11_B99B
	dw ptr11_B99C
	dw ptr11_B9D6
	dw ptr11_BA1C
	dw ptr11_BA6B
	dw ptr11_BA78
	dw ptr11_BA81
	dw ptr11_BA96
	dw ptr11_BAA2
	dw ptr11_B9DF
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
	LDA ObjectYHitBoxSizes,Y
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
	LDA ObjectXHitBoxSizes,Y
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
	db $FC
	db $FC
	db $FD
	db $FD
	db $FE
	db $FE
	db $FF
	db $FF
	db $01
	db $01
	db $02
	db $02
	db $03
	db $03
	db $04
	db $04
	db $04
	db $04
	db $03
	db $03
	db $02
	db $02
	db $01
	db $01
	db $FF
	db $FF
	db $FE
	db $FE
	db $FD
	db $FD
	db $FC
	db $FC
jmp_54_BC3E:
	LDX $A4
	LDY ObjectSlot,X
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
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
	JMP RewardPoints
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

;----------------------------------------
;SUBROUTINE ($BCD4)
;Rewards one of 4 score values from a table on the value of the accumulator.
;----------------------------------------
RewardPoints:
	ASL ;Get score data index
	STY $2B
	STX $28 ;Back up X and Y registers
	TAY
	LDA CurrentPlayer
	ASL
	TAX ;Get appropriate offset for current player's score
	LDA ScoreTbl+1,Y
	STA $32 ;Get high byte
	
	;Add to player's score
	LDA ScoreTbl,Y
	CLC
	ADC P1Score,X
	STA P1Score,X
	LDA P1Score+1,X
	ADC $32
	STA P1Score+1,X
	
	;Restore original X and Y registers
	LDY $2B
	LDX $28
	RTS
ScoreTbl:
	dw 100/10
	dw 200/10
	dw 500/10
	dw 1000/10

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
	BCC bra3_BD2C ;Branch if <6 enemies have been hit
	LDX CurrentPlayer
	INC Player1Lives,X ;If 7 more have been hit, give the current player a life
	LDA #$07
	BNE bra3_BD31 ;Play 1UP sound
bra3_BD2C:
	INC $4A ;Increment hit counter
	CLC
	ADC #$11 ;Play next hit sound
bra3_BD31:
	STA SFXRegister ;Play appropriate sound
	LDY $2B
	LDX $28
	LDA #$01
	JSR RewardPoints
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
	STA ObjectSlot,X ;Spawn a mushroom in
bra3_BDE6:
	LDA #sfxBlockRelease
	STA SFXRegister ;Play the block release sound
	LDY ObjectCount
	INC ObjectCount ;Set the index for the new object
	LDA ObjectXPos,X
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	LDA ObjectYPos,X
	STA ObjectYPos,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y ;Copy the coordinate data over to the spawned mushroom
	LDA ObjectSlot,X
	STA ObjectSlot,Y ;Copy the slot value to the mushroom
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
	LDX $A4 ;Get current object index
	LDY ObjectSlot,X
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
	STA $38
	LDY #$10 ;Set default player hitbox to 16 pixels high
	LDA PlayerPowerup
	BEQ bra3_BED4 ;Branch if the player is small, keeping their hitbox at 16 pixels high
	LDY #$18 ;Otherwise, if they have a powerup, make their hitbox 24 pixels high
bra3_BED4:
	LDA PlayerAction
	CMP #$07
	BNE bra3_BEDC ;Don't change the player's hitbox size if they aren't ducking
	LDY #$08 ;If the player is ducking, make their hitbox 8 pixels high
bra3_BEDC:
	STY $32
	LDA ObjXScreenDistance,X
	BPL bra3_BEF0
	;Object X Distance + Hitbox X Offset + 5
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC ObjectXDistance,X
	BCS bra3_BEF7 ;Branch if the distance 
	BCC bra3_BF17
bra3_BEF0:
	LDA ObjectXDistance,X
	CMP #$05
	BCS bra3_BF17
bra3_BEF7:
	LDA ObjYScreenDistance,X
	BEQ bra3_BF0D ;Branch if the player is on the same vertical screen as the object
	CMP #$FF
	BNE bra3_BF17 ;Branch if the player is on a screen above the object
	;Otherwise, continue if the player is a screen below the object
	;Player Vertical Hitbox offset(?) + Hitbox Y offset + Object X offset
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
	JSR RewardPoints
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
	BEQ sub3_BF7A
	RTS
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
	BEQ bra3_BFAD ;Branch if player isn't on Yoshi
	;Otherwise, inflict damage
		LDA #$01
		STA HurtFlag
		JMP loc3_BFC0
bra3_BFAD:
	LDA PlayerPowerup
	BEQ bra3_BFD2 ;Branch if the player is already small
	;Otherwise, make the player small
		LDA #$00
		STA PlayerPowerup
	LDA #$01
	STA PlayerPowerupBuffer ;Make the game buffer while the player is taking damage
	LDA #$07
	STA Event ;Pause game to change powerup
loc3_BFC0:
	LDA #$D0
	STA InvincibilityTimer ;Give player invulnerability frames
	LDA #sfxPowerDown
	STA SFXRegister ;Play hurt sound
	LDA ObjectState,X
	AND #%11100000
	STA ObjectState,X ;Mask out upper 3 bits of object's state
	RTS
bra3_BFD2:
	LDA #evt1_Death
	STA Event ;Trigger death event
	LDA #$00
	STA EventPart ;Go to first part of event
	STA PlayerState
	STA $06DC
	STA $06DD ;Clear player variables
	RTS