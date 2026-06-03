.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xB4
obj0xB4:
	LDX $A4
	LDA booBuddiesFlag
	CMP #$FF
	BEQ bra4_937B
	LDA #$00
	STA objSlot,X
	STA objFlags,X
	STA objVar,X
	RTS
bra4_937B:
	JSR sub4_93B0
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
	BEQ bra4_93AA
	CMP #$FF
	BEQ bra4_93AA
	RTS
bra4_93AA:
	JSR jmp_54_BC3E
	JMP jmp_54_BF74
sub4_93B0:
	LDA frameCount
	AND #$07
	BEQ bra4_93B7
	RTS
bra4_93B7:
	LDA objVar,X
	CLC
	ADC #$01
	AND #$7F
	STA objVar,X
	LDA objVar,X
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesX
	STA objXLo,X
	PLA
	BMI bra4_93D9
	LDA booBuddiesXScreen
	ADC #$00
	BPL bra4_93DD
bra4_93D9:
	LDA booBuddiesXScreen
	SBC #$00
bra4_93DD:
	STA objXHi,X
	TYA
	CLC
	ADC #$20
	AND #$7F
	TAY
	LDA booBuddiesSineTable,Y
	PHA
	CLC
	ADC booBuddiesY
	STA objYLo,X
	PLA
	BMI bra4_93FA
	LDA booBuddiesYScreen
	ADC #$00
	BPL bra4_93FE
bra4_93FA:
	LDA booBuddiesYScreen
	SBC #$00
bra4_93FE:
	STA objYHi,X
	RTS
