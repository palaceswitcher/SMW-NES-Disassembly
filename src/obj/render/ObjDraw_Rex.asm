.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; REX & SQUISHED REX GRAPHICAL CODE ($8657, $865B)
; Sprite loading code used by both variants of the Rex
;----------------------------------------
.export ptr6_8657
ptr6_8657:
	LDY #$00
	BEQ bra8_865F ; Start from frame 0 for normal Rex

.export ptr6_865B
ptr6_865B:
	LDX $A4
	LDY #$03 ; Use squished frames for squished Rex

bra8_865F:
	LDA objFrameCount
	AND #$08
	BEQ bra8_8667 ; Alternate between walking sprites every 8 frames
	INY

bra8_8667:
	TYA
	ASL
	TAX ; Get pointer index for current sprite
	LDA sprTblRex,X
	STA $32
	LDA sprTblRex+1,X
	STA $33 ; Load sprite pointer
	LDY #$80 ; Use bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8681
		LDY #$C0 ; Use bank 3 if lower bit of ID is set

bra8_8681:
	STY $36
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118
	RTS
