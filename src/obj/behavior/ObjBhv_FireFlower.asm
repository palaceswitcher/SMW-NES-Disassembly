.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0C
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
	LDA objFlags,X
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
