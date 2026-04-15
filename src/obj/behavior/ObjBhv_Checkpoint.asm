.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x74
obj0x74:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9ADD
	CMP #$FF
	BEQ bra7_9ADD
	JMP objRemoveObject
bra7_9ADD:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9B1F
	LDA objYDistHi,X
	BPL bra7_9B0E
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9B1F
bra7_9B0E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9B1F:
loc7_9B1F:
	LDA freezeFlag
	BEQ bra7_9B25
	.byte $60
bra7_9B25:
	LDA objVar,X
	BPL bra7_9B4E
	LDA #$00
	STA objVar,X
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAY
	LDA curPlayer
	BEQ bra7_9B43
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9B43:
	LDA checkpointFlag,Y
	BEQ bra7_9B4E
	LDA #$00
	STA objSlot,X
	RTS
bra7_9B4E:
	LDA #$07
	STA $25
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9B66,Y
	STA $32
	LDA tbl7_9B66+1,Y
	STA $33
	JMP ($32)
tbl7_9B66:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9B6E
ptr5_9B6E:
	LDA objXDistHi,X
	BPL bra7_9B80
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra7_9B87
	BCC bra7_9BA7
bra7_9B80:
	LDA objXDistLo,X
	CMP #$08
	BCS bra7_9BA7
bra7_9B87:
	LDA objYDistHi,X
	BEQ bra7_9B9D
	CMP #$FF
	BNE bra7_9BA7
	LDA #$18
	CLC
	ADC #$03
	CLC
	ADC objYDistLo,X
	BCS bra7_9BA4
	BCC bra7_9BA7
bra7_9B9D:
	LDA objYDistLo,X
	CMP #$00
	BCS bra7_9BA7
bra7_9BA4:
	CLC
	BCC bra7_9BA8
bra7_9BA7:
	SEC
bra7_9BA8:
	BCC bra7_9BB3
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	RTS
bra7_9BB3:
	JSR sub7_9EE5
	LDX $A4
	LDA #$1C
	STA sndSfx
	LDA #$00
	STA objSlot,X
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	TAY
	LDA curPlayer
	BEQ bra7_9BD5
	TYA
	CLC
	ADC #$1C
	TAY
bra7_9BD5:
	LDA #$01
	STA checkpointFlag,Y
	RTS
