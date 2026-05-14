.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sprPtrs_Thwomp
sprPtrs_Thwomp:
	.word sprMap_Thwomp_Idle
	.word sprMap_Thwomp_Glance
	.word sprMap_Thwomp_Attack
	.word sprMap_Thwomp_Attack
	.word sprMap_Thwomp_Attack
sprMap_Thwomp_Idle:
	.byte $03 ; Tile Width
	.byte $04 ; Tile Height
	.byte $AB ; 1K CHR Bank
	.byte $21, $22, $23
	.byte $24, $25, $26
	.byte $2C, $2D, $2E
	.byte $35, $36, $37
sprMap_Thwomp_Glance:
	.byte $03
	.byte $04
	.byte $AB
	.byte $21, $22, $23
	.byte $2A, $2B, $26
	.byte $32, $33, $34
	.byte $35, $36, $37
sprMap_Thwomp_Attack:
	.byte $03
	.byte $04
	.byte $AB
	.byte $21, $22, $23
	.byte $27, $28, $29
	.byte $2F, $30, $31
	.byte $35, $36, $37
