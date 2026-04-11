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

sprTblSuperKoopa:
	.word sprSuperKoopaWalk1		; Walking animation (Feather)
	.word sprSuperKoopaWalk2		; 
	.word sprSuperKoopaWalk1		; Walking animation (Normal)
	.word sprSuperKoopaWalk2		; 

	.word sprSuperKoopaTakeoff2		; Takeoff animation (Feather)
	.word sprSuperKoopaRedTakeoff	; 
	.word sprSuperKoopaTakeoff2		; Takeoff animation (Normal)
	.word sprSuperKoopaTakeoff1		; 

	.word sprSuperKoopaFly2			; Fly animation (Feather)
	.word sprSuperKoopaRed_Fly		; 
	.word sprSuperKoopaFly2			; Fly animation (Normal)
	.word sprSuperKoopaFly1			; 

	.word sprSuperKoopaDefeated
sprSuperKoopaWalk1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $1A, $1B
	.byte $21, $22, $23
sprSuperKoopaWalk2:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $1C, $1D, $1E
	.byte $24, $25, $23
sprSuperKoopaTakeoff1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $01, $02
	.byte $06, $07, $08
	.byte $10, $11, $FF
sprSuperKoopaTakeoff2:
	.byte $03
	.byte $03
	.byte $96
	.byte $03, $04, $05
	.byte $09, $0A, $0B
	.byte $12, $13, $FF
sprSuperKoopaFly1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $0C, $0D
	.byte $14, $15, $16
sprSuperKoopaFly2:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $0E, $0F
	.byte $14, $17, $18
sprSuperKoopaRedTakeoff:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $01, $3A
	.byte $06, $38, $39
	.byte $10, $11, $FF
sprSuperKoopaRed_Fly:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $3B, $3C
	.byte $14, $3D, $3E
sprSuperKoopaDefeated:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $19, $FF
	.byte $1F, $20, $1E
	.byte $26, $27, $28
