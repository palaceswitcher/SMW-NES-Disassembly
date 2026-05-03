.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xDE
obj0xDE:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8C96
	CMP #$FF
	BEQ bra_8C96
	JMP objRemoveObject
bra_8C96:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_8CD8
	LDA objYDistHi,X
	BPL bra_8CC7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8CD8
bra_8CC7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_8CD8:
loc_8CD8:
	LDA freezeFlag
	BEQ bra_8CDE
	RTS
bra_8CDE:
	LDA objVar,X
	BMI bra_8CE6
	JMP loc_8D69
bra_8CE6:
	LDA #$00
	STA bowserHitCount
	STA $06E2
	STA $06E3
	STA objVar,X
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	SEC
	SBC #$70
	STA objYLo,Y
	LDA objYHi,X
	SBC #$00
	STA objYHi,Y
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo+1,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+1,Y
	LDA objYLo,X
	SEC
	SBC #$48
	STA objYLo+1,Y
	LDA objYHi,X
	SBC #$00
	STA objYHi+1,Y
	LDA objFlags,X
	STA objFlags,Y
	STA objFlags+1,Y
	LDA #$00
	STA objVar,Y
	STA objVar+1,Y
	STA objState,Y
	STA objStateTimer,Y
	STA $05F6
	STA bowserState
	LDA #$E1
	STA objSlot,Y
	LDA #$D7
	STA objSlot+1,Y
	LDA #$E0
	STA $03C9
	STA $03CA
	RTS
loc_8D69:
	LDX $A4
	JSR sub_8E1A
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_8D8A
	CMP #$FF
	BEQ bra_8D8A
	JMP objRemoveObject
bra_8D8A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_8DCC
	LDA objYDistHi,X
	BPL bra_8DBB
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_8DCC
bra_8DBB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_8DCC:
loc_8DCC:
	LDA freezeFlag
	BEQ bra_8DD2
	RTS
bra_8DD2:
	LDX $A4
	LDA objFrameCount
	AND #$0C
	LSR
	LSR
	STA enemyAnimFrame,X
	LDA $06E7
	BEQ bra_8DF5
	STA clownCarFace
	INC clownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA enemyAnimFrame,X
	RTS
bra_8DF5:
	LDA objFrameCount
	AND #$E0
	LSR
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_8E12,Y
	STA clownCarFace
	JSR sub_82EA
	JSR jmp_54_BF74
	LDA #$02
	STA enemyAnimFrame,X
	RTS
.export tbl_8E12
tbl_8E12:
	.byte $00 ; Clown car blink cycle
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
sub_8E1A:
	LDA $06E3
	BMI bra_8E38
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E2C
	CMP #$F0
	BCC bra_8E4A
bra_8E2C:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc_8E4A
bra_8E38:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra_8E4A
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra_8E4A:
loc_8E4A:
	LDA $03
	SEC
	SBC $06E3
	STA $03
	LDA $06E2
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra_8E67
	LDA objXHi,X
	ADC #$00
	BPL bra_8E6C
bra_8E67:
	LDA objXHi,X
	SBC #$00
bra_8E6C:
	STA objXHi,X
	LDA $02
	SEC
	SBC $06E2
	STA $02
	RTS
