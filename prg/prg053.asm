; disassembled by BZK 6502 Disassembler
obj0x36:
	LDA yoshiXLo
	SEC
	SBC playerXLoDup
	STA yoshiXDistLo
	LDA yoshiXHi
	SBC playerXHiDup
	STA yoshiXDistHi
	BEQ bra7_8018
	CMP #$FF
	BEQ bra7_8018
	RTS
bra7_8018:
	LDA yoshiYLo
	SEC
	SBC playerYLoDup
	STA yoshiYDist
	LDA yoshiYHi
	SBC playerYHiDup
	STA yoshiYDistHi
	LDA playerYHiDup
	CMP yoshiYHi
	BEQ bra7_805A
	LDA yoshiYDistHi
	BPL bra7_8049
	LDA yoshiYDist
	CLC
	ADC #$10
	STA yoshiYDist
	LDA yoshiYDistHi
	ADC #$00
	STA yoshiYDistHi
	JMP loc7_805A
bra7_8049:
	LDA yoshiYDist
	SEC
	SBC #$10
	STA yoshiYDist
	LDA yoshiYDistHi
	SBC #$00
	STA yoshiYDistHi
bra7_805A:
loc7_805A:
	LDA yoshiUnmountedState
	AND #$7F
	ASL
	TAY
	LDA tbl7_806E,Y
	STA $32
	LDA tbl7_806E+1,Y
	STA $33
	JMP ($32)
tbl7_806E:
	.word ptr5_8078
	.word ptr5_8079
	.word ptr5_80AB
	.word ptr5_8150
	.word ptr5_8197
ptr5_8078:
	RTS
ptr5_8079:
	LDA frameCount
	AND #$07
	BNE bra7_8090_RTS
	LDA $05F6
	AND #$0F
	TAX
	LDA tbl7_80A2,X
	BMI bra7_8091
	STA yoshiAnim
	INC $05F6
bra7_8090_RTS:
	RTS
bra7_8091:
	INC yoshiUnmountedState
	LDA $05F6
	AND #$F0
	STA $05F6
	LDA #$00
	STA freezeFlag
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
	STA yoshiUnmountedState
	LDA #$00
	STA $05F7
	RTS
bra7_80C5:
	JSR sub7_820C
	LDA frameCount
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
	LDX yoshiIdleStorage
	CPX #$01
	BEQ bra7_80F0
	LDA #$09
bra7_80F0:
	STA yoshiAnim
	LDA tbl7_813C,Y
	BMI bra7_8111
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS bra7_8105
	CMP #$F0
	BCC loc7_8123
bra7_8105:
	CLC
	ADC #$10
	STA yoshiYLo
	INC yoshiYHi
	JMP loc7_8123
bra7_8111:
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS loc7_8123
	SEC
	SBC #$10
	STA yoshiYLo
	DEC yoshiYHi
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
	LDA frameCount
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
	LDX yoshiIdleStorage
	CPX #$01
	BEQ bra7_8183
	TYA
	AND #$01
	CLC
	ADC #$0A
bra7_8183:
	STA yoshiAnim
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
	STA yoshiAnim
	LDA $05F7
	AND #$7F
	CMP #$07
	BCS bra7_81AD
	INC $05F7
bra7_81AD:
	LDA $05F7
	BMI bra7_81CB
	CLC
	ADC yoshiYLo
	STA yoshiYLo
	BCS bra7_81BF
	CMP #$F0
	BCC loc7_81DD_RTS
bra7_81BF:
	CLC
	ADC #$10
	STA yoshiYLo
	INC yoshiYHi
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
loc7_81DD_RTS:
	RTS
bra7_81DE:
	LDA $AA
	AND #$0F
	STA $25
	LDX $A4
	LDA yoshiYLo
	SEC
	SBC $25
	BCS bra7_81F4
	DEC yoshiYHi
	SEC
	SBC #$10
bra7_81F4:
	STA yoshiYLo
	LDA #$00
	STA $05F7
	LDY #$02
	LDA $50
	BEQ bra7_8208
	LDA #$00
	STA $50
	LDY #$03
bra7_8208:
	STY yoshiUnmountedState
	RTS
sub7_820C:
	LDA playerHoldFlag
	BNE bra7_827B_RTS
	LDA yoshiIdleMovement
	AND #$40
	BNE bra7_8222
	LDA yoshiXLo
	CLC
	ADC #$10
	PHA
	JMP loc7_8229
bra7_8222:
	LDA yoshiXLo
	CLC
	ADC #$24
	PHA
loc7_8229:
	LDA yoshiXHi
	ADC #$00
	STA $34
	PLA
	SEC
	SBC playerXLoDup
	STA $32
	LDA $34
	SBC playerXHiDup
	BNE bra7_826C
	LDA $32
	CMP #$14
	BCS bra7_826C
	LDA yoshiYLo
	CLC
	ADC #$10
	PHA
	LDA yoshiYHi
	ADC #$00
	STA $34
	PLA
	SEC
	SBC playerYLoDup
	STA $32
	LDA $34
	SBC playerYHiDup
	BNE bra7_826C
	LDA $32
	CMP #$08
	BCS bra7_826C
	LDA playerMoveFlags
	AND #$04
	BNE bra7_826C
	LDA #$06
	STA playerState
bra7_826C:
	LDA playerState
	CMP #$07
	BNE bra7_827B_RTS
	LDA #$00
	STA yoshiUnmountedState
	LDA #$0D
	STA sndSfx
bra7_827B_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($827C)
;----------------------------------------
sub_53_827C:
	LDA yoshiXDistHi
	BEQ bra7_8286 ; Continue if the player is to the left of Yoshi (within one screen)
	CMP #$FF
	BEQ bra7_8286 ; Continue if the player is to the right of Yoshi (within one screen)
	RTS

bra7_8286:
	LDA yoshiUnmountedState
	BNE bra7_828C ; Continue if Yoshi isn't mounted
	RTS

bra7_828C:
	LDA yoshiAnim
	ASL
	TAX ; Get index for Yoshi's animation
	LDA tbl7_82A2,X
	STA $32
	LDA tbl7_82A2+1,X
	STA $33
	LDA #$40
	STA $36 ; Use bank 2
	JMP jmp_52_A463
tbl7_82A2:
	.word ofs_82BA ; Baby
	.word ofs_82C5 ; Baby (Growing)
	.word ofs_82D0 ; Ducking
	.word ofs_82E3 ; Standing
	.word ofs_82F6 ; Mouth Open
	.word ofs_8309 ; Running
	.word ofs_831C
	.word ofs_832F ; Running (Flinching)
	.word ofs_8342
	.word ofs_8355 ; Idle w/ item
	.word ofs_8368 ; Running w/ item
	.word ofs_837B
ofs_82BA:
	db $02
	db $04
	db $90
	db $FF, $FF
	db $FF, $FF
	db $37, $38
	db $39, $3A
ofs_82C5:
	db $02
	db $04
	db $90
	db $FF, $FF
	db $FF, $FF
	db $2B, $2C
	db $2D, $2E
ofs_82D0:
	db $04
	db $04
	db $92
	db $FF, $FF, $FF, $FF
	db $FF, $B1, $B2, $FF
	db $B3, $B4, $B5, $B6
	db $FF, $B7, $AF, $B0
ofs_82E3:
	db $04
	db $04
	db $92
	db $FF, $B8, $B9, $FF
	db $BA, $BB, $AB, $FF
	db $FF, $AC, $AD, $AE
	db $FF, $FF, $AF, $B0
ofs_82F6:
	db $04
	db $04
	db $A0
	db $FF, $2B, $2C, $FF
	db $2D, $2E, $2F, $FF
	db $FF, $30, $31, $32
	db $FF, $FF, $33, $34
ofs_8309:
	db $04
	db $04
	db $91
	db $FF, $76, $77, $FF
	db $78, $79, $7A, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
ofs_831C:
	db $04
	db $04
	db $93
	db $FF, $F8, $F9, $FF
	db $FA, $FB, $EB, $FF
	db $FF, $EC, $ED, $EE
	db $FF, $FF, $EF, $F0
ofs_832F:
	db $04
	db $04
	db $91
	db $71, $72, $73, $FF
	db $FF, $74, $75, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
ofs_8342:
	db $04
	db $04
	db $93
	db $F1, $F2, $F3, $FF
	db $F4, $F5, $F6, $FF
	db $FF, $FF, $F7, $EE
	db $FF, $FF, $EF, $F0
ofs_8355:
	db $04
	db $04
	db $A0
	db $FF, $36, $37, $FF
	db $38, $39, $3A, $FF
	db $FF, $3B, $3C, $3D
	db $FF, $FF, $3F, $35
ofs_8368:
	db $04
	db $04
	db $A3
	db $FF, $FA, $F9, $FF
	db $FF, $FB, $FC, $FF
	db $FF, $FD, $FE, $EB
	db $FF, $FF, $F4, $F3
ofs_837B:
	db $04
	db $04
	db $9B
	db $F7, $F8, $F9, $FF
	db $FA, $FB, $FC, $FF
	db $FF, $FF, $FD, $F2
	db $FF, $FF, $EB, $F5

objYoshiBox:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_83AC
	CMP #$FF
	BEQ bra7_83AC
	JMP objRemoveObject
bra7_83AC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_83EE
	LDA objYDistHi,X
	BPL bra7_83DD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_83EE
bra7_83DD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_83EE:
loc7_83EE:
	JSR jmp_54_BD3D
	LDA playerYoshiState
	BNE bra7_83FB
	LDA yoshiUnmountedState
	BEQ bra7_840B
bra7_83FB:
	LDA #$05
	STA objSlot,X
	LDA #$00
	STA objVar,X
	LDA #$04
	STA objState,X
	RTS
bra7_840B:
	LDA frameCount
	AND #$03
	BNE bra7_8416
	LDA #$01
	JSR jmp_54_B11D
bra7_8416:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8432
	CMP #$FF
	BEQ bra7_8432
	JMP objRemoveObject
bra7_8432:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8474
	LDA objYDistHi,X
	BPL bra7_8463
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8474
bra7_8463:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8474:
loc7_8474:
	LDA #$01
	STA freezeFlag
	LDA objVar,X
	AND #$7F
	CMP #playerAnimFrame
	BCC bra7_84C2_RTS
	LDA #$00
	STA objSlot,X
	STA $05F7
	STA $05F6
	STA yoshiIdleMovement
	STA yoshiAnim
	LDA #$01
	STA yoshiUnmountedState
	LDA objXLo,X
	STA yoshiXLo
	LDA objXHi,X
	STA yoshiXHi
	SEC
	LDA objYLo,X
	CMP #$10
	BCS bra7_84B1
	SBC #$20
	JMP loc7_84B3
bra7_84B1:
	SBC #$10
loc7_84B3:
	STA yoshiYLo
	LDA objYHi,X
	SBC #$00
	STA yoshiYHi
	LDA #SFX_YOSHIMOUNT
	STA sndSfx
bra7_84C2_RTS:
	RTS
obj0x6A:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_84E1
	CMP #$FF
	BEQ bra7_84E1
	JMP objRemoveObject
bra7_84E1:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8523
	LDA objYDistHi,X
	BPL bra7_8512
	LDA objYDistLo,X
	CLC ; logged as data
	ADC #$10 ; logged as data
	STA objYDistLo,X ; logged as data
	LDA objYDistHi,X ; logged as data
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8523
bra7_8512:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8523:
	LDA freezeFlag
	BEQ bra7_8529
	RTS
bra7_8529:
	JSR jmp_54_BD3D
objPSwitch:
	LDA #$02
	STA $25 ; Configure this to stay in Yoshi's mouth when eaten 
	LDX $A4 ; Get the index for the object's slot
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X ; Calculate the x distance from the player
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Calculate the x screen distance from the player
	STA $28
	BEQ bra7_854E ; Branch if the player and the object are on the same screen
	CMP #$FF ; If not, check if the object is one screen behind the player
	BEQ bra7_854E ; If so, branch
	JMP objRemoveObject ; Otherwise, jump
bra7_854E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8590
	LDA objYDistHi,X
	BPL bra7_857F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8590
bra7_857F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8590:
	LDA freezeFlag
	BEQ bra7_8596 ; Branch if the game isn't freezed
	RTS ; Otherwise, stop
bra7_8596:
	LDA objState,X
	AND #$1F ; Mask out lower 5 bits
	ASL
	TAY ; Get pointer index for status
	LDA tbl7_85AA,Y
	STA $32
	LDA tbl7_85AA+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer
tbl7_85AA:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word ptr_AB5D
	.word ptr5_85B8
	.word ptr_AE17
	.word ptr5_8689
	.word ptr5_8695
ptr5_85B8:
	JSR positionCarriedObject
	LDA frameCount
	AND #$00
	BNE bra7_85C6
	LDA #$27
	JSR getMovementData
bra7_85C6:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_85E2
	CMP #$FF
	BEQ bra7_85E2
	JMP objRemoveObject
bra7_85E2:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8624
	LDA objYDistHi,X
	BPL bra7_8613
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8624
bra7_8613:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8624:
	LDA freezeFlag
	BEQ bra7_862A
	RTS
bra7_862A:
	JSR objCapeHitCheck
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA playerYSpd
	BEQ bra7_8653
	LDA playerMoveFlags
	AND #$04
	BNE bra7_8652_RTS
	LDA #$01
	STA $0633
	LDA #$1E
	STA pSwitchTimer
	LDA #$0F
	STA sndSfx
	LDA #$00
	LDX $A4
	STA objSlot,X
bra7_8652_RTS:
	RTS
bra7_8653:
	LDA playerYoshiState
	BEQ bra7_866B
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA #$04
	STA playerAction
	LDA #$03
	STA sndSfx
	RTS
bra7_866B:
	LDA playerMoveFlags
	AND #$01
	BNE bra7_867E
	LDA objXDistHi,X
	BMI loc7_8688_RTS
	LDA #$01
	STA playerXMovementLocked
	JMP loc7_8688_RTS
bra7_867E:
	LDA objXDistHi,X
	BPL loc7_8688_RTS
	LDA #$01
	STA playerXMovementLocked
loc7_8688_RTS:
	RTS
ptr5_8689:
	LDA frameCount
	AND #$00
	BNE bra7_8694_RTS
	LDA #$26
	JSR getMovementData
bra7_8694_RTS:
	RTS
ptr5_8695:
	LDA frameCount
	AND #$00
	BNE bra7_86A0
	LDA #$04
	JSR getMovementData
bra7_86A0:
	LDA objState,X
	AND #$20
	BEQ bra7_86F2_RTS
	LDA objXDistHi,X
	BPL bra7_86B9
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra7_86C0
	BCC bra7_86E0
bra7_86B9:
	LDA objXDistLo,X
	CMP #$10
	BCS bra7_86E0
bra7_86C0:
	LDA objYDistHi,X
	BEQ bra7_86D6
	CMP #$FF
	BNE bra7_86E0
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra7_86DD
	BCC bra7_86E0
bra7_86D6:
	LDA objYDistLo,X
	CMP #$00
	BCS bra7_86E0
bra7_86DD:
	CLC
	BCC bra7_86E1
bra7_86E0:
	SEC
bra7_86E1:
	BCS bra7_86F2_RTS
	LDA objState,X
	AND #$40
	ORA #$04
	STA objState,X
	LDA #$00
	STA objVar,X
bra7_86F2_RTS:
	RTS
objSpring:
	LDA #$03
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
	BEQ bra7_8715
	CMP #$FF
	BEQ bra7_8715
	JMP objRemoveObject
bra7_8715:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8757
	LDA objYDistHi,X
	BPL bra7_8746
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8757
bra7_8746:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8757:
loc7_8757:
	LDA freezeFlag
	BEQ bra7_875D
	RTS
bra7_875D:
	LDA objState,X
	AND #$1F ; Mask out the upper 3 bits, limiting it to $00 - $1F
	ASL
	TAY ; Get pointer for the object's current state
	LDA tbl7_8771,Y
	STA $32
	LDA tbl7_8771+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer location
tbl7_8771:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word ptr_AB5D
	.word ptr5_8789
	.word ptr_AE17
	.word ptr5_884C
	.word ptr5_8695
	.word ptr5_88BC
	.word ptr5_88BC
	.word ptr5_88BC
	.word ptr5_8931
	.word ptr5_89C1
ptr5_8789:
	JSR positionCarriedObject
	LDA frameCount
	AND #$00
	BNE bra7_8797
	LDA #$27
	JSR getMovementData
bra7_8797:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_87B3
	CMP #$FF
	BEQ bra7_87B3
	JMP objRemoveObject
bra7_87B3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_87F5
	LDA objYDistHi,X
	BPL bra7_87E4
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_87F5
bra7_87E4:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_87F5:
loc7_87F5:
	LDA freezeFlag
	BEQ bra7_87FB
	RTS

bra7_87FB:
	JSR objCapeHitCheck
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA playerYSpd
	BEQ bra7_881E
	LDA playerMoveFlags
	AND #$04
	BNE bra7_881D_RTS
	LDA #$00
	STA playerYSpd
	LDX $A4
	LDA objState,X
	CLC
	ADC #$04
	STA objState,X
bra7_881D_RTS:
	RTS
bra7_881E:
	LDA playerYoshiState
	BEQ bra7_882E
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	RTS
bra7_882E:
	LDA playerMoveFlags
	AND #$01
	BNE bra7_8841
	LDA objXDistHi,X
	BMI bra7_884B_RTS
	LDA #$01
	STA playerXMovementLocked
	JMP loc7_884B_RTS
bra7_8841:
	LDA objXDistHi,X
	BPL bra7_884B_RTS
	LDA #$01
	STA playerXMovementLocked
bra7_884B_RTS:
loc7_884B_RTS:
	RTS
ptr5_884C:
	LDA frameCount
	AND #$00
	BNE bra7_8857
	LDA #$26
	JSR getMovementData
bra7_8857:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8873
	CMP #$FF
	BEQ bra7_8873
	JMP objRemoveObject
bra7_8873:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_88B5
	LDA objYDistHi,X
	BPL bra7_88A4
	LDA objYDistLo,X ; logged as data
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_88B5
bra7_88A4:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_88B5:
loc7_88B5:
	LDA freezeFlag
	BEQ bra7_88BB_RTS
	RTS
bra7_88BB_RTS:
	RTS
ptr5_88BC:
	LDA frameCount
	AND #$00
	BNE bra7_88C7
	LDA #$27
	JSR getMovementData
bra7_88C7:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_88E3
	CMP #$FF
	BEQ bra7_88E3
	JMP objRemoveObject
bra7_88E3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8925
	LDA objYDistHi,X
	BPL bra7_8914
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8925
bra7_8914:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8925:
loc7_8925:
	LDA freezeFlag
	BEQ bra7_892B
	RTS
bra7_892B:
	LDX $A4
	INC objState,X
	RTS
ptr5_8931:
	LDA frameCount
	AND #$00
	BNE bra7_893C
	LDA #$27
	JSR getMovementData
bra7_893C:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8958
	CMP #$FF
	BEQ bra7_8958
	JMP objRemoveObject
bra7_8958:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_899A
	LDA objYDistHi,X
	BPL bra7_8989
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_899A
bra7_8989:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_899A:
loc7_899A:
	LDA freezeFlag
	BEQ bra7_89A0
	RTS
bra7_89A0:
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player move upwards
	LDY #$50 ; Set speed to $50
	LDA btnHeld
	AND #BTN_A
	BEQ bra7_89B1 ; If A isn't held, branch and keep the speed
	LDY #$70 ; If it is held, set the speed to $70 instead
bra7_89B1:
	STY playerYSpd
	LDA #$04
	STA playerAction
	LDX $A4
	INC objState,X
	LDA #SFX_SWIM
	STA sndSfx ; Play bounce sound
	RTS
ptr5_89C1:
	LDA frameCount
	AND #$00
	BNE bra7_89CC
	LDA #$27
	JSR getMovementData
bra7_89CC:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_89E8
	CMP #$FF
	BEQ bra7_89E8
	JMP objRemoveObject
bra7_89E8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8A2A
	LDA objYDistHi,X
	BPL bra7_8A19
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8A2A
bra7_8A19:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8A2A:
loc7_8A2A:
	LDA freezeFlag
	BEQ bra7_8A30
	RTS
bra7_8A30:
	LDX $A4
	LDA objState,X
	AND #$E0
	ORA #$03
	STA objState,X
	RTS
obj0x44:
	LDX $A4
	LDA $0641,X
	CMP #$F0
	BCC bra7_8A60
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$42
	STA objSlot,X
	LDA #$00
	STA objState,X
	STA objVar,X
	STA playerHoldFlag
	STA $0641,X
	RTS
bra7_8A60:
	LDA objFrameCount
	AND #$03
	BNE objShell
	INC $0641,X

objShell:
	LDA #$04
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
	BEQ bra7_8A8C
	CMP #$FF
	BEQ bra7_8A8C
	JMP objRemoveObject
bra7_8A8C:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8ACE
	LDA objYDistHi,X
	BPL bra7_8ABD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8ACE
bra7_8ABD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8ACE:
loc7_8ACE:
	LDA freezeFlag
	BEQ bra7_8AD4
	RTS
bra7_8AD4:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8AE8,Y
	STA $32
	LDA tbl7_8AE8+1,Y
	STA $33
	JMP ($32)
tbl7_8AE8:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_8AFA
	.word objFlipKill
	.word ptr5_8B55
	.word ptr_AD79
	.word ptr5_8B7D
	.word ptr5_8B91
ptr5_8AFA:
	JSR jmp_54_AC20
	JSR objCapeHitCheck
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA playerYoshiState
	BEQ bra7_8B3F
	LDA playerYSpd
	BEQ bra7_8B34
	LDA playerMoveFlags
	AND #$04
	BNE bra7_8B33_RTS
bra7_8B15:
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA #$04
	STA playerAction
	LDA #$0F
	STA sndSfx
	LDX $A4
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objState,X
bra7_8B33_RTS:
	RTS
bra7_8B34:
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	RTS
bra7_8B3F:
	LDA $1E
	CMP #$05
	BEQ bra7_8B15
	INC objState,X
	INC objState,X
	LDA playerHoldFlag
	BNE bra7_8B33_RTS
	LDA #$15
	STA sndSfx
	RTS
ptr5_8B55:
	LDX $A4
	LDA objSlot,X
	CMP #$04
	BEQ bra7_8B66
	INC objSlot,X
	INC objSlot,X
	BNE bra7_8B6B
bra7_8B66:
	LDA #$38
	STA objSlot,X
bra7_8B6B:
	LDA #$00
	LDY objXDistHi,X
	BPL bra7_8B74
	LDA #$40
bra7_8B74:
	STA objState,X
	LDA #$80
	STA objVar,X
	RTS
ptr5_8B7D:
	LDA frameCount
	AND #$00
	BNE bra7_8B88
	LDA #$04
	JSR getMovementData
bra7_8B88:
	LDA #$10
	JSR sub3_AEA8
	JSR jmp_54_AD54
	RTS
ptr5_8B91:
	LDA frameCount
	AND #$00
	BNE bra7_8B9C_RTS
	LDA #$27
	JSR getMovementData
bra7_8B9C_RTS:
	RTS
obj0x38:
	LDX $A4
	LDA objState,X
	AND #$0F
	CMP #$04
	BNE bra7_8BAB
	JMP loc7_8C42
bra7_8BAB:
	LDA frameCount
	AND #$00
	BNE bra7_8BB6
	LDA #$25
	JSR getMovementData
bra7_8BB6:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8BD2
	CMP #$FF
	BEQ bra7_8BD2
	JMP objRemoveObject
bra7_8BD2:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8C14
	LDA objYDistHi,X
	BPL bra7_8C03
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8C14
bra7_8C03:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8C14:
loc7_8C14:
	LDA freezeFlag
	BEQ bra7_8C1A
	RTS
bra7_8C1A:
	LDA objVar,X
	BPL bra7_8C36
	LDA objXDistLo,X
	BPL bra7_8C29
	EOR #$FF
	CLC
	ADC #$01
bra7_8C29:
	CMP #$18
	BCC bra7_8C41_RTS
	LDA objVar,X
	AND #$7F
	STA objVar,X
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
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8C64
	CMP #$FF
	BEQ bra7_8C64
	JMP objRemoveObject
bra7_8C64:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8CA6
	LDA objYDistHi,X
	BPL bra7_8C95
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8CA6
bra7_8C95:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8CA6:
loc7_8CA6:
	LDA freezeFlag
	BEQ bra7_8CAC
	RTS
bra7_8CAC:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_8CC0,Y
	STA $32
	LDA tbl7_8CC0+1,Y
	STA $33
	JMP ($32)
tbl7_8CC0:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_8CCA
	.word objFlipKill
ptr5_8CCA:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA objSlot,X
	CMP #$38
	BEQ bra7_8CEB
	AND #$01
	CLC
	ADC #$44
	BNE bra7_8CED
bra7_8CEB:
	LDA #$04
bra7_8CED:
	STA objSlot,X
	LDA objState,X
	AND #$C0
	STA objState,X
	LDA #$00
	STA objVar,X
	RTS
obj0x49:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8D1C
	CMP #$FF
	BEQ bra7_8D1C
	JMP objRemoveObject
bra7_8D1C:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8D5E
	LDA objYDistHi,X
	BPL bra7_8D4D
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8D5E
bra7_8D4D:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8D5E:
loc7_8D5E:
	LDA freezeFlag
	BEQ bra7_8D64
	RTS
bra7_8D64:
	JSR jmp_54_BD3D
	JMP loc7_8DD0
obj1UP:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8D88
	CMP #$FF
	BEQ bra7_8D88
	JMP objRemoveObject
bra7_8D88:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8DCA
	LDA objYDistHi,X
	BPL bra7_8DB9
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8DCA
bra7_8DB9:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8DCA:
loc7_8DCA:
	LDA freezeFlag
	BEQ bra7_8DD0
	RTS
bra7_8DD0:
loc7_8DD0:
	JSR sub7_8DEA
	LDX $A4
	LDA objState,X
	AND #$0F
	CMP #$04
	BCS bra7_8DE9_RTS
	LDA frameCount
	AND #$01
	BNE bra7_8DE9_RTS
	LDA #$0B
	JSR getMovementData
bra7_8DE9_RTS:
	RTS
sub7_8DEA:
	LDA #$06
	STA $25 ; Configure Yoshi tongue behavior (instantly swallowed)
	LDA objState,X
	AND #%00011111 ; Mask out the upper 3 bits
	ASL
	TAY ; Use as pointer index
	LDA tbl7_8E02,Y
	STA $32
	LDA tbl7_8E02+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer
tbl7_8E02:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_8E0C
	.word ptr5_8E21
ptr5_8E0C:
	JSR jmp_54_A773
	INC playerLives
	LDA #SFX_1UP
	STA sndSfx ; Play 1UP sound
	LDA #$00
	STA objSlot,X ; Despawn 1UP
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_8E21:
	LDA objVar,X
	CMP #$0E
	BCS bra7_8E34
	LDA frameCount
	AND #$03
	BNE bra7_8E33_RTS
	LDA #$05
	JSR getMovementData
bra7_8E33_RTS:
	RTS
bra7_8E34:
	LDA objState,X
	AND #$E0
	STA objState,X
	LDA #$00
	STA objVar,X
	RTS
obj0x06:
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA objSlot,X
	BEQ bra7_8E8B
	JSR sub3_B057
	BEQ bra7_8E5B
	CMP #$04
	BEQ bra7_8E5B
	CMP #$02
	BNE bra7_8E7F
bra7_8E5B:
	LDA frameCount
	AND #$00
	BNE bra7_8E66 ; Set speed to once every frame
	LDA #$06
	JSR getMovementData
bra7_8E66:
	LDA #$08
	JSR sub3_AEA8
	LDA objSlot,X
	CMP #$70
	BEQ bra7_8E7F
	CMP #$42
	BCS bra7_8E7A
	CMP #$3A
	BCS bra7_8E7F
bra7_8E7A:
	LDA #$00
	STA objSlot,X
bra7_8E7F:
	LDY $A4
	LDA #$0F
	STA objSlot,Y
	LDA #$00
	STA objState,Y
bra7_8E8B:
	STA fireballSlot
	RTS
obj0x07:
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA objSlot,X
	BEQ bra7_8ED8
	JSR sub3_B057
	BEQ bra7_8EA8
	CMP #$04
	BEQ bra7_8EA8
	CMP #$02
	BNE bra7_8ECC
bra7_8EA8:
	LDA frameCount
	AND #$00
	BNE bra7_8EB3
	LDA #$06
	JSR getMovementData
bra7_8EB3:
	LDA #$08
	JSR sub3_AEA8
	LDA objSlot,X
	CMP #$70
	BEQ bra7_8ECC
	CMP #$42
	BCS bra7_8EC7
	CMP #$3A
	BCS bra7_8ECC
bra7_8EC7:
	LDA #$00
	STA objSlot,X
bra7_8ECC:
	LDY $A4
	LDA #$0F
	STA objSlot,Y
	LDA #$00
	STA objState,Y
bra7_8ED8:
	STA fireballSlot2
	RTS
obj0x08:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8EFA
	CMP #$FF
	BEQ bra7_8EFA
	JMP objRemoveObject
bra7_8EFA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8F3C
	LDA objYDistHi,X
	BPL bra7_8F2B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8F3C
bra7_8F2B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8F3C:
loc7_8F3C:
	LDA freezeFlag
	BEQ bra7_8F42
	RTS
bra7_8F42:
	JSR sub7_9538
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA objSlot,X
	RTS
sub7_8F50:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Player X Screen - Object X Screen = X Screen Distance
	STA $28
	BEQ bra7_8F6C ; Branch ahead if the player is on the same screen as the object
	CMP #$FF ; Is the object 1 screen ahead of the player?
	BEQ bra7_8F6C ; If so, branch ahead
	JMP objRemoveObject ; Otherwise, jump
bra7_8F6C:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8FAE
	LDA objYDistHi,X
	BPL bra7_8F9D
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8FAE
bra7_8F9D:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8FAE:
loc7_8FAE:
	LDA freezeFlag
	BEQ bra7_8FB4_RTS
	RTS
bra7_8FB4_RTS:
	RTS
obj0x09:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8FD3
	CMP #$FF
	BEQ bra7_8FD3
	JMP objRemoveObject
bra7_8FD3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9015
	LDA objYDistHi,X
	BPL bra7_9004
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9015
bra7_9004:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9015:
loc7_9015:
	LDA freezeFlag
	BEQ bra7_901B
	RTS
bra7_901B:
	JSR sub7_9538
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA objSlot,X
	RTS
obj0x0A:
	LDX $A4
	JSR sub7_9538
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub7_8F50
	LDA #$10
	JSR sub3_AEA8
	LDA #$00
	STA objSlot,X
	RTS
obj0x6B:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_907C
	CMP #$FF
	BEQ bra7_907C
	JMP objRemoveObject
bra7_907C:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_90BE
	LDA objYDistHi,X
	BPL bra7_90AD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_90BE
bra7_90AD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_90BE:
loc7_90BE:
	LDA freezeFlag
	BEQ bra7_90C4
	RTS
bra7_90C4:
	JSR sub7_9149
	RTS
obj0x0B:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_90E6
	CMP #$FF
	BEQ bra7_90E6
	JMP objRemoveObject
bra7_90E6:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9128
	LDA objYDistHi,X
	BPL bra7_9117
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9128
bra7_9117:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9128:
loc7_9128:
	LDA freezeFlag
	BEQ bra7_912E
	RTS
bra7_912E:
	JSR jmp_54_BD3D
	JSR sub7_9149
	LDA objState,X ; Get the current object state
	AND #%00001111 ; Mask the lower 4 bits out
	CMP #$04
	BCS bra7_9148_RTS ; Continue if the result is less than $04
	LDA frameCount
	AND #$01
	BNE bra7_9148_RTS ; Only continue if on an even frame
	LDA #$0B
	JSR getMovementData ; Get the movement data
bra7_9148_RTS:
	RTS
sub7_9149:
	LDA #$06
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9161,Y
	STA $32
	LDA tbl7_9161+1,Y
	STA $33
	JMP ($32)
tbl7_9161:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_916B
	.word ptr5_917C
ptr5_916B:
	JSR jmp_54_A773
	JSR objGetEdiblePowerup
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_917C:
	LDA objVar,X
obj0x3A:
	CMP #$0E
	BCS bra7_91A2
	LDA objSlot,X
	CMP #$39
	BNE bra7_9196
	LDA frameCount
	AND #$00
	BNE bra7_9195_RTS
	LDA #$2A
	JSR getMovementData
bra7_9195_RTS:
	RTS
bra7_9196:
	LDA frameCount
	AND #$03
	BNE bra7_91A1_RTS
	LDA #$05
	JSR getMovementData
bra7_91A1_RTS:
	RTS
bra7_91A2:
	LDA objState,X
	AND #$E0
	STA objState,X
	LDA #$00
	STA objVar,X
	RTS
obj0x0C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_91CE
	CMP #$FF
	BEQ bra7_91CE
	JMP objRemoveObject
bra7_91CE:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9210
	LDA objYDistHi,X
	BPL bra7_91FF
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9210
bra7_91FF:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9210:
loc7_9210:
	LDA freezeFlag
	BEQ bra7_9216
	RTS
bra7_9216:
	JSR jmp_54_BD3D
	LDA frameCount
	AND #$03
	BNE bra7_9224
	LDA #$0C
	JSR jmp_54_B11D
bra7_9224:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9240
	CMP #$FF
	BEQ bra7_9240
	JMP objRemoveObject
bra7_9240:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9282
	LDA objYDistHi,X
	BPL bra7_9271
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9282
bra7_9271:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9282:
loc7_9282:
	LDA freezeFlag
	BEQ bra7_9288
	RTS
bra7_9288:
	LDA objVar,X
	CMP #$0F
	BCS bra7_9290
	RTS
bra7_9290:
	LDA #$06
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_92A8,Y
	STA $32
	LDA tbl7_92A8+1,Y
	STA $33
	JMP ($32)
tbl7_92A8:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_92B2
	.word ptr5_92C3
ptr5_92B2:
	JSR jmp_54_A773
	JSR objGetEdiblePowerup
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_92C3:
	LDX $A4
	LDA objState,X
	AND #$E0
	STA objState,X
	RTS
obj0x0D:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_92EC
	CMP #$FF
	BEQ bra7_92EC
	JMP objRemoveObject
bra7_92EC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_932E
	LDA objYDistHi,X
	BPL bra7_931D
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_932E
bra7_931D:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_932E:
loc7_932E:
	LDA freezeFlag
	BEQ bra7_9334
	RTS
bra7_9334:
	JSR jmp_54_BD3D
	LDA frameCount
	AND #$03
	BNE bra7_9342
	LDA #$0D
	JSR jmp_54_B470
bra7_9342:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_935E
	CMP #$FF
	BEQ bra7_935E
	JMP objRemoveObject
bra7_935E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_93A0
	LDA objYDistHi,X
	BPL bra7_938F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_93A0
bra7_938F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_93A0:
loc7_93A0:
	LDA freezeFlag
	BEQ bra7_93A6
	RTS
bra7_93A6:
	LDA objVar,X
	CMP #$0F
	BCS bra7_93AE
	RTS
bra7_93AE:
	LDA #$06
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_93C6,Y
	STA $32
	LDA tbl7_93C6+1,Y
	STA $33
	JMP ($32)
tbl7_93C6:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_93D0
	.word ptr5_92C3
ptr5_93D0:
	JSR jmp_54_A773
	JSR objGetEdiblePowerup
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
obj0x0E:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_93FF
	CMP #$FF
	BEQ bra7_93FF
	JMP objRemoveObject
bra7_93FF:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9441
	LDA objYDistHi,X
	BPL bra7_9430
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9441
bra7_9430:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9441:
loc7_9441:
	LDA freezeFlag
	BEQ bra7_9447
	RTS
bra7_9447:
	JSR jmp_54_BD3D
	JSR sub7_9462
	LDA objState,X
	AND #$0F
	CMP #$04
	BCS bra7_9461_RTS
	LDA frameCount
	AND #$01
	BNE bra7_9461_RTS
	LDA #$0E
	JSR getMovementData
bra7_9461_RTS:
	RTS
sub7_9462:
	LDA #$06
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_947A,Y
	STA $32
	LDA tbl7_947A+1,Y
	STA $33
	JMP ($32)
tbl7_947A:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9484
	.word ptr5_9497
ptr5_9484:
	JSR jmp_54_A773
	LDA #$01
	STA invincibilityTimer
	LDA #$00
	STA objSlot,X
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_9497:
	LDA objVar,X
	CMP #$0E
	BCS bra7_94AA
	LDA frameCount
	AND #$03
	BNE bra7_94A9_RTS
	LDA #$05
	JSR getMovementData
bra7_94A9_RTS:
	RTS
bra7_94AA:
	LDA objState,X
	AND #$E0
	STA objState,X
	LDA #$00
	STA objVar,X
	RTS
obj0x0F:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_94D6
	CMP #$FF
	BEQ bra7_94D6
	JMP objRemoveObject
bra7_94D6:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9518
	LDA objYDistHi,X
	BPL bra7_9507
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9518
bra7_9507:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9518:
loc7_9518:
	LDA freezeFlag
	BEQ bra7_951E
	RTS
bra7_951E:
	LDA objState,X
	BNE bra7_9527
	LDY #$0F
	STY sndSfx
bra7_9527:
	CMP #$10
	BCC bra7_9534
	LDA #$00
	STA objSlot,X
	STA objState,X
	RTS
bra7_9534:
	INC objState,X
	RTS
sub7_9538:
	LDA objState,X
	AND #$40
	BEQ bra7_9550
	LDA objXLo,X
	SEC
	SBC #$03
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	JMP loc7_955E
bra7_9550:
	LDA objXLo,X
	CLC
	ADC #$03
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
loc7_955E:
	STA objXHi,X
	RTS
ptr6_9562:
	JSR sub7_9792
	LDY #$0D
	LDX $A4
	LDA objVar,X
	BMI bra7_9573
	CMP #$10
	BCC bra7_9573
	INY
bra7_9573:
	TYA
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
sprPtrs_CommonObjects:
	.word sprMap_Mushroom
	.word sprMap_PSwitch
	.word sprMap_KoopaShell1
	.word sprMap_Spring
	.word sprMap_SpringPressed
	.word sprMap_FireFlower
	.word ofs_95FE
	.word sprMap_Star
	.word sprMap_Feather
	.word sprMap_1UP
	.word ofs_961A
	.word ofs_961E
	.word sprMap_KoopaShell2
	.word ofs_9622
	.word ofs_9629
	.word sprMap_Checkpoint
	.word sprMap_GoalTape
sprMap_Mushroom:
	db $02 ; Tile Width
	db $02 ; Tile Height
	db $90 ; CHR Bank ID
	db $01, $02
	db $0B, $0C
sprMap_PSwitch:
	db $02
	db $02
	db $90
	db $03, $04
	db $0D, $0E
sprMap_KoopaShell1:
	db $02
	db $02
	db $90
	db $05, $06
	db $0F, $10
sprMap_KoopaShell2:
	db $02
	db $02
	db $90
	db $0F, $10
	db $05, $06
sprMap_Spring:
	db $02
	db $02
	db $90
	db $07, $08
	db $11, $12
sprMap_SpringPressed:
	db $02
	db $02
	db $90
	db $FF, $FF
	db $15, $16
sprMap_FireFlower:
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
sprMap_Star:
	db $02
	db $02
	db $90
	db $1B, $1C
	db $23, $24
sprMap_Feather:
	db $02
	db $02
	db $90
	db $1D, $1E
	db $25, $26
sprMap_1UP:
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
	LDA objState,X
	AND #$1F
	TAX
	LDA tbl7_9654,X
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA objState,Y
	AND #$1F
	CMP #$04
	BEQ bra7_966F
	CMP #$06
	BNE bra7_968A
bra7_966F:
	LDA #$0C
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$00
	LDX $A4
	LDA objSlot,X
	CMP #$38
	BNE bra7_96B0
	LDA objFrameCount
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$00
	STA $36
	LDA objFrameCount
	AND #$08
	ASL
	ASL
	ASL
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr7_96F8:
	LDX $A4
	LDA objState,X
	STA $05F0
	LDA objFrameCount
	AND #$04
	BNE bra7_971A_RTS
	ASL
	TAX
	LDA sprPtrs_HPodoboo,X
	STA $32
	LDA sprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	JSR jmp_54_A118
bra7_971A_RTS:
	RTS
sprPtrs_HPodoboo:
	.word sprMap_HPodoboo
sprMap_HPodoboo:
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDY #$40
	LDA objFrameCount
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
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDY #$00
	LDA objVar,X
	CMP #$14
	BCC bra7_978B
	LDY #$40
bra7_978B:
	STY $05F0
	JSR jmp_54_A118
	RTS
sub7_9792:
	LDX $A4
	LDA objVar,X
	BPL bra7_979B_RTS
	PLA
	PLA
bra7_979B_RTS:
	RTS
ptr6_979C:
	JSR sub7_9792
	LDY #$07
	LDA frameCount
	AND #$08
	BEQ bra7_97A9
	LDY #$0A
bra7_97A9:
	TYA
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
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
	LDA objXDistLo,Y
	CLC
	ADC playerSprX
	STA $28
	LDA objXDistHi,Y
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
	ADC playerSprX
	BCC bra7_9826
	INC $41
bra7_9826:
	CLC
	ADC objXDistLo,Y
	STA $28
	LDA objXDistHi,Y
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
	LDA objYDistLo,Y
	CLC
	ADC playerSprY
	STA $2B
	LDA objYDistHi,Y
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
	STA spriteMem+4
	LDA $B2
	STA spriteMem+8
	LDA $B3
	STA spriteMem+12
	LDA $B3
	STA $0210
	LDA $41
	STA spriteMem+7
	LDA $42
	STA spriteMem+11
	LDA $41
	STA spriteMem+15
	LDA $42
	STA $0213
	LDA #$59 ; Pop effect upper left tile
	STA spriteMem+5
	LDA #$61 ; Pop effect upper right tile
	STA spriteMem+9
	LDA #$61 ; Pop effect lower left tile
	STA spriteMem+13
	LDA #$59 ; Pop effect lower right tile
	STA $0211
	LDA #$01
	STA spriteMem+6
	LDA #$C1
	STA spriteMem+10
	LDA #$01
	STA spriteMem+14
	LDA #$C1
	STA $0212
	RTS
obj0x42:
	LDX $A4
	LDA objVar,X
	BPL bra7_9908
	JSR objFacePlayer
	RTS
bra7_9908:
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
	BEQ bra7_992A
	CMP #$FF
	BEQ bra7_992A
	JMP objRemoveObject
bra7_992A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_996C
	LDA objYDistHi,X
	BPL bra7_995B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_996C
bra7_995B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_996C:
loc7_996C:
	LDA freezeFlag
	BEQ bra7_9972
	RTS
bra7_9972:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9986,Y
	STA $32
	LDA tbl7_9986+1,Y
	STA $33
	JMP ($32)
tbl7_9986:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9990
	.word ptr5_99BF
ptr5_9990:
	LDA frameCount
	AND #$00
	BNE bra7_999B
	LDA #$29
	JSR getMovementData
bra7_999B:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
	INC objSlot,X
	INC objSlot,X
	LDA #$00
	STA $0641,X
	STA objVar,X
	LDA #$28
	STA objState,X
	LDA #$18
	STA sndSfx
	RTS
ptr5_99BF:
	LDX $A4
	INC objSlot,X
	INC objSlot,X
	LDA #$00
	STA objVar,X
	RTS
ptr6_99CD:
	LDY #$00
	LDA objFrameCount
	AND #$08
	BEQ bra7_99D7
	INY
bra7_99D7:
	TYA
	ASL
	TAX
	LDA sprPtrs_BuzzyBeetle,X
	STA $32
	LDA sprPtrs_BuzzyBeetle+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_99F1
	LDY #$C0
bra7_99F1:
	STY $36
	LDA objState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
sprPtrs_BuzzyBeetle:
	.word sprMap_BuzzyWalk1
	.word sprMap_BuzzyWalk2
sprMap_BuzzyWalk1:
	db $02
	db $02
	db $97
	db $1E, $1F
	db $26, $27
sprMap_BuzzyWalk2:
	db $02
	db $02
	db $97
	db $20, $21
	db $28, $29
ptr6_9A11:
	LDA #$02
	ASL
	TAX
	LDA sprPtrs_BuzzyShell,X
	STA $32
	LDA sprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9A2C
	LDY #$C0
bra7_9A2C:
	STY $36
	LDA objState,X
	AND #$1F
	CMP #$04
	BEQ bra7_9A3B
	CMP #$06
	BNE bra7_9A5C
bra7_9A3B:
	LDA #$04
	ASL
	TAX
	LDA sprPtrs_BuzzyShell,X
	STA $32
	LDA sprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9A56
	LDY #$C0
bra7_9A56:
	STY $36
	LDA #$80
	BNE bra7_9A61
bra7_9A5C:
	LDA objState,X
	AND #$40
bra7_9A61:
	STA $05F0
	JSR jmp_54_A118
	RTS
ptr6_9A68:
	LDA objFrameCount
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
	LDA sprPtrs_BuzzyShell,X
	STA $32
	LDA sprPtrs_BuzzyShell+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9A93
	LDY #$C0
bra7_9A93:
	STY $36
	JSR jmp_54_A118
	RTS
sprPtrs_BuzzyShell:
	.word sprMap_BuzzyShell1
	.word sprMap_BuzzyShell2
	.word sprMap_BuzzyShell3
	.word sprMap_BuzzyShell2
	.word sprMap_BuzzyShell4
sprMap_BuzzyShell1:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $22, $23
sprMap_BuzzyShell2:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $24, $25
sprMap_BuzzyShell3:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $2A, $2B
sprMap_BuzzyShell4:
	db $02
	db $02
	db $97
	db $2A, $2B
	db $1C, $1D
obj0x74:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9ADD
	CMP #$FF
	BEQ bra7_9ADD
	JMP objRemoveObject
bra7_9ADD:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9B1F
	LDA objYDistHi,X
	BPL bra7_9B0E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9B1F
bra7_9B0E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9B1F:
loc7_9B1F:
	LDA freezeFlag
	BEQ bra7_9B25
	db $60
bra7_9B25:
	LDA objVar,X
	BPL bra7_9B4E
	LDA #$00
	STA objVar,X
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAY
	LDA curPlayer
	BEQ bra7_9B43
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9B43:
	LDA checkpointFlag,Y
	BEQ bra7_9B4E
	LDA #$00
	STA objSlot,X
	RTS
bra7_9B4E:
	LDA #$07
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9B66,Y
	STA $32
	LDA tbl7_9B66+1,Y
	STA $33
	JMP ($32)
tbl7_9B66:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9B6E
ptr5_9B6E:
	LDA objXDistHi,X
	BPL bra7_9B80
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra7_9B87
	BCC bra7_9BA7
bra7_9B80:
	LDA objXDistLo,X
	CMP #$08
	BCS bra7_9BA7
bra7_9B87:
	LDA objYDistHi,X
	BEQ bra7_9B9D
	CMP #$FF
	BNE bra7_9BA7
	LDA #$18
	CLC
	ADC #$03
	CLC
	ADC objYDistLo,X
	BCS bra7_9BA4
	BCC bra7_9BA7
bra7_9B9D:
	LDA objYDistLo,X
	CMP #$00
	BCS bra7_9BA7
bra7_9BA4:
	CLC
	BCC bra7_9BA8
bra7_9BA7:
	SEC
bra7_9BA8:
	BCC bra7_9BB3
	LDA objState,X
	AND #$E0
	STA objState,X
	RTS
bra7_9BB3:
	JSR sub7_9EE5
	LDX $A4
	LDA #$1C
	STA sndSfx
	LDA #$00
	STA objSlot,X
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAY
	LDA curPlayer
	BEQ bra7_9BD5
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9BD5:
	LDA #$01
	STA checkpointFlag,Y
	RTS
ptr6_9BDB:
	LDA #$0F
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDA #$40
	STA $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
sprMap_Checkpoint:
	db $02
	db $01
	db $90
	db $3E, $3E
ptr6_9BFB:
	LDA #$10
	ASL
	TAX
	LDA sprPtrs_CommonObjects,X
	STA $32
	LDA sprPtrs_CommonObjects+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra7_9C16
	LDY #$C0
bra7_9C16:
	STY $36
	LDA #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
sprMap_GoalTape:
	db $03
	db $01
	db $A6
	db $37, $36, $36
	db $36 ; Excess byte, can be removed
obj0x48:
	LDX $A4
	LDA objVar,X
	BMI bra7_9C32
	JMP loc7_9D0B
bra7_9C32:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9C4E
	CMP #$FF
	BEQ bra7_9C4E
	JMP objRemoveObject
bra7_9C4E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9C90
	LDA objYDistHi,X
	BPL bra7_9C7F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9C90
bra7_9C7F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9C90:
loc7_9C90:
	LDA freezeFlag
	BEQ bra7_9C96
	RTS
bra7_9C96:
	LDA objVar,X
	CMP #$80
	BNE bra7_9D07
	JSR objFacePlayer
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA $0515,Y
	LDA objState,X
	AND #$40
	BNE bra7_9CBC
	LDA objXLo,X
	CLC
	ADC #$10
	JMP loc7_9CC2
bra7_9CBC:
	LDA objXLo,X
	SEC
	SBC #$10
loc7_9CC2:
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	STA $0529,Y
	LDA objYLo,X
	CLC
	ADC #$10
	STA objYLo,Y
	CLC
	ADC #$10
	STA $053D,Y
	LDA objYHi,X
	STA objYHi,Y
	STA $0551,Y
	LDA objSlot,X
	STA objSlot,Y
	STA $0501,Y
	LDA objState,X
	STA objState,Y
	STA $0565,Y
	LDA #$00
	STA objVar,Y
	STA $0579,Y
	STA objAction,Y
	STA $066A,Y
	RTS
bra7_9D07:
	JSR sub_54_B4FC
	RTS
loc7_9D0B:
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
	BEQ bra7_9D2D
	CMP #$FF
	BEQ bra7_9D2D
	JMP objRemoveObject
bra7_9D2D:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9D6F
	LDA objYDistHi,X
	BPL bra7_9D5E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9D6F
bra7_9D5E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9D6F:
loc7_9D6F:
	LDA freezeFlag
	BEQ bra7_9D75
	RTS
bra7_9D75:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9D89,Y
	STA $32
	LDA tbl7_9D89+1,Y
	STA $33
	JMP ($32)
tbl7_9D89:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9D93
	.word objFlipKill
ptr5_9D93:
	LDA frameCount
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
	LDA sprPtrs_HPodoboo,X
	STA $32
	LDA sprPtrs_HPodoboo+1,X
	STA $33
	LDA #$40
	STA $36
	LDX $A4
	LDX $A4
	LDA objState,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
obj0x4C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9DE5
	CMP #$FF
	BEQ bra7_9DE5
	JMP objRemoveObject
bra7_9DE5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9E27
	LDA objYDistHi,X
	BPL bra7_9E16
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9E27
bra7_9E16:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9E27:
loc7_9E27:
	LDA freezeFlag
	BEQ bra7_9E2D
	RTS
bra7_9E2D:
	LDA objVar,X
	BPL bra7_9E4F
	LDA #$00
	STA objVar,X
	STA $0641,X
	STA objAction,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	RTS
bra7_9E4F:
	INC $0641,X
	LDA $0641,X
	CMP #$60
	BCC bra7_9E66
	LDA #$00
	STA $0641,X
	LDA objAction,X
	EOR #$01
	STA objAction,X
bra7_9E66:
	LDA objAction,X
	BNE bra7_9E82
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	BCS bra7_9E98
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
	JMP loc7_9E98
bra7_9E82:
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	CMP #$F0
	BCC bra7_9E98
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
bra7_9E98:
loc7_9E98:
	LDA #$07
	STA $25
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9EB0,Y
	STA $32
	LDA tbl7_9EB0+1,Y
	STA $33
	JMP ($32)
tbl7_9EB0:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9EB8
ptr5_9EB8:
	LDA objXDistHi,X
	BPL bra7_9EE4_RTS
	LDA #MUS_VICTORY
	STA sndMusic ; Play level complete music
	LDA #$06
	STA gameState ; Trigger goal tape event
	LDA worldNumber
	ASL
	ASL ; Multiply world number by 4
	CLC
	ADC levelNumber ; Add it to the level number to get the level index
	TAY
	LDA curPlayer
	BEQ bra7_9ED9 ; Branch ahead if player one is playing
	TYA
	CLC
	ADC #$1C
	TAY ; If player 2 is playing, use their checkpoint index instead
bra7_9ED9:
	LDA #$00
	STA checkpointFlag,Y
	STA invincibilityTimer
	STA playerPowerupBuffer ; Clear the player's checkpoint, invincibility, and any powerup buffering
bra7_9EE4_RTS:
	RTS
sub7_9EE5:
	LDA playerPowerup
	BNE bra7_9EF6_RTS ; Only do this if the player is small
	INC playerPowerup ; Make the player big
	LDA #$07
	STA gameState ; Update the player's sprite?
	LDA #$01
	STA playerPowerupBuffer ; Update the player's sprite
bra7_9EF6_RTS:
	RTS
obj0x7C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9F15
	CMP #$FF
	BEQ bra7_9F15
	JMP objRemoveObject
bra7_9F15:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9F57
	LDA objYDistHi,X
	BPL bra7_9F46
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9F57
bra7_9F46:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9F57:
loc7_9F57:
	LDA freezeFlag
	BEQ bra7_9F5D
	RTS
bra7_9F5D:
	LDA objVar,X
	BPL bra7_9F78
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F78
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$0F
	STA objXLo,X
	RTS
bra7_9F78:
	LDA $058C,X
	CMP #$02
	BEQ bra7_9F8D
	LDA objXDistHi,X
	BPL bra7_9F8C_RTS
bra7_9F84:
	INC $E0
	LDX curPlayer
	INC playerLives,X
bra7_9F8C_RTS:
	RTS
bra7_9F8D:
	LDA objXDistHi,X
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
