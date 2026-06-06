.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl4_9122
tbl4_9122:
	.word sprCharginChuckIdle
	.word sprCharginChuckRun1
	.word sprCharginChuckRun2
	.word sprCharginChuckRun
	.word sprCharginChuckStun1
	.word sprCharginChuckStun2
	.word sprCharginChuckStun3
	.word sprCharginChuckStun4
	.word sprBaseballChuckIdle
	.word sprBaseballChuckHold
	.word sprBaseballChuckThrow1
	.word sprBaseballChuckRunHold
	.word sprBaseballChuckThrow2
	.word sprPassinChuckIdle
	.word sprPassinChuckKick
	.word sprDigginChuckIdle
	.word sprDigginChuckDig
	.word sprDigginChuckThrow1
	.word sprDigginChuckThrow2
sprCharginChuckIdle:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $14, $15, $16
	.byte $22, $23, $24
	.byte $2A, $2B, $2C
sprCharginChuckRun1:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1D, $1E, $FF
	.byte $2C, $2D, $2E, $FF
sprCharginChuckRun2:
	.byte $04
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF, $FF
	.byte $0D, $0E, $0F, $10
	.byte $1A, $1B, $1C, $FF
	.byte $28, $29, $2A, $2B
sprCharginChuckRun:
	.byte $04
	.byte $04
	.byte $A8
	.byte $FF, $1F, $20, $FF
	.byte $23, $24, $25, $26
	.byte $2B, $2C, $2D, $2E
	.byte $33, $34, $35, $36
sprCharginChuckStun1:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $09, $0A, $FF
	.byte $1A, $0F, $1B
	.byte $25, $26, $27
sprCharginChuckStun2:
	.byte $03
	.byte $04
	.byte $A9
	.byte $09, $0A, $FF
	.byte $0E, $0F, $10
	.byte $1C, $1D, $1E
	.byte $25, $26, $27
sprCharginChuckStun3:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $0B, $0C, $0D
	.byte $17, $18, $19
	.byte $25, $26, $27
sprCharginChuckStun4:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $11, $12, $13
	.byte $1F, $20, $21
	.byte $28, $29, $27
; Unused Clappin' Chuck Mappings
	.byte $04
	.byte $04
	.byte $A8
	.byte $FF, $1D, $1E, $FF
	.byte $FF, $21, $22, $FF
	.byte $27, $28, $29, $2A
	.byte $2F, $30, $31, $32
sprDigginChuckIdle:
	.byte $04 ; digging chuck (unused) mappings
	.byte $03
	.byte $AF
	.byte $FF, $0B, $0C, $0D
	.byte $FF, $16, $17, $18
	.byte $23, $24, $25, $26
sprDigginChuckDig:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $14
	.byte $FF, $1D, $1E, $1F
	.byte $2A, $2B, $2C, $2D
sprDigginChuckThrow1:
	.byte $04
	.byte $03
	.byte $AF
	.byte $FF, $12, $13, $15
	.byte $FF, $20, $21, $22
	.byte $23, $24, $25, $26
sprDigginChuckThrow2:
	.byte $04
	.byte $03
	.byte $AF
	.byte $0E, $0F, $10, $11
	.byte $19, $1A, $1B, $1C
	.byte $FF, $27, $28, $29
sprPassinChuckIdle:
	.byte $03
	.byte $04
	.byte $A9
	.byte $FF, $FF, $FF
	.byte $30, $31, $32
	.byte $36, $37, $38
	.byte $3C, $3D, $3E
sprPassinChuckKick:
	.byte $03
	.byte $04
	.byte $AF
	.byte $FF, $2E, $FF
	.byte $2F, $30, $31
	.byte $32, $33, $34
	.byte $35, $36, $37
	.byte $37, $38 ; Excess bytes
sprBaseballChuckIdle:
	.byte $03
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $11, $12, $FF
	.byte $1F, $20, $21
	.byte $2F, $30, $31
sprBaseballChuckHold:
	.byte $03
	.byte $04
	.byte $AA
	.byte $09, $0A, $FF
	.byte $38, $39, $FF
	.byte $3A, $3B, $3C
	.byte $3D, $3E, $3F
sprBaseballChuckThrow1:
	.byte $03
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $18, $19
	.byte $25, $26, $27
	.byte $35, $36, $37
sprBaseballChuckRunHold:
	.byte $03
	.byte $04
	.byte $AA
	.byte $0B, $0C, $FF
	.byte $16, $17, $FF
	.byte $25, $26, $27
	.byte $35, $36, $37
sprBaseballChuckThrow2:
	.byte $03
	.byte $04
	.byte $AA
	.byte $FF, $FF, $FF
	.byte $13, $14, $15
	.byte $22, $23, $24
	.byte $32, $33, $34
