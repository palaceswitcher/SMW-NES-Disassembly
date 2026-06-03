.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xD6
obj0xD6:
	LDX $A4
	LDA objVar,X
	BMI bra4_92C1
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA objXDistHi,X
	BEQ bra4_92C0_RTS
	CMP #$FF
	BEQ bra4_92C0_RTS
	LDA #$00
	STA booBuddiesFlag
	JMP objRemoveObject
bra4_92C0_RTS:
	RTS
bra4_92C1:
	LDA booBuddiesFlag
	CMP #$FF
	BNE bra4_92CA
	JMP objRemoveObject ; unlogged
bra4_92CA:
	LDA #$FF
	STA booBuddiesFlag
	LDA objXLo,X
	STA booBuddiesX
	LDA objXHi,X
	STA booBuddiesXScreen
	LDA objYLo,X
	STA booBuddiesY
	LDA objYHi,X
	STA booBuddiesYScreen
	LDA #$00
	STA objVar,X
	LDA #$09
	STA $25
	LDA objSlot,X
	AND #$01
	ORA #$B6
	STA $26
bra4_92F4:
	LDX objCount
	INC objCount
	LDY $25
	LDA tbl4_934B,Y
	STA objVar,X
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesX
	STA objXLo,X
	PLA
	BMI bra4_9314
	LDA booBuddiesXScreen
	ADC #$00
	BPL bra4_9318
bra4_9314:
	LDA booBuddiesXScreen
	SBC #$00
bra4_9318:
	STA objXHi,X
	LDY $25
	LDA tbl4_935F,Y
	STA objFlags,X
	LDA tbl4_9355,Y
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesY
	STA objYLo,X
	PLA
	BMI bra4_933A
	LDA booBuddiesYScreen
	ADC #$00
	BPL bra4_933E
bra4_933A:
	LDA booBuddiesYScreen
	SBC #$00
bra4_933E:
	STA objYHi,X
	LDA $26
	STA objSlot,X
	DEC $25
	BPL bra4_92F4
	RTS
tbl4_934B:
	.byte $0B
	.byte $16
	.byte $21
	.byte $2C
	.byte $37
	.byte $42
	.byte $4D
	.byte $58
	.byte $63
	.byte $6E
tbl4_9355:
	.byte $2B
	.byte $36
	.byte $41
	.byte $4C
	.byte $57
	.byte $62
	.byte $6D
	.byte $78
	.byte $03
	.byte $0E
tbl4_935F:
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
	.byte $80
	.byte $00
	.byte $40
