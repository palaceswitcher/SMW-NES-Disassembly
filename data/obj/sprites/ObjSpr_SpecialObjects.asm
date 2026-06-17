.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl5_805E
tbl5_805E:
	.word ofs2_80CE
	.word ofs2_8278
	.word ofs2_828F
	.word ofs2_82A6
	.word ofs2_82AD
	.word ofs2_82B4
	.word ofs2_82BB
	.word spikeTop_Walk1
	.word spikeTop_Walk2
	.word spikeTop_SideWalk1
	.word spikeTop_SideWalk2
	.word spikeTop_Diag
	.word spikeTop_Walk1_VMir
	.word spikeTop_Walk2_VMir
	.word spikeTop_SideWalk1_VMir
	.word spikeTop_SideWalk2_VMir
	.word spikeTop_Diag_VMir
	.word fenceKoopa
	.word redPlatform
	.word redPlatform
	.word greenPlatform
	.word fuzzySpr
	.word fuzzySpr2
	.word onOffSwitch_Off
	.word onOffSwitch_On
	.word chainsaw1
	.word chainsaw2
	.word chainsaw3
	.word rope1
	.word rope2
	.word rope3
	.word Longrope1
	.word Longrope2
	.word Longrope3
; Unused upside-down sprites--->
	.word chainsaw_VMir1
	.word chainsaw_VMir2
	.word chainsaw_VMir3
; <---
	.word chainsaw1
	.word chainsaw2
	.word chainsaw3
	.word ofs2_8261
	.word pSwitchPlatform
	.word pSwitchDoor
pSwitchPlatform:
	.byte $06
	.byte $02
	.byte $A4
	.byte $32, $33, $32, $33, $32, $33
	.byte $34, $35, $34, $35, $34, $35
pSwitchDoor:
	.byte $02
	.byte $04
	.byte $AB
	.byte $38, $39
	.byte $3A, $3B
	.byte $3C, $3D
	.byte $3E, $3F
ofs2_80CE:
	.byte $01
	.byte $01
	.byte $95
	.byte $FF
chainsaw1:
	.byte $02
	.byte $05
	.byte $95
	.byte $01, $02
	.byte $05, $06
	.byte $09, $0A
	.byte $0D, $0E
	.byte $13, $14
chainsaw2:
	.byte $02
	.byte $05
	.byte $95
	.byte $03, $04
	.byte $07, $08
	.byte $0B, $0C
	.byte $0F, $10
	.byte $15, $16
chainsaw3:
	.byte $02
	.byte $05
	.byte $95
	.byte $03, $04
	.byte $07, $08
	.byte $0B, $0C
	.byte $11, $12
	.byte $15, $16

; These 3 go unused
chainsaw_VMir1:
	.byte $02
	.byte $05
	.byte $95
	.byte $13, $14
	.byte $0D, $0E
	.byte $09, $0A
	.byte $05, $06
	.byte $01, $02
chainsaw_VMir2:
	.byte $02
	.byte $05
	.byte $95
	.byte $15, $16
	.byte $0F, $10
	.byte $0B, $0C
	.byte $07, $08
	.byte $03, $04
chainsaw_VMir3:
	.byte $02
	.byte $05
	.byte $95
	.byte $15, $16
	.byte $11, $12
	.byte $0B, $0C
	.byte $07, $08
	.byte $03, $04

rope1:
	.byte $02
	.byte $0A
	.byte $95
	.byte $1B, $1C
	.byte $13, $14
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
rope2:
	.byte $02
	.byte $0A
	.byte $95
	.byte $17, $18
	.byte $15, $16
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
rope3:
	.byte $02
	.byte $0A
	.byte $95
	.byte $19, $1A
	.byte $15, $16
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
Longrope1:
	.byte $02
	.byte $11
	.byte $95
	.byte $1B, $1C
	.byte $13, $14
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
Longrope2:
	.byte $02
	.byte $11
	.byte $95
	.byte $17, $18
	.byte $15, $16
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
Longrope3:
	.byte $02
	.byte $11
	.byte $95
	.byte $19, $1A
	.byte $15, $16
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1E, $FF
	.byte $1F, $FF
onOffSwitch_Off:
	.byte $02
	.byte $02
	.byte $A4
	.byte $2E, $2F
	.byte $30, $31
onOffSwitch_On:
	.byte $02
	.byte $02
	.byte $A4
	.byte $2A, $2B
	.byte $2C, $2D
redPlatform:
	.byte $06
	.byte $02
	.byte $A4
	.byte $39, $3A, $3A, $3A, $3A, $3B
	.byte $3C, $3D, $3D, $3D, $3D, $3E
greenPlatform:
	.byte $05
	.byte $02
	.byte $A4
	.byte $24, $25, $25, $25, $26
	.byte $27, $28, $28, $28, $29
fuzzySpr:
	.byte $03
	.byte $02
	.byte $A4
	.byte $01, $02, $FF
	.byte $0B, $0C, $0D
fuzzySpr2:
	.byte $03
	.byte $02
	.byte $A4
	.byte $03, $04, $FF
	.byte $0E, $0C, $0F
fenceKoopa:
	.byte $02
	.byte $04
	.byte $94
	.byte $14, $15
	.byte $20, $21
	.byte $2F, $30
	.byte $3B, $3C
spikeTop_Walk1:
	.byte $02
	.byte $02
	.byte $97
	.byte $2C, $2D
	.byte $32, $33
spikeTop_Walk2:
	.byte $02
	.byte $02
	.byte $97
	.byte $2E, $2F
	.byte $34, $35
spikeTop_SideWalk1:
	.byte $02
	.byte $02
	.byte $97
	.byte $38, $39
	.byte $3C, $3D
spikeTop_SideWalk2:
	.byte $02
	.byte $02
	.byte $97
	.byte $3A, $3B
	.byte $3E, $3F
; Unused--->
spikeTop_Diag:
	.byte $02
	.byte $02
	.byte $97
	.byte $30, $31
	.byte $36, $37
; <---
spikeTop_Walk1_VMir:
	.byte $02
	.byte $02
	.byte $97
	.byte $32, $33
	.byte $2C, $2D
spikeTop_Walk2_VMir:
	.byte $02
	.byte $02
	.byte $97
	.byte $34, $35
	.byte $2E, $2F
spikeTop_SideWalk1_VMir:
	.byte $02
	.byte $02
	.byte $97
	.byte $3C, $3D
	.byte $38, $39
spikeTop_SideWalk2_VMir:
	.byte $02
	.byte $02
	.byte $97
	.byte $3E, $3F
	.byte $3A, $3B
; Unused--->
spikeTop_Diag_VMir:
	.byte $02
	.byte $02
	.byte $97
	.byte $36, $37
	.byte $30, $31
; <---
ofs2_8261:
	.byte $04
	.byte $05
	.byte $B6
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $8E
	.byte $99
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $A7
	.byte $A8
	.byte $A9
	.byte $AA
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_8278:
	.byte $04
	.byte $05
	.byte $B6
	.byte $84
	.byte $85
	.byte $86
	.byte $FF
	.byte $8F
	.byte $90
	.byte $91
	.byte $92
	.byte $9D
	.byte $9E
	.byte $9F
	.byte $A0
	.byte $AB
	.byte $AC
	.byte $AD
	.byte $AA
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_828F:
	.byte $04
	.byte $05
	.byte $B6
	.byte $87
	.byte $88
	.byte $89
	.byte $8A
	.byte $93
	.byte $94
	.byte $95
	.byte $96
	.byte $A1
	.byte $A2
	.byte $A3
	.byte $A4
	.byte $AE
	.byte $AF
	.byte $B0
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_82A6:
	.byte $02
	.byte $02
	.byte $B6
	.byte $97
	.byte $98
	.byte $A5
	.byte $A6
ofs2_82AD:
	.byte $02
	.byte $02
	.byte $B6
	.byte $A5
	.byte $A6
	.byte $97
	.byte $98
ofs2_82B4:
	.byte $04
	.byte $01
	.byte $B6
	.byte $B2
	.byte $B3
	.byte $B3
	.byte $B4
ofs2_82BB:
	.byte $04
	.byte $04
	.byte $B6
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $8E
	.byte $99
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $A7
	.byte $A8
	.byte $A9
	.byte $AA
