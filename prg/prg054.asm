;------------------------------------------------------------
;OBJECT BANK
;This bank handles objects and contains various functions relating to them. Object-specific things will be kept here for convenience sake
;------------------------------------------------------------
jmp_54_A000:
	LDA YoshiUnmountedState
	BNE bra3_A006 ;If riding Yoshi, branch
	RTS
bra3_A006:
	LDA GameState
	CMP #$04
	BEQ bra3_A023 ;If the player is dying, branch
	LDA #$35
	STA ObjectPRGBank ;Set current object bank to 53
	LDA ObjectPRGBank
	STA M90_PRG0 ;Swap the current object bank in
	LDA #$33
	STA M90_PRG3 ;Swap bank 51 into the 4th PRG slot
	JSR Obj_h36 ;Jump
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
; Calculate distance between the player and Yoshi
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
; Move Yoshi 16 pixels down (If on a lower vertical screen)
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
	JMP Obj_RemoveObject
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

;----------------------------------------
; OBJECTS 00-7F ($A1B5)
tbl3_A1B5:
	dw ptr4_A0D8
	
	objID_Yoshi = ($-tbl3_A1B5)/2
	dw Obj_YoshiBox

	objID_PSwitch = ($-tbl3_A1B5)/2
	dw Obj_PSwitch

	objID_Spring = ($-tbl3_A1B5)/2
	dw Obj_Spring

	objID_Shell = ($-tbl3_A1B5)/2
	dw Obj_Shell

	objID_1UP = ($-tbl3_A1B5)/2
	dw Obj_1UP

	objID_PFireball1 = ($-tbl3_A1B5)/2
	dw Obj_h06

	objID_PFireball2 = ($-tbl3_A1B5)/2
	dw Obj_h07

	objID_YoshiFireTop = ($-tbl3_A1B5)/2
	dw Obj_h08

	objID_YoshiFireMiddle = ($-tbl3_A1B5)/2
	dw Obj_h09

	objID_YoshiFireBottom = ($-tbl3_A1B5)/2
	dw Obj_h0A

	objID_Mushroom = ($-tbl3_A1B5)/2
	dw Obj_h0B

	objID_FireFlower = ($-tbl3_A1B5)/2
	dw Obj_h0C

	objID_Feather = ($-tbl3_A1B5)/2
	dw Obj_h0D

	objID_Star = ($-tbl3_A1B5)/2
	dw Obj_h0E

	objID_Pop = ($-tbl3_A1B5)/2
	dw Obj_h0F

	objID_Koopa = ($-tbl3_A1B5)/2
	dw Obj_Koopa
	dw Obj_Koopa

	objID_RedBeachKoopa = ($-tbl3_A1B5)/2
	dw Obj_h12
	dw Obj_h12

	objID_BouncingParatroopa = ($-tbl3_A1B5)/2
	dw Obj_h14
	dw Obj_h14

	objID_Rex = ($-tbl3_A1B5)/2
	dw Obj_h16
	dw Obj_h16

	objID_RexSquashed = ($-tbl3_A1B5)/2
	dw Obj_h16
	dw Obj_h16

	objID_PiranhaPlant = ($-tbl3_A1B5)/2
	dw Obj_h1A
	dw Obj_h1A

	objID_PiranhaPlantMask = ($-tbl3_A1B5)/2
	dw Obj_h1C
	dw Obj_h1C

	objID_SuperKoopaCape = ($-tbl3_A1B5)/2
	dw Obj_h1E
	dw Obj_h1E

	objID_SuperKoopaJump = ($-tbl3_A1B5)/2
	dw Obj_h1E

	objID_SuperKoopaStraight = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h1E

	objID_SuperKoopaAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h1E

	objID_SuperKoopaFlyUp = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h1E

	objID_VolcanoLotus = ($-tbl3_A1B5)/2
	dw Obj_h24
	dw Obj_h24

	objID_LotusPollen1 = ($-tbl3_A1B5)/2
	dw Obj_h26
	dw Obj_h26

	objID_LotusPollen2 = ($-tbl3_A1B5)/2
	dw Obj_h26
	dw Obj_h26

	objID_LotusPollen3 = ($-tbl3_A1B5)/2
	dw Obj_h26
	dw Obj_h26

	objID_LotusPollen4 = ($-tbl3_A1B5)/2
	dw Obj_h26
	dw Obj_h26

	objID_Swooper = ($-tbl3_A1B5)/2
	dw Obj_h2E
	dw Obj_h2E

	objID_BlurpHorizontal = ($-tbl3_A1B5)/2
	dw Obj_h30
	dw Obj_h30

	objID_BlurpVertical = ($-tbl3_A1B5)/2
	dw Obj_h30
	dw Obj_h30

	objID_BlurpAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h30

	objID_BlurpRight = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h30

	objID_GreenKoopa = ($-tbl3_A1B5)/2
	dw Obj_h36
	dw Obj_h36

	objID_KoopaShellAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h38

	objID_MushroomHidden = ($-tbl3_A1B5)/2
	dw Obj_h0B

	objID_Mechakoopa = ($-tbl3_A1B5)/2
	dw Obj_h3A
	dw Obj_h3A

	objID_StompedMechakoopa1 = ($-tbl3_A1B5)/2
	dw Obj_h3C
	dw Obj_h3C

	objID_StompedMechakoopa2 = ($-tbl3_A1B5)/2
	dw Obj_h3C
	dw Obj_h3C

	objID_StompedMechakoopa3 = ($-tbl3_A1B5)/2
	dw Obj_h3C
	dw Obj_h3C

	objID_BuzzyBeetle = ($-tbl3_A1B5)/2
	dw Obj_h42
	dw Obj_h42

	objID_BuzzyShell = ($-tbl3_A1B5)/2
	dw Obj_h44
	dw Obj_h44

	objID_BuzzyShellKicked = ($-tbl3_A1B5)/2
	dw Obj_h38
	dw Obj_h38

	objID_HorizontalPodoboo = ($-tbl3_A1B5)/2
	dw Obj_h48

	objID_1UPAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h49

	objID_SpikeTop = ($-tbl3_A1B5)/2
	dw Obj_h4A
	dw Obj_h4A

	objID_GoalTape = ($-tbl3_A1B5)/2
	dw Obj_h4C
	dw Obj_h4C

	objID_ClimbingKoopaHoriz = ($-tbl3_A1B5)/2
	dw Obj_h4E
	dw Obj_h4E

	objID_ClimbingKoopaVert = ($-tbl3_A1B5)/2
	dw Obj_h4E ;50
	dw Obj_h4E ;51

	objID_BlurpStill = ($-tbl3_A1B5)/2
	dw Obj_h30 ;52 (Blurp)
	dw Obj_h30

	objID_LinePlatform = ($-tbl3_A1B5)/2
	dw Obj_h54 ;54 (Line Platform)
	dw Obj_h54

	objID_ShortPlatform = ($-tbl3_A1B5)/2
	dw Obj_h54
	dw Obj_h54

	objID_GreenParatroopa = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h58
	dw Obj_h58

	objID_ChainsawUp = ($-tbl3_A1B5)/2
	dw Obj_h5A
	dw Obj_h5A

	objID_Rope = ($-tbl3_A1B5)/2
	dw Obj_h5C
	dw Obj_h5C
	dw Obj_h5C

	objID_RopeLong = ($-tbl3_A1B5)/2
	dw Obj_h5C

	objID_ChainsawDown = ($-tbl3_A1B5)/2
	dw Obj_h5A
	dw Obj_h5A

	objID_ChainsawUpAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h5A
	dw Obj_h5A

	objID_DiagonalPodoboo = ($-tbl3_A1B5)/2
	dw Obj_h64
	dw Obj_h64

	objID_NA = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h66
	dw Obj_h66
	dw Obj_h66
	dw Obj_h66

	objID_PSwitchDropped = ($-tbl3_A1B5)/2
	dw Obj_h6A

	objID_MushroomStanding = ($-tbl3_A1B5)/2
	dw Obj_h6B

	objID_Vine = ($-tbl3_A1B5)/2
	dw Obj_h6C
	dw Obj_h6C

	objID_BeachKoopaSliding = ($-tbl3_A1B5)/2
	dw Obj_h6E
	dw Obj_h6E

	objID_MortonRoy = ($-tbl3_A1B5)/2
	dw Obj_h70

	objID_DiagonalPodobooBoss = ($-tbl3_A1B5)/2
	dw Obj_h64

	objID_LemmyWendy = ($-tbl3_A1B5)/2
	dw Obj_h72

	objID_LemmyWendyDummy1 = ($-tbl3_A1B5)/2
	dw Obj_h72

	objID_MidwayPoint = ($-tbl3_A1B5)/2
	dw Obj_h74

	objID_LemmyWendyDummy2 = ($-tbl3_A1B5)/2
	dw Obj_h72

	objID_OnOffBlock = ($-tbl3_A1B5)/2
	dw Obj_h76

	objID_Reznor = ($-tbl3_A1B5)/2
	dw Obj_h77

	objID_ReznorFire = ($-tbl3_A1B5)/2
	dw Obj_h78 ;Object 0x78 (Reznor Fire)

	objID_Fuzzy = ($-tbl3_A1B5)/2
	dw Obj_h54 ;Object 0x79 (Fuzzy)

	objID_BeachKoopaSlidingAlt = ($-tbl3_A1B5)/2 ;Verify this
	dw Obj_h7A
	dw Obj_h7A

	objID_LevelExit = ($-tbl3_A1B5)/2
	dw Obj_h7C

	objID_CastleCanvas = ($-tbl3_A1B5)/2
	dw Obj_h7D

	objID_Urchin = ($-tbl3_A1B5)/2
	dw Obj_h7E
	dw Obj_h7E ;Object 0x7F (Urchin)

;----------------------------------------
; Unused duplicated pointers for objects' 00-7F rendering code. Can be found in bank 52
	dw ptr4_A0D8
	dw ptr6_9562 ;1
	dw ptr6_9590 ;2
	dw ptr6_9630 ;3
	dw ptr6_9660 ;4
	dw ptr6_96B7 ;5
	dw ptr6_96D5 ;6
	dw ptr6_96D5 ;7
	dw ptr7_96F8 ;8
	dw ptr7_96F8 ;9
	dw ptr7_96F8 ;a
	dw ptr6_9724 ;b
	dw ptr6_9742 ;c
	dw ptr6_9769 ;d
	dw ptr6_979C ;e
	dw ptr6_97C3 ;f
	dw ptr6_820E ;10
	dw ptr6_820E ;11
	dw ptr6_820E ;12
	dw ptr6_820E ;13
	dw ptr6_820E ;14
	dw ptr6_820E ;15
	dw ptr6_8657 ;16
	dw ptr6_8657 ;17
	dw ptr6_865B ;18
	dw ptr6_865B ;19
	dw ptr6_884B ;1a
	dw ptr6_884B ;1b
	dw ptr6_8912 ;1c
	dw ptr6_8912 ;1d
	dw ptr6_8AA0 ;1e
	dw ptr6_8AA0 ;1f
	dw ptr6_8AA0 ;20
	dw ptr6_8AA0 ;21
	dw ptr6_8AA0 ;22
	dw ptr6_8AA0 ;23
	dw ptr6_8CDE ;24
	dw ptr6_8CDE ;25
	dw ptr6_8E17 ;26
	dw ptr6_8E17 ;27
	dw ptr6_8E17 ;28
	dw ptr6_8E17 ;29
	dw ptr6_8E17 ;2a
	dw ptr6_8E17 ;2b
	dw ptr6_8E17 ;2c
	dw ptr6_8E17 ;2d
	dw ptr6_8F90 ;2e
	dw ptr6_8F90 ;2f
	dw ptr6_9118 ;30
	dw ptr6_9118 ;31
	dw ptr6_9118 ;32
	dw ptr6_9118 ;33
	dw ptr6_9118 ;34
	dw ptr6_9118 ;35
	dw ptr6_820E ;36
	dw ptr6_820E ;37
	dw ptr6_9660 ;38
	dw ptr6_9724 ;39
	dw ptr6_9349 ;3a
	dw ptr6_9349 ;3b
	dw ptr6_95B5 ;3c
	dw ptr6_95B5 ;3d
	dw ptr6_95B5 ;3e
	dw ptr6_95B5 ;3f
	dw ptr6_95B5 ;40
	dw ptr6_95B5 ;41
	dw ptr6_99CD ;42
	dw ptr6_99CD ;43
	dw ptr6_9A11 ;44
	dw ptr6_9A11 ;45
	dw ptr6_9A68 ;46
	dw ptr6_9A68 ;47
	dw ptr5_9DA5 ;48
	dw ptr6_96B7 ;49
	dw bra5_8008 ;4a
	dw bra5_8008 ;4b
	dw ptr6_9BFB ;4c
	dw ptr6_9BFB ;4d
	dw bra5_8008 ;4e
	dw bra5_8008 ;4f
	dw bra5_8008 ;50
	dw bra5_8008 ;51
	dw ptr6_9118 ;52
	dw ptr6_9118 ;53
	dw ptr6_8039 ;54
	dw ptr6_8039 ;55
	dw ptr6_8039 ;56
	dw ptr6_8039 ;57
	dw ptr6_820E ;58
	dw ptr6_820E ;59
	dw bra5_8008 ;5a
	dw bra5_8008 ;5b
	dw bra5_8008 ;5c
	dw bra5_8008 ;5d
	dw bra5_8008 ;5e
	dw bra5_8008 ;5f
	dw bra5_8008 ;60
	dw bra5_8008 ;61
	dw bra5_8008 ;62
	dw bra5_8008 ;63
	dw ptr6_9389 ;64
	dw ptr6_9389 ;65
	dw bra5_8008 ;66
	dw bra5_8008 ;67
	dw bra5_8008 ;68
	dw bra5_8008 ;69
	dw ptr6_958D ;6a
	dw ptr6_9727 ;6b
	dw ptr6_99A9 ;6c
	dw ptr6_99A9 ;6d
	dw ptr6_820E ;6e
	dw ptr6_820E ;6f
	dw ptr6_8CA2 ;70
	dw ptr6_9364 ;71
	dw ptr6_8CDB ;72
	dw ptr6_8CDB ;73
	dw ptr6_9BDB ;74
	dw ptr6_8CDB ;75
	dw ptr6_8039 ;76
	dw ptr6_8000 ;77
	dw ptr6_8000 ;78
	dw ptr6_8039 ;79
	dw ptr6_820E ;7a
	dw ptr6_820E ;7b
	dw ptr4_A0D8 ;7c (different)
	dw ptr4_A0D8 ;7d (different)
	dw ptr6_9670 ;7e
	dw ptr6_9670 ;7f

;----------------------------------------
; OBJECTS 00 - 7F PRG BANKS ($A3B5)
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

;----------------------------------------
; OBJECTS 80-FF ($A435)
tbl3_A435:
	objID_BulletBill = ($-tbl3_A435)/2 + $80
	dw Obj_h80
	dw Obj_h80

	objID_Eerie = ($-tbl3_A435)/2 + $80
	dw Obj_h82
	dw Obj_h82

	objID_Thwomp = ($-tbl3_A435)/2 + $80
	dw Obj_h84
	dw Obj_h84

	objID_UrchinVertical = ($-tbl3_A435)/2 + $80
	dw Obj_h86
	dw Obj_h86

	objID_Ninji = ($-tbl3_A435)/2 + $80
	dw Obj_h88
	dw Obj_h88

	objID_FishBone = ($-tbl3_A435)/2 + $80
	dw Obj_h8A
	dw Obj_h8A

	objID_SpikeBall = ($-tbl3_A435)/2 + $80
	dw Obj_h8C
	dw Obj_h8C

	objID_ParachuteGoombaAlt = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_h8E
	dw Obj_h8E

	objID_FuzzyAlt = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_h90
	dw Obj_h90

	objID_UrchinHorizontal = ($-tbl3_A435)/2 + $80
	dw Obj_h92
	dw Obj_h92

	objID_Goomba = ($-tbl3_A435)/2 + $80
	dw Obj_h94
	dw Obj_h94

	objID_GoombaUpsideDown = ($-tbl3_A435)/2 + $80
	dw Obj_h96
	dw Obj_h96

	objID_ParachuteGoomba = ($-tbl3_A435)/2 + $80
	dw Obj_h98
	dw Obj_h98

	objID_Spiny = ($-tbl3_A435)/2 + $80
	dw Obj_h9A
	dw Obj_h9A

	objID_VerticalPodoboo = ($-tbl3_A435)/2 + $80
	dw Obj_h9C
	dw Obj_h9C

	objID_DiagonalPodobooAlt = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_h9E
	dw Obj_h9E

	objID_Paragoomba = ($-tbl3_A435)/2 + $80
	dw Obj_hA0
	dw Obj_hA0

	objID_DryBonesThrowing = ($-tbl3_A435)/2 + $80
	dw Obj_hA2
	dw Obj_hA2

	objID_DryBones = ($-tbl3_A435)/2 + $80
	dw Obj_hA4
	dw Obj_hA4

	objID_Bone = ($-tbl3_A435)/2 + $80
	dw Obj_hA6
	dw Obj_hA6

	objID_DryBonesThrowingBroken = ($-tbl3_A435)/2 + $80
	dw Obj_hA8
	dw Obj_hA8

	objID_DryBonesBroken = ($-tbl3_A435)/2 + $80
	dw Obj_hA8 ;AA
	dw Obj_hA8 ;AB

	objID_BonyBeetle = ($-tbl3_A435)/2 + $80
	dw Obj_hAA ;AC
	dw Obj_hAA ;AD

	objID_BonyBeetleBroken = ($-tbl3_A435)/2 + $80
	dw Obj_hAC ;AE
	dw Obj_hAC ;AF

	objID_Thing = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hAE
	dw Obj_hAE

	objID_Football = ($-tbl3_A435)/2 + $80
	dw Obj_hB0
	dw Obj_hB0

	objID_Rock = ($-tbl3_A435)/2 + $80
	dw Obj_hB2
	dw Obj_hB2

	objID_BooBuddiesBoo = ($-tbl3_A435)/2 + $80
	dw Obj_hB4
	dw Obj_hB4

	objID_PrincessPeach = ($-tbl3_A435)/2 + $80
	dw Obj_hB6
	dw ptr4_A0D8

	objID_Smoke = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hB8
	dw ptr4_A0D8
	dw Obj_hBA

	objID_NA2 = ($-tbl3_A435)/2 + $80 ;Verify this
	dw ptr4_A0D8
	dw ptr4_A0D8

	objID_MushroomPrincess = ($-tbl3_A435)/2 + $80
	dw Obj_hBD

	objID_CharginChuck = ($-tbl3_A435)/2 + $80
	dw Obj_hBE
	dw Obj_hBE

	objID_CharginChuckChase = ($-tbl3_A435)/2 + $80
	dw Obj_hC0
	dw Obj_hC0 ;Actually C2

	objID_CharginChuckStunned = ($-tbl3_A435)/2 + $80
	dw Obj_hC2
	dw Obj_hC2

	objID_CharginChuck_Hit = ($-tbl3_A435)/2 + $80
	dw Obj_hBE
	dw Obj_hBE

	objID_CharginChuckChase_Hit = ($-tbl3_A435)/2 + $80
	dw Obj_hC0
	dw Obj_hC0

	objID_CharginChuckStunned_Hit = ($-tbl3_A435)/2 + $80
	dw Obj_hC2
	dw Obj_hC2

	objID_CharginChuck_Hit2 = ($-tbl3_A435)/2 + $80
	dw Obj_hBE
	dw Obj_hBE

	objID_CharginChuckChase_Hit2 = ($-tbl3_A435)/2 + $80
	dw Obj_hC0
	dw Obj_hC0

	objID_BaseballChuck = ($-tbl3_A435)/2 + $80
	dw Obj_hCE
	dw Obj_hCE

	objID_FootballChuck = ($-tbl3_A435)/2 + $80
	dw Obj_hD0
	dw Obj_hD0

	objID_DigginChuck = ($-tbl3_A435)/2 + $80
	dw Obj_hD2
	dw Obj_hD2

	objID_BooBuddiesCenterAlt = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hD4
	dw Obj_hD5

	objID_BooBuddiesCenter = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hD6 ;D8
	dw Obj_hD6

	objID_Boo = ($-tbl3_A435)/2 + $80
	dw Obj_hD8 ;DA
	dw Obj_hD8

	objID_BooCrewBoo = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hDA ;DC
	dw Obj_hDA

	objID_BooFlyAway = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hDC ;DE
	dw Obj_hDC

	objID_Propeller = ($-tbl3_A435)/2 + $80
	dw Obj_hDE ;E0

	objID_Bowser = ($-tbl3_A435)/2 + $80
	dw Obj_hDF

	objID_SpikeUp = ($-tbl3_A435)/2 + $80
	dw Obj_hE0
	dw Obj_hE0

	objID_DinoRhino = ($-tbl3_A435)/2 + $80
	dw Obj_hE2 ;E4
	dw Obj_hE2

	objID_DinoTorch = ($-tbl3_A435)/2 + $80
	dw Obj_hE4
	dw Obj_hE4

	objID_BonusBlock1UP = ($-tbl3_A435)/2 + $80
	dw Obj_hE6

	objID_BonusBlockCoin = ($-tbl3_A435)/2 + $80
	dw Obj_hE7

	objID_BonusBlock1 = ($-tbl3_A435)/2 + $80
	dw Obj_hE8 ;1st bonus block (EA)
	dw Obj_hE8

	objID_BonusBlock2 = ($-tbl3_A435)/2 + $80
	dw Obj_hE8 ;2nd bonus block (EC)
	dw Obj_hE8

	objID_BonusBlock3 = ($-tbl3_A435)/2 + $80
	dw Obj_hE8 ;3rd bonus block (EE)
	dw Obj_hED

	objID_NA3 = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hED ;F0
	dw Obj_hED

	objID_BGPriorityAbove = ($-tbl3_A435)/2 + $80
	dw Obj_hF0 ;F2
	dw Obj_hF0

	objID_BGPriorityBelow = ($-tbl3_A435)/2 + $80
	dw Obj_hED

	objID_PipeExit = ($-tbl3_A435)/2 + $80
	dw Obj_hED ;F5

	objID_SpikeDown = ($-tbl3_A435)/2 + $80
	dw Obj_hF4 ;F6
	dw Obj_hF4

	objID_SpikeUpAlt = ($-tbl3_A435)/2 + $80 ;Verify this
	dw Obj_hF4 ;F8
	dw Obj_hF4

	objID_VerticalParatroopa = ($-tbl3_A435)/2 + $80
	dw Obj_h58
	dw Obj_h58

	objID_CountdownPlatform_1s = ($-tbl3_A435)/2 + $80
	dw Obj_hFA ;FC
	dw Obj_hFA

	objID_CountdownPlatform_4s = ($-tbl3_A435)/2 + $80
	dw Obj_hFA ;FE
	dw Obj_hFA

;----------------------------------------
; Unused duplicated pointers for objects' 80-FF rendering code. Can be found in bank 52
	dw ptr6_8BF1 ;80
	dw ptr6_8BF1 ;81
	dw ptr6_9093 ;82
	dw ptr6_9093 ;83
	dw ptr6_83B3 ;84
	dw ptr6_83B3 ;85
	dw ptr6_87FE ;86
	dw ptr6_87FE ;87
	dw ptr6_817B ;88
	dw ptr6_817B ;89
	dw ptr6_9519 ;8a
	dw ptr6_9519 ;8b
	dw ptr7_9632 ;8c
	dw ptr7_9632 ;8d
	dw ptr6_8544 ;8e
	dw ptr6_8544 ;8f
	dw ptr7_8544 ;90
	dw ptr7_8544 ;91
	dw ptr6_87FE ;92
	dw ptr6_87FE ;93
	dw ptr6_88E0 ;94
	dw ptr6_88E0 ;95
	dw ptr6_8897 ;96
	dw ptr6_8897 ;97
	dw ptr6_8517 ;98
	dw ptr6_8517 ;99
	dw ptr6_8A5E ;9a
	dw ptr6_8A5E ;9b
	dw ptr6_8D95 ;9c
	dw ptr6_8D95 ;9d
	dw ptr6_8F15 ;9e
	dw ptr6_8F15 ;9f
	dw ptr6_82C7 ;a0
	dw ptr6_82C7 ;a1
	dw ptr6_9980 ;a2
	dw ptr6_9980 ;a3
	dw ptr6_9980 ;a4
	dw ptr6_9980 ;a5
	dw ptr6_9B79 ;a6
	dw ptr6_9B79 ;a7
	dw ptr7_9A87 ;a8
	dw ptr7_9A87 ;a9
	dw ptr7_9A87 ;aa
	dw ptr7_9A87 ;ab
	dw ptr6_9279 ;ac
	dw ptr6_9279 ;ad
	dw ptr6_93B7 ;ae
	dw ptr6_93B7 ;af
	dw ptr6_8B71 ;b0
	dw ptr6_8B71 ;b1
	dw ptr6_8E28 ;b2
	dw ptr6_8E28 ;b3
	dw ptr6_90C4 ;b4
	dw ptr6_90C4 ;b5
	dw ptr6_990E ;b6
	dw ptr6_990E ;b7
	dw ptr6_8ECE ;b8
	dw ptr4_A0D8 ;b9 (different)
	dw ptr6_8F2E ;ba
	dw ptr4_A0D8 ;bb (different)
	dw ptr6_8F2E ;bc
	dw ptr4_A0D8 ;bd (different)
	dw ptr4_A0D8 ;be (different)
	dw ptr6_8349 ;bf
	dw ptr9_843B ;c0
	dw ptr9_843B ;c1
	dw ptr6_8640 ;c2
	dw ptr6_8640 ;c3
	dw ptr6_87C8 ;c4
	dw ptr6_87C8 ;c5
	dw ptr9_843B ;c6
	dw ptr9_843B ;c7
	dw ptr6_8640 ;c8
	dw ptr6_8640 ;c9
	dw ptr6_87C8 ;ca
	dw ptr6_87C8 ;cb
	dw ptr9_843B ;cc
	dw ptr9_843B ;cd
	dw ptr6_8640 ;ce
	dw ptr6_8640 ;cf
	dw ptr6_8A81 ;d0
	dw ptr6_8A81 ;d1
	dw ptr6_8D59 ;d2
	dw ptr6_8D59 ;d3
	dw ptr6_901A ;d4
	dw ptr6_901A ;d5
	dw ptr4_A0D8 ;d6 (different)
	dw ptr4_A0D8 ;d7 (different)
	dw ptr6_9286 ;d8
	dw ptr6_9286 ;d9
	dw ptr6_98E1 ;da
	dw ptr6_98E1 ;db
	dw ptr6_98B7 ;dc
	dw ptr6_98B7 ;dd
	dw bra4_98BE ;de
	dw bra4_98BE ;df
	dw ptr6_88D1 ;e0
	dw ptr6_88F9 ;e1
	dw ptr7_8000 ;e2
	dw ptr7_8000 ;e3
	dw ptr6_8475 ;e4
	dw ptr6_8475 ;e5
	dw ptr6_8475 ;e6
	dw ptr6_8475 ;e7
	dw ptr6_9BED ;e8
	dw ptr6_9951 ;e9
	dw ptr6_9951 ;ea
	dw ptr6_9951 ;eb
	dw ptr6_9951 ;ec
	dw ptr6_9951 ;ed
	dw ptr6_9951 ;ee
	dw ptr4_A0D8 ;ef (different)
	dw ptr4_A0D8 ;f0 (different)
	dw ptr4_A0D8 ;f1 (different)
	dw ptr4_A0D8 ;f2 (different)
	dw ptr4_A0D8 ;f3 (different)
	dw ptr4_A0D8 ;f4 (different)
	dw ptr4_A0D8 ;f5 (different)
	dw ptr7_8000 ;f6
	dw ptr7_8000 ;f7
	dw ptr7_8000 ;f8
	dw ptr7_8000 ;f9
	dw ptr6_820E ;fa
	dw ptr6_820E ;fb
	dw ptr6_96CB ;fc
	dw ptr6_96CB ;fd
	dw ptr6_96CB ;fe
	dw ptr6_96CB ;ff

;------------------------------------
;OBJECTS 80-FF PRG BANKS ($A635)
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

;----------------------------------------
;ROUTINE ($A6B5)
;Removes the object of the X index from memory.
;----------------------------------------
Obj_RemoveObject:
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

;----------------------------------------
;SUBROUTINE ($A6D4)
;Checks if an object is being hit by a cape and kills it accordingly.
;----------------------------------------
Obj_CapeHitCheck:
	LDA Player1YoshiStatus
	BNE @Stop ;Stop if the player is riding Yoshi
		LDA PlayerPowerup
		CMP #$03
		BCS @Continue ;Only continue if the player has a cape
@Stop:
	RTS

@Continue:
	LDA PlayerPrevAction
	CMP #$05
	BNE @Stop ;Branch if the player isn't spinning

; Get object hitbox size
	LDX $A4 ;Get index of current object
	LDY ObjectSlot,X
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
	STA $38

; Check if the player is within the object's hitbox horizontally
	LDA ObjXScreenDistance,X
	BPL @HorizHitboxCheckLeft ;Branch if the player is to the left of the object
	; If player is to the right of the object:
		LDA #16
		CLC
		ADC $36
		CLC
		ADC ObjectXDistance,X ;X Hitbox + 16 + X Distance > 255
		BCS @VertHitboxCheck ;Branch if the player is within 16 pixels of the object's hitbox (cape distance)
		BCC SkipCapeKill ;Otherwise, set carry and stop

	; If player is to the left of the object:
	@HorizHitboxCheckLeft:
		LDA ObjectXDistance,X
		CMP #16
		BCS SkipCapeKill ;Don't kill the object if the player is more than 16 pixels away from it

; Otherwise, if the player is within the hitbox horizontally, check if they're in the hitbox vertically
@VertHitboxCheck:
	LDA ObjYScreenDistance,X
	BEQ @VertHitboxCheckAbove ;Branch if the player's origin is already above or at the object's origin
	CMP #$FF
	BNE SkipCapeKill ;Don't kill the object if it's off-screen?
	; If the player is at the same level as the object:
		LDA #24
		CLC
		ADC $38
		CLC
		ADC ObjectYDistance,X ;Y hitbox + 24 + Y Distance > 255
		BCS @KillObject ;Kill the object if the player is within 24 vertical pixels of the object's hitbox (origin at its foot?)
		BCC SkipCapeKill ;Otherwise, don't kill it and stop

	; If the player's origin is above or at the object's:
	@VertHitboxCheckAbove:
		LDA ObjectYDistance,X
		CMP #$00
		BCS SkipCapeKill ;Don't kill the object if the player is above the object
	; Otherwise, continue and kill the object
	@KillObject:
		CLC
		BCC CheckIfCapeKill ;Clear the carry and continue

SkipCapeKill:
	SEC
	
CheckIfCapeKill:
	BCS @Stop ;Stop if the carry flag was set
		LDA ObjectState,X
		AND #%11100000
		ORA #%00000100 ;Enable collision check
		STA ObjectState,X
		LDA #$00
		STA ObjectVariables,X ;Reset object animation(?)
		LDA #$01
		JSR RewardPoints ;Give 200 points
		LDA #sfx_EnemyHit2
		STA Sound_Sfx ;Play hit sound
		PLA
		PLA ;Go back two calls and stop running code for this object
@Stop:
	RTS

;----------------------------------------
;SUBROUTINE ($A74D)
;Destroys an object if spin jumped on or jumped on with Yoshi.
;----------------------------------------
Obj_KillOnSpinJump:
	LDA Player1YoshiStatus
	BNE @Continue ;Continue if player has Yoshi
	LDA PlayerPrevAction
	CMP #$05
	BNE @Stop ;If the player doesn't have Yoshi, make sure they're spin jumping

@Continue:
	LDA #$20
	STA PlayerYSpeed ;Set player's vertical speed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Make player face up
	LDA #$04
	STA PlayerAction ;Make player jump
	LDA #$0F
	STA ObjectSlot,X ;Make object pop
	LDA #$00
	STA ObjectState,X ;Remove object
	PLA
	PLA ;Go back two calls and stop running code for this object
@Stop:
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

;----------------------------------------
;ROUTINE ($A7BB)
;Checks if Yoshi's tongue is able to eat an object.
;Takes the object's tongue behavior $25 as a parameter.
;Values:
; > 00 - 06 = Copy to Yoshi State
; > 02 = P-Switch
; > 03 = Spring
; > 04 = Fire breath
; > 06 = Swallow
; > 07 = Inedible
;----------------------------------------
Obj_YoshiTongueCheck:
	LDA $25
	CMP #$07
	BNE bra3_A7C4 ;Branch if the object is completely inedible
	JMP YoshiEatStop ;Otherwise, jump

bra3_A7C4:
	LDA YoshiTongueState
	CMP #$01
	BEQ @Continue ;Branch if there's nothing on Yoshi's tongue already

@Stop:
	JMP YoshiEatStop ;If there is, jump

@Continue:
	LDX $A4 ;Get index for current object
	LDA PlayerState
	CMP #$09
	BCC @Stop ;Stop if Yoshi's tongue isn't out
	LDA PlayerMovement
	AND #$40
	BNE @IsFacingObjectLeft ;Branch if the player is facing left
	; If the player is facing right:
		LDA ObjXScreenDistance,X
		BMI @Stop ;Stop if the player is facing away from the object (facing right and to the left of it)
		BPL bra3_A7E8 ;Branch if the player is to the left of the object

	; If the player is facing left:
	@IsFacingObjectLeft:
		LDA ObjXScreenDistance,X
		BPL @Stop ;Stop if the player is facing away from the object (facing left and to the right of it)

bra3_A7E8:
	LDX PlayerAnimationFrame
	CPX #$06
	BCC YoshiEatStop ;Make sure Yoshi's mouth is open
	LDA tbl3_A85F,X
	STA $32 ;Get the width of Yoshi's tongue hitbox
	LDY $A4 ;Get index for current object
	LDX ObjectSlot,Y
	LDA ObjectXHitBoxSizes,X
	STA $36 ;Get object hitbox width
	LDA ObjectYHitBoxSizes,X
	STA $38 ;Get object hitbox height
	LDX $A4
	LDA ObjXScreenDistance,X
	BPL bra3_A816 ;Branch if the player is to the left of the object
	; If the player is to the right of the object:
		LDA $32
		CLC
		ADC $36
		CLC
		ADC ObjectXDistance,X
		BCS bra3_A81D
		BCC bra3_A83D

	; If the player is to the left of the object:
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
	BCS YoshiEatStop
	LDX PlayerAnimationFrame
	LDA tbl3_A86D,X
	STA PlayerAnimationFrame
	LDX $A4
	INC ObjectState,X
	LDA $25
	STA YoshiTongueState
	RTS

YoshiEatStop:
	LDX $A4
	LDA ObjectState,X
	AND #$E0 ;Mask out the lower 5 bits
	ORA #$03
	STA ObjectState,X ;Run main collision code
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

;----------------------------------------
;FUNCTION ($AA7B)
;Offsets the player's position for the current object? Doesn't seem to do anything when disabled.
;----------------------------------------
ptr_AA7B:
	LDY $A4 ;Get index for the current object
	LDX PlayerAnimationFrame ;Get hitbox index for player
	CPX #$0C
	BCC @Continue ;Only continue if the player isn't underwater or doing a special animation
	; Otherwise, move to the next object function
		LDA ObjectState,Y
		CLC
		ADC #$01
		STA ObjectState,Y ;Move to next object function
		RTS

@Continue:
	LDA tbl3_AB0D,X
	STA $37
	LDA tbl3_AB1B,X
	STA $34 ;Get player hitbox
	LDX ObjectSlot,Y ;Get the index for the current object

	; Get player's horizontal offset
	LDA ObjectXHitBoxSizes,X
	LSR
	CLC
	ADC $37
	STA $32 ;(Player hitbox width / 2) + animation hitbox size

	; Get player's vertical offset
	LDA ObjectYHitBoxSizes,X
	CLC
	ADC #4
	EOR #%11111111 ;Make value negative
	STA $36 ;-1 * (Hitbox height + 4) + 1

	LDA PlayerMovement
	AND #%01000000
	BNE @AddHorizOffsetLeft ;Branch if the player is facing left
	; If the player is facing right:
		LDA PlayerXPosDup
		CLC
		ADC $34
		STA ObjectXPos,Y
		LDA PlayerXScreenDup ;Offset player's position to the right
		ADC #$00
		JMP @AddVertOffset ;Add high byte if needed

	; If the player is facing left:
	@AddHorizOffsetLeft:
		LDA PlayerXPosDup
		SEC
		SBC $32
		STA ObjectXPos,Y
		LDA PlayerXScreenDup
		SBC #$00 ;Offset player's position to the left

@AddVertOffset:
	STA ObjectXScreen,Y
	LDA PlayerYScreenDup
	STA ObjectYScreen,Y ;Carry over to high byte of player's position
	LDA $36
	BMI @AddNegVertOffset ;Offset differently if the vertical offset is negative
	; Add positive offset to player's vertical position
		CLC
		ADC PlayerYPosDup
		STA ObjectYPos,Y ;Add vertical offset to player's position
		BCS @AddHorizHighByte ;Add to high byte if needed
			CMP #$F0
			BCC @Stop ;Stop if adding 16 doesn't cross the vertical screen boundary

		@AddHorizHighByte:
			CLC
			ADC #16
			STA ObjectYPos,Y ;Offset Y position by 16
			LDA ObjectYScreen,Y
			CLC
			ADC #$01
			JMP @StoreVerticalHighByte

	; Add negative offset to player's vertical position
	@AddNegVertOffset:
		CLC
		ADC PlayerYPosDup
		STA ObjectYPos,Y
		BCS @Stop ;Stop if subtraction doesn't need to borrow from the high byte
			SEC
			SBC #16
			STA ObjectYPos,Y
			LDA ObjectYScreen,Y
			SEC
			SBC #$01 ;Borrow from high byte if needed

@StoreVerticalHighByte:
	STA ObjectYScreen,Y
@Stop:
	RTS

tbl3_AB0D:
	db $00 ;Idle
	db $00 ;Walking
	db $00 ;Running
	db $00 ;Unused
	db $00 ;Jumping
	db $00 ;Spinning
	db $00 ;Turning (Unused)
	db $18 ;Ducking
	db $28 ;Looking up
	db $30 ;Running jump
	db $28 ;Falling
	db $18 ;Sinking
	db $00 ;Swimming up
	db $00 ;Climbing idle
tbl3_AB1B:
	db $00 ;Idle
	db $01 ;Walking
	db $02 ;Running
	db $03 ;Unused
	db $04 ;Jumping
	db $05 ;Spinning
	db $10 ;Turning (Unused)
	db $10 ;Ducking
	db $20 ;Looking up
	db $28 ;Running jump
	db $20 ;Falling
	db $10 ;Sinking
	db $10 ;Swimming up
	db $10 ;Climbing idle

;----------------------------------------
;FUNCTION ($AB29)
;Handles Yoshi eating powerups
;----------------------------------------
Obj_PowerupEatCheck:
	LDA $25
	CMP #$06
	BNE @Continue ;Skip ahead if object can't be swallowed
	;If the object can be swallowed:
		LDA #sfx_YoshiSwallow
		STA Sound_Sfx ;Play swallow sound

@Continue:
	JSR Obj_GetEdiblePowerup ;Check if Yoshi ate a generic powerup (mushroom, fire flower, or feather)
	CPX #objID_1UP
	BNE @CheckIfStar ;Check if Yoshi ate a star if he didn't eat a 1UP
	; If Yoshi ate a 1UP:
		LDY CurrentPlayer
		LDA Player1Lives,Y
		CLC
		ADC #1
		STA Player1Lives,Y ;Add 1 to the player's life counter if Yoshi ate a 1UP
		LDA #sfx_1UP
		STA Sound_Sfx ;Play 1UP sound
		BNE @RemoveObject ;Continue and remove object
	; If Yoshi ate a star:
	@CheckIfStar:
		CPX #objID_Star
		BNE @RemoveObject ;Continue and remove object if Yoshi didn't eat a star
			LDA #$01
			STA InvincibilityTimer ;Give the player invincibility

@RemoveObject:
	LDX $A4 ;Get object's index
	LDA #$00
	STA ObjectSlot,X ;Remove object
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
	AND #btnB
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
;SUBROUTINE ($AB92)
;Positions carried objects.
;----------------------------------------
PositionCarriedObject:
	LDY $A4
	LDA ObjectState,Y
	AND #$80
	BNE bra3_AB9C ;Branch if the object is being carried
	; Otherwise, stop
		RTS
bra3_AB9C:
	LDA ButtonsHeld
	AND #btnB
	STA PlayerHoldFlag ;Set the player's carrying flag if the B button is held
	BEQ bra3_AC08 ;Branch if the B button isn't being held
	LDA PlayerMovement
	AND #$40
	BNE bra3_ABBB ;Branch if the player is facing left
	; Otherwise, offset the carried sprite to the right
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
; This code is skipped due to the branch above
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

; Continue here
bra3_ABEE:
	CLC
	ADC PlayerYPosDup
	STA ObjectYPos,Y ;Offset object 20 pixels above the origin of the player's sprite
	BCS PositionCarriedObjectDone ;Stop if adding overflows and subtracts 20, which occurs for values 20 ($14) and higher
	; If it doesn't overflow and subtract properly, subtract 16 ($10) and decrement the upper byte
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
	BCS bra3_AC71
	CMP #$F0
	BCC bra3_AC97
bra3_AC71:
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
	BCS bra3_AD14
	CMP #$F0
	BCC bra3_AD3A
bra3_AD14:
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

;----------------------------------------
;FUNCTION ($AD88)
;Moves an object while they're falling off-screen
;----------------------------------------
Obj_FlipKill:
	LDY #2
	LDX $A4
	LDA ObjectState,X
	AND #%01000000
	BNE bra3_AD95 ;Offset object position to the right if facing right
		LDY #-2 ;Otherwise, if facing left, offset it to the left

bra3_AD95:
	TYA
	PHA ;Back offset up ins tack
	CLC
	ADC ObjectXPos,X
	STA ObjectXPos,X ;Offset object's horizontal position
	PLA
	BMI bra3_ADA8 ;Branch if offset was negative
	; If offset was positive:
		LDA ObjectXScreen,X
		ADC #$00 ;Add high byte if necessary
		BPL bra3_ADAD
	; If offset was negative:
	bra3_ADA8:
		LDA ObjectXScreen,X
		SBC #$00 ;Subtract high byte if necesssary

bra3_ADAD:
	STA ObjectXScreen,X ;Store high byte
	LDA ObjectYPos,X
	CMP #$E0
	BCC bra3_ADC3 ;Branch if object above the kill zone
		LDA #$00
		STA ObjectSlot,X
		STA ObjectState,X
		STA ObjectVariables,X ;Despawn object if it goes below the kill zone
		RTS

bra3_ADC3:
	LDA ObjectVariables,X
	TAY
	LDA tbl3_AE0F,Y
	STA $32 ;Get offset from object's movement data index?
	CMP #$FF
	BNE bra3_ADD6 ;Continue if the end of the data isn't reached
		LDA #7
		STA $32 ;Set offset to 7 if the end of the data is reached
		BNE bra3_ADDF

; Move through movement indices every 4th frame
bra3_ADD6:
	LDA FrameCount
	AND #$03
	BNE bra3_ADDF
	INC ObjectVariables,X

bra3_ADDF:
	LDA $32
	BMI bra3_ADFC ;Branch if the movement is negative (upwards)
		CLC
		ADC ObjectYPos,X
		STA ObjectYPos,X ;Add offset
		BCS bra3_ADF0 ;Add 16 if it varries to the high byte
		CMP #$F0
		BCC loc3_AE0E_RTS ;Also add 16 if it's 16 pixels before the vertical screen boundary. Otherwise, stop

bra3_ADF0:
	CLC
	ADC #16
	STA ObjectYPos,X
	INC ObjectYScreen,X ;Offset position by 16 with carry to high byte
	JMP loc3_AE0E_RTS ;Stop

bra3_ADFC:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Add offset
	BCS loc3_AE0E_RTS ;Stop if borrow from high byte isn't needed
		SEC
		SBC #16
		STA ObjectYPos,X
		DEC ObjectYScreen,X ;Subtract 16 and borrow from high byte
loc3_AE0E_RTS:
	RTS

tbl3_AE0F:
	db -4
	db -3
	db -2
	db 1
	db 2
	db 3
	db 4
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

;----------------------------------------
;SUBROUTINE ($AE37)
;Checks if the object Yoshi ate was a powerup and gives it to the player
;Returns:
;X Reg: The ID of the object eaten. Special mushrooms will return the ID for normal mushrooms
;Y Reg: The index of the current object.
;----------------------------------------
Obj_GetEdiblePowerup:
	LDA $25
	CMP #$06
	BNE bra3_AE97_RTS ;Stop if object can't be swallowed

; Special call that doesn't check if an object can be swallowed
jmp_54_AE3D:
	LDY $A4 ;Get current object's index
	LDA PlayerPowerup
	CMP #$04
	BNE @Continue ;Continue if player isn't moving with a cape
		LDA #$03 ;Clamp player powerup state to 3 (not moving with cape)

@Continue:
	STA $32 ;Copy player powerup status to scratch memory
	LDX ObjectSlot,Y ;Get index for current object
	CPX #objID_Koopa
	BCC GetPowerupFromObject ;Branch if object's ID is between 1 and 15
	; Otherwise, check if the object is a mushroom variant
		CPX #objID_MushroomStanding
		BEQ SetToMushroom ;Give powerup for standing mushroom
		CPX #objID_MushroomPrincess
		BEQ SetToMushroom ;Give powerup for princess-thrown mushroom
		CPX #objID_MushroomHidden
		BNE bra3_AE97_RTS ;Give power up if mushroom was hidden. Otherwise, don't give the player a powerup at all

SetToMushroom:
	LDX #objID_Mushroom ;Replace with ID for normal mushroom

GetPowerupFromObject:
	LDA ObjectPowerupTbl,X ;Get powerup for swallowing current object
	BEQ bra3_AE97_RTS ;Don't change powerup if swallowing the object does nothing
	CMP #$01
	BNE @GivePowerupContinue ;Branch if the object 
	; If the object gives a mushroom when swallowed:
		LDY PlayerPowerup
		BEQ @GivePowerupContinue ;Don't check the item box if the player is small
			LDY ItemBox
			BEQ @StoreItem ;Store a mushroom if the item box is empty
			BNE @SetPowerupEffect ;Otherwise, don't overwrite the item box
	; If it gives a fire flower or feather when swallowed:
	@GivePowerupContinue:
		STA PlayerPowerup ;Give player powerup
		LDA $32
		BEQ @SetPowerupEffect ;Only put the player's powerup in the item box if the player has one

@StoreItem:
	STA ItemBox ;Store powerup in item box

; Plays the powerup sound and buffers the game
@SetPowerupEffect:
	LDA #sfx_Powerup
	STA Sound_Sfx
	LDA #$01 ;Set powerup buffer time for fire flower
	CPX #objID_Feather
	BNE @NotFeather
	; If Yoshi ate a feather:
		LDA #sfx_Feather
		STA Sound_Sfx ;Play feather sound
		LDA #$81 ;Set powerup buffer time for feather
	; If Yoshi ate a mushroom or fire flower:
	@NotFeather:
		STA PlayerPowerupBuffer
		LDA #$07
		STA GameState ;Trigger appropriate event
		LDY $A4 ;Return current object index in Y register

bra3_AE97_RTS:
	RTS

ObjectPowerupTbl:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $01 ;Mushroom
	db $02 ;Fire Flower
	db $03 ;Feather
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

;----------------------------------------
;SUBROUTINE ($B043)
;$A8 = X Pos Hi
;$A9 = X Pos Lo
;$AA = Y Pos Hi
;$AB = Y Pos Lo
;$36 = Calculated X hitbox?
;$38 = Calculated Y hitbox?
;$32 - $33 = Movement data pointer
;----------------------------------------
sub3_B043:
	STY $2B ;Backup Y register
	LDX $A4 ;Get index for current object
	LDY ObjectSlot,X
	LDA #$08
	STA $36
	LDA ObjectYHitBoxSizes,Y
	CLC
	ADC #$04 ;Object's vertical hitbox + 4
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
	STA $38 ;Store added hitbox
	;Calulate object X position?
	LDA ObjectXPos,X
	CLC
	ADC $36
	STA $A8 ;Add object position by pre-set value
	LDA ObjectXScreen,X
	ADC #$00
	STA $A9
	
	;Copy object Y position?
	LDA ObjectYPos,X
	STA $AA
	LDA ObjectYScreen,X
	STA $AB

loc3_B0A8:
	;Add post-calculated object hitbox height to object's vertical position?
	LDA $38
	BMI bra3_B0C1 ;Branch if post-calculated object hitbox is over 127 pixels high?
	CLC
	ADC $AA
	STA $AA ;Add post calculated hitbox to vertical screen?
	BCS bra3_B0B7 ;Add 16 if the screen boundary is crossed
	CMP #$F0
	BCC loc3_B0CF ;Add high byte when object is 16 pixels below vertical screen boundary

bra3_B0B7:
	CLC
	ADC #16
	STA $AA
	INC $AB ;Add 16 to vertical position (assuming overflow)
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

;----------------------------------------
;SUBROUTINE ($B11D)
;Loads an object's movement vectors and stops at the last vector.
; Parameters:
; > A: Object ID
;----------------------------------------
jmp_54_B11D:
	ASL
	TAY
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33 ;Get pointer for movement data
	JSR GetSpeedData
	LDA ObjectPRGBank
	STA M90_PRG0 ;Swap object back into first 8K PRG bank
	RTS

;----------------------------------------
;SUBROUTINE ($B132)
;Loads movement data from a table and updates the object's variable accordingly.
; Parameters:
; > $0032: Movement table pointer
; > Object Variable: Used to determine which movement vectors to load from the table
;----------------------------------------
GetSpeedData:
	LDX $A4 ;Get index of current object
	LDA ObjectVariables,X
	AND #%01111111 ;Clear upper bit of object variable
	ASL
	TAY ;Get movement data index
	LDA ObjectState,X
	AND #$40
	BEQ LoadObjSpeedRight ;Branch if object is facing right
	; If the object is facing left, invert its X movement value
		LDA ($32),Y
		EOR #$FF
		CLC
		ADC #$01 ;(x XOR 255) + 1 == -x (Two's complement of X movement)
		JMP StoreObjMovementData ;Continue
	; If object is facing right, load X movement value as normal
	LoadObjSpeedRight:
		LDA ($32),Y

StoreObjMovementData:
	STA $06E2 ;Store X movement

; Load Y movement from next byte in table
	INY
	LDA ($32),Y
	STA $06E3

	LDA InterruptMode
	CMP #$04
	BEQ ChangeObjDirection ;Branch if in the bowser fight, which has one screen
	; Otherwise, add X movement to the object's position
		LDA $06E2
		PHA ;Backup object X movement
		CLC
		ADC ObjectXPos,X
		STA ObjectXPos,X ;Add X movement to object's horizontal position
		PLA ;Get X movement
		BMI ObjNegXSpeedCalcHi ;Branch if X movement value is negative, subtracting upper byte of X position
		LDA ObjectXScreen,X
		ADC #$00 ;Otherwise, if X movement value is positive, carry to upper byte of the X position if needed
		BPL StoreObjXSpeedCalc ;Continue if the position doesn't overflow
		; Borrow from upper byte of object's horizontal position if needed
		ObjNegXSpeedCalcHi:
			LDA ObjectXScreen,X
			SBC #$00

StoreObjXSpeedCalc:
	STA ObjectXScreen,X ;Store upper byte of object's horizontal position

; Add positive vertical movement
	LDA $06E3
	BMI ObjNegYSpeedCalc ;Branch if object's Y movement is negative (moving upwards)
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Otherwise, if movement is positive, add to low byte
	BCS ObjYSpeedCalcHi ;Branch if it carries over (crossing vertical screen boundary)
	CMP #$F0
	BCC ChangeObjDirection ;If adding 10 wouldn't carry over, branch
	; Carry to high byte and move 16 bytes down if addition carries over
	ObjYSpeedCalcHi:
		CLC
		ADC #$10
		STA ObjectYPos,X
		INC ObjectYScreen,X ;Carry over addition and add 16 ($10)
		JMP ChangeObjDirection

; Subtract negative vertical movement (if speed value is negative)
ObjNegYSpeedCalc:
	CLC
	ADC ObjectYPos,X
	STA ObjectYPos,X ;Subtract low byte
	BCS ChangeObjDirection ;Branch if subtraction doesn't borrow from high byte
	; Otherwise, borrow from high byte and subtract 16 ($10)
		SEC
		SBC #$10
		STA ObjectYPos,X
		DEC ObjectYScreen,X

; Change object's direction if needed and update movement vector table index
ChangeObjDirection:
	INY ;Move to next byte
	LDA ($32),Y
	CMP #$FF
	BNE UpdateObjSpeedDataIndex ;Branch if delimiter byte isn't reached
	; Turn the object around and stop if the delimiter byte is reached
		LDA ObjectState,X
		EOR #%01000000
		STA ObjectState,X ;Turn object around
		JMP GetSpeedDataDone ;Go to next vector and end routine
	; If the X movement byte isn't the delimiter, check if it's an index change vector
	UpdateObjSpeedDataIndex:
		AND #%11110000
		BEQ GetSpeedDataDone ;Stop if the X movement byte is normal
		;Otherwise, check if it's a loop byte
			LDA ($32),Y
			AND #%00111111
			BNE SubObjXYSpeedIndex ;Stop if this is a normal movement value
			STA ObjectVariables,X ;If they are clear, set the movement vector index directly
			RTS
		; If bits 0 - 5 of the next byte aren't clear, subtract the X/Y speed set index by the lower 6 bits of the next byte
		SubObjXYSpeedIndex:
			STA $32 ;Save lower 6 bits of next byte
			LDA ObjectVariables,X
			SEC
			SBC $32
			STA ObjectVariables,X ;Move back the amount of X/Y speed sets in the lower 6 bits (highest bit of the subtrahend will be cleared)

; Move to next set of X/Y speeds in the table
GetSpeedDataDone:
	INC ObjectVariables,X
	RTS

;----------------------------------------
;SUBROUTINE ($B1DA)
;Loads an object's movement vectors in a looping pattern.
; Parameters:
; > A: Object ID
;----------------------------------------
GetMovementData:
	ASL
	TAY ;Get pointer index
	LDA tbl_51_E000,Y
	STA $32
	LDA tbl_51_E000+1,Y
	STA $33 ;Load movement data pointer
	JSR sub3_B1EF
	LDA ObjectPRGBank
	STA M90_PRG0
	RTS

sub3_B1EF:
	LDX $A4
	LDA ObjectVariables,X
	AND #%01111111 ;Mask out upper bit to not affect carry
	ASL
	TAY
	LDA ObjectState,X
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
	BCC loc3_B24C
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
	BCS loc3_B24C
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
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

;----------------------------------------
;SUBROUTINE ($B3B4)
;Loads an object's movement data and flips them when they reach a ledge.
;----------------------------------------
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
	BEQ loc3_B3DC
	JSR sub3_B057
	BEQ loc3_B3E4

loc3_B3DC:
	LDA ObjectState,X
	EOR #$40
	STA ObjectState,X ;Flip the object horizontally

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
	BCS bra3_B441
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


;----------------------------------------
;SUBROUTINE ($B4FC)
;Handles vertical speed in the object's variable until it reaches 7.
;----------------------------------------
sub_54_B4FC:
	LDA FrameCount
	AND #$01
	BNE bra3_B556 ;Only continue every even frame, branching every odd frame
		LDA ObjectVariables,X
		AND #%01111111 ;Ignore vertical speed mode flag
		CMP #$07
		BCS bra3_B50E
			INC ObjectVariables,X ;Increase vertical speed until it's 7
	bra3_B50E:
		TAY
		BMI bra3_B52A ;Branch if vertical speed is negative (redundant? seems to never happen)
		CLC
		ADC ObjectYPos,X
		STA ObjectYPos,X ;Vertically offset the object by its speed
		BCS bra3_B51E
		CMP #256-16
		BCC loc3_B53C ;Branch if it goes more than 16 pixels below the vertical screen boundary

	; Add 16 to the object's vertical position if it crosses a vertical screen boundary and doesn't carry over
	bra3_B51E:
		CLC
		ADC #16
		STA ObjectYPos,X
		INC ObjectYScreen,X
		JMP loc3_B53C

	; Subtract 16 from the object's vertical position if it crosses the vertical screen boundary
	bra3_B52A:
		CLC
		ADC ObjectYPos,X
		STA ObjectYPos,X ;Add negative vertical offset
		BCS loc3_B53C
		SEC
		SBC #16
		STA ObjectYPos,X ;Subtract 16 if it crosses the vertical screen boundary
		DEC ObjectYScreen,X ;Borrow from high byte if needed

	; Despawn object if it crosses the death barrier
	loc3_B53C:
		LDA ObjectYScreen,X
		CMP YScreenCount
		BCC bra3_B556
		LDA ObjectYPos,X
		CMP #$E0
		BCC bra3_B556 ;Don't clear object if it's above the death barrier
			LDA #$00
			STA ObjectSlot,X
			STA ObjectState,X
			STA ObjectVariables,X ;Clear object from memory

bra3_B556:
	Obj_DistCalc bra3_B5BA_RTS

bra3_B5BA_RTS:
	RTS

;----------------------------------------
;SUBROUTINE ($B5BB)
;Turns the object around in the direction of the player
;----------------------------------------
Obj_FacePlayer:
	LDA #$00
	STA ObjectVariables,X ;Clear object variable
	TAY ;Set object direction to right
	LDA ObjXScreenDistance,X
	BMI @SetDirection ;Branch if the object is behind the player, setting its direction to right
		LDY #$40 ;If the object is ahead of the player, set object direction to left
@SetDirection:
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
	BCC loc3_B632
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
	BCS loc3_B632
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
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
	BCC loc3_B70F
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
	BCS loc3_B70F
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
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
	BCC loc3_B883
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
	BCS loc3_B883
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
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
	BCC bra3_B903_RTS
	LDA #$00
	STA $0641,X
	INC ObjectAction,X
bra3_B903_RTS:
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
	BCC loc3_B9D5_RTS
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
	BCS loc3_B9D5_RTS
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
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
	BCC loc3_BC1D_RTS
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
	BCS loc3_BC1D_RTS
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
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

;----------------------------------------
;SUBROUTINE ($BCA7)
;Like the subroutine below it, except it gives more rebound speed and always turns the player right.
;----------------------------------------
Obj_StompReboundAlt:
	LDA #sfx_EnemyHit2
	STA Sound_Sfx ;Play enemy hit sound
	LDA #48
	STA PlayerYSpeed
	STA PlayerXSpeed ;Set player's horizontal and vertical rebound speed
	LDA PlayerMovement
	ORA #%00000100
	AND #%10111110 ;This may be a bug
	STA PlayerMovement ;Make player move upwards and right
	LDA #$01
	JMP RewardPoints ;Give player 200 points

;----------------------------------------
;SUBROUTINE ($BCBE)
;Bounces the player back and gives them points while playing a sound effect 
;----------------------------------------
Obj_StompRebound:
	LDA #sfx_EnemyHit2
	STA Sound_Sfx ;Play hit sound effect

;----------------------------------------
;SUBROUTINE ($BCC2)
;Bounces the player back and gives them points
;----------------------------------------
Obj_StompReboundNoSFX:
	LDA #8
	STA PlayerYSpeed ;Set vertical rebound speed
	LDA PlayerMovement
	ORA #%00000100 ;Make player move up
	EOR #%00000001
	STA PlayerMovement ;Reverse the player's horizontal direction
	LDA #8
	STA PlayerXSpeed ;Set horizontal rebound speed
	LDA #$01 ;Give player 200 points

;----------------------------------------
;SUBROUTINE ($BCD4)
;Rewards one of 4 score values to the current player from a table based on the value of the accumulator.
; Parameters:
; > A = Score Value
;   > 0 = 100
;   > 1 = 200
;   > 2 = 500
;   > 3 = 1000
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
	
; Add to player's score
	LDA ScoreTbl,Y
	CLC
	ADC P1Score,X
	STA P1Score,X
	LDA P1Score+1,X
	ADC $32
	STA P1Score+1,X
	
; Restore original X and Y registers
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
	STA Sound_Sfx ;Play appropriate sound
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
	BEQ loc3_BDCE
	LDA PlayerYSpeed
	BEQ bra3_BE27
	LDA PlayerMovement
	AND #$04
	BEQ bra3_BE27
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
	LDA #sfx_BlockRelease
	STA Sound_Sfx ;Play the block release sound
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
	BCC loc3_BE29
	PLA
	PLA
	RTS
bra3_BE54:
	LDY $A4
	STY $32
	CPX $32
	BEQ loc3_BE29
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
;SUBROUTINE ($BEBC)
;Checks if the player collides with the object's hitbox. If the player takes damage or isn't touching the object, it will stop the object's code.
;----------------------------------------
Obj_PlayerHitCheck:
	LDX $A4 ;Get current object index
	LDY ObjectSlot,X
	LDA ObjectXHitBoxSizes,Y
	STA $36
	LDA ObjectYHitBoxSizes,Y
	STA $38
	LDY #$10 ;Set default player hitbox to 16 pixels high
	LDA PlayerPowerup
	BEQ @SetPlayerDuckingHeight ;Branch if the player is small, keeping their hitbox at 16 pixels high
	LDY #$18 ;Otherwise, if they have a powerup, make their hitbox 24 pixels high

@SetPlayerDuckingHeight:
	LDA PlayerAction
	CMP #pAction_Duck
	BNE @HorizHitboxCheck ;Don't change the player's hitbox size if they aren't ducking
	LDY #$08 ;If the player is ducking, make their hitbox 8 pixels high

@HorizHitboxCheck:
	STY $32 ;Store player's hitbox height
	LDA ObjXScreenDistance,X
	BPL @HorizHitboxCheckLeft ;Branch if the player is to the left of the object
	; If player is to the right of the object:
		LDA #5
		CLC
		ADC $36
		CLC
		ADC ObjectXDistance,X ;5 + X Hitbox + X Distance > 255
		BCS @VertHitboxCheck ;Move to the vertical check if player is within 5 pixels of the object's hitbox horizontally
		BCC SkipPlayerObjectColl ;Otherwise, stop

	; If player is to the left of the object:
	@HorizHitboxCheckLeft:
		LDA ObjectXDistance,X
		CMP #5
		BCS SkipPlayerObjectColl ;Stop if the player is more than 5 pixels away from the object

; Otherwise, if the player is within the horizontal hitbox, move to the vertical hitbox check
@VertHitboxCheck:
	LDA ObjYScreenDistance,X
	BEQ @VertHitboxCheckAbove ;Skip these checks if the player's origin is already above or at the object's origin
	CMP #$FF
	BNE SkipPlayerObjectColl ;Stop if the object is off-screen
	; If the player is at the same level as the object:
		LDA $32
		CLC
		ADC $38
		CLC
		ADC ObjectYDistance,X ;Player Hitbox Height + Object Hitbox Height > 255
		BCS @HandleCollision ;Handle collision with the player if they're within the object's vertical hitbox
		BCC SkipPlayerObjectColl ;Otherwise, stop

	; If the player's origin is above or at the object's:
	@VertHitboxCheckAbove:
		LDA ObjectYDistance,X
		CMP #$00
		BCS SkipPlayerObjectColl ;Stop if the player is above the object
	; Otherwise, continue and handle collision with player
	@HandleCollision:
		CLC
		BCC CheckIfCollided ;Handle collision

SkipPlayerObjectColl:
	SEC ;If set, the branch below will fail and collision with the player won't be handled

CheckIfCollided:
	BCC ObjHandlePlayerColl ;If not set, handle collision accordingly
bra3_BF1A:
	LDA ObjectState,X
	AND #%11100000
	STA ObjectState,X ;Stop checking for collision
	PLA
	PLA
	RTS ;Go back two calls and stop running code for this object.

; Check if the player can take damage
ObjHandlePlayerColl:
	LDA ObjYScreenDistance,X
	BPL @InvincibilityCheck ;Only continue if the player isn't above the object's hitbox
	LDA ObjectYDistance,X
	CMP #-14
	BCC @InvincibilityCheck ;AND only continue if the player is within 14 pixels of the object vertically
		LDA PlayerAction
		CMP #pAction_ClimbIdle
		BEQ @GivePoints
		CMP #pAction_ClimbMove
		BEQ @GivePoints ;Give points if the player hits the object while climbing
		LDA PlayerMovement
		AND #%00000100
		BNE @InvincibilityCheck ;Don't give points if the player is moving up

@GivePoints:
	LDA InvincibilityTimer
	BNE @GivePointsContinue ;Reward points immediately if the player already has invulnerability frames
	LDA #$F6
	STA InvincibilityTimer ;Otherwise, give them 12 frames of invulnerability without flickering
@GivePointsContinue:
	LDA #$01
	JSR RewardPoints ;Give the player 200 points
	RTS

@InvincibilityCheck:
	LDA InvincibilityTimer
	BEQ @DamagePlayer ;Deal damage if the player isn't invincible
	CMP #$D0
	BCS bra3_BF1A ;Stop collision check if the player has invulnerability frames
	; Otherwise, if player has star power:
		LDX $A4
		LDA ObjectState,X
		AND #%11100000 ;Ignore function number bits
		ORA #%00000100 ;Kill object
		STA ObjectState,X
		LDA #$00
		STA ObjectVariables,X ;Clear object variables
		PLA
		PLA
		RTS ;Go back two calls and stop running code for this object

@DamagePlayer:
	JSR DealDamage ;Deal damage
	PLA
	PLA
	RTS ;Go back two calls and stop running code for this object

jmp_54_BF74:
	LDA InvincibilityTimer
	BEQ DealDamage
	RTS

;----------------------------------------
;SUBROUTINE ($BF7A)
;Deals damage to the player. This is only used within this bank
;----------------------------------------
DealDamage:
	LDX $A4
	LDA ObjectSlot,X
	CMP #$48
	BCC @TurnObject
	CMP #$4C
	BCC @DamagePlayer ;Don't turn objects $48 - $4C around when they damage the player

; Turn the object in the direction of the player when it damages them
@TurnObject:
	LDA ObjXScreenDistance,X
	BMI @TurnObjectRight ;Turn object right if the player is damaged from the right
	LDA ObjectState,X
	ORA #%01000000 ;Turn object left if the player is damaged from the left 
	BNE @SetObjectDirection

@TurnObjectRight:
	LDA ObjectState,X
	AND #%10111111

@SetObjectDirection:
	STA ObjectState,X ;Turn object right

@DamagePlayer:
	LDA #$00
	STA PlayerHoldFlag
	LDA Player1YoshiStatus
	BEQ @DamageNoYoshi ;Branch if player isn't on Yoshi
	;Otherwise, inflict damage to Yoshi
		LDA #$01
		STA HurtFlag
		JMP @GiveIFrames ;Hurt player and give them invulnerability frames

; Handle damage if the player isn't riding Yoshi
@DamageNoYoshi:
	LDA PlayerPowerup
	BEQ @KillPlayer ;Kill the player if they're already small
	;Otherwise, make the player small
		LDA #$00
		STA PlayerPowerup
	LDA #$01
	STA PlayerPowerupBuffer ;Make the game buffer while the player is taking damage
	LDA #$07
	STA GameState ;Pause game to change powerup

@GiveIFrames:
	LDA #$D0
	STA InvincibilityTimer ;Give player (128) invulnerability frames
	LDA #sfx_PowerDown
	STA Sound_Sfx ;Play hurt sound
	LDA ObjectState,X
	AND #%11100000
	STA ObjectState,X ;End collision check for this frame
	RTS

@KillPlayer:
	LDA #gameState_Death
	STA GameState ;Trigger death event
	LDA #$00
	STA GameSubstate ;Go to first part of event
	STA PlayerState
	STA $06DC
	STA $06DD ;Clear player variables
	RTS
