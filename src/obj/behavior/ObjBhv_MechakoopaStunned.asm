.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x3C
obj0x3C:
	LDX $A4
	LDA objStateTimer,X
	CMP #$F0
	BCC bra8_9419
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$3A
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	STA objVar,X
	STA objStateTimer,X
	LDA #$F8
	BMI bra8_9406
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra8_93FA ; unlogged
	CMP #$F0 ; unlogged
	BCC loc8_9418_RTS ; unlogged
bra8_93FA:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc8_9418_RTS ; unlogged
bra8_9406:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS loc8_9418_RTS
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged

loc8_9418_RTS:
	RTS
bra8_9419:
	LDA objFrameCount
	AND #$03
	BNE bra8_9423
	INC objStateTimer,X
bra8_9423:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra8_948D

bra8_948D:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_94A1,Y
	STA $32
	LDA tbl8_94A1+1,Y
	STA $33
	JMP ($32)
tbl8_94A1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_94B1
	.word objFlipKill
	.word ptr3_9564
	.word ptr_AD79
	.word ptr3_959C
ptr3_94B1:
	JSR jmp_54_ACC3
	LDA $0636
	BEQ bra8_94BA
	RTS
bra8_94BA:
	LDA frameCount
	AND #$00
	BNE bra8_94C5
	LDA #$27
	JSR getMovementData
bra8_94C5:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_94E1
	CMP #$FF
	BEQ bra8_94E1
	JMP objRemoveObject ; unlogged
bra8_94E1:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9523
	LDA objYDistHi,X
	BPL bra8_9512
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_9523
bra8_9512:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_9523:
loc8_9523:
	LDA freezeFlag
	BEQ bra8_9529
	RTS
bra8_9529:
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA $1E
	CMP #$05
	BEQ bra8_9541
bra8_9535:
	INC objFlags,X
	INC objFlags,X
	LDA #$00
	STA objVar,X
	RTS
bra8_9541:
	LDA playerYSpd
	BEQ bra8_9535
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
	STA objFlags,X
	RTS
ptr3_9564:
	LDA objXDistHi,X
	BPL bra8_9570
	LDA objFlags,X
	ORA #$40
	BNE bra8_9575
bra8_9570:
	LDA objFlags,X
	AND #$BF
bra8_9575:
	STA objFlags,X
	LDA frameCount
	AND #$00
	BNE bra8_9583
	LDA #$23
	JSR getMovementData
bra8_9583:
	LDA objVar,X
	CMP #$07
	BCC bra8_959B_RTS
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	AND #$20
	BNE bra8_959B_RTS
	LDA #$00
	STA objVar,X
bra8_959B_RTS:
	RTS
ptr3_959C:
	LDA frameCount
	AND #$00
	BNE bra8_95A7
	LDA #$45
	JSR getMovementData
bra8_95A7:
	LDA #$20
	JSR objObjectHitCheck
tbl8_95AC:
	JSR jmp_54_AD54
	LDA #$01
	STA $06E4
	RTS
