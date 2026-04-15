.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_CommonObjects
sprPtrs_CommonObjects:
	.word sprMap_Mushroom
	.word sprMap_PSwitch
	.word sprMap_KoopaShell1
	.word sprMap_Spring
	.word sprMap_SpringPressed
	.word sprMap_FireFlower
	.word ofs_95FE
	.word sprMap_Star
	.word sprMap_Feather
	.word sprMap_1UP
	.word ofs_961A
	.word ofs_961E
	.word sprMap_KoopaShell2
	.word ofs_9622
	.word ofs_9629
	.word sprMap_Checkpoint ; This is in another file
	.word sprMap_GoalTape ; This is in another file
sprMap_Mushroom:
	.byte $02 ; Tile Width
	.byte $02 ; Tile Height
	.byte $90 ; CHR Bank ID
	.byte $01, $02
	.byte $0B, $0C
sprMap_PSwitch:
	.byte $02
	.byte $02
	.byte $90
	.byte $03, $04
	.byte $0D, $0E
sprMap_KoopaShell1:
	.byte $02
	.byte $02
	.byte $90
	.byte $05, $06
	.byte $0F, $10
sprMap_KoopaShell2:
	.byte $02
	.byte $02
	.byte $90
	.byte $0F, $10
	.byte $05, $06
sprMap_Spring:
	.byte $02
	.byte $02
	.byte $90
	.byte $07, $08
	.byte $11, $12
sprMap_SpringPressed:
	.byte $02
	.byte $02
	.byte $90
	.byte $FF, $FF
	.byte $15, $16
sprMap_FireFlower:
	.byte $02
	.byte $02
	.byte $90
	.byte $17, $18
	.byte $1F, $20
ofs_95FE:
	.byte $02
	.byte $02
	.byte $90
	.byte $59, $5A
	.byte $61, $62
sprMap_Star:
	.byte $02
	.byte $02
	.byte $90
	.byte $1B, $1C
	.byte $23, $24
sprMap_Feather:
	.byte $02
	.byte $02
	.byte $90
	.byte $1D, $1E
	.byte $25, $26
sprMap_1UP:
	.byte $02
	.byte $02
	.byte $90
	.byte $27, $28
	.byte $29, $2A
ofs_961A:
	.byte $01
	.byte $01
	.byte $90
	.byte $FF
ofs_961E:
	.byte $01
	.byte $01
	.byte $84
	.byte $17
ofs_9622:
	.byte $02
	.byte $02
	.byte $90
	.byte $33, $34
	.byte $35, $36
ofs_9629:
	.byte $02
	.byte $02
	.byte $90
	.byte $2F, $30
	.byte $31, $32
