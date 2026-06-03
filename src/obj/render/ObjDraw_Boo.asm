.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_98E1
ptr6_98E1:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDY #$03
	LDA objVar,X
	CMP #$20
	BCC bra4_990A
	LDY #$05
	INC objState,X
	LDA objState,X
	BMI bra4_990A
	CMP #$20
	BCS bra4_990A
	LDY #$00
	AND #$04
	BEQ bra4_990A
	LDY #$01
bra4_990A:
	TYA
	JMP loc4_992B
