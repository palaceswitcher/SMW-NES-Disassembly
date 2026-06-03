.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; Patrolling (flickers)
.export ptr6_98B7
ptr6_98B7:
	LDA frameCount
	AND #$01
	BEQ bra4_98BE
	RTS

; Attacking
.export bra4_98BE
bra4_98BE:
	LDX $A4
	LDA objFlags,X
	AND #$40
	STA $05F0
	LDA objFlags,X
	AND #$03
	TAY
	LDA tbl4_98DD,Y
	TAY
	LDA frameCount
	AND #$10
	BEQ bra4_98D9
	INY
bra4_98D9:
	TYA
	JMP loc4_992B
tbl4_98DD:
	.byte $00
	.byte $02
	.byte $04
	.byte $02
