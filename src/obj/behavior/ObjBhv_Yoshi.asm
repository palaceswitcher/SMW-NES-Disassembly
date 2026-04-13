.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export objBhvYoshi
objBhvYoshi:
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
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $02
	.byte $03
	.byte $80
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
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $80
tbl7_813C:
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
	.byte $FE
	.byte $FF
	.byte $01
	.byte $02
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
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $07
	.byte $08
	.byte $80
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
	.byte $18
	.byte $6D
	.byte $F4
	.byte $05
	.byte $8D
	.byte $F4
	.byte $05
	.byte $B0
	.byte $09
	.byte $38
	.byte $E9
	.byte $10
	.byte $8D
	.byte $F4
	.byte $05
	.byte $CE
	.byte $F5
	.byte $05
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
