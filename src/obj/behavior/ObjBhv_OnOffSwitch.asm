.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x76
obj0x76:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra5_8CFF
	CMP #$FF
	BEQ bra5_8CFF
	JMP objRemoveObject
bra5_8CFF:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8D41
	LDA objYDistHi,X
	BPL bra5_8D30
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8D41
bra5_8D30:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8D41:
loc5_8D41:
	LDA freezeFlag
	BEQ bra5_8D47
	RTS
bra5_8D47:
	LDA objVar,X
	BPL bra5_8D5A
	LDA #$00
	STA objVar,X
	STA switchBlockFlag
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra5_8D5A:
	JSR sub5_8D67
	LDA switchBlockFlag
	CLC
	ADC #$57
	STA enemyAnimFrame,X
	RTS
sub5_8D67:
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
	BEQ bra5_8D89
	CMP #$FF
	BEQ bra5_8D89
	JMP objRemoveObject
bra5_8D89:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8DCB
	LDA objYDistHi,X
	BPL bra5_8DBA
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8DCB
bra5_8DBA:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8DCB:
loc5_8DCB:
	LDA freezeFlag
	BEQ bra5_8DD1
	RTS
bra5_8DD1:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8DE5,Y
	STA $32
	LDA tbl5_8DE5+1,Y
	STA $33
	JMP ($32)
tbl5_8DE5:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr10_8DED
ptr10_8DED:
	LDA objXDistHi,X
	BPL bra5_8DFF
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_8E06
	BCC bra5_8E26
bra5_8DFF:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_8E26
bra5_8E06:
	LDA objYDistHi,X
	BEQ bra5_8E1C
	CMP #$FF
	BNE bra5_8E26
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_8E23
	BCC bra5_8E26
bra5_8E1C:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_8E26
bra5_8E23:
	CLC
	BCC bra5_8E27
bra5_8E26:
	SEC
bra5_8E27:
	BCC bra5_8E32
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	RTS
bra5_8E32:
	LDA playerMoveFlags
	AND #$04
	BEQ bra5_8E4E_RTS
	LDA switchBlockFlag
	EOR #$01
	STA switchBlockFlag
	LDA playerMoveFlags
	AND #$FB
	STA playerMoveFlags
	LDA #$20
	STA playerYSpd
	LDA #$16
	STA sndSfx
bra5_8E4E_RTS:
	RTS
