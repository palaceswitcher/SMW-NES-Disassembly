.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD8
obj0xD8:
	LDX $A4
	LDA objVar,X
	CMP #$80
	BEQ bra4_940E
	JMP loc4_9475
bra4_940E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_942A
	CMP #$FF
	BEQ bra4_942A
	JMP objRemoveObject
bra4_942A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_946C
	LDA objYDistHi,X
	BPL bra4_945B
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_946C ; unlogged
bra4_945B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_946C:
loc4_946C:
	LDA freezeFlag
	BEQ bra4_9472
	RTS ; unlogged
bra4_9472:
	JMP objFacePlayer
loc4_9475:
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
	BEQ bra4_9497
	CMP #$FF
	BEQ bra4_9497
	JMP objRemoveObject
bra4_9497:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_94D9
	LDA objYDistHi,X
	BPL bra4_94C8
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_94D9
bra4_94C8:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_94D9:
loc4_94D9:
	LDA freezeFlag
	BEQ bra4_94DF
	RTS
bra4_94DF:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_94F3,Y
	STA $32
	LDA tbl4_94F3+1,Y
	STA $33
	JMP ($32)
tbl4_94F3:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_94FD
	.word objFlipKill
.export ptr9_94FD
ptr9_94FD:
	JSR sub4_9506
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_9506:
	LDA objFrameCount
	AND #$02
	BNE bra4_951E
	LDA #$88
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_951E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_953A
	CMP #$FF
	BEQ bra4_953A
	JMP objRemoveObject ; unlogged
bra4_953A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_957C
	LDA objYDistHi,X
	BPL bra4_956B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_957C
bra4_956B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_957C:
loc4_957C:
	LDA freezeFlag
	BEQ bra4_9582
	RTS ; unlogged
bra4_9582:
	LDA objVar,X
	CMP #$20
	BCC bra4_95D0
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BEQ bra4_95BC
	LDA objYDistHi,X
	BMI bra4_95AD
	LDA #$00
	STA objVar,X
	LDA objFlags,X
	AND #$DF
	STA objFlags,X
	JMP loc4_95BC
bra4_95AD:
	LDY #$00
	LDA objFlags,X
	AND #$20
	BEQ bra4_95B8
	LDY #$10
bra4_95B8:
	TYA
	STA objVar,X
bra4_95BC:
loc4_95BC:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	RTS
bra4_95D0:
	LDA objFlags,X
	AND #$20
	BNE bra4_962E
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BNE bra4_95F2
	LDA frameCount
	AND #$3E
	BNE bra4_95F1_RTS
	LDA #$20
	STA objVar,X
bra4_95F1_RTS:
	RTS
bra4_95F2:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BCC bra4_961A
	LDA objYDistHi,X
	BPL bra4_961A
	LDA objYDistLo,X
	CMP #$C8
	BCS bra4_961A
	LDA frameCount
	AND #$06
	BNE bra4_961A
	LDA #$10
	STA objVar,X
	LDA objFlags,X
	ORA #$20
	STA objFlags,X
bra4_961A:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	RTS
bra4_962E:
	LDA playerMoveFlags
	AND #$40
	STA $25
	LDA objXDistHi,X
	AND #$40
	CMP $25
	BNE bra4_9649
	LDA frameCount
	AND #$3E
	BNE bra4_9648_RTS
	LDA #$20
	STA objVar,X
bra4_9648_RTS:
	RTS
bra4_9649:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BCC bra4_9671
	LDA objYDistHi,X
	BPL bra4_965E
	LDA objYDistLo,X
	CMP #$E0
	BCC bra4_9671
bra4_965E:
	LDA frameCount
	AND #$06
	BNE bra4_9671
	LDA #$00
	STA objVar,X
	LDA objFlags,X
	AND #$DF
	STA objFlags,X
bra4_9671:
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	RTS
