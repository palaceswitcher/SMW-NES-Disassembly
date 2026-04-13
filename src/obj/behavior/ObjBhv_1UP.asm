.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x49
obj0x49:
	LDX $A4
	objDistCalc bra7_8D64

bra7_8D64:
	JSR jmp_54_BD3D
	JMP loc7_8DD0
.export obj1UP
obj1UP:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8D88
	CMP #$FF
	BEQ bra7_8D88
	JMP objRemoveObject
bra7_8D88:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8DCA
	LDA objYDistHi,X
	BPL bra7_8DB9
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8DCA
bra7_8DB9:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8DCA:
loc7_8DCA:
	LDA freezeFlag
	BEQ bra7_8DD0
	RTS
bra7_8DD0:
loc7_8DD0:
	JSR sub7_8DEA
	LDX $A4
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BCS bra7_8DE9_RTS
	LDA frameCount
	AND #$01
	BNE bra7_8DE9_RTS
	LDA #$0B
	JSR getMovementData
bra7_8DE9_RTS:
	RTS
sub7_8DEA:
	LDA #$06
	STA $25 ; Configure Yoshi tongue behavior (instantly swallowed)
	LDA objFlags,X
	AND #%00011111 ; Mask out the upper 3 bits
	ASL
	TAY ; Use as pointer index
	LDA tbl7_8E02,Y
	STA $32
	LDA tbl7_8E02+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer
tbl7_8E02:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_8E0C
	.word ptr5_8E21
ptr5_8E0C:
	JSR jmp_54_A773
	INC playerLives
	LDA #SFX_1UP
	STA sndSfx ; Play 1UP sound
	LDA #$00
	STA objSlot,X ; Despawn 1UP
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_8E21:
	LDA objVar,X
	CMP #$0E
	BCS bra7_8E34
	LDA frameCount
	AND #$03
	BNE bra7_8E33_RTS
	LDA #$05
	JSR getMovementData
bra7_8E33_RTS:
	RTS
bra7_8E34:
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	LDA #$00
	STA objVar,X
	RTS
