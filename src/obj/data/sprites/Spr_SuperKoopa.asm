.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprTblSuperKoopa
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
