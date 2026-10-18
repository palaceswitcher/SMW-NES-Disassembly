.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8517
ptr6_8517:
	LDA objFrameCount
	LSR
	LSR
	LSR
	AND #$06
	TAY
	LDA tbl9_8548+1,Y
	STA $05F0
	LDA tbl9_8548,Y
	ASL
	TAX
	LDA sprPtrs_ParachuteGoomba,X
	STA $32
	LDA sprPtrs_ParachuteGoomba+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra9_8542
	LDY #$C0
bra9_8542:
	STY $36
.export ptr6_8544
ptr6_8544:
	JSR jmp_54_A118
	RTS

; Animation attributes
; =====Format=====
; Frame number, attributes
tbl9_8548:
; Still
	.byte $00
	.byte $00
; Tilted left
	.byte $01
	.byte $00
; Still
	.byte $00
	.byte $00
; Titled right
	.byte $01
	.byte $40
