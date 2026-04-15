.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

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
