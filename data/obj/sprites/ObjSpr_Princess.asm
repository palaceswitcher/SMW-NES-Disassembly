.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl_8EFC
tbl_8EFC:
	.word ofs_8F00
	.word ofs_8F17
ofs_8F00:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
ofs_8F17:
	.byte $04
	.byte $05
	.byte $E3
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $CE
	.byte $CF
	.byte $CD
	.byte $FF
	.byte $DA
	.byte $DB
	.byte $DC
	.byte $E3
	.byte $E4
	.byte $E5
	.byte $E6
	.byte $FF
	.byte $E9
	.byte $EA
	.byte $FF
