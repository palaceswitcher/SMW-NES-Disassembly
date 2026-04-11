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

sprTblRex:
	.word sprRexWalk1
	.word sprRexWalk2
	.word sprRexFlattened ; Unused
	.word sprRexSquishedWalk1
	.word sprRexSquishedWalk2
sprRexWalk1:
	.byte $03
	.byte $04
	.byte $95
	.byte $21, $22, $FF
	.byte $25, $26, $FF
	.byte $29, $2A, $2B
	.byte $33, $34, $35
sprRexWalk2:
	.byte $03
	.byte $04
	.byte $95
	.byte $23, $24, $FF
	.byte $27, $28, $FF
	.byte $2C, $2D, $2E
	.byte $36, $37, $38
sprRexFlattened:
	.byte $02
	.byte $01
	.byte $95
	.byte $39, $3A
sprRexSquishedWalk1:
	.byte $02
	.byte $02
	.byte $95
	.byte $2F, $30
	.byte $3B, $3C
sprRexSquishedWalk2:
	.byte $02
	.byte $02
	.byte $95
	.byte $31, $32
	.byte $3D, $3E