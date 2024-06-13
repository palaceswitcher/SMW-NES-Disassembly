;disassembled by BZK 6502 Disassembler
obj_h36:
	LDA YoshiXPos
	SEC
	SBC PlayerXPosDup
	STA YoshiXDistance
	LDA YoshiXScreen
	SBC PlayerXScreenDup
	STA YoshiXScreenDist
	BEQ bra7_8018
	CMP #$FF
	BEQ bra7_8018
	RTS
bra7_8018:
	LDA YoshiYPos
	SEC
	SBC PlayerYPosDup
	STA YoshiYDistance
	LDA YoshiYScreen
	SBC PlayerYScreenDup
	STA YoshiYScreenDist
	LDA PlayerYScreenDup
	CMP YoshiYScreen
	BEQ bra7_805A
	LDA YoshiYScreenDist
	BPL bra7_8049
	LDA YoshiYDistance
	CLC
	ADC #$10
	STA YoshiYDistance
	LDA YoshiYScreenDist
	ADC #$00
	STA YoshiYScreenDist
	JMP loc7_805A
bra7_8049:
	LDA YoshiYDistance
	SEC
	SBC #$10
	STA YoshiYDistance
	LDA YoshiYScreenDist
	SBC #$00
	STA YoshiYScreenDist
bra7_805A:
loc7_805A:
	LDA YoshiUnmountedState
	AND #$7F
	ASL
	TAY
	LDA tbl7_806E,Y
	STA $32
	LDA tbl7_806E+1,Y
	STA $33
	JMP ($32)
tbl7_806E:
	dw ptr5_8078
	dw ptr5_8079
	dw ptr5_80AB
	dw ptr5_8150
	dw ptr5_8197
ptr5_8078:
	RTS
ptr5_8079:
	LDA FrameCount
	AND #$07
	BNE bra7_8090_RTS
	LDA $05F6
	AND #$0F
	TAX
	LDA tbl7_80A2,X
	BMI bra7_8091
	STA YoshiAnimation
	INC $05F6
bra7_8090_RTS:
	RTS
bra7_8091:
	INC YoshiUnmountedState
	LDA $05F6
	AND #$F0
	STA $05F6
	LDA #$00
	STA FreezeFlag
	RTS
tbl7_80A2:
	db $00
	db $01
	db $00
	db $01
	db $02
	db $03
	db $02
	db $03
	db $80
ptr5_80AB:
	LDX $05F6
	LDA tbl7_813C,X
	CMP #$02
	BNE bra7_80C5
	JSR sub3_B758
	BNE bra7_80C5
	LDA #$04
	STA YoshiUnmountedState
	LDA #$00
	STA $05F7
	RTS
bra7_80C5:
	JSR sub7_820C
	LDA FrameCount
	AND #$03
	BEQ bra7_80CF
	RTS
bra7_80CF:
	LDA $05F6
	AND #$0F
	TAY
	LDA tbl7_8127,Y
	BPL bra7_80E7
	LDA $05F6
	AND #$F0
	STA $05F6
	LDY #$00
	LDA tbl7_8127
bra7_80E7:
	LDX YoshiIdleStorage
	CPX #$01
	BEQ bra7_80F0
	LDA #$09
bra7_80F0:
	STA YoshiAnimation
	LDA tbl7_813C,Y
	BMI bra7_8111
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra7_8105
	CMP #$F0
	BCC loc7_8123
bra7_8105:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc7_8123
bra7_8111:
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS loc7_8123
	SEC
	SBC #$10
	STA YoshiYPos
	DEC YoshiYScreen
loc7_8123:
	INC $05F6
	RTS
tbl7_8127:
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $04
	db $04
	db $04
	db $04
	db $80
tbl7_813C:
	db $FE
	db $FF
	db $01
	db $02
	db $FE
	db $FF
	db $01
	db $02
	db $FE
	db $FF
	db $01
	db $02
	db $FE
	db $FF
	db $01
	db $02
	db $FE
	db $FF
	db $01
	db $02
ptr5_8150:
	LDA #$22
	JSR sub_54_B5CD
	JSR sub7_820C
	LDA FrameCount
	AND #$03
	BNE bra7_8189_RTS
	LDA $05F6
	AND #$0F
	TAY
	LDA tbl7_818A,Y
	BPL bra7_8176
	LDA $05F6
	AND #$F0
	STA $05F6
	LDY #$00
	LDA tbl7_818A
bra7_8176:
	LDX YoshiIdleStorage
	CPX #$01
	BEQ bra7_8183
	TYA
	AND #$01
	CLC
	ADC #$0A
bra7_8183:
	STA YoshiAnimation
	INC $05F6
bra7_8189_RTS:
	RTS
tbl7_818A:
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $05
	db $06
	db $07
	db $08
	db $07
	db $08
	db $80
ptr5_8197:
	JSR sub3_B758
	BNE bra7_81DE
	LDA #$06
	STA YoshiAnimation
	LDA $05F7
	AND #$7F
	CMP #$07
	BCS bra7_81AD
	INC $05F7
bra7_81AD:
	LDA $05F7
	BMI bra7_81CB
	CLC
	ADC YoshiYPos
	STA YoshiYPos
	BCS bra7_81BF
	CMP #$F0
	BCC bra7_81DD_RTS
bra7_81BF:
	CLC
	ADC #$10
	STA YoshiYPos
	INC YoshiYScreen
	JMP loc7_81DD_RTS
bra7_81CB:
	db $18
	db $6D
	db $F4
	db $05
	db $8D
	db $F4
	db $05
	db $B0
	db $09
	db $38
	db $E9
	db $10
	db $8D
	db $F4
	db $05
	db $CE
	db $F5
	db $05
bra7_81DD_RTS:
loc7_81DD_RTS:
	RTS
bra7_81DE:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA YoshiYPos
	SEC
	SBC $25
	BCS bra7_81F4
	DEC YoshiYScreen
	SEC
	SBC #$10
bra7_81F4:
	STA YoshiYPos
	LDA #$00
	STA $05F7
	LDY #$02
	LDA $50
	BEQ bra7_8208
	LDA #$00
	STA $50
	LDY #$03
bra7_8208:
	STY YoshiUnmountedState
	RTS
sub7_820C:
	LDA PlayerHoldFlag
	BNE bra7_827B_RTS
	LDA YoshiIdleMovement
	AND #$40
	BNE bra7_8222
	LDA YoshiXPos
	CLC
	ADC #$10
	PHA
	JMP loc7_8229
bra7_8222:
	LDA YoshiXPos
	CLC
	ADC #$24
	PHA
loc7_8229:
	LDA YoshiXScreen
	ADC #$00
	STA $34
	PLA
	SEC
	SBC PlayerXPosDup
	STA $32
	LDA $34
	SBC PlayerXScreenDup
	BNE bra7_826C
	LDA $32
	CMP #$14
	BCS bra7_826C
	LDA YoshiYPos
	CLC
	ADC #$10
	PHA
	LDA YoshiYScreen
	ADC #$00
	STA $34
	PLA
	SEC
	SBC PlayerYPosDup
	STA $32
	LDA $34
	SBC PlayerYScreenDup
	BNE bra7_826C
	LDA $32
	CMP #$08
	BCS bra7_826C
	LDA PlayerMovement
	AND #$04
	BNE bra7_826C
	LDA #$06
	STA PlayerState
bra7_826C:
	LDA PlayerState
	CMP #$07
	BNE bra7_827B_RTS
	LDA #$00
	STA YoshiUnmountedState
	LDA #$0D
	STA SFXRegister
bra7_827B_RTS:
	RTS
sub_53_827C:
	LDA YoshiXScreenDist
	BEQ bra7_8286
	CMP #$FF
	BEQ bra7_8286
	RTS
bra7_8286:
	LDA YoshiUnmountedState
	BNE bra7_828C
	RTS
bra7_828C:
	LDA YoshiAnimation
	ASL
	TAX
	LDA tbl7_82A2,X
	STA $32
	LDA tbl7_82A2+1,X
	STA $33
	LDA #$40
	STA $36
	JMP jmp_52_A463
tbl7_82A2:
	dw ofs_82BA ;Idle Yoshi Mappings
	dw ofs_82C5
	dw ofs_82D0
	dw ofs_82E3
	dw ofs_82F6
	dw ofs_8309
	dw ofs_831C
	dw ofs_832F
	dw ofs_8342
	dw ofs_8355
	dw ofs_8368
	dw ofs_837B
ofs_82BA:
	db $02
	db $04
	db $90
	db $FF
	db $FF
	db $FF
	db $FF
	db $37
	db $38
	db $39
	db $3A
ofs_82C5:
	db $02
	db $04
	db $90
	db $FF
	db $FF
	db $FF
	db $FF
	db $2B
	db $2C
	db $2D
	db $2E
ofs_82D0:
	db $04
	db $04
	db $92
	db $FF
	db $FF
	db $FF
	db $FF
	db $FF
	db $B1
	db $B2
	db $FF
	db $B3
	db $B4
	db $B5
	db $B6
	db $FF
	db $B7
	db $AF
	db $B0
ofs_82E3:
	db $04
	db $04
	db $92
	db $FF
	db $B8
	db $B9
	db $FF
	db $BA
	db $BB
	db $AB
	db $FF
	db $FF
	db $AC
	db $AD
	db $AE
	db $FF
	db $FF
	db $AF
	db $B0
ofs_82F6:
	db $04
	db $04
	db $A0
	db $FF
	db $2B
	db $2C
	db $FF
	db $2D
	db $2E
	db $2F
	db $FF
	db $FF
	db $30
	db $31
	db $32
	db $FF
	db $FF
	db $33
	db $34
ofs_8309:
	db $04
	db $04
	db $91
	db $FF
	db $76
	db $77
	db $FF
	db $78
	db $79
	db $7A
	db $FF
	db $FF
	db $FF
	db $6D
	db $6E
	db $FF
	db $FF
	db $6F
	db $70
ofs_831C:
	db $04
	db $04
	db $93
	db $FF
	db $F8
	db $F9
	db $FF
	db $FA
	db $FB
	db $EB
	db $FF
	db $FF
	db $EC
	db $ED
	db $EE
	db $FF
	db $FF
	db $EF
	db $F0
ofs_832F:
	db $04
	db $04
	db $91
	db $71
	db $72
	db $73
	db $FF
	db $FF
	db $74
	db $75
	db $FF
	db $FF
	db $FF
	db $6D
	db $6E
	db $FF
	db $FF
	db $6F
	db $70
ofs_8342:
	db $04
	db $04
	db $93
	db $F1
	db $F2
	db $F3
	db $FF
	db $F4
	db $F5
	db $F6
	db $FF
	db $FF
	db $FF
	db $F7
	db $EE
	db $FF
	db $FF
	db $EF
	db $F0
ofs_8355:
	db $04
	db $04
	db $A0
	db $FF
	db $36
	db $37
	db $FF
	db $38
	db $39
	db $3A
	db $FF
	db $FF
	db $3B
	db $3C
	db $3D
	db $FF
	db $FF
	db $3F
	db $35
ofs_8368:
	db $04
	db $04
	db $A3
	db $FF
	db $FA
	db $F9
	db $FF
	db $FF
	db $FB
	db $FC
	db $FF
	db $FF
	db $FD
	db $FE
	db $EB
	db $FF
	db $FF
	db $F4
	db $F3
ofs_837B:
	db $04
	db $04
	db $9B
	db $F7
	db $F8
	db $F9
	db $FF
	db $FA
	db $FB
	db $FC
	db $FF
	db $FF
	db $FF
	db $FD
	db $F2
	db $FF
	db $FF
	db $EB
	db $F5
obj_h01:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_83AC
	CMP #$FF
	BEQ bra7_83AC
	JMP loc3_A6B5
bra7_83AC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_83EE
	LDA ObjYScreenDistance,X
	BPL bra7_83DD
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_83EE
bra7_83DD:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_83EE:
loc7_83EE:
	JSR jmp_54_BD3D
	LDA Player1YoshiStatus
	BNE bra7_83FB
	LDA YoshiUnmountedState
	BEQ bra7_840B
bra7_83FB:
	LDA #$05
	STA ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	LDA #$04
	STA ObjectState,X
	RTS
bra7_840B:
	LDA FrameCount
	AND #$03
	BNE bra7_8416
	LDA #$01
	JSR jmp_54_B11D
bra7_8416:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8432
	CMP #$FF
	BEQ bra7_8432
	JMP loc3_A6B5
bra7_8432:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8474
	LDA ObjYScreenDistance,X
	BPL bra7_8463
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8474
bra7_8463:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8474:
loc7_8474:
	LDA #$01
	STA FreezeFlag
	LDA ObjectVariables,X
	AND #$7F
	CMP #PlayerAnimationFrame
	BCC bra7_84C2_RTS
	LDA #$00
	STA ObjectSlot,X
	STA $05F7
	STA $05F6
	STA YoshiIdleMovement
	STA YoshiAnimation
	LDA #$01
	STA YoshiUnmountedState
	LDA ObjectXPos,X
	STA YoshiXPos
	LDA ObjectXScreen,X
	STA YoshiXScreen
	SEC
	LDA ObjectYPos,X
	CMP #$10
	BCS bra7_84B1
	SBC #$20
	JMP loc7_84B3
bra7_84B1:
	SBC #$10
loc7_84B3:
	STA YoshiYPos
	LDA ObjectYScreen,X
	SBC #$00
	STA YoshiYScreen
	LDA #sfxYoshiMount
	STA SFXRegister
bra7_84C2_RTS:
	RTS
obj_h6A:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_84E1
	CMP #$FF
	BEQ bra7_84E1
	JMP loc3_A6B5
bra7_84E1:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8523
	LDA ObjYScreenDistance,X
	BPL bra7_8512
	LDA ObjectYDistance,X
	CLC ;logged as data
	ADC #$10 ;logged as data
	STA ObjectYDistance,X ;logged as data
	LDA ObjYScreenDistance,X ;logged as data
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8523
bra7_8512:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8523:
loc7_8523:
	LDA FreezeFlag
	BEQ bra7_8529
	RTS
bra7_8529:
	JSR jmp_54_BD3D
obj_h02:
	LDA #$02
	STA $25 ;Configure this to stay in Yoshi's mouth when eaten 
	LDX $A4 ;Get the index for the object's slot
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X ;Calculate the x distance from the player
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X ;Calculate the x screen distance from the player
	STA $28
	BEQ bra7_854E ;Branch if the player and the object are on the same screen
	CMP #$FF ;If not, check if the object is one screen behind the player
	BEQ bra7_854E ;If so, branch
	JMP loc3_A6B5 ;Otherwise, jump
bra7_854E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8590
	LDA ObjYScreenDistance,X
	BPL bra7_857F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8590
bra7_857F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8590:
loc7_8590:
	LDA FreezeFlag
	BEQ bra7_8596 ;Branch if the game isn't freezed
	RTS ;Otherwise, stop
bra7_8596:
	LDA ObjectState,X
	AND #$1F ;Mask out lower 5 bits
	ASL
	TAY ;Get pointer index for status
	LDA tbl7_85AA,Y
	STA $32
	LDA tbl7_85AA+1,Y
	STA $33 ;Load pointer into memory
	JMP ($32) ;Jump to pointer
tbl7_85AA:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB5D
	dw ptr5_85B8
	dw ptr_AE17
	dw ptr5_8689
	dw ptr5_8695
ptr5_85B8:
	JSR PositionCarriedObject
	LDA FrameCount
	AND #$00
	BNE bra7_85C6
	LDA #$27
	JSR GetMovementData
bra7_85C6:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_85E2
	CMP #$FF
	BEQ bra7_85E2
	JMP loc3_A6B5
bra7_85E2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ loc7_8624
	LDA ObjYScreenDistance,X
	BPL bra7_8613
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8624
bra7_8613:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
loc7_8624:
	LDA FreezeFlag
	BEQ bra7_862A
	RTS
bra7_862A:
	JSR jmp_54_A6D4
	JSR jmp_54_A773
	JSR SetObjectCarryState
	LDA PlayerYSpeed
	BEQ bra7_8653
	LDA PlayerMovement
	AND #$04
	BNE bra7_8652_RTS
	LDA #$01
	STA $0633
	LDA #$1E
	STA $0635
	LDA #$0F
	STA SFXRegister
	LDA #$00
	LDX $A4
	STA ObjectSlot,X
bra7_8652_RTS:
	RTS
bra7_8653:
	LDA Player1YoshiStatus
	BEQ bra7_866B
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$03
	STA SFXRegister
	RTS
bra7_866B:
	LDA PlayerMovement
	AND #$01
	BNE bra7_867E
	LDA ObjXScreenDistance,X
	BMI bra7_8688_RTS
	LDA #$01
	STA $06EF
	JMP loc7_8688_RTS
bra7_867E:
	LDA ObjXScreenDistance,X
	BPL bra7_8688_RTS
	LDA #$01
	STA $06EF
bra7_8688_RTS:
loc7_8688_RTS:
	RTS
ptr5_8689:
	LDA FrameCount
	AND #$00
	BNE bra7_8694_RTS
	LDA #$26
	JSR GetMovementData
bra7_8694_RTS:
	RTS
ptr5_8695:
	LDA FrameCount
	AND #$00
	BNE bra7_86A0
	LDA #$04
	JSR GetMovementData
bra7_86A0:
	LDA ObjectState,X
	AND #$20
	BEQ bra7_86F2_RTS
	LDA ObjXScreenDistance,X
	BPL bra7_86B9
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra7_86C0
	BCC bra7_86E0
bra7_86B9:
	LDA ObjectXDistance,X
	CMP #$10
	BCS bra7_86E0
bra7_86C0:
	LDA ObjYScreenDistance,X
	BEQ bra7_86D6
	CMP #$FF
	BNE bra7_86E0
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC ObjectYDistance,X
	BCS bra7_86DD
	BCC bra7_86E0
bra7_86D6:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra7_86E0
bra7_86DD:
	CLC
	BCC bra7_86E1
bra7_86E0:
	SEC
bra7_86E1:
	BCS bra7_86F2_RTS
	LDA ObjectState,X
	AND #$40
	ORA #$04
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
bra7_86F2_RTS:
	RTS
obj_h03:
	LDA #$03
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8715
	CMP #$FF
	BEQ bra7_8715
	JMP loc3_A6B5
bra7_8715:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8757
	LDA ObjYScreenDistance,X
	BPL bra7_8746
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8757
bra7_8746:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8757:
loc7_8757:
	LDA FreezeFlag
	BEQ bra7_875D
	RTS
bra7_875D:
	LDA ObjectState,X
	AND #$1F ;Mask out the upper 3 bits, limiting it to $00 - $1F
	ASL
	TAY ;Get pointer for the object's current state
	LDA tbl7_8771,Y
	STA $32
	LDA tbl7_8771+1,Y
	STA $33 ;Load pointer into memory
	JMP ($32) ;Jump to pointer location
tbl7_8771:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB5D
	dw ptr5_8789
	dw ptr_AE17
	dw ptr5_884C
	dw ptr5_8695
	dw ptr5_88BC
	dw ptr5_88BC
	dw ptr5_88BC
	dw ptr5_8931
	dw ptr5_89C1
ptr5_8789:
	JSR PositionCarriedObject
	LDA FrameCount
	AND #$00
	BNE bra7_8797
	LDA #$27
	JSR GetMovementData
bra7_8797:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_87B3
	CMP #$FF
	BEQ bra7_87B3
	JMP loc3_A6B5
bra7_87B3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_87F5
	LDA ObjYScreenDistance,X
	BPL bra7_87E4
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_87F5
bra7_87E4:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_87F5:
loc7_87F5:
	LDA FreezeFlag
	BEQ bra7_87FB
	RTS

bra7_87FB:
	JSR jmp_54_A6D4
	JSR jmp_54_A773
	JSR SetObjectCarryState
	LDA PlayerYSpeed
	BEQ bra7_881E
	LDA PlayerMovement
	AND #$04
	BNE bra7_881D_RTS
	LDA #$00
	STA PlayerYSpeed
	LDX $A4
	LDA ObjectState,X
	CLC
	ADC #$04
	STA ObjectState,X
bra7_881D_RTS:
	RTS
bra7_881E:
	LDA Player1YoshiStatus
	BEQ bra7_882E
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra7_882E:
	LDA PlayerMovement
	AND #$01
	BNE bra7_8841
	LDA ObjXScreenDistance,X
	BMI bra7_884B_RTS
	LDA #$01
	STA $06EF
	JMP loc7_884B_RTS
bra7_8841:
	LDA ObjXScreenDistance,X
	BPL bra7_884B_RTS
	LDA #$01
	STA $06EF
bra7_884B_RTS:
loc7_884B_RTS:
	RTS
ptr5_884C:
	LDA FrameCount
	AND #$00
	BNE bra7_8857
	LDA #$26
	JSR GetMovementData
bra7_8857:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8873
	CMP #$FF
	BEQ bra7_8873
	JMP loc3_A6B5
bra7_8873:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_88B5
	LDA ObjYScreenDistance,X
	BPL bra7_88A4
	LDA ObjectYDistance,X ;logged as data
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_88B5
bra7_88A4:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_88B5:
loc7_88B5:
	LDA FreezeFlag
	BEQ bra7_88BB_RTS
	RTS
bra7_88BB_RTS:
	RTS
ptr5_88BC:
	LDA FrameCount
	AND #$00
	BNE bra7_88C7
	LDA #$27
	JSR GetMovementData
bra7_88C7:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_88E3
	CMP #$FF
	BEQ bra7_88E3
	JMP loc3_A6B5
bra7_88E3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8925
	LDA ObjYScreenDistance,X
	BPL bra7_8914
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8925
bra7_8914:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8925:
loc7_8925:
	LDA FreezeFlag
	BEQ bra7_892B
	RTS
bra7_892B:
	LDX $A4
	INC ObjectState,X
	RTS
ptr5_8931:
	LDA FrameCount
	AND #$00
	BNE bra7_893C
	LDA #$27
	JSR GetMovementData
bra7_893C:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8958
	CMP #$FF
	BEQ bra7_8958
	JMP loc3_A6B5
bra7_8958:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_899A
	LDA ObjYScreenDistance,X
	BPL bra7_8989
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_899A
bra7_8989:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_899A:
loc7_899A:
	LDA FreezeFlag
	BEQ bra7_89A0
	RTS
bra7_89A0:
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement ;Make player move upwards
	LDY #$50 ;Set speed to $50
	LDA zInputCurrentState
	AND #buttonA
	BEQ bra7_89B1 ;If A isn't held, branch and keep the speed
	LDY #$70 ;If it is held, set the speed to $70 instead
bra7_89B1:
	STY PlayerYSpeed
	LDA #$04
	STA PlayerAction
	LDX $A4
	INC ObjectState,X
	LDA #sfxSwim
	STA SFXRegister ;Play bounce sound
	RTS
ptr5_89C1:
	LDA FrameCount
	AND #$00
	BNE bra7_89CC
	LDA #$27
	JSR GetMovementData
bra7_89CC:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_89E8
	CMP #$FF
	BEQ bra7_89E8
	JMP loc3_A6B5
bra7_89E8:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8A2A
	LDA ObjYScreenDistance,X
	BPL bra7_8A19
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8A2A
bra7_8A19:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8A2A:
loc7_8A2A:
	LDA FreezeFlag
	BEQ bra7_8A30
	RTS
bra7_8A30:
	LDX $A4
	LDA ObjectState,X
	AND #$E0
	ORA #$03
	STA ObjectState,X
	RTS
obj_h44:
	LDX $A4
	LDA $0641,X
	CMP #$F0
	BCC bra7_8A60
	LDA ObjectSlot,X
	AND #$01
	CLC
	ADC #$42
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
	STA ObjectVariables,X
	STA PlayerHoldFlag
	STA $0641,X
	RTS
bra7_8A60:
	LDA $062B
	AND #$03
	BNE obj_h04
	INC $0641,X
obj_h04:
	LDA #$04
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8A8C
	CMP #$FF
	BEQ bra7_8A8C
	JMP loc3_A6B5
bra7_8A8C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8ACE
	LDA ObjYScreenDistance,X
	BPL bra7_8ABD
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8ACE
bra7_8ABD:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8ACE:
loc7_8ACE:
	LDA FreezeFlag
	BEQ bra7_8AD4
	RTS
bra7_8AD4:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8AE8,Y
	STA $32
	LDA tbl7_8AE8+1,Y
	STA $33
	JMP ($32)
tbl7_8AE8:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_8AFA
	dw ptr_AD88
	dw ptr5_8B55
	dw ptr_AD79
	dw ptr5_8B7D
	dw ptr5_8B91
ptr5_8AFA:
	JSR jmp_54_AC20
	JSR jmp_54_A6D4
	JSR jmp_54_A773
	JSR SetObjectCarryState
	LDA Player1YoshiStatus
	BEQ bra7_8B3F
	LDA PlayerYSpeed
	BEQ bra7_8B34
	LDA PlayerMovement
	AND #$04
	BNE bra7_8B33_RTS
bra7_8B15:
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA #$04
	STA PlayerAction
	LDA #$0F
	STA SFXRegister
	LDX $A4
	LDA #$0F
	STA ObjectSlot,X
	LDA #$00
	STA ObjectState,X
bra7_8B33_RTS:
	RTS
bra7_8B34:
	LDA #$20
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	RTS
bra7_8B3F:
	LDA $1E
	CMP #$05
	BEQ bra7_8B15
	INC ObjectState,X
	INC ObjectState,X
	LDA PlayerHoldFlag
	BNE bra7_8B33_RTS
	LDA #$15
	STA SFXRegister
	RTS
ptr5_8B55:
	LDX $A4
	LDA ObjectSlot,X
	CMP #$04
	BEQ bra7_8B66
	INC ObjectSlot,X
	INC ObjectSlot,X
	BNE bra7_8B6B
bra7_8B66:
	LDA #$38
	STA ObjectSlot,X
bra7_8B6B:
	LDA #$00
	LDY ObjXScreenDistance,X
	BPL bra7_8B74
	LDA #$40
bra7_8B74:
	STA ObjectState,X
	LDA #$80
	STA ObjectVariables,X
	RTS
ptr5_8B7D:
	LDA FrameCount
	AND #$00
	BNE bra7_8B88
	LDA #$04
	JSR GetMovementData
bra7_8B88:
	LDA #$10
	JSR sub3_AEA8
	JSR jmp_54_AD54
	RTS
ptr5_8B91:
	LDA FrameCount
	AND #$00
	BNE bra7_8B9C_RTS
	LDA #$27
	JSR GetMovementData
bra7_8B9C_RTS:
	RTS
obj_h38:
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BNE bra7_8BAB
	JMP loc7_8C42
bra7_8BAB:
	LDA FrameCount
	AND #$00
	BNE bra7_8BB6
	LDA #$25
	JSR GetMovementData
bra7_8BB6:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8BD2
	CMP #$FF
	BEQ bra7_8BD2
	JMP loc3_A6B5
bra7_8BD2:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8C14
	LDA ObjYScreenDistance,X
	BPL bra7_8C03
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8C14
bra7_8C03:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8C14:
loc7_8C14:
	LDA FreezeFlag
	BEQ bra7_8C1A
	RTS
bra7_8C1A:
	LDA ObjectVariables,X
	BPL bra7_8C36
	LDA ObjectXDistance,X
	BPL bra7_8C29
	EOR #$FF
	CLC
	ADC #$01
bra7_8C29:
	CMP #$18
	BCC bra7_8C41_RTS
	LDA ObjectVariables,X
	AND #$7F
	STA ObjectVariables,X
	RTS
bra7_8C36:
	JSR sub7_8C42
	LDA #$10
	JSR sub3_AEA8
	JSR jmp_54_AD54
bra7_8C41_RTS:
	RTS
loc7_8C42:
sub7_8C42:
	LDA #$04
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8C64
	CMP #$FF
	BEQ bra7_8C64
	JMP loc3_A6B5
bra7_8C64:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8CA6
	LDA ObjYScreenDistance,X
	BPL bra7_8C95
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8CA6
bra7_8C95:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8CA6:
loc7_8CA6:
	LDA FreezeFlag
	BEQ bra7_8CAC
	RTS
bra7_8CAC:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8CC0,Y
	STA $32
	LDA tbl7_8CC0+1,Y
	STA $33
	JMP ($32)
tbl7_8CC0:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_8CCA
	dw ptr_AD88
ptr5_8CCA:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	LDA #$30
	STA PlayerYSpeed
	LDA PlayerMovement
	ORA #$04
	STA PlayerMovement
	LDA ObjectSlot,X
	CMP #$38
	BEQ bra7_8CEB
	AND #$01
	CLC
	ADC #$44
	BNE bra7_8CED
bra7_8CEB:
	LDA #$04
bra7_8CED:
	STA ObjectSlot,X
	LDA ObjectState,X
	AND #$C0
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	RTS
obj_h49:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8D1C
	CMP #$FF
	BEQ bra7_8D1C
	JMP loc3_A6B5
bra7_8D1C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8D5E
	LDA ObjYScreenDistance,X
	BPL bra7_8D4D
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8D5E
bra7_8D4D:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8D5E:
loc7_8D5E:
	LDA FreezeFlag
	BEQ bra7_8D64
	RTS
bra7_8D64:
	JSR jmp_54_BD3D
	JMP loc7_8DD0
obj_h05:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8D88
	CMP #$FF
	BEQ bra7_8D88
	JMP loc3_A6B5
bra7_8D88:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8DCA
	LDA ObjYScreenDistance,X
	BPL bra7_8DB9
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8DCA
bra7_8DB9:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8DCA:
loc7_8DCA:
	LDA FreezeFlag
	BEQ bra7_8DD0
	RTS
bra7_8DD0:
loc7_8DD0:
	JSR sub7_8DEA
	LDX $A4
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCS bra7_8DE9_RTS
	LDA FrameCount
	AND #$01
	BNE bra7_8DE9_RTS
	LDA #$0B
	JSR GetMovementData
bra7_8DE9_RTS:
	RTS
sub7_8DEA:
	LDA #$06
	STA $25 ;Configure Yoshi tongue behavior (instantly swallowed)
	LDA ObjectState,X
	AND #%00011111 ;Mask out the upper 3 bits
	ASL
	TAY ;Use as pointer index
	LDA tbl7_8E02,Y
	STA $32
	LDA tbl7_8E02+1,Y
	STA $33 ;Load pointer into memory
	JMP ($32) ;Jump to pointer
tbl7_8E02:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_8E0C
	dw ptr5_8E21
ptr5_8E0C:
	JSR jmp_54_A773
	INC Player1Lives
	LDA #sfx1up
	STA SFXRegister ;Play 1UP sound
	LDA #$00
	STA ObjectSlot,X ;Despawn 1UP
	LDA #$03
	JSR RewardPoints
	RTS
ptr5_8E21:
	LDA ObjectVariables,X
	CMP #$0E
	BCS bra7_8E34
	LDA FrameCount
	AND #$03
	BNE bra7_8E33_RTS
	LDA #$05
	JSR GetMovementData
bra7_8E33_RTS:
	RTS
bra7_8E34:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	RTS
obj_h06:
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA ObjectSlot,X
	BEQ bra7_8E8B
	JSR sub3_B057
	BEQ bra7_8E5B
	CMP #$04
	BEQ bra7_8E5B
	CMP #$02
	BNE bra7_8E7F
bra7_8E5B:
	LDA FrameCount
	AND #$00
	BNE bra7_8E66 ;Set speed to once every frame
	LDA #$06
	JSR GetMovementData
bra7_8E66:
	LDA #$08
	JSR sub3_AEA8
	LDA ObjectSlot,X
	CMP #$70
	BEQ bra7_8E7F
	CMP #$42
	BCS bra7_8E7A
	CMP #$3A
	BCS bra7_8E7F
bra7_8E7A:
	LDA #$00
	STA ObjectSlot,X
bra7_8E7F:
	LDY $A4
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra7_8E8B:
	STA FireballSlot
	RTS
obj_h07:
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA ObjectSlot,X
	BEQ bra7_8ED8
	JSR sub3_B057
	BEQ bra7_8EA8
	CMP #$04
	BEQ bra7_8EA8
	CMP #$02
	BNE bra7_8ECC
bra7_8EA8:
	LDA FrameCount
	AND #$00
	BNE bra7_8EB3
	LDA #$06
	JSR GetMovementData
bra7_8EB3:
	LDA #$08
	JSR sub3_AEA8
	LDA ObjectSlot,X
	CMP #$70
	BEQ bra7_8ECC
	CMP #$42
	BCS bra7_8EC7
	CMP #$3A
	BCS bra7_8ECC
bra7_8EC7:
	LDA #$00
	STA ObjectSlot,X
bra7_8ECC:
	LDY $A4
	LDA #$0F
	STA ObjectSlot,Y
	LDA #$00
	STA ObjectState,Y
bra7_8ED8:
	STA FireballSlot2
	RTS
obj_h08:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8EFA
	CMP #$FF
	BEQ bra7_8EFA
	JMP loc3_A6B5
bra7_8EFA:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8F3C
	LDA ObjYScreenDistance,X
	BPL bra7_8F2B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8F3C
bra7_8F2B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8F3C:
loc7_8F3C:
	LDA FreezeFlag
	BEQ bra7_8F42
	RTS
bra7_8F42:
	JSR sub7_9538
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
sub7_8F50:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X ;Player X Screen - Object X Screen = X Screen Distance
	STA $28
	BEQ bra7_8F6C ;Branch ahead if the player is on the same screen as the object
	CMP #$FF ;Is the object 1 screen ahead of the player?
	BEQ bra7_8F6C ;If so, branch ahead
	JMP loc3_A6B5 ;Otherwise, jump
bra7_8F6C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_8FAE
	LDA ObjYScreenDistance,X
	BPL bra7_8F9D
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_8FAE
bra7_8F9D:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_8FAE:
loc7_8FAE:
	LDA FreezeFlag
	BEQ bra7_8FB4_RTS
	RTS
bra7_8FB4_RTS:
	RTS
obj_h09:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_8FD3
	CMP #$FF
	BEQ bra7_8FD3
	JMP loc3_A6B5
bra7_8FD3:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9015
	LDA ObjYScreenDistance,X
	BPL bra7_9004
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9015
bra7_9004:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9015:
loc7_9015:
	LDA FreezeFlag
	BEQ bra7_901B
	RTS
bra7_901B:
	JSR sub7_9538
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	ADC #$00
	STA ObjectYScreen,X
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
obj_h0A:
	LDX $A4
	JSR sub7_9538
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	LDA ObjectYScreen,X
	SBC #$00
	STA ObjectYScreen,X
	JSR sub7_8F50
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA ObjectSlot,X
	RTS
obj_h6B:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_907C
	CMP #$FF
	BEQ bra7_907C
	JMP loc3_A6B5
bra7_907C:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_90BE
	LDA ObjYScreenDistance,X
	BPL bra7_90AD
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_90BE
bra7_90AD:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_90BE:
loc7_90BE:
	LDA FreezeFlag
	BEQ bra7_90C4
	RTS
bra7_90C4:
	JSR sub7_9149
	RTS
obj_h0B:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_90E6
	CMP #$FF
	BEQ bra7_90E6
	JMP loc3_A6B5
bra7_90E6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9128
	LDA ObjYScreenDistance,X
	BPL bra7_9117
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9128
bra7_9117:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9128:
loc7_9128:
	LDA FreezeFlag
	BEQ bra7_912E
	RTS
bra7_912E:
	JSR jmp_54_BD3D
	JSR sub7_9149
	LDA ObjectState,X ;Get the current object state
	AND #%00001111 ;Mask the lower 4 bits out
	CMP #$04
	BCS bra7_9148_RTS ;Continue if the result is less than $04
	LDA FrameCount
	AND #$01
	BNE bra7_9148_RTS ;Only continue if on an even frame
	LDA #$0B
	JSR GetMovementData ;Get the movement data
bra7_9148_RTS:
	RTS
sub7_9149:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9161,Y
	STA $32
	LDA tbl7_9161+1,Y
	STA $33
	JMP ($32)
tbl7_9161:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_916B
	dw ptr5_917C
ptr5_916B:
	JSR jmp_54_A773
	JSR sub3_AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR RewardPoints
	RTS
ptr5_917C:
	LDA ObjectVariables,X
obj_h3A:
	CMP #$0E
	BCS bra7_91A2
	LDA ObjectSlot,X
	CMP #$39
	BNE bra7_9196
	LDA FrameCount
	AND #$00
	BNE bra7_9195_RTS
	LDA #$2A
	JSR GetMovementData
bra7_9195_RTS:
	RTS
bra7_9196:
	LDA FrameCount
	AND #$03
	BNE bra7_91A1_RTS
	LDA #$05
	JSR GetMovementData
bra7_91A1_RTS:
	RTS
bra7_91A2:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	RTS
obj_h0C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_91CE
	CMP #$FF
	BEQ bra7_91CE
	JMP loc3_A6B5
bra7_91CE:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9210
	LDA ObjYScreenDistance,X
	BPL bra7_91FF
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9210
bra7_91FF:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9210:
loc7_9210:
	LDA FreezeFlag
	BEQ bra7_9216
	RTS
bra7_9216:
	JSR jmp_54_BD3D
	LDA FrameCount
	AND #$03
	BNE bra7_9224
	LDA #$0C
	JSR jmp_54_B11D
bra7_9224:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9240
	CMP #$FF
	BEQ bra7_9240
	db $4C
	db $B5
	db $A6
bra7_9240:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9282
	LDA ObjYScreenDistance,X
	BPL bra7_9271
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9282
bra7_9271:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9282:
loc7_9282:
	LDA FreezeFlag
	BEQ bra7_9288
	RTS
bra7_9288:
	LDA ObjectVariables,X
	CMP #$0F
	BCS bra7_9290
	RTS
bra7_9290:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_92A8,Y
	STA $32
	LDA tbl7_92A8+1,Y
	STA $33
	JMP ($32)
tbl7_92A8:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_92B2
	dw ptr5_92C3
ptr5_92B2:
	JSR jmp_54_A773
	JSR sub3_AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR RewardPoints
	RTS
ptr5_92C3:
	LDX $A4
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
obj_h0D:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_92EC
	CMP #$FF
	BEQ bra7_92EC
	JMP loc3_A6B5
bra7_92EC:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_932E
	LDA ObjYScreenDistance,X
	BPL bra7_931D
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_932E
bra7_931D:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_932E:
loc7_932E:
	LDA FreezeFlag
	BEQ bra7_9334
	RTS
bra7_9334:
	JSR jmp_54_BD3D
	LDA FrameCount
	AND #$03
	BNE bra7_9342
	LDA #$0D
	JSR jmp_54_B470
bra7_9342:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_935E
	CMP #$FF
	BEQ bra7_935E
	JMP loc3_A6B5
bra7_935E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_93A0
	LDA ObjYScreenDistance,X
	BPL bra7_938F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_93A0
bra7_938F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_93A0:
loc7_93A0:
	LDA FreezeFlag
	BEQ bra7_93A6
	RTS
bra7_93A6:
	LDA ObjectVariables,X
	CMP #$0F
	BCS bra7_93AE
	RTS
bra7_93AE:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_93C6,Y
	STA $32
	LDA tbl7_93C6+1,Y
	STA $33
	JMP ($32)
tbl7_93C6:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_93D0
	dw ptr5_92C3
ptr5_93D0:
	JSR jmp_54_A773
	JSR sub3_AE37
	LDA #$00
	STA ObjectSlot,Y
	LDA #$03
	JSR RewardPoints
	RTS
obj_h0E:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_93FF
	CMP #$FF
	BEQ bra7_93FF
	JMP loc3_A6B5
bra7_93FF:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9441
	LDA ObjYScreenDistance,X
	BPL bra7_9430
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9441
bra7_9430:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9441:
loc7_9441:
	LDA FreezeFlag
	BEQ bra7_9447
	RTS
bra7_9447:
	JSR jmp_54_BD3D
	JSR sub7_9462
	LDA ObjectState,X
	AND #$0F
	CMP #$04
	BCS bra7_9461_RTS
	LDA FrameCount
	AND #$01
	BNE bra7_9461_RTS
	LDA #$0E
	JSR GetMovementData
bra7_9461_RTS:
	RTS
sub7_9462:
	LDA #$06
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_947A,Y
	STA $32
	LDA tbl7_947A+1,Y
	STA $33
	JMP ($32)
tbl7_947A:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_9484
	dw ptr5_9497
ptr5_9484:
	JSR jmp_54_A773
	LDA #$01
	STA InvincibilityTimer
	LDA #$00
	STA ObjectSlot,X
	LDA #$03
	JSR RewardPoints
	RTS
ptr5_9497:
	LDA ObjectVariables,X
	CMP #$0E
	BCS bra7_94AA
	LDA FrameCount
	AND #$03
	BNE bra7_94A9_RTS
	LDA #$05
	JSR GetMovementData
bra7_94A9_RTS:
	RTS
bra7_94AA:
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	LDA #$00
	STA ObjectVariables,X
	RTS
obj_h0F:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_94D6
	CMP #$FF
	BEQ bra7_94D6
	JMP loc3_A6B5
bra7_94D6:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9518
	LDA ObjYScreenDistance,X
	BPL bra7_9507
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9518
bra7_9507:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9518:
loc7_9518:
	LDA FreezeFlag
	BEQ bra7_951E
	RTS
bra7_951E:
	LDA ObjectState,X
	BNE bra7_9527
	LDY #$0F
	STY SFXRegister
bra7_9527:
	CMP #$10
	BCC bra7_9534
	LDA #$00
	STA ObjectSlot,X
	STA ObjectState,X
	RTS
bra7_9534:
	INC ObjectState,X
	RTS
sub7_9538:
	LDA ObjectState,X
	AND #$40
	BEQ bra7_9550
	LDA ObjectXPos,X
	SEC
	SBC #$03
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	SBC #$00
	JMP loc7_955E
bra7_9550:
	LDA ObjectXPos,X
	CLC
	ADC #$03
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
loc7_955E:
	STA ObjectXScreen,X
	RTS
obj_u80:
	JSR sub7_9792
	LDY #$0D
	LDX $A4
	LDA ObjectVariables,X
	BMI bra7_9573
	CMP #$10
	BCC bra7_9573
	INY
bra7_9573:
	TYA
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_958D:
	JSR sub7_9792
ptr6_9590:
	LDA #$01
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
SprPtrs_CommonObjects:
	dw SprMap_Mushroom
	dw SprMap_PSwitch
	dw SprMap_KoopaShell1
	dw SprMap_Spring
	dw SprMap_SpringPressed
	dw SprMap_FireFlower
	dw ofs_95FE
	dw SprMap_Star
	dw SprMap_Feather
	dw SprMap_1UP
	dw ofs_961A
	dw ofs_961E
	dw SprMap_KoopaShell2
	dw ofs_9622
	dw ofs_9629
	dw SprMap_Checkpoint
	dw SprMap_GoalTape
SprMap_Mushroom:
	db $02 ;Tile Width
	db $02 ;Tile Height
	db $90 ;CHR Bank ID
	db $01, $02
	db $0B, $0C
SprMap_PSwitch:
	db $02
	db $02
	db $90
	db $03, $04
	db $0D, $0E
SprMap_KoopaShell1:
	db $02
	db $02
	db $90
	db $05, $06
	db $0F, $10
SprMap_KoopaShell2:
	db $02
	db $02
	db $90
	db $0F, $10
	db $05, $06
SprMap_Spring:
	db $02
	db $02
	db $90
	db $07, $08
	db $11, $12
SprMap_SpringPressed:
	db $02
	db $02
	db $90
	db $FF, $FF
	db $15, $16
SprMap_FireFlower:
	db $02
	db $02
	db $90
	db $17, $18
	db $1F, $20
ofs_95FE:
	db $02
	db $02
	db $90
	db $59, $5A
	db $61, $62
SprMap_Star:
	db $02
	db $02
	db $90
	db $1B, $1C
	db $23, $24
SprMap_Feather:
	db $02
	db $02
	db $90
	db $1D, $1E
	db $25, $26
SprMap_1UP:
	db $02
	db $02
	db $90
	db $27, $28
	db $29, $2A
ofs_961A:
	db $01
	db $01
	db $90
	db $FF
ofs_961E:
	db $01
	db $01
	db $84
	db $17
ofs_9622:
	db $02
	db $02
	db $90
	db $33, $34
	db $35, $36
ofs_9629:
	db $02
	db $02
	db $90
	db $2F, $30
	db $31, $32
ptr6_9630:
	LDX $A4
	LDA ObjectState,X
	AND #$1F
	TAX
	LDA tbl7_9654,X
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
tbl7_9654:
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $03
	db $04
	db $04
	db $04
	db $04
	db $04
ptr6_9660:
	LDY $A4
	LDA ObjectState,Y
	AND #$1F
	CMP #$04
	BEQ bra7_966F
	CMP #$06
	BNE bra7_968A
bra7_966F:
	LDA #$0C
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$80
	STA $05F0
	JSR jmp_54_A118
	RTS
bra7_968A:
	LDA #$02
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$00
	LDX $A4
	LDA ObjectSlot,X
	CMP #$38
	BNE bra7_96B0
	LDA $062B
	AND #$04
	BEQ bra7_96B0
	LDY #$40
bra7_96B0:
	STY $05F0
	JSR jmp_54_A118
	RTS
ptr6_96B7:
	JSR sub7_9792
	LDA #$09
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_96D5:
	LDY $A4
	LDA #$0B
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$00
	STA $36
	LDA $062B
	AND #$08
	ASL
	ASL
	ASL
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr7_96F8:
	LDX $A4
	LDA ObjectState,X
	STA $05F0
	LDA $062B
	AND #$04
	BNE bra7_971A_RTS
	ASL
	TAX
	LDA SprPtrs_HPodoboo,X
	STA $32
	LDA SprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	JSR jmp_54_A118
bra7_971A_RTS:
	RTS
SprPtrs_HPodoboo:
	dw SprMap_HPodoboo
SprMap_HPodoboo:
	db $02
	db $02
	db $90
	db $09, $0A
	db $13, $14
ptr6_9724:
	JSR sub7_9792
ptr6_9727:
	LDA #$00
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_9742:
	JSR sub7_9792
	LDA #$05
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$40
	LDA $062B
	AND #$10
	BEQ bra7_9762
	LDY #$00
bra7_9762:
	STY $05F0
	JSR jmp_54_A118
	RTS
ptr6_9769:
	JSR sub7_9792
	LDA #$08
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDY #$00
	LDA ObjectVariables,X
	CMP #$14
	BCC bra7_978B
	LDY #$40
bra7_978B:
	STY $05F0
	JSR jmp_54_A118
	RTS
sub7_9792:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra7_979B_RTS
	PLA
	PLA
bra7_979B_RTS:
	RTS
ptr6_979C:
	JSR sub7_9792
	LDY #$07
	LDA FrameCount
	AND #$08
	BEQ bra7_97A9
	LDY #$0A
bra7_97A9:
	TYA
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$00
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_97C3:
	LDA #$40
	STA $05F0
	LDA #$08
	STA $25
	LDA $05F0
	AND #$40
	BEQ bra7_9817
	LDX #$00
	LDY $A4
	LDA ObjectXDistance,Y
	CLC
	ADC PlayerSprXPos
	STA $28
	LDA ObjXScreenDistance,Y
	ADC #$00
	BMI bra7_97F9
	BEQ bra7_97E9
	RTS
bra7_97E9:
	LDA $28
bra7_97EB:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	CLC
	ADC #$08
	BCC bra7_97EB
	BCS bra7_980C
bra7_97F9:
	LDA $28
	LDY #$00
bra7_97FD:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_980B_RTS
	CLC
	ADC #$08
	BCC bra7_97FD
	BCS bra7_97EB
bra7_980B_RTS:
	RTS
bra7_980C:
	LDA #$00
bra7_980E:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_980E
	BCS bra7_9862
bra7_9817:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC PlayerSprXPos
	BCC bra7_9826
	INC $41
bra7_9826:
	CLC
	ADC ObjectXDistance,Y
	STA $28
	LDA ObjXScreenDistance,Y
	ADC $41
	BMI bra7_9846
	BEQ bra7_9836
	RTS
bra7_9836:
	LDA $28
bra7_9838:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	SEC
	SBC #$08
	BCS bra7_9838
	BCC bra7_9859
bra7_9846:
	LDA $28
	LDY #$00
bra7_984A:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_9858_RTS
	SEC
	SBC #$08
	BCS bra7_984A
	BCC bra7_9838
bra7_9858_RTS:
	RTS
bra7_9859:
	LDA #$00
bra7_985B:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_985B
bra7_9862:
	LDX #$00
	LDY $A4
	LDA ObjectYDistance,Y
	CLC
	ADC PlayerSprYPos
	STA $2B
	LDA ObjYScreenDistance,Y
	ADC #$00
	BMI bra7_9890
	BEQ bra7_9878
	RTS
bra7_9878:
	LDA $2B
	CMP #$C8
	BCC bra7_9880
	LDA #$F8
bra7_9880:
	STA $B2,X
	INX
	CPX #$02
	BCS bra7_98AC
	CLC
	ADC #$08
	STA $2B
	BCC bra7_9878
	BCS bra7_98A3
bra7_9890:
	LDA $2B
	LDY #$00
bra7_9894:
	STY $B2,X
	INX
	CPX #$02
	BCS bra7_98A2
	CLC
	ADC #$08
	BCC bra7_9894
	BCS bra7_9880
bra7_98A2:
	db $60
bra7_98A3:
	LDA #$00
bra7_98A5:
	STA $B2,X
	INX
	CPX #$02
	BCC bra7_98A5
bra7_98AC:
	LDA $B2
	STA $0204
	LDA $B2
	STA $0208
	LDA $B3
	STA $020C
	LDA $B3
	STA $0210
	LDA $41
	STA $0207
	LDA $42
	STA $020B
	LDA $41
	STA $020F
	LDA $42
	STA $0213
	LDA #$59 ;Pop effect upper left tile
	STA $0205
	LDA #$61 ;Pop effect upper right tile
	STA $0209
	LDA #$61 ;Pop effect lower left tile
	STA $020D
	LDA #$59 ;Pop effect lower right tile
	STA $0211
	LDA #$01
	STA $0206
	LDA #$C1
	STA $020A
	LDA #$01
	STA $020E
	LDA #$C1
	STA $0212
	RTS
obj_h42:
	LDX $A4
	LDA ObjectVariables,X
	BPL bra7_9908
	JSR jmp_54_B5BB
	RTS
bra7_9908:
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_992A
	CMP #$FF
	BEQ bra7_992A
	JMP loc3_A6B5
bra7_992A:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_996C
	LDA ObjYScreenDistance,X
	BPL bra7_995B
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_996C
bra7_995B:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_996C:
loc7_996C:
	LDA FreezeFlag
	BEQ bra7_9972
	RTS
bra7_9972:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9986,Y
	STA $32
	LDA tbl7_9986+1,Y
	STA $33
	JMP ($32)
tbl7_9986:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_9990
	dw ptr5_99BF
ptr5_9990:
	LDA FrameCount
	AND #$00
	BNE bra7_999B
	LDA #$29
	JSR GetMovementData
bra7_999B:
	JSR jmp_54_A6D4
	JSR jmp_54_BEBC
	JSR jmp_54_A74D
	JSR jmp_54_BCBE
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA $0641,X
	STA ObjectVariables,X
	LDA #$28
	STA ObjectState,X
	LDA #$18
	STA SFXRegister
	RTS
ptr5_99BF:
	LDX $A4
	INC ObjectSlot,X
	INC ObjectSlot,X
	LDA #$00
	STA ObjectVariables,X
	RTS
ptr6_99CD:
	LDY #$00
	LDA $062B
	AND #$08
	BEQ bra7_99D7
	INY
bra7_99D7:
	TYA
	ASL
	TAX
	LDA SprPtrs_BuzzyBeetle,X
	STA $32
	LDA SprPtrs_BuzzyBeetle+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_99F1
	LDY #$C0
bra7_99F1:
	STY $36
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
SprPtrs_BuzzyBeetle:
	dw SprMap_BuzzyWalk1
	dw SprMap_BuzzyWalk2
SprMap_BuzzyWalk1:
	db $02
	db $02
	db $97
	db $1E, $1F
	db $26, $27
SprMap_BuzzyWalk2:
	db $02
	db $02
	db $97
	db $20, $21
	db $28, $29
ptr6_9A11:
	LDA #$02
	ASL
	TAX
	LDA SprPtrs_BuzzyShell,X
	STA $32
	LDA SprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A2C
	LDY #$C0
bra7_9A2C:
	STY $36
	LDA ObjectState,X
	AND #$1F
	CMP #$04
	BEQ bra7_9A3B
	CMP #$06
	BNE bra7_9A5C
bra7_9A3B:
	LDA #$04
	ASL
	TAX
	LDA SprPtrs_BuzzyShell,X
	STA $32
	LDA SprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A56
	LDY #$C0
bra7_9A56:
	STY $36
	LDA #$80
	BNE bra7_9A61
bra7_9A5C:
	LDA ObjectState,X
	AND #$40
bra7_9A61:
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_9A68:
	LDA $062B
	AND #$0C
	LSR
	LSR
	LDY #$00
	CMP #$03
	BNE bra7_9A77
	LDY #$40
bra7_9A77:
	STY $05F0
	ASL
	TAX
	LDA SprPtrs_BuzzyShell,X
	STA $32
	LDA SprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9A93
	LDY #$C0
bra7_9A93:
	STY $36
	JSR jmp_54_A118
	RTS
SprPtrs_BuzzyShell:
	dw SprMap_BuzzyShell1
	dw SprMap_BuzzyShell2
	dw SprMap_BuzzyShell3
	dw SprMap_BuzzyShell2
	dw SprMap_BuzzyShell4
SprMap_BuzzyShell1:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $22, $23
SprMap_BuzzyShell2:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $24, $25
SprMap_BuzzyShell3:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $2A, $2B
SprMap_BuzzyShell4:
	db $02
	db $02
	db $97
	db $2A, $2B
	db $1C, $1D
obj_h74:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9ADD
	CMP #$FF
	BEQ bra7_9ADD
	JMP loc3_A6B5
bra7_9ADD:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9B1F
	LDA ObjYScreenDistance,X
	BPL bra7_9B0E
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9B1F
bra7_9B0E:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9B1F:
loc7_9B1F:
	LDA FreezeFlag
	BEQ bra7_9B25
	db $60
bra7_9B25:
	LDA ObjectVariables,X
	BPL bra7_9B4E
	LDA #$00
	STA ObjectVariables,X
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA CurrentPlayer
	BEQ bra7_9B43
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9B43:
	LDA CheckpointFlag,Y
	BEQ bra7_9B4E
	LDA #$00
	STA ObjectSlot,X
	RTS
bra7_9B4E:
	LDA #$07
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9B66,Y
	STA $32
	LDA tbl7_9B66+1,Y
	STA $33
	JMP ($32)
tbl7_9B66:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_9B6E
ptr5_9B6E:
	LDA ObjXScreenDistance,X
	BPL bra7_9B80
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC ObjectXDistance,X
	BCS bra7_9B87
	BCC bra7_9BA7
bra7_9B80:
	LDA ObjectXDistance,X
	CMP #$08
	BCS bra7_9BA7
bra7_9B87:
	LDA ObjYScreenDistance,X
	BEQ bra7_9B9D
	CMP #$FF
	BNE bra7_9BA7
	LDA #$18
	CLC
	ADC #$03
	CLC
	ADC ObjectYDistance,X
	BCS bra7_9BA4
	BCC bra7_9BA7
bra7_9B9D:
	LDA ObjectYDistance,X
	CMP #$00
	BCS bra7_9BA7
bra7_9BA4:
	CLC
	BCC bra7_9BA8
bra7_9BA7:
	SEC
bra7_9BA8:
	BCC bra7_9BB3
	LDA ObjectState,X
	AND #$E0
	STA ObjectState,X
	RTS
bra7_9BB3:
	JSR sub7_9EE5
	LDX $A4
	LDA #$1C
	STA SFXRegister
	LDA #$00
	STA ObjectSlot,X
	LDA WorldNumber
	ASL
	ASL
	CLC
	ADC LevelNumber
	TAY
	LDA CurrentPlayer
	BEQ bra7_9BD5
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9BD5:
	LDA #$01
	STA CheckpointFlag,Y
	RTS
ptr6_9BDB:
	LDA #$0F
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
SprMap_Checkpoint:
	db $02
	db $01
	db $90
	db $3E, $3E
ptr6_9BFB:
	LDA #$10
	ASL
	TAX
	LDA SprPtrs_CommonObjects,X
	STA $32
	LDA SprPtrs_CommonObjects+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA ObjectSlot,X
	AND #$01
	BEQ bra7_9C16
	LDY #$C0
bra7_9C16:
	STY $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
SprMap_GoalTape:
	db $03
	db $01
	db $A6
	db $37, $36, $36
	db $36 ;Excess byte, can be removed
obj_h48:
	LDX $A4
	LDA ObjectVariables,X
	BMI bra7_9C32
	JMP loc7_9D0B
bra7_9C32:
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9C4E
	CMP #$FF
	BEQ bra7_9C4E
	JMP loc3_A6B5
bra7_9C4E:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9C90
	LDA ObjYScreenDistance,X
	BPL bra7_9C7F
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9C90
bra7_9C7F:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9C90:
loc7_9C90:
	LDA FreezeFlag
	BEQ bra7_9C96
	RTS
bra7_9C96:
	LDA ObjectVariables,X
	CMP #$80
	BNE bra7_9D07
	JSR jmp_54_B5BB
	LDY ObjectCount
	INC ObjectCount
	INC ObjectCount
	LDA ObjectXPos,X
	STA $0515,Y
	LDA ObjectState,X
	AND #$40
	BNE bra7_9CBC
	LDA ObjectXPos,X
	CLC
	ADC #$10
	JMP loc7_9CC2
bra7_9CBC:
	LDA ObjectXPos,X
	SEC
	SBC #$10
loc7_9CC2:
	STA ObjectXPos,Y
	LDA ObjectXScreen,X
	STA ObjectXScreen,Y
	STA $0529,Y
	LDA ObjectYPos,X
	CLC
	ADC #$10
	STA ObjectYPos,Y
	CLC
	ADC #$10
	STA $053D,Y
	LDA ObjectYScreen,X
	STA ObjectYScreen,Y
	STA $0551,Y
	LDA ObjectSlot,X
	STA ObjectSlot,Y
	STA $0501,Y
	LDA ObjectState,X
	STA ObjectState,Y
	STA $0565,Y
	LDA #$00
	STA ObjectVariables,Y
	STA $0579,Y
	STA ObjectAction,Y
	STA $066A,Y
	RTS
bra7_9D07:
	JSR sub_54_B4FC
	RTS
loc7_9D0B:
	LDA #$07
	STA $25
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9D2D
	CMP #$FF
	BEQ bra7_9D2D
	JMP loc3_A6B5
bra7_9D2D:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9D6F
	LDA ObjYScreenDistance,X
	BPL bra7_9D5E
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9D6F
bra7_9D5E:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9D6F:
loc7_9D6F:
	LDA FreezeFlag
	BEQ bra7_9D75
	RTS
bra7_9D75:
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9D89,Y
	STA $32
	LDA tbl7_9D89+1,Y
	STA $33
	JMP ($32)
tbl7_9D89:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_9D93
	dw ptr_AD88
ptr5_9D93:
	LDA FrameCount
	AND #$00
	BNE bra7_9D9E
	LDA #$25
	JSR jmp_54_B11D
bra7_9D9E:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
ptr5_9DA5:
	LDA #$00
	ASL
	TAX
	LDA SprPtrs_HPodoboo,X
	STA $32
	LDA SprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDX $A4
	LDA ObjectState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
obj_h4C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9DE5
	CMP #$FF
	BEQ bra7_9DE5
	JMP loc3_A6B5
bra7_9DE5:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9E27
	LDA ObjYScreenDistance,X
	BPL bra7_9E16
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9E27
bra7_9E16:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9E27:
loc7_9E27:
	LDA FreezeFlag
	BEQ bra7_9E2D
	RTS
bra7_9E2D:
	LDA ObjectVariables,X
	BPL bra7_9E4F
	LDA #$00
	STA ObjectVariables,X
	STA $0641,X
	STA ObjectAction,X
	LDA ObjectXPos,X
	CLC
	ADC #$08
	STA ObjectXPos,X
	LDA ObjectXScreen,X
	ADC #$00
	STA ObjectXScreen,X
	RTS
bra7_9E4F:
	INC $0641,X
	LDA $0641,X
	CMP #$60
	BCC bra7_9E66
	LDA #$00
	STA $0641,X
	LDA ObjectAction,X
	EOR #$01
	STA ObjectAction,X
bra7_9E66:
	LDA ObjectAction,X
	BNE bra7_9E82
	LDA ObjectYPos,X
	SEC
	SBC #$01
	STA ObjectYPos,X
	BCS bra7_9E98
	SEC
	SBC #$10
	STA ObjectYPos,X
	DEC ObjectYScreen,X
	JMP loc7_9E98
bra7_9E82:
	LDA ObjectYPos,X
	CLC
	ADC #$01
	STA ObjectYPos,X
	CMP #$F0
	BCC bra7_9E98
	CLC
	ADC #$10
	STA ObjectYPos,X
	INC ObjectYScreen,X
bra7_9E98:
loc7_9E98:
	LDA #$07
	STA $25
	LDA ObjectState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9EB0,Y
	STA $32
	LDA tbl7_9EB0+1,Y
	STA $33
	JMP ($32)
tbl7_9EB0:
	dw ptr_A7BB
	dw ptr_AA7B
	dw ptr_AB29
	dw ptr5_9EB8
ptr5_9EB8:
	LDA ObjXScreenDistance,X
	BPL bra7_9EE4_RTS
	LDA #musVictory
	STA MusicRegister ;Play level complete music
	LDA #$06
	STA Event ;Trigger goal tape event
	LDA WorldNumber
	ASL
	ASL ;Multiply world number by 4
	CLC
	ADC LevelNumber ;Add it to the level number to get the level index
	TAY
	LDA CurrentPlayer
	BEQ bra7_9ED9 ;Branch ahead if player one is playing
	TYA
	CLC
	ADC #$1C
	TAY ;If player 2 is playing, use their checkpoint index instead
bra7_9ED9:
	LDA #$00
	STA CheckpointFlag,Y
	STA InvincibilityTimer
	STA PlayerPowerupBuffer ;Clear the player's checkpoint, invincibility, and any powerup buffering
bra7_9EE4_RTS:
	RTS
sub7_9EE5:
	LDA PlayerPowerup
	BNE bra7_9EF6_RTS ;Only do this if the player is small
	INC PlayerPowerup ;Make the player big
	LDA #$07
	STA Event ;Update the player's sprite?
	LDA #$01
	STA PlayerPowerupBuffer ;Update the player's sprite
bra7_9EF6_RTS:
	RTS
obj_h7C:
	LDX $A4
	LDA ObjectXPos,X
	SEC
	SBC PlayerXPosDup
	STA ObjectXDistance,X
	LDA ObjectXScreen,X
	SBC PlayerXScreenDup
	STA ObjXScreenDistance,X
	STA $28
	BEQ bra7_9F15
	CMP #$FF
	BEQ bra7_9F15
	JMP loc3_A6B5
bra7_9F15:
	LDA ObjectYPos,X
	SEC
	SBC PlayerYPosDup
	STA ObjectYDistance,X
	LDA ObjectYScreen,X
	SBC PlayerYScreenDup
	STA ObjYScreenDistance,X
	LDA PlayerYScreenDup
	CMP ObjectYScreen,X
	BEQ bra7_9F57
	LDA ObjYScreenDistance,X
	BPL bra7_9F46
	LDA ObjectYDistance,X
	CLC
	ADC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	ADC #$00
	STA ObjYScreenDistance,X
	JMP loc7_9F57
bra7_9F46:
	LDA ObjectYDistance,X
	SEC
	SBC #$10
	STA ObjectYDistance,X
	LDA ObjYScreenDistance,X
	SBC #$00
	STA ObjYScreenDistance,X
bra7_9F57:
loc7_9F57:
	LDA FreezeFlag
	BEQ bra7_9F5D
	RTS
bra7_9F5D:
	LDA ObjectVariables,X
	BPL bra7_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F78
	LDA #$00
	STA ObjectVariables,X
	LDA ObjectXPos,X
	CLC
	ADC #$0F
	STA ObjectXPos,X
	RTS
bra7_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F8D
	LDA ObjXScreenDistance,X
	BPL bra7_9F8C_RTS
bra7_9F84:
	INC $E0
	LDX CurrentPlayer
	INC Player1Lives,X
bra7_9F8C_RTS:
	RTS
bra7_9F8D:
	LDA ObjXScreenDistance,X
	BPL bra7_9F84
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