;------------------------------------------------------------
; OBJECT BANK
; This bank handles objects and contains various functions relating to them. Object-specific things will be kept here for convenience sake
;------------------------------------------------------------
jmp_54_A000:
	LDA yoshiUnmountedState
	BNE bra3_A006 ; If riding Yoshi, branch
	RTS
bra3_A006:
	LDA gameState
	CMP #$04
	BEQ bra3_A023 ; If the player is dying, branch
	LDA #$35
	STA curObjPrgBank ; Set current object bank to 53
	LDA curObjPrgBank
	STA M90_PRG0 ; Swap the current object bank in
	LDA #$33
	STA M90_PRG3 ; Swap bank 51 into the 4th PRG slot
	JSR obj0x36 ; Jump
	LDA #$3F
	STA M90_PRG3 ; Swap bank 63 back in
	RTS
bra3_A023:
	LDA yoshiXLo
	SEC
	SBC playerXLoDup
	STA yoshiXDistLo
	LDA yoshiXHi
	SBC playerXHiDup
	STA yoshiXDistHi
	BEQ bra3_A03B
	CMP #$FF
	BEQ bra3_A03B
	RTS
bra3_A03B:
; Calculate distance between the player and Yoshi
	LDA yoshiYLo
	SEC
	SBC playerYLoDup
	STA yoshiYDist
	LDA yoshiYHi
	SBC playerYHiDup
	STA yoshiYDistHi

	LDA playerYHiDup
	CMP yoshiYHi
	BEQ loc3_A07D_RTS ; Stop if the player and Yoshi are on the same vertical screen
	LDA yoshiYDistHi
	BPL bra3_A06C ; Move Yoshi up if he's at a higher screen than the player
; Move Yoshi 16 pixels down (If on a lower vertical screen)
	LDA yoshiYDist
	CLC
	ADC #$10
	STA yoshiYDist
	LDA yoshiYDistHi
	ADC #$00
	STA yoshiYDistHi

	JMP loc3_A07D_RTS ; Jump

; Move Yoshi 16 pixels up
bra3_A06C:
	LDA yoshiYDist
	SEC
	SBC #$10
	STA yoshiYDist
	LDA yoshiYDistHi
	SBC #$00
	STA yoshiYDistHi
loc3_A07D_RTS:
	RTS
jmp_54_A07E:
	LDX #$00
bra3_A080:
	STX $A4
	LDA objSlot,X
	BEQ bra3_A08F
	LDA #$33
	STA M90_PRG3
	JSR sub3_A09C
bra3_A08F:
	LDX $A4
	INX
	CPX objCount
	BCC bra3_A080
	LDA #$3F
	STA M90_PRG3
	RTS
sub3_A09C:
	LDY objSlot,X
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
	STA curObjPrgBank
	LDA curObjPrgBank
	STA M90_PRG0
	LDA objSlot,X
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
	LDA objSlot,X
	BEQ bra3_A148
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra3_A100
	CMP #$FF
	BEQ bra3_A100
	JMP objRemoveObject
bra3_A100:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra3_A142
jmp_54_A118:
	LDA objYDistHi,X
	BPL bra3_A131
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc3_A142
bra3_A131:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra3_A142:
loc3_A142:
	LDA freezeFlag
	BEQ bra3_A148
	RTS
bra3_A148:
	LDX $A4
	INX
	CPX objCount
	BCC bra3_A0DB
	RTS
jmp_54_A150:
	LDX #$00
bra3_A152:
	LDA objSlot,X
	BEQ bra3_A15D
	INX
	CPX objCount
	BCC bra3_A152
	RTS
bra3_A15D:
	TXA
	TAY
	INY
bra3_A160:
	LDA objSlot,Y
	BEQ bra3_A1AD
	LDA objXLo,Y
	STA objXLo,X
	LDA objXHi,Y
	STA objXHi,X
	LDA objYLo,Y
	STA objYLo,X
	LDA objYHi,Y
	STA objYHi,X
	LDA objSlot,Y
	STA objSlot,X
	LDA objState,Y
	STA objState,X
	LDA objVar,Y
	STA objVar,X
	LDA $058C,Y
	STA $058C,X
	LDA $0641,Y
	STA $0641,X
	LDA enemyAnimFrame,Y
	STA enemyAnimFrame,X
	LDA objAction,Y
	STA objAction,X
	LDA #$00
	STA objSlot,Y
	INX
bra3_A1AD:
	INY
	CPY objCount
	BCC bra3_A160
	STX objCount
	RTS

;----------------------------------------
; OBJECTS 00-7F ($A1B5)
tbl3_A1B5:
	.word ptr4_A0D8
	
	OBJ_YOSHI = ($-tbl3_A1B5)/2
	.word objYoshiBox

	OBJ_PSWITCH = ($-tbl3_A1B5)/2
	.word objPSwitch

	OBJ_SPRING = ($-tbl3_A1B5)/2
	.word objSpring

	OBJ_SHELL = ($-tbl3_A1B5)/2
	.word objShell

	OBJ_1UP = ($-tbl3_A1B5)/2
	.word obj1UP

	OBJ_PFIREBALL1 = ($-tbl3_A1B5)/2
	.word obj0x06

	OBJ_PFIREBALL2 = ($-tbl3_A1B5)/2
	.word obj0x07

	OBJ_YOSHIFIRE_TOP = ($-tbl3_A1B5)/2
	.word obj0x08

	OBJ_YOSHIFIRE_MIDDLE = ($-tbl3_A1B5)/2
	.word obj0x09

	OBJ_YOSHIFIRE_BOTTOM = ($-tbl3_A1B5)/2
	.word obj0x0A

	OBJ_MUSHROOM = ($-tbl3_A1B5)/2
	.word obj0x0B

	OBJ_FIREFLOWER = ($-tbl3_A1B5)/2
	.word obj0x0C

	OBJ_FEATHER = ($-tbl3_A1B5)/2
	.word obj0x0D

	OBJ_STAR = ($-tbl3_A1B5)/2
	.word obj0x0E

	OBJ_POP = ($-tbl3_A1B5)/2
	.word obj0x0F

	OBJ_KOOPA = ($-tbl3_A1B5)/2
	.word objKoopa
	.word objKoopa

	OBJ_BEACHKOOPA = ($-tbl3_A1B5)/2
	.word obj0x12
	.word obj0x12

	OBJ_PARATROOPA_BOUNCING = ($-tbl3_A1B5)/2
	.word obj0x14
	.word obj0x14

	OBJ_REX = ($-tbl3_A1B5)/2
	.word obj0x16
	.word obj0x16

	OBJ_REX_STOMPED = ($-tbl3_A1B5)/2
	.word obj0x16
	.word obj0x16

	OBJ_PIRANHAPLANT = ($-tbl3_A1B5)/2
	.word obj0x1A
	.word obj0x1A

	OBJ_PIRANHAPLANTMASK = ($-tbl3_A1B5)/2
	.word obj0x1C
	.word obj0x1C

	OBJ_SUPERKOOPA_CAPE = ($-tbl3_A1B5)/2
	.word obj0x1E
	.word obj0x1E

	OBJ_SUPERKOOPA_JUMP = ($-tbl3_A1B5)/2
	.word obj0x1E

	OBJ_SUPERKOOPA_STRAIGHT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x1E

	OBJ_SUPERKOOPA_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x1E

	OBJ_SUPERKOOPA_FLYUP = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x1E

	OBJ_VOLCANOLOTUS = ($-tbl3_A1B5)/2
	.word obj0x24
	.word obj0x24

	OBJ_LOTUSPOLLEN1 = ($-tbl3_A1B5)/2
	.word obj0x26
	.word obj0x26

	OBJ_LOTUSPOLLEN2 = ($-tbl3_A1B5)/2
	.word obj0x26
	.word obj0x26

	OBJ_LOTUSPOLLEN3 = ($-tbl3_A1B5)/2
	.word obj0x26
	.word obj0x26

	OBJ_LOTUSPOLLEN4 = ($-tbl3_A1B5)/2
	.word obj0x26
	.word obj0x26

	OBJ_SWOOPER = ($-tbl3_A1B5)/2
	.word obj0x2E
	.word obj0x2E

	OBJ_BLURP_HORIZONTAL = ($-tbl3_A1B5)/2
	.word obj0x30
	.word obj0x30

	OBJ_BLURP_VERTICAL = ($-tbl3_A1B5)/2
	.word obj0x30
	.word obj0x30

	OBJ_BLURP_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x30

	OBJ_BLURP_RIGHT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x30

	OBJ_GREENKOOPA = ($-tbl3_A1B5)/2
	.word obj0x36
	.word obj0x36

	OBJ_KOOPASHELL_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x38

	OBJ_MUSHROOM_HIDDEN = ($-tbl3_A1B5)/2
	.word obj0x0B

	OBJ_MECHAKOOPA = ($-tbl3_A1B5)/2
	.word obj0x3A
	.word obj0x3A

	OBJ_MECHAKOOPA_STOMPED1 = ($-tbl3_A1B5)/2
	.word obj0x3C
	.word obj0x3C

	OBJ_MECHAKOOPA_STOMPED2 = ($-tbl3_A1B5)/2
	.word obj0x3C
	.word obj0x3C

	OBJ_MECHAKOOPA_STOMPED3 = ($-tbl3_A1B5)/2
	.word obj0x3C
	.word obj0x3C

	OBJ_BUZZYBEETLE = ($-tbl3_A1B5)/2
	.word obj0x42
	.word obj0x42

	OBJ_BUZZYSHELL = ($-tbl3_A1B5)/2
	.word obj0x44
	.word obj0x44

	OBJ_BUZZYSHELL_KICKED = ($-tbl3_A1B5)/2
	.word obj0x38
	.word obj0x38

	OBJ_PODOBOO_HORIZONTAL = ($-tbl3_A1B5)/2
	.word obj0x48

	OBJ_1UP_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x49

	OBJ_SPIKETOP = ($-tbl3_A1B5)/2
	.word obj0x4A
	.word obj0x4A

	OBJ_GOALTAPE = ($-tbl3_A1B5)/2
	.word obj0x4C
	.word obj0x4C

	OBJ_CLIMBINGKOOPA_HORIZONTAL = ($-tbl3_A1B5)/2
	.word obj0x4E
	.word obj0x4E

	OBJ_CLIMBINGKOOPA_VERTICAL = ($-tbl3_A1B5)/2
	.word obj0x4E ; 50
	.word obj0x4E ; 51

	OBJ_BLURPSTILL = ($-tbl3_A1B5)/2
	.word obj0x30 ; 52 (Blurp)
	.word obj0x30

	OBJ_LINEPLATFORM = ($-tbl3_A1B5)/2
	.word obj0x54 ; 54 (Line Platform)
	.word obj0x54

	OBJ_SHORTPLATFORM = ($-tbl3_A1B5)/2
	.word obj0x54
	.word obj0x54

	OBJ_PARATROOPA_GREEN = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x58
	.word obj0x58

	OBJ_CHAINSAW_UP = ($-tbl3_A1B5)/2
	.word obj0x5A
	.word obj0x5A

	OBJ_ROPE = ($-tbl3_A1B5)/2
	.word obj0x5C
	.word obj0x5C
	.word obj0x5C

	OBJ_ROPE_LONG = ($-tbl3_A1B5)/2
	.word obj0x5C

	OBJ_CHAINSAW_DOWN = ($-tbl3_A1B5)/2
	.word obj0x5A
	.word obj0x5A

	OBJ_CHAINSAW_UP_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x5A
	.word obj0x5A

	OBJ_PODOBOO_DIAG = ($-tbl3_A1B5)/2
	.word obj0x64
	.word obj0x64

	OBJ_PSWITCHPLATFORM = ($-tbl3_A1B5)/2
	.word obj0x66
	.word obj0x66

	OBJ_PDOOR = ($-tbl3_A1B5)/2
	.word obj0x66
	.word obj0x66

	OBJ_PSWITCH_BOXED = ($-tbl3_A1B5)/2
	.word obj0x6A

	OBJ_MUSHROOM_IDLE = ($-tbl3_A1B5)/2
	.word obj0x6B

	OBJ_VINE = ($-tbl3_A1B5)/2
	.word obj0x6C
	.word obj0x6C

	OBJ_BEACHKOOPA_SLIDING = ($-tbl3_A1B5)/2
	.word obj0x6E
	.word obj0x6E

	OBJ_MORTONROY = ($-tbl3_A1B5)/2
	.word obj0x70

	OBJ_PODOBOO_DIAG_BOSS = ($-tbl3_A1B5)/2
	.word obj0x64

	OBJ_LEMMYWENDY = ($-tbl3_A1B5)/2
	.word obj0x72

	OBJ_LEMMYWENDYDUMMY1 = ($-tbl3_A1B5)/2
	.word obj0x72

	OBJ_MIDWAYPOINT = ($-tbl3_A1B5)/2
	.word obj0x74

	OBJ_LEMMYWENDYDUMMY2 = ($-tbl3_A1B5)/2
	.word obj0x72

	OBJ_ONOFFBLOCK = ($-tbl3_A1B5)/2
	.word obj0x76

	OBJ_REZNOR = ($-tbl3_A1B5)/2
	.word obj0x77

	OBJ_REZNORFIRE = ($-tbl3_A1B5)/2
	.word obj0x78 ; Object 0x78 (Reznor Fire)

	OBJ_FUZZY = ($-tbl3_A1B5)/2
	.word obj0x54 ; Object 0x79 (Fuzzy)

	OBJ_BEACHKOOPA_SLIDING_ALT = ($-tbl3_A1B5)/2 ; Verify this
	.word obj0x7A
	.word obj0x7A

	OBJ_LEVELEXIT = ($-tbl3_A1B5)/2
	.word obj0x7C

	OBJ_CASTLECANVAS = ($-tbl3_A1B5)/2
	.word obj0x7D

	OBJ_URCHIN = ($-tbl3_A1B5)/2
	.word obj0x7E
	.word obj0x7E ; Object 0x7F (Urchin)

;----------------------------------------
; Unused duplicated pointers for objects' 00-7F rendering code. Can be found in bank 52
	.word ptr4_A0D8
	.word ptr6_9562 ; 1
	.word ptr6_9590 ; 2
	.word ptr6_9630 ; 3
	.word ptr6_9660 ; 4
	.word ptr6_96B7 ; 5
	.word ptr6_96D5 ; 6
	.word ptr6_96D5 ; 7
	.word ptr7_96F8 ; 8
	.word ptr7_96F8 ; 9
	.word ptr7_96F8 ; a
	.word ptr6_9724 ; b
	.word ptr6_9742 ; c
	.word ptr6_9769 ; d
	.word ptr6_979C ; e
	.word ptr6_97C3 ; f
	.word ptr6_820E ; 10
	.word ptr6_820E ; 11
	.word ptr6_820E ; 12
	.word ptr6_820E ; 13
	.word ptr6_820E ; 14
	.word ptr6_820E ; 15
	.word ptr6_8657 ; 16
	.word ptr6_8657 ; 17
	.word ptr6_865B ; 18
	.word ptr6_865B ; 19
	.word ptr6_884B ; 1a
	.word ptr6_884B ; 1b
	.word ptr6_8912 ; 1c
	.word ptr6_8912 ; 1d
	.word ptr6_8AA0 ; 1e
	.word ptr6_8AA0 ; 1f
	.word ptr6_8AA0 ; 20
	.word ptr6_8AA0 ; 21
	.word ptr6_8AA0 ; 22
	.word ptr6_8AA0 ; 23
	.word ptr6_8CDE ; 24
	.word ptr6_8CDE ; 25
	.word ptr6_8E17 ; 26
	.word ptr6_8E17 ; 27
	.word ptr6_8E17 ; 28
	.word ptr6_8E17 ; 29
	.word ptr6_8E17 ; 2a
	.word ptr6_8E17 ; 2b
	.word ptr6_8E17 ; 2c
	.word ptr6_8E17 ; 2d
	.word ptr6_8F90 ; 2e
	.word ptr6_8F90 ; 2f
	.word ptr6_9118 ; 30
	.word ptr6_9118 ; 31
	.word ptr6_9118 ; 32
	.word ptr6_9118 ; 33
	.word ptr6_9118 ; 34
	.word ptr6_9118 ; 35
	.word ptr6_820E ; 36
	.word ptr6_820E ; 37
	.word ptr6_9660 ; 38
	.word ptr6_9724 ; 39
	.word ptr6_9349 ; 3a
	.word ptr6_9349 ; 3b
	.word ptr6_95B5 ; 3c
	.word ptr6_95B5 ; 3d
	.word ptr6_95B5 ; 3e
	.word ptr6_95B5 ; 3f
	.word ptr6_95B5 ; 40
	.word ptr6_95B5 ; 41
	.word ptr6_99CD ; 42
	.word ptr6_99CD ; 43
	.word ptr6_9A11 ; 44
	.word ptr6_9A11 ; 45
	.word ptr6_9A68 ; 46
	.word ptr6_9A68 ; 47
	.word ptr5_9DA5 ; 48
	.word ptr6_96B7 ; 49
	.word bra5_8008 ; 4a
	.word bra5_8008 ; 4b
	.word ptr6_9BFB ; 4c
	.word ptr6_9BFB ; 4d
	.word bra5_8008 ; 4e
	.word bra5_8008 ; 4f
	.word bra5_8008 ; 50
	.word bra5_8008 ; 51
	.word ptr6_9118 ; 52
	.word ptr6_9118 ; 53
	.word ptr6_8039 ; 54
	.word ptr6_8039 ; 55
	.word ptr6_8039 ; 56
	.word ptr6_8039 ; 57
	.word ptr6_820E ; 58
	.word ptr6_820E ; 59
	.word bra5_8008 ; 5a
	.word bra5_8008 ; 5b
	.word bra5_8008 ; 5c
	.word bra5_8008 ; 5d
	.word bra5_8008 ; 5e
	.word bra5_8008 ; 5f
	.word bra5_8008 ; 60
	.word bra5_8008 ; 61
	.word bra5_8008 ; 62
	.word bra5_8008 ; 63
	.word ptr6_9389 ; 64
	.word ptr6_9389 ; 65
	.word bra5_8008 ; 66
	.word bra5_8008 ; 67
	.word bra5_8008 ; 68
	.word bra5_8008 ; 69
	.word ptr6_958D ; 6a
	.word ptr6_9727 ; 6b
	.word ptr6_99A9 ; 6c
	.word ptr6_99A9 ; 6d
	.word ptr6_820E ; 6e
	.word ptr6_820E ; 6f
	.word ptr6_8CA2 ; 70
	.word ptr6_9364 ; 71
	.word ptr6_8CDB ; 72
	.word ptr6_8CDB ; 73
	.word ptr6_9BDB ; 74
	.word ptr6_8CDB ; 75
	.word ptr6_8039 ; 76
	.word ptr6_8000 ; 77
	.word ptr6_8000 ; 78
	.word ptr6_8039 ; 79
	.word ptr6_820E ; 7a
	.word ptr6_820E ; 7b
	.word ptr4_A0D8 ; 7c (different)
	.word ptr4_A0D8 ; 7d (different)
	.word ptr6_9670 ; 7e
	.word ptr6_9670 ; 7f

;----------------------------------------
; OBJECTS 00 - 7F PRG BANKS ($A3B5)
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

;----------------------------------------
; OBJECTS 80-FF ($A435)
tbl3_A435:
	OBJ_BULLETBILL = ($-tbl3_A435)/2 + $80
	.word obj0x80
	.word obj0x80

	OBJ_EERIE = ($-tbl3_A435)/2 + $80
	.word obj0x82
	.word obj0x82

	OBJ_THWOMP = ($-tbl3_A435)/2 + $80
	.word obj0x84
	.word obj0x84

	OBJ_URCHIN_VERTICAL = ($-tbl3_A435)/2 + $80
	.word obj0x86
	.word obj0x86

	OBJ_NINJI = ($-tbl3_A435)/2 + $80
	.word obj0x88
	.word obj0x88

	OBJ_FISHBONE = ($-tbl3_A435)/2 + $80
	.word obj0x8A
	.word obj0x8A

	OBJ_SPIKEBALL = ($-tbl3_A435)/2 + $80
	.word obj0x8C
	.word obj0x8C

	OBJ_PARACHUTEGOOMBA_ALT = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0x8E
	.word obj0x8E

	OBJ_FUZZY_ALT = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0x90
	.word obj0x90

	OBJ_URCHIN_HORIZONTAL = ($-tbl3_A435)/2 + $80
	.word obj0x92
	.word obj0x92

	OBJ_GOOMBA = ($-tbl3_A435)/2 + $80
	.word obj0x94
	.word obj0x94

	OBJ_GOOMBA_FLIPPED = ($-tbl3_A435)/2 + $80
	.word obj0x96
	.word obj0x96

	OBJ_PARACHUTEGOOMBA = ($-tbl3_A435)/2 + $80
	.word obj0x98
	.word obj0x98

	OBJ_SPINY = ($-tbl3_A435)/2 + $80
	.word obj0x9A
	.word obj0x9A

	OBJ_PODOBOO_VERTICAL = ($-tbl3_A435)/2 + $80
	.word obj0x9C
	.word obj0x9C

	OBJ_PODOBOO_DIAG_ALT = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0x9E
	.word obj0x9E

	OBJ_PARAGOOMBA = ($-tbl3_A435)/2 + $80
	.word obj0xA0
	.word obj0xA0

	OBJ_DRYBONES_THROWING = ($-tbl3_A435)/2 + $80
	.word obj0xA2
	.word obj0xA2

	OBJ_DRYBONES = ($-tbl3_A435)/2 + $80
	.word obj0xA4
	.word obj0xA4

	OBJ_BONE = ($-tbl3_A435)/2 + $80
	.word obj0xA6
	.word obj0xA6

	OBJ_DRYBONES_THROW_BROKEN = ($-tbl3_A435)/2 + $80
	.word obj0xA8
	.word obj0xA8

	OBJ_DRYBONES_BROKEN = ($-tbl3_A435)/2 + $80
	.word obj0xA8 ; AA
	.word obj0xA8 ; AB

	OBJ_BONYBEETLE = ($-tbl3_A435)/2 + $80
	.word obj0xAA ; AC
	.word obj0xAA ; AD

	OBJ_BONYBEETLE_BROKEN = ($-tbl3_A435)/2 + $80
	.word obj0xAC ; AE
	.word obj0xAC ; AF

	OBJ_THING = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xAE
	.word obj0xAE

	OBJ_FOOTBALL = ($-tbl3_A435)/2 + $80
	.word obj0xB0
	.word obj0xB0

	OBJ_ROCK = ($-tbl3_A435)/2 + $80
	.word obj0xB2
	.word obj0xB2

	OBJ_BOOBUDDY = ($-tbl3_A435)/2 + $80
	.word obj0xB4
	.word obj0xB4

	OBJ_PRINCESSPEACH = ($-tbl3_A435)/2 + $80
	.word obj0xB6
	.word ptr4_A0D8

	OBJ_SMOKE = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xB8
	.word ptr4_A0D8
	.word obj0xBA

	OBJ_PSWITCHPLATFORM2 = ($-tbl3_A435)/2 + $80 ; Verify this
	.word ptr4_A0D8
	.word ptr4_A0D8

	OBJ_MUSHROOM_PRINCESS = ($-tbl3_A435)/2 + $80
	.word obj0xBD

	OBJ_CHARGINCHUCK = ($-tbl3_A435)/2 + $80
	.word obj0xBE
	.word obj0xBE

	OBJ_CHARGINCHUCK_CHASE = ($-tbl3_A435)/2 + $80
	.word obj0xC0
	.word obj0xC0 ; Actually C2

	OBJ_CHARGINCHUCK_STUNNED = ($-tbl3_A435)/2 + $80
	.word obj0xC2
	.word obj0xC2

	OBJ_CHARGINCHUCK_HIT = ($-tbl3_A435)/2 + $80
	.word obj0xBE
	.word obj0xBE

	OBJ_CHARGINCHUCK_CHASE_HIT = ($-tbl3_A435)/2 + $80
	.word obj0xC0
	.word obj0xC0

	OBJ_CHARGINCHUCK_STUNNED_HIT = ($-tbl3_A435)/2 + $80
	.word obj0xC2
	.word obj0xC2

	OBJ_CHARGINCHUCK_HIT2 = ($-tbl3_A435)/2 + $80
	.word obj0xBE
	.word obj0xBE

	OBJ_CHARGINCHUCK_CHASE_HIT2 = ($-tbl3_A435)/2 + $80
	.word obj0xC0
	.word obj0xC0

	OBJ_BASEBALLCHUCK = ($-tbl3_A435)/2 + $80
	.word obj0xCE
	.word obj0xCE

	OBJ_FOOTBALLCHUCK = ($-tbl3_A435)/2 + $80
	.word obj0xD0
	.word obj0xD0

	OBJ_DIGGINCHUCK = ($-tbl3_A435)/2 + $80
	.word obj0xD2
	.word obj0xD2

	OBJ_BOOBUDDIESCENTER_ALT = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xD4
	.word obj0xD5

	OBJ_BOOBUDDIESCENTER = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xD6 ; D8
	.word obj0xD6

	OBJ_BOO = ($-tbl3_A435)/2 + $80
	.word obj0xD8 ; DA
	.word obj0xD8

	OBJ_BOOCREWBOO = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xDA ; DC
	.word obj0xDA

	OBJ_BOO_FLYAWAY = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xDC ; DE
	.word obj0xDC

	OBJ_PROPELLER = ($-tbl3_A435)/2 + $80
	.word obj0xDE ; E0

	OBJ_BOWSER = ($-tbl3_A435)/2 + $80
	.word obj0xDF

	OBJ_SPIKE_UP = ($-tbl3_A435)/2 + $80
	.word obj0xE0
	.word obj0xE0

	OBJ_DINORHINO = ($-tbl3_A435)/2 + $80
	.word obj0xE2 ; E4
	.word obj0xE2

	OBJ_DINOTORCH = ($-tbl3_A435)/2 + $80
	.word obj0xE4
	.word obj0xE4

	OBJ_1UP_BONUS = ($-tbl3_A435)/2 + $80
	.word obj0xE6

	OBJ_BONUSBLOCKCOIN = ($-tbl3_A435)/2 + $80
	.word obj0xE7

	OBJ_BONUSBLOCK1 = ($-tbl3_A435)/2 + $80
	.word obj0xE8 ; 1st bonus block (EA)
	.word obj0xE8

	OBJ_BONUSBLOCK2 = ($-tbl3_A435)/2 + $80
	.word obj0xE8 ; 2nd bonus block (EC)
	.word obj0xE8

	OBJ_BONUSBLOCK3 = ($-tbl3_A435)/2 + $80
	.word obj0xE8 ; 3rd bonus block (EE)
	.word obj0xED

	OBJ_PSWITCHPLATFORM3 = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xED ; F0
	.word obj0xED

	OBJ_BGPRIORITY_ABOVE = ($-tbl3_A435)/2 + $80
	.word obj0xF0 ; F2
	.word obj0xF0

	OBJ_BGPRIORITY_BELOW = ($-tbl3_A435)/2 + $80
	.word obj0xED

	OBJ_PIPEEXIT = ($-tbl3_A435)/2 + $80
	.word obj0xED ; F5

	OBJ_SPIKE_DOWN = ($-tbl3_A435)/2 + $80
	.word obj0xF4 ; F6
	.word obj0xF4

	OBJ_SPIKE_UP_ALT = ($-tbl3_A435)/2 + $80 ; Verify this
	.word obj0xF4 ; F8
	.word obj0xF4

	OBJ_PARATROOPA_VERTICAL = ($-tbl3_A435)/2 + $80
	.word obj0x58
	.word obj0x58

	OBJ_COUNTDOWNPLATFORM_1S = ($-tbl3_A435)/2 + $80
	.word obj0xFA ; FC
	.word obj0xFA

	OBJ_COUNTDOWNPLATFORM_4S = ($-tbl3_A435)/2 + $80
	.word obj0xFA ; FE
	.word obj0xFA

;----------------------------------------
; Unused duplicated pointers for objects' 80-FF rendering code. Can be found in bank 52
	.word ptr6_8BF1 ; 80
	.word ptr6_8BF1 ; 81
	.word ptr6_9093 ; 82
	.word ptr6_9093 ; 83
	.word ptr6_83B3 ; 84
	.word ptr6_83B3 ; 85
	.word ptr6_87FE ; 86
	.word ptr6_87FE ; 87
	.word ptr6_817B ; 88
	.word ptr6_817B ; 89
	.word ptr6_9519 ; 8a
	.word ptr6_9519 ; 8b
	.word ptr7_9632 ; 8c
	.word ptr7_9632 ; 8d
	.word ptr6_8544 ; 8e
	.word ptr6_8544 ; 8f
	.word ptr7_8544 ; 90
	.word ptr7_8544 ; 91
	.word ptr6_87FE ; 92
	.word ptr6_87FE ; 93
	.word ptr6_88E0 ; 94
	.word ptr6_88E0 ; 95
	.word ptr6_8897 ; 96
	.word ptr6_8897 ; 97
	.word ptr6_8517 ; 98
	.word ptr6_8517 ; 99
	.word ptr6_8A5E ; 9a
	.word ptr6_8A5E ; 9b
	.word ptr6_8D95 ; 9c
	.word ptr6_8D95 ; 9d
	.word ptr6_8F15 ; 9e
	.word ptr6_8F15 ; 9f
	.word ptr6_82C7 ; a0
	.word ptr6_82C7 ; a1
	.word ptr6_9980 ; a2
	.word ptr6_9980 ; a3
	.word ptr6_9980 ; a4
	.word ptr6_9980 ; a5
	.word ptr6_9B79 ; a6
	.word ptr6_9B79 ; a7
	.word ptr7_9A87 ; a8
	.word ptr7_9A87 ; a9
	.word ptr7_9A87 ; aa
	.word ptr7_9A87 ; ab
	.word ptr6_9279 ; ac
	.word ptr6_9279 ; ad
	.word ptr6_93B7 ; ae
	.word ptr6_93B7 ; af
	.word ptr6_8B71 ; b0
	.word ptr6_8B71 ; b1
	.word ptr6_8E28 ; b2
	.word ptr6_8E28 ; b3
	.word ptr6_90C4 ; b4
	.word ptr6_90C4 ; b5
	.word ptr6_990E ; b6
	.word ptr6_990E ; b7
	.word ptr6_8ECE ; b8
	.word ptr4_A0D8 ; b9 (different)
	.word ptr6_8F2E ; ba
	.word ptr4_A0D8 ; bb (different)
	.word ptr6_8F2E ; bc
	.word ptr4_A0D8 ; bd (different)
	.word ptr4_A0D8 ; be (different)
	.word ptr6_8349 ; bf
	.word ptr9_843B ; c0
	.word ptr9_843B ; c1
	.word ptr6_8640 ; c2
	.word ptr6_8640 ; c3
	.word ptr6_87C8 ; c4
	.word ptr6_87C8 ; c5
	.word ptr9_843B ; c6
	.word ptr9_843B ; c7
	.word ptr6_8640 ; c8
	.word ptr6_8640 ; c9
	.word ptr6_87C8 ; ca
	.word ptr6_87C8 ; cb
	.word ptr9_843B ; cc
	.word ptr9_843B ; cd
	.word ptr6_8640 ; ce
	.word ptr6_8640 ; cf
	.word ptr6_8A81 ; d0
	.word ptr6_8A81 ; d1
	.word ptr6_8D59 ; d2
	.word ptr6_8D59 ; d3
	.word ptr6_901A ; d4
	.word ptr6_901A ; d5
	.word ptr4_A0D8 ; d6 (different)
	.word ptr4_A0D8 ; d7 (different)
	.word ptr6_9286 ; d8
	.word ptr6_9286 ; d9
	.word ptr6_98E1 ; da
	.word ptr6_98E1 ; .byte
	.word ptr6_98B7 ; dc
	.word ptr6_98B7 ; dd
	.word bra4_98BE ; de
	.word bra4_98BE ; df
	.word ptr6_88D1 ; e0
	.word ptr6_88F9 ; e1
	.word ptr7_8000 ; e2
	.word ptr7_8000 ; e3
	.word ptr6_8475 ; e4
	.word ptr6_8475 ; e5
	.word ptr6_8475 ; e6
	.word ptr6_8475 ; e7
	.word ptr6_9BED ; e8
	.word ptr6_9951 ; e9
	.word ptr6_9951 ; ea
	.word ptr6_9951 ; eb
	.word ptr6_9951 ; ec
	.word ptr6_9951 ; ed
	.word ptr6_9951 ; ee
	.word ptr4_A0D8 ; ef (different)
	.word ptr4_A0D8 ; f0 (different)
	.word ptr4_A0D8 ; f1 (different)
	.word ptr4_A0D8 ; f2 (different)
	.word ptr4_A0D8 ; f3 (different)
	.word ptr4_A0D8 ; f4 (different)
	.word ptr4_A0D8 ; f5 (different)
	.word ptr7_8000 ; f6
	.word ptr7_8000 ; f7
	.word ptr7_8000 ; f8
	.word ptr7_8000 ; f9
	.word ptr6_820E ; fa
	.word ptr6_820E ; fb
	.word ptr6_96CB ; fc
	.word ptr6_96CB ; fd
	.word ptr6_96CB ; fe
	.word ptr6_96CB ; ff

;------------------------------------
; OBJECTS 80-FF PRG BANKS ($A635)
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

;----------------------------------------
; ROUTINE ($A6B5)
; Removes the object of the X index from memory.
;----------------------------------------
objRemoveObject:
	LDA #$00
	STA objAction,X
	STA objSlot,X
	STA objState,X
	STA objVar,X ; Wipe the object from memory
	LDA $058C,X
	TAY
	LDX tbl_51_FC80,Y
	LDA $03CE,X
	AND tbl_51_FD80,Y
	STA $03CE,X
	RTS

;----------------------------------------
; SUBROUTINE ($A6D4)
; Checks if an object is being hit by a cape and kills it accordingly.
;----------------------------------------
objCapeHitCheck:
	LDA playerYoshiState
	BNE @stop ; Stop if the player is riding Yoshi
		LDA playerPowerup
		CMP #$03
		BCS @continue ; Only continue if the player has a cape
@stop:
	RTS

@continue:
	LDA playerPrevAction
	CMP #$05
	BNE @stop ; Branch if the player isn't spinning

; Get object hitbox size
	LDX $A4 ; Get index of current object
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $38

; Check if the player is within the object's hitbox horizontally
	LDA objXDistHi,X
	BPL @horizHitboxCheckLeft ; Branch if the player is to the left of the object
	; If player is to the right of the object:
		LDA #16
		CLC
		ADC $36
		CLC
		ADC objXDistLo,X ; X Hitbox + 16 + X Distance > 255
		BCS @vertHitboxCheck ; Branch if the player is within 16 pixels of the object's hitbox (cape distance)
		BCC skipCapeKill ; Otherwise, set carry and stop

	; If player is to the left of the object:
	@horizHitboxCheckLeft:
		LDA objXDistLo,X
		CMP #16
		BCS skipCapeKill ; Don't kill the object if the player is more than 16 pixels away from it

; Otherwise, if the player is within the hitbox horizontally, check if they're in the hitbox vertically
@vertHitboxCheck:
	LDA objYDistHi,X
	BEQ @vertHitboxCheckAbove ; Branch if the player's origin is already above or at the object's origin
	CMP #$FF
	BNE skipCapeKill ; Don't kill the object if it's off-screen?
	; If the player is at the same level as the object:
		LDA #24
		CLC
		ADC $38
		CLC
		ADC objYDistLo,X ; Y hitbox + 24 + Y Distance > 255
		BCS @killObject ; Kill the object if the player is within 24 vertical pixels of the object's hitbox (origin at its foot?)
		BCC skipCapeKill ; Otherwise, don't kill it and stop

	; If the player's origin is above or at the object's:
	@vertHitboxCheckAbove:
		LDA objYDistLo,X
		CMP #$00
		BCS skipCapeKill ; Don't kill the object if the player is above the object
	; Otherwise, continue and kill the object
	@killObject:
		CLC
		BCC checkIfCapeKill ; Clear the carry and continue

skipCapeKill:
	SEC
	
checkIfCapeKill:
	BCS @stop ; Stop if the carry flag was set
		LDA objState,X
		AND #%11100000
		ORA #%00000100 ; Enable collision check
		STA objState,X
		LDA #$00
		STA objVar,X ; Reset object animation(?)
		LDA #$01
		JSR rewardPoints ; Give 200 points
		LDA #SFX_ENEMYHIT2
		STA sndSfx ; Play hit sound
		PLA
		PLA ; Go back two calls and stop running code for this object
@stop:
	RTS

;----------------------------------------
; SUBROUTINE ($A74D)
; Destroys an object if spin jumped on or jumped on with Yoshi.
;----------------------------------------
objKillOnSpinJump:
	LDA playerYoshiState
	BNE @continue ; Continue if player has Yoshi
	LDA playerPrevAction
	CMP #$05
	BNE @stop ; If the player doesn't have Yoshi, make sure they're spin jumping

@continue:
	LDA #$20
	STA playerYSpd ; Set player's vertical speed
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player face up
	LDA #$04
	STA playerAction ; Make player jump
	LDA #$0F
	STA objSlot,X ; Make object pop
	LDA #$00
	STA objState,X ; Remove object
	PLA
	PLA ; Go back two calls and stop running code for this object
@stop:
	RTS

jmp_54_A773:
	LDA objXDistHi,X
	BPL bra3_A785 ; Branch if the player is a screen ahead of the object
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra3_A78C
	BCC bra3_A7AC
bra3_A785:
	LDA objXDistLo,X
	CMP #$08
	BCS bra3_A7AC ; Branch if the player isn't within 8 horizontal pixels of the object's hitbox
bra3_A78C:
	LDA objYDistHi,X
	BEQ bra3_A7A2 ; Branch if the player is to the left of the object
	CMP #$FF
	BNE bra3_A7AC ; Branch if the player isn't to the right of the object
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra3_A7A9
	BCC bra3_A7AC
bra3_A7A2:
	LDA objYDistLo,X
	CMP #$00
	BCS bra3_A7AC ; Branch if the player is above the object's hitbox?
bra3_A7A9:
	CLC
	BCC bra3_A7AD
bra3_A7AC:
	SEC
bra3_A7AD:
	BCC bra3_A7BA_RTS
	LDA objState,X
	AND #$E0
	STA objState,X
	PLA
	PLA
	RTS
bra3_A7BA_RTS:
	RTS

;----------------------------------------
; ROUTINE ($A7BB)
; Checks if Yoshi's tongue is able to eat an object.
; Takes the object's tongue behavior $25 as a parameter.
; Values:
; > 00 - 06 = Copy to Yoshi State
; > 02 = P-Switch
; > 03 = Spring
; > 04 = Fire breath
; > 06 = Swallow
; > 07 = Inedible
;----------------------------------------
objYoshiTongueCheck:
	LDA $25
	CMP #$07
	BNE bra3_A7C4 ; Branch if the object is completely inedible
	JMP yoshiEatStop ; Otherwise, jump

bra3_A7C4:
	LDA yoshiTongueState
	CMP #$01
	BEQ @continue ; Branch if there's nothing on Yoshi's tongue already

@stop:
	JMP yoshiEatStop ; If there is, jump

@continue:
	LDX $A4 ; Get index for current object
	LDA playerState
	CMP #$09
	BCC @stop ; Stop if Yoshi's tongue isn't out
	LDA playerMoveFlags
	AND #$40
	BNE @isFacingObjectLeft ; Branch if the player is facing left
	; If the player is facing right:
		LDA objXDistHi,X
		BMI @stop ; Stop if the player is facing away from the object (facing right and to the left of it)
		BPL bra3_A7E8 ; Branch if the player is to the left of the object

	; If the player is facing left:
	@isFacingObjectLeft:
		LDA objXDistHi,X
		BPL @stop ; Stop if the player is facing away from the object (facing left and to the right of it)

bra3_A7E8:
	LDX playerAnimFrame
	CPX #$06
	BCC yoshiEatStop ; Make sure Yoshi's mouth is open
	LDA tbl3_A85F,X
	STA $32 ; Get the width of Yoshi's tongue hitbox
	LDY $A4 ; Get index for current object
	LDX objSlot,Y
	LDA objectXHitBoxSizes,X
	STA $36 ; Get object hitbox width
	LDA objectYHitBoxSizes,X
	STA $38 ; Get object hitbox height
	LDX $A4
	LDA objXDistHi,X
	BPL bra3_A816 ; Branch if the player is to the left of the object
	; If the player is to the right of the object:
		LDA $32
		CLC
		ADC $36
		CLC
		ADC objXDistLo,X
		BCS bra3_A81D
		BCC bra3_A83D

	; If the player is to the left of the object:
	bra3_A816:
		LDA objXDistLo,X
		CMP $32
		BCS bra3_A83D

bra3_A81D:
	LDA objYDistHi,X
	BEQ bra3_A833
	CMP #$FF
	BNE bra3_A83D
	LDA #$10
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra3_A83A
	BCC bra3_A83D

bra3_A833:
	LDA objYDistLo,X
	CMP #$00
	BCS bra3_A83D

bra3_A83A:
	CLC
	BCC bra3_A83E

bra3_A83D:
	SEC
bra3_A83E:
	BCS yoshiEatStop
	LDX playerAnimFrame
	LDA tbl3_A86D,X
	STA playerAnimFrame
	LDX $A4
	INC objState,X
	LDA $25
	STA yoshiTongueState
	RTS

yoshiEatStop:
	LDX $A4
	LDA objState,X
	AND #$E0 ; Mask out the lower 5 bits
	ORA #$03
	STA objState,X ; Run main collision code
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
; A87B
objectXHitBoxSizes:
	.byte $00
	.byte $00
	.byte $10
	.byte $10
	.byte $10 ; Koopa shell
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
	.byte $10 ; Koopa
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
; A97B
objectYHitBoxSizes:
	.byte $00
	.byte $00
	.byte $10
	.byte $10
	.byte $10 ; Koopa shell
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
	.byte $20 ; Koopa
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

;----------------------------------------
; FUNCTION ($AA7B)
; Offsets the player's position for the current object? Doesn't seem to do anything when disabled.
;----------------------------------------
ptr_AA7B:
	LDY $A4 ; Get index for the current object
	LDX playerAnimFrame ; Get hitbox index for player
	CPX #$0C
	BCC @continue ; Only continue if the player isn't underwater or doing a special animation
	; Otherwise, move to the next object function
		LDA objState,Y
		CLC
		ADC #$01
		STA objState,Y ; Move to next object function
		RTS

@continue:
	LDA tbl3_AB0D,X
	STA $37
	LDA tbl3_AB1B,X
	STA $34 ; Get player hitbox
	LDX objSlot,Y ; Get the index for the current object

	; Get player's horizontal offset
	LDA objectXHitBoxSizes,X
	LSR
	CLC
	ADC $37
	STA $32 ; (Player hitbox width / 2) + animation hitbox size

	; Get player's vertical offset
	LDA objectYHitBoxSizes,X
	CLC
	ADC #4
	EOR #%11111111 ; Make value negative
	STA $36 ;-1 * (Hitbox height + 4) + 1

	LDA playerMoveFlags
	AND #%01000000
	BNE @addHorizOffsetLeft ; Branch if the player is facing left
	; If the player is facing right:
		LDA playerXLoDup
		CLC
		ADC $34
		STA objXLo,Y
		LDA playerXHiDup ; Offset player's position to the right
		ADC #$00
		JMP @addVertOffset ; Add high byte if needed

	; If the player is facing left:
	@addHorizOffsetLeft:
		LDA playerXLoDup
		SEC
		SBC $32
		STA objXLo,Y
		LDA playerXHiDup
		SBC #$00 ; Offset player's position to the left

@addVertOffset:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y ; Carry over to high byte of player's position
	LDA $36
	BMI @addNegVertOffset ; Offset differently if the vertical offset is negative
	; Add positive offset to player's vertical position
		CLC
		ADC playerYLoDup
		STA objYLo,Y ; Add vertical offset to player's position
		BCS @addHorizHighByte ; Add to high byte if needed
			CMP #$F0
			BCC @stop ; Stop if adding 16 doesn't cross the vertical screen boundary

		@addHorizHighByte:
			CLC
			ADC #16
			STA objYLo,Y ; Offset Y position by 16
			LDA objYHi,Y
			CLC
			ADC #$01
			JMP @storeVerticalHighByte

	; Add negative offset to player's vertical position
	@addNegVertOffset:
		CLC
		ADC playerYLoDup
		STA objYLo,Y
		BCS @stop ; Stop if subtraction doesn't need to borrow from the high byte
			SEC
			SBC #16
			STA objYLo,Y
			LDA objYHi,Y
			SEC
			SBC #$01 ; Borrow from high byte if needed

@storeVerticalHighByte:
	STA objYHi,Y
@stop:
	RTS

tbl3_AB0D:
	.byte $00 ; Idle
	.byte $00 ; Walking
	.byte $00 ; Running
	.byte $00 ; Unused
	.byte $00 ; Jumping
	.byte $00 ; Spinning
	.byte $00 ; Turning (Unused)
	.byte $18 ; Ducking
	.byte $28 ; Looking up
	.byte $30 ; Running jump
	.byte $28 ; Falling
	.byte $18 ; Sinking
	.byte $00 ; Swimming up
	.byte $00 ; Climbing idle
tbl3_AB1B:
	.byte $00 ; Idle
	.byte $01 ; Walking
	.byte $02 ; Running
	.byte $03 ; Unused
	.byte $04 ; Jumping
	.byte $05 ; Spinning
	.byte $10 ; Turning (Unused)
	.byte $10 ; Ducking
	.byte $20 ; Looking up
	.byte $28 ; Running jump
	.byte $20 ; Falling
	.byte $10 ; Sinking
	.byte $10 ; Swimming up
	.byte $10 ; Climbing idle

;----------------------------------------
; FUNCTION ($AB29)
; Handles Yoshi eating powerups
;----------------------------------------
objPowerupEatCheck:
	LDA $25
	CMP #$06
	BNE @continue ; Skip ahead if object can't be swallowed
	; If the object can be swallowed:
		LDA #SFX_YOSHISWALLOW
		STA sndSfx ; Play swallow sound

@continue:
	JSR objGetEdiblePowerup ; Check if Yoshi ate a generic powerup (mushroom, fire flower, or feather)
	CPX #OBJ_1UP
	BNE @checkIfStar ; Check if Yoshi ate a star if he didn't eat a 1UP
	; If Yoshi ate a 1UP:
		LDY curPlayer
		LDA playerLives,Y
		CLC
		ADC #1
		STA playerLives,Y ; Add 1 to the player's life counter if Yoshi ate a 1UP
		LDA #SFX_1UP
		STA sndSfx ; Play 1UP sound
		BNE @removeObject ; Continue and remove object
	; If Yoshi ate a star:
	@checkIfStar:
		CPX #OBJ_STAR
		BNE @removeObject ; Continue and remove object if Yoshi didn't eat a star
			LDA #$01
			STA invincibilityTimer ; Give the player invincibility

@removeObject:
	LDX $A4 ; Get object's index
	LDA #$00
	STA objSlot,X ; Remove object
	RTS

ptr_AB5D:
	LDX $A4 ; Get index for object
	LDA $058C,X
	STA $0632
	LDA #$00
	STA objSlot,X ; Remove object
	RTS

;----------------------------------------
; SUBROUTINE
; Updates player and object values when an object is picked up.
;----------------------------------------
setObjectCarryState:
	LDA playerYoshiState
	BNE setObjectCarryStateDone ; Make sure the player isn't riding Yoshi
	LDA playerHoldFlag
	BNE setObjectCarryStateDone ; Stop if the player is already carrying something
	LDA playerAction+1
	CMP #$04
	BCS setObjectCarryStateDone ; Only continue if player is either walking, running, or doing nothing
	LDA btnHeld
	AND #BTN_B
	BEQ setObjectCarryStateDone ; Make sure the B button is held
	STA playerHoldFlag
	LDY $A4 ; Get index for current object
	LDA objState,Y
	ORA #$80
	STA objState,Y ; Set object to "held"
	PLA
	PLA ; Add 2 to stack pointer? The accumulator is overwritten after every call to this routine, so this is seemingly useless.
setObjectCarryStateDone:
	RTS
	
;----------------------------------------
; SUBROUTINE ($AB92)
; Positions carried objects.
;----------------------------------------
positionCarriedObject:
	LDY $A4
	LDA objState,Y
	AND #$80
	BNE bra3_AB9C ; Branch if the object is being carried
	; Otherwise, stop
		RTS
bra3_AB9C:
	LDA btnHeld
	AND #BTN_B
	STA playerHoldFlag ; Set the player's carrying flag if the B button is held
	BEQ bra3_AC08 ; Branch if the B button isn't being held
	LDA playerMoveFlags
	AND #$40
	BNE bra3_ABBB ; Branch if the player is facing left
	; Otherwise, offset the carried sprite to the right
		LDA playerXLoDup
		CLC
		ADC #$06
		STA objXLo,Y ; Offset the object 6 pixels right of the player
		LDA playerXHiDup
		ADC #$00 ; Update the X screen if needed (high byte)
		JMP loc3_ABC7

bra3_ABBB:
	LDA playerXLoDup
	SEC
	SBC #$16
	STA objXLo,Y ; Offset the carried object's X position by 22 ($16) pixels
	LDA playerXHiDup
	SBC #$00

loc3_ABC7:
	STA objXHi,Y ; Update the X screen when needed (high byte)
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$EC ; Offset object -20 pixels vertically, or 20 pixels up from the player's sprite
	BMI bra3_ABEE ; Always branch
; This code is skipped due to the branch above
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra3_ABDF
	CMP #$F0
	BCC positionCarriedObjectDone
bra3_ABDF:
	CLC
	ADC #$10
	STA objYLo,Y
	LDA objYHi,Y
	CLC
	ADC #$01
	JMP jmp_54_AC02

; Continue here
bra3_ABEE:
	CLC
	ADC playerYLoDup
	STA objYLo,Y ; Offset object 20 pixels above the origin of the player's sprite
	BCS positionCarriedObjectDone ; Stop if adding overflows and subtracts 20, which occurs for values 20 ($14) and higher
	; If it doesn't overflow and subtract properly, subtract 16 ($10) and decrement the upper byte
		SEC
		SBC #$10
		STA objYLo,Y ; Subtract 16
		LDA objYHi,Y
		SEC
		SBC #$01 ; Decrement upper byte
;--------------------
; SUB-SUBROUTINE
; Sets current object's Y screen.
;--------------------
jmp_54_AC02:
	STA objYHi,Y
positionCarriedObjectDone:
	PLA
	PLA ; Add 2 to stack pointer? Seemingly useless.
	RTS

bra3_AC08:
	LDA playerMoveFlags
	AND #$40
	ORA #$05
	TAY
	LDA btnHeld
	AND #$08
	BEQ bra3_AC17
	INY
bra3_AC17:
	TYA
	LDY $A4
	STA objState,Y
	PLA
	PLA
	RTS
jmp_54_AC20:
	LDA playerYoshiState
	BNE bra3_ACA1_RTS
	LDY $A4
	LDA objState,Y
	AND #$80
	BEQ bra3_ACA1_RTS
	LDA btnHeld
	AND #$40
	STA playerHoldFlag
	BEQ bra3_ACA2
	LDA playerMoveFlags
	AND #$40
	BNE bra3_AC4D
	LDA playerXLoDup
	CLC
	ADC #$06
	STA objXLo,Y
	LDA playerXHiDup
	ADC #$00
	JMP loc3_AC59
bra3_AC4D:
	LDA playerXLoDup
	SEC
	SBC #$16
	STA objXLo,Y
	LDA playerXHiDup
	SBC #$00
loc3_AC59:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$EC
	BMI bra3_AC80
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra3_AC71
	CMP #$F0
	BCC bra3_AC97
bra3_AC71:
	CLC
	ADC #$10
	STA objYLo,Y
	LDA $0550,Y
	CLC
	ADC #$01
	JMP jmp_54_AC94
bra3_AC80:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra3_AC97
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
jmp_54_AC94:
	STA objYHi,Y
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
	LDA objState,Y
	AND #$7F
	STA objState,Y
	LDA btnHeld
	AND #$08
	BEQ bra3_ACC2_RTS
	LDA objState,Y
	AND #$F0
	ORA #$07
	STA objState,Y
	LDA #$00
	STA objVar,Y
	PLA
	PLA
bra3_ACC2_RTS:
	RTS
jmp_54_ACC3:
	LDA playerYoshiState
	BNE bra3_ACA1_RTS
	LDY $A4
	LDA objState,Y
	AND #$80
	BEQ bra3_ACA1_RTS
	LDA btnHeld
	AND #$40
	STA playerHoldFlag
	BEQ bra3_ACA2
	LDA playerMoveFlags
	AND #$40
	BNE bra3_ACF0
	LDA playerXLoDup
	CLC
	ADC #$00
	STA objXLo,Y
	LDA playerXHiDup
	ADC #$00
	JMP loc3_ACFC
bra3_ACF0:
	LDA playerXLoDup
	SEC
	SBC #$16
	STA objXLo,Y
	LDA playerXHiDup
	SBC #$00
loc3_ACFC:
	STA objXHi,Y
	LDA playerYHiDup
	STA objYHi,Y
	LDA #$E0
	BMI bra3_AD23
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra3_AD14
	CMP #$F0
	BCC bra3_AD3A
bra3_AD14:
	CLC
	ADC #$10
	STA objYLo,Y
	LDA objYHi,Y
	CLC
	ADC #$01
	JMP jmp_54_AD37
bra3_AD23:
	CLC
	ADC playerYLoDup
	STA objYLo,Y
	BCS bra3_AD3A
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
jmp_54_AD37:
	STA objYHi,Y
bra3_AD3A:
	JMP loc3_AC97
sub3_AD3D:
	LDA objState,Y
	AND #$40
	PHA
	ORA #$06
	STA objState,Y
	LDA #$00
	STA playerHoldFlag
	STA objVar,Y
	PLA
	JMP loc3_AD5C
jmp_54_AD54:
	JSR sub3_BD03
	LDA objState,Y
	AND #$40
loc3_AD5C:
	EOR #$40
	STA $34
	LDA objState,X
	AND #$80
	ORA $34
	ORA #$04
	STA objState,X
	LDA objSlot,X
	CMP #$E1
	BEQ bra3_AD78_RTS
	LDA #$00
	STA objVar,X
bra3_AD78_RTS:
	RTS
ptr_AD79:
	LDY #$FE
	LDX $A4
	LDA objState,X
	AND #$40
	BEQ bra3_AD95
	LDY #$02
	BNE bra3_AD95

;----------------------------------------
; FUNCTION ($AD88)
; Moves an object while they're falling off-screen
;----------------------------------------
objFlipKill:
	LDY #2
	LDX $A4
	LDA objState,X
	AND #%01000000
	BNE bra3_AD95 ; Offset object position to the right if facing right
		LDY #-2 ; Otherwise, if facing left, offset it to the left

bra3_AD95:
	TYA
	PHA ; Back offset up ins tack
	CLC
	ADC objXLo,X
	STA objXLo,X ; Offset object's horizontal position
	PLA
	BMI bra3_ADA8 ; Branch if offset was negative
	; If offset was positive:
		LDA objXHi,X
		ADC #$00 ; Add high byte if necessary
		BPL bra3_ADAD
	; If offset was negative:
	bra3_ADA8:
		LDA objXHi,X
		SBC #$00 ; Subtract high byte if necesssary

bra3_ADAD:
	STA objXHi,X ; Store high byte
	LDA objYLo,X
	CMP #$E0
	BCC bra3_ADC3 ; Branch if object above the kill zone
		LDA #$00
		STA objSlot,X
		STA objState,X
		STA objVar,X ; Despawn object if it goes below the kill zone
		RTS

bra3_ADC3:
	LDA objVar,X
	TAY
	LDA tbl3_AE0F,Y
	STA $32 ; Get offset from object's movement data index?
	CMP #$FF
	BNE bra3_ADD6 ; Continue if the end of the data isn't reached
		LDA #7
		STA $32 ; Set offset to 7 if the end of the data is reached
		BNE bra3_ADDF

; Move through movement indices every 4th frame
bra3_ADD6:
	LDA frameCount
	AND #$03
	BNE bra3_ADDF
	INC objVar,X

bra3_ADDF:
	LDA $32
	BMI bra3_ADFC ; Branch if the movement is negative (upwards)
		CLC
		ADC objYLo,X
		STA objYLo,X ; Add offset
		BCS bra3_ADF0 ; Add 16 if it varries to the high byte
		CMP #$F0
		BCC loc3_AE0E_RTS ; Also add 16 if it's 16 pixels before the vertical screen boundary. Otherwise, stop

bra3_ADF0:
	CLC
	ADC #16
	STA objYLo,X
	INC objYHi,X ; Offset position by 16 with carry to high byte
	JMP loc3_AE0E_RTS ; Stop

bra3_ADFC:
	CLC
	ADC objYLo,X
	STA objYLo,X ; Add offset
	BCS loc3_AE0E_RTS ; Stop if borrow from high byte isn't needed
		SEC
		SBC #16
		STA objYLo,X
		DEC objYHi,X ; Subtract 16 and borrow from high byte
loc3_AE0E_RTS:
	RTS

tbl3_AE0F:
	.byte -4
	.byte -3
	.byte -2
	.byte 1
	.byte 2
	.byte 3
	.byte 4
	.byte $FF

ptr_AE17:
	LDA objXDistHi,X
	BPL bra3_AE23
	LDA objState,X
	ORA #$40
	BNE bra3_AE28
bra3_AE23:
	LDA objState,X
	AND #$BF
bra3_AE28:
	STA objState,X
	LDA frameCount
	AND #$00
	BNE bra3_AE36_RTS
	LDA #$24
	JSR getMovementData
bra3_AE36_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($AE37)
; Checks if the object Yoshi ate was a powerup and gives it to the player
; Returns:
; X Reg: The ID of the object eaten. Special mushrooms will return the ID for normal mushrooms
; Y Reg: The index of the current object.
;----------------------------------------
objGetEdiblePowerup:
	LDA $25
	CMP #$06
	BNE bra3_AE97_RTS ; Stop if object can't be swallowed

; Special call that doesn't check if an object can be swallowed
jmp_54_AE3D:
	LDY $A4 ; Get current object's index
	LDA playerPowerup
	CMP #$04
	BNE @continue ; Continue if player isn't moving with a cape
		LDA #$03 ; Clamp player powerup state to 3 (not moving with cape)

@continue:
	STA $32 ; Copy player powerup status to scratch memory
	LDX objSlot,Y ; Get index for current object
	CPX #OBJ_KOOPA
	BCC getPowerupFromObject ; Branch if object's ID is between 1 and 15
	; Otherwise, check if the object is a mushroom variant
		CPX #OBJ_MUSHROOM_IDLE
		BEQ setToMushroom ; Give powerup for standing mushroom
		CPX #OBJ_MUSHROOM_PRINCESS
		BEQ setToMushroom ; Give powerup for princess-thrown mushroom
		CPX #OBJ_MUSHROOM_HIDDEN
		BNE bra3_AE97_RTS ; Give power up if mushroom was hidden. Otherwise, don't give the player a powerup at all

setToMushroom:
	LDX #OBJ_MUSHROOM ; Replace with ID for normal mushroom

getPowerupFromObject:
	LDA objectPowerupTbl,X ; Get powerup for swallowing current object
	BEQ bra3_AE97_RTS ; Don't change powerup if swallowing the object does nothing
	CMP #$01
	BNE @givePowerupContinue ; Branch if the object 
	; If the object gives a mushroom when swallowed:
		LDY playerPowerup
		BEQ @givePowerupContinue ; Don't check the item box if the player is small
			LDY playerItemBox
			BEQ @storeItem ; Store a mushroom if the item box is empty
			BNE @setPowerupEffect ; Otherwise, don't overwrite the item box
	; If it gives a fire flower or feather when swallowed:
	@givePowerupContinue:
		STA playerPowerup ; Give player powerup
		LDA $32
		BEQ @setPowerupEffect ; Only put the player's powerup in the item box if the player has one

@storeItem:
	STA playerItemBox ; Store powerup in item box

; Plays the powerup sound and buffers the game
@setPowerupEffect:
	LDA #SFX_POWERUP
	STA sndSfx
	LDA #$01 ; Set powerup buffer time for fire flower
	CPX #OBJ_FEATHER
	BNE @notFeather
	; If Yoshi ate a feather:
		LDA #SFX_FEATHER
		STA sndSfx ; Play feather sound
		LDA #$81 ; Set powerup buffer time for feather
	; If Yoshi ate a mushroom or fire flower:
	@notFeather:
		STA playerPowerupBuffer
		LDA #$07
		STA gameState ; Trigger appropriate event
		LDY $A4 ; Return current object index in Y register

bra3_AE97_RTS:
	RTS

objectPowerupTbl:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01 ; Mushroom
	.byte $02 ; Fire Flower
	.byte $03 ; Feather
	.byte $00
	.byte $00

sub3_AEA8:
	STA $38
	LDX #$FF

loc3_AEAC:
	INX
	LDY objSlot,X
	BMI bra3_AEBE
	LDA tbl3_AF43,Y
	BNE bra3_AECF
	CPX objCount
	BCC loc3_AEAC
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
	CPX objCount
	BCC loc3_AEAC
	PLA
	PLA
	RTS
bra3_AECF:
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $37
	LDY $A4
	STY $32
	CPX $32
	BEQ loc3_AEAC
	LDA objXLo,X
	SEC
	SBC objXLo,Y
	STA $32
	LDA objXHi,X
	SBC objXHi,Y
	STA $33
	LDA objYLo,X
	SEC
	SBC objYLo,Y
	STA $34
	LDA objYHi,X
	SBC objYHi,Y
	STA $35
	LDA $33
	BPL bra3_AF17
	CMP #$FF
	BNE loc3_AEAC
	LDA #$00
	CLC
	ADC $36
	CLC
	ADC $32
	BCS bra3_AF1F
	BCC loc3_AEAC
bra3_AF17:
	BNE loc3_AEAC
	LDA $32
	CMP $38
	BCS loc3_AEAC
bra3_AF1F:
	LDA $35
	BPL bra3_AF34
	CMP #$FF
	BNE loc3_AEAC
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

;----------------------------------------
; SUBROUTINE ($B043)
; $A8 = X Pos Hi
; $A9 = X Pos Lo
; $AA = Y Pos Hi
; $AB = Y Pos Lo
; $36 = Calculated X hitbox?
; $38 = Calculated Y hitbox?
; $32 - $33 = Movement data pointer
;----------------------------------------
sub3_B043:
	STY $2B ; Backup Y register
	LDX $A4 ; Get index for current object
	LDY objSlot,X
	LDA #$08
	STA $36
	LDA objectYHitBoxSizes,Y
	CLC
	ADC #$04 ; Object's hitbox height + 4
	JMP loc3_B08D

sub3_B057:
	STY $2B
	LDX $A4
	LDY objSlot,X
	LDA objState,X
	AND #$40
	BEQ bra3_B069
	LDA #$00
	BEQ bra3_B06C

bra3_B069:
	LDA objectXHitBoxSizes,Y

bra3_B06C:
	STA $36
	LDA objectYHitBoxSizes,Y
	SEC
	SBC #$08
	JMP loc3_B08D

;----------------------------------------
; SUBROUTINE ($B077)
; $A8 = X Pos Lo
; $A9 = X Pos Hi
; $AA = Y Pos Lo
; $AB = Y Pos Hi
; $36 = Calculated X hitbox?
; $38 = Calculated Y hitbox?
; $32 - $33 = Movement data pointer
;----------------------------------------
sub3_B077:
	STY $2B
	LDX $A4
	LDY objSlot,X ; Load current object
	LDA objState,X ; Get state of current object
	AND #%01000000
	BEQ @setObjXPosOfs ; Offset position by 0 if the object isn't mirrored
	LDA objectXHitBoxSizes,Y ; Offset the object by its hitbox width during the calculation if it's mirrored

@setObjXPosOfs:
	STA $36
	LDA objectYHitBoxSizes,Y

loc3_B08D:
	STA $38 ; Store vertical position offset

; Move object origin back to the left if mirrored
	LDA objXLo,X
	CLC
	ADC $36
	STA $A8
	LDA objXHi,X
	ADC #$00
	STA $A9
	
	; Copy Y position
	LDA objYLo,X
	STA $AA
	LDA objYHi,X
	STA $AB

; Move origin to bottom of object
loc3_B0A8:
	LDA $38
	BMI bra3_B0C1 ; Perform subtraction instead of the offset is a negative value
	CLC
	ADC $AA
	STA $AA
	BCS bra3_B0B7 ; Add 16 and carry if carry is needed
	CMP #256-16
	BCC loc3_B0CF ; Branch if adding 16 wouldn't require a carry

; Add 16 to Y boundary and carry
bra3_B0B7:
	CLC
	ADC #16
	STA $AA
	INC $AB ; Add 16 to vertical position and carry
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
	CMP #256-40
	BCC bra3_B0D8 ; Branch if object doesn't cross the vertical screen boundary? (assuming it's at least 8 units tall?)
	LDA #$00
	RTS

bra3_B0D8:
	LDY $AB
	LDA levelVerticalScreenOffs,Y
	CLC
	ADC $A9 ; Get level screen index of object's origin
	TAY

	LDA prgDataBank2
	STA M90_PRG0
	LDA ($8C),Y
	TAY ; Get the screen number of the object's origin
	AND #31 ; Only 32 possible screens per level
	ORA #%10000000
	STA $35
	LDA #$00
	STA $34
	LDY $A8
	LDA $AA
	AND #%11110000 ; Get tile row of object origin
	ORA tbl_51_FE00,Y ; Get tile X position
	TAY

; Get the tile the object's origin is on
	LDA prgDataBank1
	STA M90_PRG0
	LDA ($34),Y ; Get tile
	TAY
	LDA prgDataBank2
	STA M90_PRG0
	LDA ($DA),Y ; Get tile behavior
	TAY
	LDA tbl_51_FF00,Y ; Return upper nybble of behavior
	PHA
	LDA curObjPrgBank
	STA M90_PRG0 ; Switch the object's PRG bank back in
	LDY $2B
	PLA
	RTS

;----------------------------------------
; SUBROUTINE ($B11D)
; Loads an object's movement vectors and stops at the last vector.
; Parameters:
; > A: Object ID
;----------------------------------------
jmp_54_B11D:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33 ; Get pointer for movement data
	JSR getSpeedData
	LDA curObjPrgBank
	STA M90_PRG0 ; Swap object back into first 8K PRG bank
	RTS

;----------------------------------------
; SUBROUTINE ($B132)
; Loads movement data from a table and updates the object's variable accordingly.
; Parameters:
; > $0032: Movement table pointer
; > Object Variable: Used to determine which movement vectors to load from the table
;----------------------------------------
getSpeedData:
	LDX $A4 ; Get index of current object
	LDA objVar,X
	AND #%01111111 ; Clear upper bit of object variable
	ASL
	TAY ; Get movement data index
	LDA objState,X
	AND #$40
	BEQ loadObjSpeedRight ; Branch if object is facing right
	; If the object is facing left, invert its X movement value
		LDA ($32),Y
		EOR #$FF
		CLC
		ADC #$01 ; (x XOR 255) + 1 == -x (Two's complement of X movement)
		JMP storeObjMovementData ; Continue
	; If object is facing right, load X movement value as normal
	loadObjSpeedRight:
		LDA ($32),Y

storeObjMovementData:
	STA $06E2 ; Store X movement

; Load Y movement from next byte in table
	INY
	LDA ($32),Y
	STA $06E3

	LDA interruptMode
	CMP #$04
	BEQ changeObjDirection ; Branch if in the bowser fight, which has one screen
	; Otherwise, add X movement to the object's position
		LDA $06E2
		PHA ; Backup object X movement
		CLC
		ADC objXLo,X
		STA objXLo,X ; Add X movement to object's horizontal position
		PLA ; Get X movement
		BMI objNegXSpeedCalcHi ; Branch if X movement value is negative, subtracting upper byte of X position
		LDA objXHi,X
		ADC #$00 ; Otherwise, if X movement value is positive, carry to upper byte of the X position if needed
		BPL storeObjXSpeedCalc ; Continue if the position doesn't overflow
		; Borrow from upper byte of object's horizontal position if needed
		objNegXSpeedCalcHi:
			LDA objXHi,X
			SBC #$00

storeObjXSpeedCalc:
	STA objXHi,X ; Store upper byte of object's horizontal position

; Add positive vertical movement
	LDA $06E3
	BMI objNegYSpeedCalc ; Branch if object's Y movement is negative (moving upwards)
	CLC
	ADC objYLo,X
	STA objYLo,X ; Otherwise, if movement is positive, add to low byte
	BCS objYSpeedCalcHi ; Branch if it carries over (crossing vertical screen boundary)
	CMP #$F0
	BCC changeObjDirection ; If adding 10 wouldn't carry over, branch
	; Carry to high byte and move 16 bytes down if addition carries over
	objYSpeedCalcHi:
		CLC
		ADC #$10
		STA objYLo,X
		INC objYHi,X ; Carry over addition and add 16 ($10)
		JMP changeObjDirection

; Subtract negative vertical movement (if speed value is negative)
objNegYSpeedCalc:
	CLC
	ADC objYLo,X
	STA objYLo,X ; Subtract low byte
	BCS changeObjDirection ; Branch if subtraction doesn't borrow from high byte
	; Otherwise, borrow from high byte and subtract 16 ($10)
		SEC
		SBC #$10
		STA objYLo,X
		DEC objYHi,X

; Change object's direction if needed and update movement vector table index
changeObjDirection:
	INY ; Move to next byte
	LDA ($32),Y
	CMP #$FF
	BNE updateObjSpeedDataIndex ; Branch if delimiter byte isn't reached
	; Turn the object around and stop if the delimiter byte is reached
		LDA objState,X
		EOR #%01000000
		STA objState,X ; Turn object around
		JMP getSpeedDataDone ; Go to next vector and end routine
	; If the X movement byte isn't the delimiter, check if it's an index change vector
	updateObjSpeedDataIndex:
		AND #%11110000
		BEQ getSpeedDataDone ; Stop if the X movement byte is normal
		; Otherwise, check if it's a loop byte
			LDA ($32),Y
			AND #%00111111
			BNE subObjXYSpeedIndex ; Stop if this is a normal movement value
			STA objVar,X ; If they are clear, set the movement vector index directly
			RTS
		; If bits 0 - 5 of the next byte aren't clear, subtract the X/Y speed set index by the lower 6 bits of the next byte
		subObjXYSpeedIndex:
			STA $32 ; Save lower 6 bits of next byte
			LDA objVar,X
			SEC
			SBC $32
			STA objVar,X ; Move back the amount of X/Y speed sets in the lower 6 bits (highest bit of the subtrahend will be cleared)

; Move to next set of X/Y speeds in the table
getSpeedDataDone:
	INC objVar,X
	RTS

;----------------------------------------
; SUBROUTINE ($B1DA)
; Loads an object's movement vectors in a looping pattern.
; Parameters:
; > A: Object ID
;----------------------------------------
getMovementData:
	ASL
	TAY ; Get pointer index
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33 ; Load movement data pointer
	JSR sub3_B1EF
	LDA curObjPrgBank
	STA M90_PRG0
	RTS

sub3_B1EF:
	LDX $A4
	LDA objVar,X
	AND #%01111111 ; Mask out upper bit to not affect carry
	ASL
	TAY
	LDA objState,X
	AND #%00100000
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
	LDA objVar,X
	AND #$7F
	CMP #$07
	BCS bra3_B21E
	INC objVar,X
bra3_B21E:
	TAY
	BMI bra3_B23A
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B22E
	CMP #$F0
	BCC loc3_B24C
bra3_B22E:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B24C
bra3_B23A:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc3_B24C
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
loc3_B24C:
	JSR sub3_B057
	BEQ bra3_B25D
	CMP #$02
	BEQ bra3_B25D
	LDA objState,X
	EOR #$40
	STA objState,X
bra3_B25D:
	LDY #$00 ; Clear Y reg
	LDA ($32),Y ; Load movement data
	TAY ; Copy it to the Y reg
	LDA objState,X
	AND #$40
	BEQ bra3_B26E ; Branch if the object is facing right
	TYA ; Load the movement data
	EOR #$FF ; Negate the value
	TAY ; Copy it back to the Y register
	INY ; Increase it by 1
bra3_B26E:
	TYA ; Copy it back to the accumulator
	PHA ; Push into stack
	CLC
	ADC objXLo,X
	STA objXLo,X ; Move the object by adding to its position
	PLA ; Pull the value that was just added
	BMI bra3_B281 ; Branch if it's negative
	LDA objXHi,X
	ADC #$00 ; Update the horizontal screen (if the object is going left?)
	BPL bra3_B286 ; Branch if the screen is negative?
bra3_B281:
	LDA objXHi,X
	SBC #$00 ; Update the horizontal screen (if the object is going right?)
bra3_B286:
	STA objXHi,X ; Update it in memory
	RTS
loc3_B28A:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA objYLo,X
	SEC
	SBC $25
	BCS bra3_B2A0
	DEC objYHi,X
	SEC
	SBC #$10
bra3_B2A0:
	STA objYLo,X
	LDA objState,X
	AND #$C0
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
loc3_B2B4:
	INY
	LDA ($32),Y ; Load movement data
	BMI bra3_B2D3 ; Branch if bit 7 of is set
	JSR sub3_B077 ; Otherwise, jump
	BEQ bra3_B2C2
	CMP #$02
	BNE bra3_B2F8
bra3_B2C2:
	LDA objState,X
	ORA #$20
	STA objState,X
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra3_B2D3:
	LDA objSlot,X
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
	LDA objState,X
	EOR #$40
	STA objState,X
bra3_B30A:
	LDA objState,X
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
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_B32F
	LDA objXHi,X
	ADC #$00
	BPL bra3_B334
bra3_B32F:
	LDA objXHi,X
	SBC #$00
bra3_B334:
	STA objXHi,X
	INY
	LDA ($32),Y
	BMI bra3_B355
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B349
	CMP #$F0
	BCC bra3_B367
bra3_B349:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B367
bra3_B355:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B367
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra3_B367:
loc3_B367:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B379
	LDA objState,X
	EOR #$40
	STA objState,X
	JMP loc3_B397
bra3_B379:
	AND #$F0
	BEQ bra3_B397
	LDA ($32),Y
	AND #$3F
	BNE bra3_B38C
	LDA objVar,X
	AND #$80
	STA objVar,X
	RTS
bra3_B38C:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra3_B397:
loc3_B397:
	INC objVar,X
	RTS
jmp_54_B39B:
	LDX $A4
	LDA objVar,X
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

;----------------------------------------
; SUBROUTINE ($B3B4)
; Loads an object's movement data and flips them when they reach a ledge.
;----------------------------------------
sub_54_B3B4:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B3C9
	LDA curObjPrgBank
	STA M90_PRG0 ; Swap PRG bank out for current object
	RTS

sub3_B3C9:
	LDX $A4
	LDA objVar,X
	AND #$7F
	ASL
	TAY
	JSR sub3_B043
	BEQ loc3_B3DC
	JSR sub3_B057
	BEQ loc3_B3E4

loc3_B3DC:
	LDA objState,X
	EOR #$40
	STA objState,X ; Flip the object horizontally

loc3_B3E4:
	LDA objState,X
	AND #%01000000
	BEQ bra3_B3F5 ; If the object is facing right, branch
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
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_B409
	LDA objXHi,X
	ADC #$00
	BPL bra3_B40E
bra3_B409:
	LDA objXHi,X
	SBC #$00
bra3_B40E:
	STA objXHi,X
	INY
	LDA ($32),Y
	BMI bra3_B42F
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B423
	CMP #$F0
	BCC bra3_B441
bra3_B423:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP bra3_B441
bra3_B42F:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B441
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra3_B441:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B453
	LDA objState,X
	EOR #$40
	STA objState,X
	JMP bra3_B46C
bra3_B453:
	AND #$F0
	BEQ bra3_B46C
	LDA ($32),Y
	AND #$3F
	BNE bra3_B461
	STA objVar,X
	RTS
bra3_B461:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra3_B46C:
	INC objVar,X
	RTS
jmp_54_B470:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B485
	LDA curObjPrgBank
	STA M90_PRG0
	RTS
sub3_B485:
	LDX $A4
	LDA objVar,X
	ASL
	TAY
	LDA ($32),Y
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_B4A0
	LDA objXHi,X
	ADC #$00
	BPL bra3_B4A5
bra3_B4A0:
	LDA objXHi,X
	SBC #$00
bra3_B4A5:
	STA objXHi,X
	INY
	LDA ($32),Y
	BMI bra3_B4C6
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B4BA
	CMP #$F0
	BCC bra3_B4D8
bra3_B4BA:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B4D8
bra3_B4C6:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B4D8
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
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
	STA objVar,X
	RTS
bra3_B4ED:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra3_B4F8:
	INC objVar,X
	RTS


;----------------------------------------
; SUBROUTINE ($B4FC)
; Handles vertical speed in the object's variable until it reaches 7.
;----------------------------------------
sub_54_B4FC:
	LDA frameCount
	AND #$01
	BNE bra3_B556 ; Only continue every even frame, branching every odd frame
		LDA objVar,X
		AND #%01111111 ; Ignore vertical speed mode flag
		CMP #$07
		BCS bra3_B50E
			INC objVar,X ; Increase vertical speed until it's 7
	bra3_B50E:
		TAY
		BMI bra3_B52A ; Branch if vertical speed is negative (redundant? seems to never happen)
		CLC
		ADC objYLo,X
		STA objYLo,X ; Vertically offset the object by its speed
		BCS bra3_B51E
		CMP #256-16
		BCC loc3_B53C ; Branch if it goes more than 16 pixels below the vertical screen boundary

	; Add 16 to the object's vertical position if it crosses a vertical screen boundary and doesn't carry over
	bra3_B51E:
		CLC
		ADC #16
		STA objYLo,X
		INC objYHi,X
		JMP loc3_B53C

	; Subtract 16 from the object's vertical position if it crosses the vertical screen boundary
	bra3_B52A:
		CLC
		ADC objYLo,X
		STA objYLo,X ; Add negative vertical offset
		BCS loc3_B53C
		SEC
		SBC #16
		STA objYLo,X ; Subtract 16 if it crosses the vertical screen boundary
		DEC objYHi,X ; Borrow from high byte if needed

	; Despawn object if it crosses the death barrier
	loc3_B53C:
		LDA objYHi,X
		CMP levelYScreenCount
		BCC bra3_B556
		LDA objYLo,X
		CMP #$E0
		BCC bra3_B556 ; Don't clear object if it's above the death barrier
			LDA #$00
			STA objSlot,X
			STA objState,X
			STA objVar,X ; Clear object from memory

bra3_B556:
	objDistCalc bra3_B5BA_RTS

bra3_B5BA_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($B5BB)
; Turns the object around in the direction of the player
;----------------------------------------
objFacePlayer:
	LDA #$00
	STA objVar,X ; Clear object variable
	TAY ; Set object direction to right
	LDA objXDistHi,X
	BMI @setDirection ; Branch if the object is behind the player, setting its direction to right
		LDY #$40 ; If the object is ahead of the player, set object direction to left
@setDirection:
	TYA
	STA objState,X ; Store object direction
	RTS

sub_54_B5CD:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33
	JSR sub3_B5E2
	LDA curObjPrgBank
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
	ADC yoshiYLo
	STA yoshiYLo
	BCS bra3_B614
	CMP #$F0
	BCC loc3_B632
bra3_B614:
	CLC
	ADC #$10
	STA yoshiYLo
	INC yoshiYHi
	JMP loc3_B632
bra3_B620:
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS loc3_B632
	SEC
	SBC #$10
	STA yoshiYLo
	DEC yoshiYHi
loc3_B632:
	LDY #$00
	LDA ($32),Y
	TAY
	LDA yoshiIdleMovement
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
	ADC yoshiXLo
	STA yoshiXLo
	PLA
	BMI bra3_B656
	LDA yoshiXHi
	ADC #$00
	BPL bra3_B65B
bra3_B656:
	LDA yoshiXHi
	SBC #$00
bra3_B65B:
	STA yoshiXHi
	RTS
bra3_B65F:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA yoshiYLo
	SEC
	SBC $25
	BCS bra3_B675
	DEC yoshiYHi
	SEC
	SBC #$10
bra3_B675:
	STA yoshiYLo
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
	LDA yoshiIdleMovement
	EOR #$40
	STA yoshiIdleMovement
bra3_B6B2:
	LDA yoshiIdleMovement
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
	ADC yoshiXLo
	STA yoshiXLo
	PLA
	BMI bra3_B6D7
	LDA yoshiXHi
	ADC #$00
	BPL bra3_B6DC
bra3_B6D7:
	LDA yoshiXHi
	SBC #$00
bra3_B6DC:
	STA yoshiXHi
	INY
	LDA ($32),Y
	BMI bra3_B6FD
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS bra3_B6F1
	CMP #$F0
	BCC loc3_B70F
bra3_B6F1:
	CLC
	ADC #$10
	STA yoshiYLo
	INC yoshiYHi
	JMP loc3_B70F
bra3_B6FD:
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS loc3_B70F
	SEC
	SBC #$10
	STA yoshiYLo
	DEC yoshiYHi
loc3_B70F:
	INY
	LDA ($32),Y
	CMP #$FF
	BNE bra3_B721
	LDA yoshiIdleMovement
	EOR #$40
	STA yoshiIdleMovement
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
	LDA yoshiIdleMovement
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
	LDA yoshiIdleMovement
	AND #$40
	BEQ bra3_B763
	LDA #$20
bra3_B763:
	STA $36
	LDA #$22
bra3_B767:
	STA $38
	LDA yoshiXLo
	CLC
	ADC $36
	STA $A8
	LDA yoshiXHi
	ADC #$00
	STA $A9
	LDA yoshiYLo
	STA $AA
	LDA yoshiYHi
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
	LDA objYLo,X
	STA $AA
	LDA objYHi,X
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
	ADC objXLo,X
	STA $A8
	TYA
	BMI bra3_B7E8
	LDA objXHi,X
	ADC #$00
	BPL bra3_B7ED
bra3_B7E8:
	LDA objXHi,X
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
	LDA curObjPrgBank
	STA M90_PRG0
	RTS
sub3_B807:
	LDX $A4
	LDA $0641,X
	ASL
	TAY
	LDA interruptMode
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
	INC objAction,X
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
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_B849
	LDA objXHi,X
	ADC #$00
	BPL bra3_B84E
bra3_B849:
	LDA objXHi,X
	SBC #$00
bra3_B84E:
	STA objXHi,X
	INY
	LDA ($32),Y
	STA $2B
	BMI bra3_B871
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B865
	CMP #$F0
	BCC loc3_B883
bra3_B865:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B883
bra3_B871:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc3_B883
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
loc3_B883:
	INY
	LDA ($32),Y
	CMP #$80
	BNE bra3_B892
	INC objAction,X
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
	LDA objAction,X
	ASL
	ASL ; Multiply the object's action value by 4
	STA $3F ; Back up in RAM
	TAY ; Use as pointer index
	LDA ($34),Y ; Load value pointer 
	ASL
	TAY ; Get the index for the previously loaded value
	LDA tbl3_B8BF,Y
	STA $32
	LDA tbl3_B8BF+1,Y
	STA $33 ; Store the pointer in RAM
	LDA #$00
	STA $28
	STA $2B
	JMP ($32) ; Jump to the pointer
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
	LDA interruptMode
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
	BCC bra3_B903_RTS
	LDA #$00
	STA $0641,X
	INC objAction,X
bra3_B903_RTS:
	RTS

bra3_B904:
	LDA ($34),Y
	STA $28
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_B91A
	LDA objXHi,X
	ADC #$00
	BPL bra3_B91F
bra3_B91A:
	LDA objXHi,X
	SBC #$00
bra3_B91F:
	STA objXHi,X
	INY
	LDA ($34),Y
	STA $2B
	BMI bra3_B942
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B936
	CMP #$F0
	BCC bra3_B954
bra3_B936:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B954
bra3_B942:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B954
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra3_B954:
loc3_B954:
	INC $0641,X
	LDA $0641,X
	INY
	CMP ($34),Y
	BCC bra3_B967_RTS
	LDA #$00
	STA $0641,X
	INC objAction,X
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
	LDA frameCount
	AND $26
	BNE bra3_B982_RTS
	LDA $25
	JSR sub3_B7F2
bra3_B982_RTS:
	RTS
ptr11_B983:
	LDA #$00
	STA objAction,X
	RTS
ptr11_B989:
	LDA $0668
	BNE bra3_B992
	INC objAction,X
	RTS
bra3_B992:
	LDY $3F
	INY
	LDA ($34),Y
	STA objAction,X
	RTS
ptr11_B99B:
	RTS
ptr11_B99C:
	LDA objVar,X
	AND #$7F
	CMP #$07
	BCS bra3_B9A8
	INC objVar,X
bra3_B9A8:
	BMI bra3_B9C3
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_B9B7
	CMP #$F0
	BCC loc3_B9D5_RTS
bra3_B9B7:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_B9D5_RTS
bra3_B9C3:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc3_B9D5_RTS
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
loc3_B9D5_RTS:
	RTS
ptr11_B9D6:
	LDY $3F
	INY
	LDA ($34),Y
	STA objAction,X
	RTS
ptr11_B9DF:
	LDA objXDistHi,X
	BPL bra3_B9F1
	LDA #$05
	CLC
	ADC #$20
	CLC
	ADC objXDistLo,X
	BCS bra3_B9F8
	BCC bra3_BA18
bra3_B9F1:
	LDA objXDistLo,X
	CMP #$05
	BCS bra3_BA18
bra3_B9F8:
	LDA objYDistHi,X
	BEQ bra3_BA0E
	CMP #$FF
	BNE bra3_BA18
	LDA #$10
	CLC
	ADC #$0C
	CLC
	ADC objYDistLo,X
	BCS bra3_BA15
	BCC bra3_BA18
bra3_BA0E:
	LDA objYDistLo,X
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
	LDA objXDistHi,X
	BPL bra3_BA2E
	LDA #$05
	CLC
	ADC #$30
	CLC
	ADC objXDistLo,X
	BCS bra3_BA35
	BCC bra3_BA55
bra3_BA2E:
	LDA objXDistLo,X
	CMP #$05
	BCS bra3_BA55
bra3_BA35:
	LDA objYDistHi,X
	BEQ bra3_BA4B
	CMP #$FF
	BNE bra3_BA55
	LDA #$10
	CLC
	ADC #$0C
	CLC
	ADC objYDistLo,X
	BCS bra3_BA52
	BCC bra3_BA55
bra3_BA4B:
	LDA objYDistLo,X
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
	LDA playerYSpd
	BEQ bra3_BA6A_RTS
	LDA playerMoveFlags
	AND #$04
	BNE bra3_BA6A_RTS
	LDY $3F
	INY
	LDA ($34),Y
	STA objAction,X
bra3_BA6A_RTS:
	RTS
ptr11_BA6B:
	LDY $3F
	INY
	LDA ($34),Y
	CLC
	ADC objAction,X
	STA objAction,X
	RTS
ptr11_BA78:
	LDA $06DC
	BEQ bra3_BA80_RTS
	INC objAction,X
bra3_BA80_RTS:
	RTS
ptr11_BA81:
	LDY $3F
	LDA objXDistLo,X
	CMP #$E8
	BCC bra3_BA8B
	INY
bra3_BA8B:
	INY
	LDA ($34),Y
	CLC
	ADC objAction,X
	STA objAction,X
	RTS
ptr11_BA96:
	INC $05F7
	LDA #$00
	STA objAction,X
	STA $05F6
	RTS
ptr11_BAA2:
	LDA #$01
	STA $28
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_BAB8
	LDA objXHi,X
	ADC #$00
	BPL bra3_BABD
bra3_BAB8:
	LDA objXHi,X
	SBC #$00
bra3_BABD:
	STA objXHi,X
	LDA #$00
	STA $2B
	INC objVar,X
	LDA objVar,X
	CMP #$50
	BCC bra3_BADB_RTS
	LDA #$00
	STA objVar,X
	DEC enemyAnimFrame,X
	BNE bra3_BADB_RTS
	INC objAction,X
bra3_BADB_RTS:
	RTS
	LDX $A4
	LDA objVar,X
	ASL
	TAY
	LDA ($32),Y
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_BAF7
	LDA objXHi,X
	ADC #$00
	BPL bra3_BAFC
bra3_BAF7:
	LDA objXHi,X
	SBC #$00
bra3_BAFC:
	STA objXHi,X
	INY
	LDA ($32),Y
	BMI bra3_BB1D
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_BB11
	CMP #$F0
	BCC bra3_BB2F
bra3_BB11:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP bra3_BB2F
bra3_BB1D:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_BB2F
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra3_BB2F:
	INY
	LDA frameCount
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
	STA objVar,X
bra3_BB49:
	RTS
bra3_BB4A:
	STA $32
	LDA objVar,X
	SEC
	SBC $32
	STA objVar,X
bra3_BB55:
	INC objVar,X
	RTS
sub_54_BB59:
	STY $2B
	LDX $A4
	LDY objSlot,X
	LDA objectYHitBoxSizes,Y
	CLC
	ADC objYLo,X
	STA $AA
	LDA objYHi,X
	ADC #$00
	STA $AB
	JMP loc3_BB81
sub_54_BB73:
	STY $2B
	LDX $A4
	LDA objYLo,X
	STA $AA
	LDA objYHi,X
	STA $AB
loc3_BB81:
	LDA objXLo,X
	STA $A8
	LDA objXHi,X
	STA $A9
	JMP loc3_B0CF
sub_54_BB8E:
	STY $2B
	LDX $A4
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	CLC
	ADC objXLo,X
	STA $A8
	LDA objXHi,X
	ADC #$00
	STA $A9
	JMP loc3_BBB6
sub_54_BBA8:
	STY $2B
	LDX $A4
	LDA objXLo,X
	STA $A8
	LDA objXHi,X
	STA $A9
loc3_BBB6:
	LDA objYLo,X
	STA $AA
	LDA objYHi,X
	STA $AB
	JMP loc3_B0CF
jmp_54_BBC3:
	LDA objVar,X
	AND #$1F
	TAY
	LDA tbl3_BC1E,Y
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra3_BBDE
	LDA objXHi,X
	ADC #$00
	BPL bra3_BBE3
bra3_BBDE:
	LDA objXHi,X
	SBC #$00
bra3_BBE3:
	STA objXHi,X
	TYA
	CLC
	ADC #$08
	AND #$1F
	TAY
	LDA tbl3_BC1E,Y
	BMI bra3_BC0B
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra3_BBFF
	CMP #$F0
	BCC loc3_BC1D_RTS
bra3_BBFF:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc3_BC1D_RTS
bra3_BC0B:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc3_BC1D_RTS
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
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
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $38
	LDY #$10
	LDA playerPowerup
	BEQ bra3_BC56
	LDY #$18
bra3_BC56:
	LDA playerAction
	CMP #$07
	BNE bra3_BC5E
	LDY #$08
bra3_BC5E:
	STY $32
	LDA objXDistHi,X
	BPL bra3_BC72
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC objXDistLo,X
	BCS bra3_BC79
	BCC bra3_BC99
bra3_BC72:
	LDA objXDistLo,X
	CMP #$05
	BCS bra3_BC99
bra3_BC79:
	LDA objYDistHi,X
	BEQ bra3_BC8F
	CMP #$FF
	BNE bra3_BC99
	LDA $32
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra3_BC96
	BCC bra3_BC99
bra3_BC8F:
	LDA objYDistLo,X
	CMP #$00
	BCS bra3_BC99
bra3_BC96:
	CLC
	BCC bra3_BC9A
bra3_BC99:
	SEC
bra3_BC9A:
	BCC bra3_BCA6_RTS
	LDA objState,X
	AND #$E0
	STA objState,X
	PLA
	PLA
bra3_BCA6_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($BCA7)
; Like the subroutine below it, except it gives more rebound speed and always turns the player right.
;----------------------------------------
objStompReboundAlt:
	LDA #SFX_ENEMYHIT2
	STA sndSfx ; Play enemy hit sound
	LDA #48
	STA playerYSpd
	STA playerXSpd ; Set player's horizontal and vertical rebound speed
	LDA playerMoveFlags
	ORA #%00000100
	AND #%10111110 ; This may be a bug
	STA playerMoveFlags ; Make player move upwards and right
	LDA #$01
	JMP rewardPoints ; Give player 200 points

;----------------------------------------
; SUBROUTINE ($BCBE)
; Bounces the player back and gives them points while playing a sound effect 
;----------------------------------------
objStompRebound:
	LDA #SFX_ENEMYHIT2
	STA sndSfx ; Play hit sound effect

;----------------------------------------
; SUBROUTINE ($BCC2)
; Bounces the player back and gives them points
;----------------------------------------
objStompReboundNoSFX:
	LDA #8
	STA playerYSpd ; Set vertical rebound speed
	LDA playerMoveFlags
	ORA #%00000100 ; Make player move up
	EOR #%00000001
	STA playerMoveFlags ; Reverse the player's horizontal direction
	LDA #8
	STA playerXSpd ; Set horizontal rebound speed
	LDA #1 ; Give player 200 points

;----------------------------------------
; SUBROUTINE ($BCD4)
; Rewards one of 4 score values to the current player from a table based on the value of the accumulator.
; Parameters:
; > A = Score Value
;   > 0 = 100
;   > 1 = 200
;   > 2 = 500
;   > 3 = 1000
;----------------------------------------
rewardPoints:
	ASL ; Get score data index
	STY $2B
	STX $28 ; Back up X and Y registers
	TAY
	LDA curPlayer
	ASL
	TAX ; Get appropriate offset for current player's score
	LDA scoreTbl+1,Y
	STA $32 ; Get high byte
	
; Add to player's score
	LDA scoreTbl,Y
	CLC
	ADC playerScores,X
	STA playerScores,X
	LDA playerScores+1,X
	ADC $32
	STA playerScores+1,X
	
; Restore original X and Y registers
	LDY $2B
	LDX $28
	RTS
scoreTbl:
	.word 100/10
	.word 200/10
	.word 500/10
	.word 1000/10

sub3_BD03:
	LDA objSlot,X
	CMP #$E1
	BEQ bra3_BD17_RTS
	STY $2B
	STX $28
	LDA objState,X
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
	BCC bra3_BD2C ; Branch if <6 enemies have been hit
	LDX curPlayer
	INC playerLives,X ; If 7 or more have been hit, give the current player a life
	LDA #$07
	BNE bra3_BD31 ; Play 1UP sound
bra3_BD2C:
	INC $4A ; Increment hit counter
	CLC
	ADC #$11 ; Play next hit sound
bra3_BD31:
	STA sndSfx ; Play appropriate sound
	LDY $2B
	LDX $28
	LDA #$01
	JSR rewardPoints
	RTS
jmp_54_BD3D:
	LDA objVar,X
	BPL bra3_BD6B_RTS
	AND #$7F
	BEQ bra3_BD6C
	CMP #$40
	BCC bra3_BD66
	LDA objSlot,X
	AND #$FE
	CMP #$6C
	BNE bra3_BD56
	PLA
	PLA
	RTS
bra3_BD56:
	LDA #$00
	STA objSlot,X
	STA objState,X
	STA objAction,X
	LDA #$FF
	STA objVar,X
bra3_BD66:
	INC objVar,X
	PLA
	PLA
bra3_BD6B_RTS:
	RTS
bra3_BD6C:
	LDA #$F2
	STA objAction,X
	LDY #$22
	LDA playerPowerup
	BNE bra3_BD7F
	LDA playerYoshiState
	BNE bra3_BD7F
	LDY #$18
bra3_BD7F:
	STY $25
	LDA objXDistHi,X
	BPL bra3_BD93
	LDA #$06
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra3_BD9A
	BCC bra3_BDBA
bra3_BD93:
	LDA objXDistLo,X
	CMP #$06
	BCS bra3_BDBA
bra3_BD9A:
	LDA objYDistHi,X
	BEQ bra3_BDB0
	CMP #$FF
	BNE bra3_BDBA
	LDA $25
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra3_BDB7
	BCC bra3_BDBA
bra3_BDB0:
	LDA objYDistLo,X
	CMP #$00
	BCS bra3_BDBA
bra3_BDB7:
	CLC
	BCC bra3_BDBB
bra3_BDBA:
	SEC
bra3_BDBB:
	BCS bra3_BE27
	LDA objSlot,X
	CMP #$39
	BEQ loc3_BDCE
	LDA playerYSpd
	BEQ bra3_BE27
	LDA playerMoveFlags
	AND #$04
	BEQ bra3_BE27
loc3_BDCE:
	INC objVar,X
	LDA playerPowerup
	BNE bra3_BDE6
	LDA objSlot,X
	CMP #$0C
	BEQ bra3_BDE1
	CMP #$0D
	BNE bra3_BDE6
bra3_BDE1:
	LDA #$0B
	STA objSlot,X ; Spawn a mushroom in
bra3_BDE6:
	LDA #SFX_BLOCKRELEASE
	STA sndSfx ; Play the block release sound
	LDY objCount
	INC objCount ; Set the index for the new object
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y ; Copy the coordinate data over to the spawned mushroom
	LDA objSlot,X
	STA objSlot,Y ; Copy the slot value to the mushroom
	LDA #$00
	STA objVar,Y
	STA objAction,Y
	STA objActionTimer,Y
	STA enemyAnimFrame,Y
	LDA objState,Y
	AND #$E0
	ORA #$04
	STA objState,Y
	PLA
	PLA
	RTS
bra3_BE27:
	LDX #$FF
loc3_BE29:
	INX
	LDA objSlot,X
	CMP #$38
	BEQ bra3_BE46
	CMP #$46
	BEQ bra3_BE46
	CMP #$47
	BEQ bra3_BE46
	CMP #$04
	BNE bra3_BE4D
	LDA objState,X
	AND #$0F
	CMP #$07
	BNE bra3_BE4D
bra3_BE46:
	LDA objState,X
	AND #$20
	BEQ bra3_BE54
bra3_BE4D:
	CPX objCount
	BCC loc3_BE29
	PLA
	PLA
	RTS
bra3_BE54:
	LDY $A4
	STY $32
	CPX $32
	BEQ loc3_BE29
	LDA objXLo,X
	SEC
	SBC objXLo,Y
	STA $32
	LDA objXHi,X
	SBC objXHi,Y
	STA $33
	LDA objYLo,X
	SEC
	SBC objYLo,Y
	STA $34
	LDA objYHi,X
	SBC objYHi,Y
	STA $35
	LDA $33
	BPL bra3_BE8F
	CMP #$FF
	BNE loc3_BE29
	LDA #$10
	CLC
	ADC $32
	BCS bra3_BE97
	BCC loc3_BE29
bra3_BE8F:
	BNE loc3_BE29
	LDA $32
	CMP #$10
	BCS loc3_BE29
bra3_BE97:
	LDA $35
	BPL bra3_BEA9
	CMP #$FF
	BNE loc3_BE29
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

;----------------------------------------
; SUBROUTINE ($BEBC)
; Checks if the player collides with the object's hitbox. If the player stomps the object, they are rewarded 200 points. Otherwise, if the player takes damage or isn't touching the object, it will stop the object's code.
;----------------------------------------
objPlayerHitCheck:
	LDX $A4 ; Get current object index
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $38
	LDY #$10 ; Set default player hitbox to 16 pixels high
	LDA playerPowerup
	BEQ @setPlayerDuckingHeight ; Branch if the player is small, keeping their hitbox at 16 pixels high
	LDY #$18 ; Otherwise, if they have a powerup, make their hitbox 24 pixels high

@setPlayerDuckingHeight:
	LDA playerAction
	CMP #PACT_DUCK
	BNE @horizHitboxCheck ; Don't change the player's hitbox size if they aren't ducking
	LDY #$08 ; If the player is ducking, make their hitbox 8 pixels high

@horizHitboxCheck:
	STY $32 ; Store player's hitbox height
	LDA objXDistHi,X
	BPL @horizHitboxCheckLeft ; Branch if the player is to the left of the object
	; If player is to the right of the object:
		LDA #5
		CLC
		ADC $36
		CLC
		ADC objXDistLo,X ; 5 + X Hitbox + X Distance > 255
		BCS @vertHitboxCheck ; Move to the vertical check if player is within 5 pixels of the object's hitbox horizontally
		BCC skipPlayerObjectColl ; Otherwise, stop

	; If player is to the left of the object:
	@horizHitboxCheckLeft:
		LDA objXDistLo,X
		CMP #5
		BCS skipPlayerObjectColl ; Stop if the player is more than 5 pixels away from the object

; Otherwise, if the player is within the horizontal hitbox, move to the vertical hitbox check
@vertHitboxCheck:
	LDA objYDistHi,X
	BEQ @vertHitboxCheckAbove ; Skip these checks if the player's origin is already above or at the object's origin
	CMP #$FF
	BNE skipPlayerObjectColl ; Stop if the object is off-screen
	; If the player is at the same level as the object:
		LDA $32
		CLC
		ADC $38
		CLC
		ADC objYDistLo,X ; Player Hitbox Height + Object Hitbox Height > 255
		BCS @handleCollision ; Handle collision with the player if they're within the object's vertical hitbox
		BCC skipPlayerObjectColl ; Otherwise, stop

	; If the player's origin is above or at the object's:
	@vertHitboxCheckAbove:
		LDA objYDistLo,X
		CMP #$00
		BCS skipPlayerObjectColl ; Stop if the player is above the object
	; Otherwise, continue and handle collision with player
	@handleCollision:
		CLC
		BCC checkIfCollided ; Handle collision

skipPlayerObjectColl:
	SEC ; If set, the branch below will fail and collision with the player won't be handled

checkIfCollided:
	BCC objHandlePlayerColl ; If not set, handle collision accordingly
bra3_BF1A:
	LDA objState,X
	AND #%11100000
	STA objState,X ; Stop checking for collision
	PLA
	PLA
	RTS ; Go back two calls and stop running code for this object

; Check if the player can take damage
objHandlePlayerColl:
	LDA objYDistHi,X
	BPL @invincibilityCheck ; Only continue if the player isn't above the object's hitbox
	LDA objYDistLo,X
	CMP #-14
	BCC @invincibilityCheck ; AND only continue if the player is within 14 pixels of the object vertically
		LDA playerAction
		CMP #PACT_CLIMBIDLE
		BEQ @givePoints
		CMP #PACT_CLIMBMOVE
		BEQ @givePoints ; Give points if the player hits the object while climbing
		LDA playerMoveFlags
		AND #%00000100
		BNE @invincibilityCheck ; Player can be assumed to be taking damage from the object if they are moving upwards

; Otherwise, if the player is falling downwards, it can be assumed that they're stomping on the object
@givePoints:
	LDA invincibilityTimer
	BNE @givePointsContinue ; Reward points immediately if the player already has invulnerability frames
	LDA #$F6
	STA invincibilityTimer ; Otherwise, give them 12 frames of invulnerability without flickering
@givePointsContinue:
	LDA #$01
	JSR rewardPoints ; Give the player 200 points
	RTS

@invincibilityCheck:
	LDA invincibilityTimer
	BEQ @damagePlayer ; Deal damage if the player isn't invincible
	CMP #$D0
	BCS bra3_BF1A ; Stop collision check if the player has invulnerability frames
	; Otherwise, if player has star power:
		LDX $A4
		LDA objState,X
		AND #%11100000 ; Ignore function number bits
		ORA #%00000100 ; Kill object
		STA objState,X
		LDA #$00
		STA objVar,X ; Clear object variables
		PLA
		PLA
		RTS ; Go back two calls and stop running code for this object

@damagePlayer:
	JSR dealDamage ; Deal damage
	PLA
	PLA
	RTS ; Go back two calls and stop running code for this object

jmp_54_BF74:
	LDA invincibilityTimer
	BEQ dealDamage
	RTS

;----------------------------------------
; SUBROUTINE ($BF7A)
; Deals damage to the player. This is only used within this bank
;----------------------------------------
dealDamage:
	LDX $A4
	LDA objSlot,X
	CMP #$48
	BCC @turnObject
	CMP #$4C
	BCC @damagePlayer ; Don't turn objects $48 - $4C around when they damage the player

; Turn the object in the direction of the player when it damages them
@turnObject:
	LDA objXDistHi,X
	BMI @turnObjectRight ; Turn object right if the player is damaged from the right
	LDA objState,X
	ORA #%01000000 ; Turn object left if the player is damaged from the left 
	BNE @setObjectDirection

@turnObjectRight:
	LDA objState,X
	AND #%10111111

@setObjectDirection:
	STA objState,X ; Turn object right

@damagePlayer:
	LDA #$00
	STA playerHoldFlag
	LDA playerYoshiState
	BEQ @damageNoYoshi ; Branch if player isn't on Yoshi
	; Otherwise, inflict damage to Yoshi
		LDA #$01
		STA playerHurtFlag
		JMP @giveIFrames ; Hurt player and give them invulnerability frames

; Handle damage if the player isn't riding Yoshi
@damageNoYoshi:
	LDA playerPowerup
	BEQ @killPlayer ; Kill the player if they're already small
	; Otherwise, make the player small
		LDA #$00
		STA playerPowerup
	LDA #$01
	STA playerPowerupBuffer ; Make the game buffer while the player is taking damage
	LDA #$07
	STA gameState ; Pause game to change powerup

@giveIFrames:
	LDA #$D0
	STA invincibilityTimer ; Give player (128) invulnerability frames
	LDA #SFX_POWERDOWN
	STA sndSfx ; Play hurt sound
	LDA objState,X
	AND #%11100000
	STA objState,X ; End collision check for this frame
	RTS

@killPlayer:
	LDA #GAMESTATE_DEATH
	STA gameState ; Trigger death event
	LDA #$00
	STA gameSubstate ; Go to first part of event
	STA playerState
	STA $06DC
	STA $06DD ; Clear player variables
	RTS
