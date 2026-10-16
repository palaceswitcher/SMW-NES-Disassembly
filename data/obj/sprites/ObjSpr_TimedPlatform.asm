.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl5_96EB
tbl5_96EB:
	.word grassPlatform1
	.word grassPlatform2
	.word grassPlatform3
	.word grassPlatform4
	.word grassPlatform5
grassPlatform1:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $9B
	.byte $9E
	.byte $9F
	.byte $9C
	.byte $9D
	.byte $A0
	.byte $A1
grassPlatform2:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $A2
	.byte $A3
	.byte $9F
	.byte $9C
	.byte $A4
	.byte $A5
	.byte $A1
grassPlatform3:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $AD
	.byte $AE
	.byte $9F
	.byte $9C
	.byte $AF
	.byte $B0
	.byte $A1
grassPlatform4:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $B1
	.byte $B2
	.byte $9F
	.byte $9C
	.byte $B3
	.byte $B4
	.byte $A1
grassPlatform5:
	.byte $04
	.byte $02
	.byte $CE
	.byte $9A
	.byte $B5
	.byte $B6
	.byte $9F
	.byte $9C
	.byte $B7
	.byte $B8
	.byte $A1
