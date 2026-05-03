.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr7_8000
ptr7_8000:
	LDA playerYHi
	BNE bra_8005
	RTS
bra_8005:
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA sprTblWoodenSpike,X
	STA $32
	LDA sprTblWoodenSpike+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra_8025
	LDY #$C0
bra_8025:
	STY $36
	LDA #$20
	STA $05F0
	STA $06E1
	JSR jmp_52_A118
	LDA #$00
	STA $06E1
	RTS
