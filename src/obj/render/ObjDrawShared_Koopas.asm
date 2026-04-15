.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; KOOPA GRAPHICAL CODE ($820E)
; Used by every Koopa variant
;----------------------------------------
.export ptr6_820E
ptr6_820E:
	LDX $A4 ; Get current object index
	LDA enemyAnimFrame,X
	ASL
	TAX ; Get index for current frame
	LDA sprTblKoopa,X
	STA $32
	LDA sprTblKoopa+1,X
	STA $33 ; Load mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ @continue
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

@continue:
	STY $36 ; Set bank number
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_52_A118 ; Render mapping data
	RTS
