.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0E
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
	LDA objFlags,X
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
	LDA objFlags,X
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
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	LDA #$00
	STA objVar,X
	RTS
