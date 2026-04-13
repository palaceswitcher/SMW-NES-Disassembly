.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0D
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
	JSR parseMovementData
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
	LDA objFlags,X
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
