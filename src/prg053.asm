.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_9660
ptr6_9660:
	LDY $A4
	LDA objFlags,Y
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
.export ptr6_96B7
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
.export ptr6_96D5
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
.export ptr7_96F8
ptr7_96F8:
	LDX $A4
	LDA objFlags,X
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
	.byte $02
	.byte $02
	.byte $90
	.byte $09, $0A
	.byte $13, $14
.export ptr6_9724
ptr6_9724:
	JSR sub7_9792
.export ptr6_9727
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
.export ptr6_9742
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
.export ptr6_9769
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
.export sub7_9792
sub7_9792:
	LDX $A4
	LDA objVar,X
	BPL bra7_979B_RTS
	PLA
	PLA
bra7_979B_RTS:
	RTS
.export ptr6_979C
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
.export ptr6_97C3
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
	.byte $60
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
.export obj0x42
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
	LDA objFlags,X
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
	STA objStateTimer,X
	STA objVar,X
	LDA #$28
	STA objFlags,X
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
.export ptr6_99CD
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
	LDA objFlags,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
sprPtrs_BuzzyBeetle:
	.word sprMap_BuzzyWalk1
	.word sprMap_BuzzyWalk2
sprMap_BuzzyWalk1:
	.byte $02
	.byte $02
	.byte $97
	.byte $1E, $1F
	.byte $26, $27
sprMap_BuzzyWalk2:
	.byte $02
	.byte $02
	.byte $97
	.byte $20, $21
	.byte $28, $29
.export ptr6_9A11
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
	LDA objFlags,X
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
	LDA objFlags,X
	AND #$40
bra7_9A61:
	STA $05F0
	JSR jmp_54_A118
	RTS
.export ptr6_9A68
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
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $22, $23
sprMap_BuzzyShell2:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $24, $25
sprMap_BuzzyShell3:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $2A, $2B
sprMap_BuzzyShell4:
	.byte $02
	.byte $02
	.byte $97
	.byte $2A, $2B
	.byte $1C, $1D
.export obj0x74
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
	.byte $60
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
	LDA objFlags,X
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
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
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
.export ptr6_9BDB
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
.export sprMap_Checkpoint
sprMap_Checkpoint:
	.byte $02
	.byte $01
	.byte $90
	.byte $3E, $3E
.export ptr6_9BFB
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
.export sprMap_GoalTape
sprMap_GoalTape:
	.byte $03
	.byte $01
	.byte $A6
	.byte $37, $36, $36
	.byte $36 ; Excess byte, can be removed
.export obj0x48
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
	LDA objFlags,X
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
	LDA objFlags,X
	STA objFlags,Y
	STA $0565,Y
	LDA #$00
	STA objVar,Y
	STA $0579,Y
	STA objState,Y
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
	LDA objFlags,X
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

.export ptr5_9DA5
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
	LDA objFlags,X
	AND #$40
	STA $05F0
	JSR jmp_54_A118
	RTS
.export obj0x4C
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
	STA objStateTimer,X
	STA objState,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	RTS
bra7_9E4F:
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$60
	BCC bra7_9E66
	LDA #$00
	STA objStateTimer,X
	LDA objState,X
	EOR #$01
	STA objState,X
bra7_9E66:
	LDA objState,X
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
	LDA objFlags,X
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
.export obj0x7C
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
