.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; SUPER KOOPA GRAPHICAL CODE ($8AA0)
; Used by every Super Koopa variant
;----------------------------------------
.export ptr6_8AA0
ptr6_8AA0:
	LDX $A4 ; Get index for current object
	LDA objVar,X
	BPL bra8_8AAB ; Branch if object isn't using it's variable for speed (during defeat)
	LDY #$0C ; Use defeated frame
	BNE bra8_8AC9 ; Render sprite
bra8_8AAB:
	AND #%01111111 ; Ignore high byte of variable
	TAY ; Get index for current animation
	LDA superkoopaAnimStartFrames,Y
	TAY ; Get animation starting frame
	LDA objSlot,X
	CMP #OBJ_SUPERKOOPA_JUMP
	BCC bra8_8AC1 ; Use flashing animation if this is the feather variant
		CMP #OBJ_SUPERKOOPA_ALT
		BCC bra8_8ABF ; Branch if Super Koopa is a non-feather variant
			LDY #$08 ; Set takeoff starting frame for feather variants
	bra8_8ABF:
		INY
		INY ; Use starting frame for non-feather variants

bra8_8AC1:
	LDA objFrameCount
	AND #$04
	BNE bra8_8AC9
		INY ; Alternate between frames every 4 frames

bra8_8AC9:
	TYA
	ASL
	TAX ; Get pointer index for frame
	LDA sprTblSuperKoopa,X
	STA $32
	LDA sprTblSuperKoopa+1,X
	STA $33 ; Load sprite mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8AE3
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

bra8_8AE3:
	STY $36 ; Set bank number
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118 ; Render mapping data
	RTS

; Animation starting frame for each motion vector
superkoopaAnimStartFrames:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
