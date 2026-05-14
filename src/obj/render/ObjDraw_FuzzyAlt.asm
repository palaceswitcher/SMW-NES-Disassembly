.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr7_8544
ptr7_8544:
	LDY #$00
	LDX $A4
	LDA objFrameCount
	AND #$10
	BEQ bra6_8550
	INY
bra6_8550:
	TYA
	ASL
	TAX
	LDA tbl6_8570,X
	STA $32
	LDA tbl6_8570+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_856A
	LDY #$C0
bra6_856A:
	STY $36
	JSR jmp_54_A118
	RTS ; unlogged code end
