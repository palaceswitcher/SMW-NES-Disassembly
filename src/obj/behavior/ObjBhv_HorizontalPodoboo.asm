.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x48
obj0x48:
	LDX $A4
	LDA objVar,X
	BMI bra7_9C32
	JMP loc7_9D0B
bra7_9C32:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9C4E
	CMP #$FF
	BEQ bra7_9C4E
	JMP objRemoveObject
bra7_9C4E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9C90
	LDA objYDistHi,X
	BPL bra7_9C7F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9C90
bra7_9C7F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9C90:
loc7_9C90:
	LDA freezeFlag
	BEQ bra7_9C96
	RTS
bra7_9C96:
	LDA objVar,X
	CMP #$80
	BNE bra7_9D07
	JSR objFacePlayer
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA $0515,Y
	LDA objFlags,X
	AND #$40
	BNE bra7_9CBC
	LDA objXLo,X
	CLC
	ADC #$10
	JMP loc7_9CC2
bra7_9CBC:
	LDA objXLo,X
	SEC
	SBC #$10
loc7_9CC2:
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	STA $0529,Y
	LDA objYLo,X
	CLC
	ADC #$10
	STA objYLo,Y
	CLC
	ADC #$10
	STA $053D,Y
	LDA objYHi,X
	STA objYHi,Y
	STA $0551,Y
	LDA objSlot,X
	STA objSlot,Y
	STA $0501,Y
	LDA objFlags,X
	STA objFlags,Y
	STA $0565,Y
	LDA #$00
	STA objVar,Y
	STA $0579,Y
	STA objState,Y
	STA $066A,Y
	RTS
bra7_9D07:
	JSR sub_54_B4FC
	RTS
loc7_9D0B:
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
	BEQ bra7_9D2D
	CMP #$FF
	BEQ bra7_9D2D
	JMP objRemoveObject
bra7_9D2D:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9D6F
	LDA objYDistHi,X
	BPL bra7_9D5E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9D6F
bra7_9D5E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9D6F:
loc7_9D6F:
	LDA freezeFlag
	BEQ bra7_9D75
	RTS
bra7_9D75:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9D89,Y
	STA $32
	LDA tbl7_9D89+1,Y
	STA $33
	JMP ($32)
tbl7_9D89:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9D93
	.word objFlipKill
ptr5_9D93:
	LDA frameCount
	AND #$00
	BNE bra7_9D9E
	LDA #$25
	JSR jmp_54_B11D
bra7_9D9E:
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
