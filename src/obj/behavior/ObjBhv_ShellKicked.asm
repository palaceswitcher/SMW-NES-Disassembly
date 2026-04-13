.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x38
obj0x38:
	LDX $A4
	LDA objFlags,X
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
	JSR objObjectHitCheck
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
	LDA objFlags,X
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
	LDA objFlags,X
	AND #$C0
	STA objFlags,X
	LDA #$00
	STA objVar,X
	RTS
