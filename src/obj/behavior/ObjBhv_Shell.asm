.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x44
obj0x44:
	LDX $A4
	LDA objStateTimer,X
	CMP #$F0
	BCC bra7_8A60
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$42
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	STA objVar,X
	STA playerHoldFlag
	STA objStateTimer,X
	RTS
bra7_8A60:
	LDA objFrameCount
	AND #$03
	BNE objShell
	INC objStateTimer,X

.export objShell
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
	LDA objFlags,X
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
	STA objFlags,X
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
	INC objFlags,X
	INC objFlags,X
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
	STA objFlags,X
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
	JSR objObjectHitCheck
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
