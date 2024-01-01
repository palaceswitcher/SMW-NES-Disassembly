; 0x048010-0x04A00F
lda_36_C000:
	.word pnt3_C014
	.word pnt3_CAF2
	.word pnt3_CD2C
	.word pnt3_CD2C
	.word pnt3_CD2C
	.word pnt3_CD2C
	.word pnt3_CE54
	.word pnt3_CE54
	.word pnt3_CE54
	.word pnt3_CE54
pnt3_C014:
	.word PlayerSmall_AnimTbl
	.word PlayerBig_AnimTbl
	.word PlayerFire_AnimTbl
	.word PlayerCape_AnimTbl
	.word pnt3_CAAE
	.word PlayerSmall_AnimTbl2
	.word PlayerBig_AnimTbl2
	.word PlayerFire_AnimTbl2
	.word PlayerCape_AnimTbl2
	.word pnt3_CAD0
PlayerSmall_AnimTbl:
	.word pnt3_C070
	.word pnt3_C078
	.word pnt3_C084
	.word pnt3_C078
	.word pnt3_C0D8
	.word pnt3_C0EC
	.word pnt3_C100
	.word pnt3_C108
	.word pnt3_C110
	.word pnt3_C0E4
	.word pnt3_C118
	.word pnt3_C120
	.word pnt3_C128
	.word pnt3_C134
	.word pnt3_C13C
	.word pnt3_C0E4
	.word pnt3_C148
	.word pnt3_C150
PlayerSmall_AnimTbl2:
	.word pnt3_C160
	.word pnt3_C168
	.word pnt3_C174
	.word pnt3_C168
	.word pnt3_C1C8
	.word pnt3_C0EC
	.word pnt3_C100
	.word pnt3_C1D4
	.word pnt3_C110
	.word pnt3_C1C8
	.word pnt3_C1E4
	.word pnt3_C1EC
	.word pnt3_C1F4
	.word pnt3_C134
	.word pnt3_C13C
	.word pnt3_C1C8
	.word pnt3_C148
	.word pnt3_C150
pnt3_C070:
	.word PlayerSmall_Stand
	.byte $0A
	.byte $00
	.word PlayerSmall_Stand
	.byte $80
	.byte $00
pnt3_C078:
	.word PlayerSmall_Stand
	.byte $04
	.byte $00
	.word PlayerSmall_Walk1
	.byte $04
	.byte $00
	.word PlayerSmall_Stand
	.byte $80
	.byte $00
pnt3_C084:
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Stand
	.byte $02
	.byte $00
	.word PlayerSmall_Walk1
	.byte $02
	.byte $00
	.word PlayerSmall_Run1
	.byte $02
	.byte $00
	.word PlayerSmall_Run2
	.byte $02
	.byte $00
	.word PlayerSmall_Run1
	.byte $02
	.byte $00
	.word PlayerSmall_Run2
	.byte $02
	.byte $00
	.word PlayerSmall_Run1
	.byte $90
	.byte $00
pnt3_C0D8:
	.word PlayerSmall_Jump
	.byte $23
	.byte $00
	.word PlayerSmall_Fall
	.byte $02
	.byte $00
	.word PlayerSmall_Fall
	.byte $81
	.byte $00
pnt3_C0E4:
	.word PlayerSmall_RunJump
	.byte $0A
	.byte $00
	.word PlayerSmall_RunJump
	.byte $80
	.byte $00
pnt3_C0EC:
	.word PlayerSmall_Stand
	.byte $01
	.byte $00
	.word PlayerSmall_Back
	.byte $01
	.byte $00
	.word PlayerSmall_Flipped
	.byte $01
	.byte $00
	.word PlayerSmall_Front
	.byte $01
	.byte $00
	.word PlayerSmall_Stand
	.byte $80
	.byte $00
pnt3_C100:
	.word PlayerSmall_Turn
	.byte $0A
	.byte $00
	.word PlayerSmall_Turn
	.byte $80
	.byte $00
pnt3_C108:
	.word PlayerSmall_Duck
	.byte $08
	.byte $00
	.word PlayerSmall_Duck
	.byte $80
	.byte $00
pnt3_C110:
	.word PlayerSmall_LookUp
	.byte $02
	.byte $00
	.word PlayerSmall_LookUp
	.byte $80
	.byte $00
pnt3_C118:
	.word PlayerSmall_Fall
	.byte $02
	.byte $00
	.word PlayerSmall_Fall
	.byte $80
	.byte $00
pnt3_C120:
	.word PlayerSmall_Swim1
	.byte $01
	.byte $00
	.word PlayerSmall_Swim1
	.byte $80
	.byte $00
pnt3_C128:
	.word PlayerSmall_RunJump
	.byte $03
	.byte $00
	.word PlayerSmall_Swim1
	.byte $03
	.byte $00
	.word PlayerSmall_RunJump
	.byte $80
	.byte $00
pnt3_C134:
	.word PlayerSmall_Climb1
	.byte $08
	.byte $00
	.word PlayerSmall_Climb1
	.byte $80
	.byte $00
pnt3_C13C:
	.word PlayerSmall_Climb1
	.byte $08
	.byte $00
	.word PlayerSmall_Climb2
	.byte $08
	.byte $00
	.word PlayerSmall_Climb1
	.byte $80
	.byte $00
pnt3_C148:
	.word PlayerSmall_Victory
	.byte $0A
	.byte $00
	.word PlayerSmall_Victory
	.byte $80
	.byte $00
pnt3_C150:
	.word PlayerSmall_Death1
	.byte $28
	.byte $00
	.word PlayerSmall_Death1
	.byte $08
	.byte $00
	.word PlayerSmall_Death2
	.byte $08
	.byte $00
	.word PlayerSmall_Death1
	.byte $81
	.byte $00
pnt3_C160:
	.word PlayerSmall_Hold
	.byte $0A
	.byte $00
	.word PlayerSmall_Hold
	.byte $80
	.byte $00
pnt3_C168:
	.word PlayerSmall_Hold
	.byte $04
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $04
	.byte $00
	.word PlayerSmall_Hold
	.byte $80
	.byte $00
pnt3_C174:
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $90
	.byte $00
pnt3_C1C8:
	.word PlayerSmall_HoldWalk
	.byte $23
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $81
	.byte $00
pnt3_C1D4:
	.word PlayerSmall_DuckHold
	.byte $08
	.byte $00
	.word PlayerSmall_DuckHold
	.byte $80
	.byte $00
	.word PlayerSmall_Hold
	.byte $02
	.byte $00
	.word PlayerSmall_Hold
	.byte $80
	.byte $00
pnt3_C1E4:
	.word PlayerSmall_HoldWalk
	.byte $02
	.byte $00
	.word PlayerSmall_HoldWalk
	.byte $80
	.byte $00
pnt3_C1EC:
	.word pnt3_C2D8
	.byte $01
	.byte $00
	.word pnt3_C2D8
	.byte $80
	.byte $00
pnt3_C1F4:
	.word pnt3_C2D8
	.byte $03
	.byte $00
	.word pnt3_C2D8
	.byte $03
	.byte $00
	.word pnt3_C2D8
	.byte $80
	.byte $00
PlayerSmall_Stand:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $60, $61
PlayerSmall_Walk1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $6A, $6B
PlayerSmall_Run1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $60, $6C
PlayerSmall_Run2:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $6A, $6D
PlayerSmall_RunJump:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $68, $69
PlayerSmall_Jump:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $74, $75
	.byte $76, $77
	.byte $78, $79
PlayerSmall_Fall:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $7A, $7B
	.byte $7C, $7D
	.byte $57, $5C
PlayerSmall_Back:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $48, $49
	.byte $4A, $4B
	.byte $4C, $4D
PlayerSmall_Flipped:
	.byte $42
	.byte $03
	.byte $99
	.byte $08
	.byte $65, $64
	.byte $7F, $66
	.byte $61, $60
PlayerSmall_Front:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $4E, $4F
	.byte $56, $58
	.byte $59, $5A
PlayerSmall_Turn:
	.byte $02
	.byte $03
	.byte $9A
	.byte $08
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
PlayerSmall_Duck:
	.byte $02
	.byte $02
	.byte $99
	.byte $08
	.byte $50, $51
	.byte $52, $53
PlayerSmall_LookUp:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $5B, $5D
	.byte $5E, $5F
	.byte $60, $61
PlayerSmall_Swim1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $62, $63
PlayerSmall_Climb1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $48, $49
	.byte $4A, $4B
	.byte $72, $73
PlayerSmall_Climb2:
	.byte $42
	.byte $03
	.byte $99
	.byte $08
	.byte $49, $48
	.byte $4B, $4A
	.byte $73, $72
PlayerSmall_Victory:
	.byte $02
	.byte $03
	.byte $98
	.byte $08
	.byte $0E, $0D
	.byte $10, $0F
	.byte $12, $11
PlayerSmall_Death1:
	.byte $02
	.byte $03
	.byte $98
	.byte $08
	.byte $18, $19
	.byte $1A, $1B
	.byte $1C, $1D
PlayerSmall_Death2:
	.byte $42
	.byte $03
	.byte $98
	.byte $08
	.byte $19, $18
	.byte $1B, $1A
	.byte $1D, $1C
PlayerSmall_Hold:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $40, $41
PlayerSmall_HoldWalk:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $42, $43
PlayerSmall_DuckHold:
	.byte $02
	.byte $02
	.byte $99
	.byte $08
	.byte $44, $45
	.byte $46, $47
pnt3_C2D8:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $62, $63
PlayerBig_AnimTbl:
	.word pnt3_C326
	.word pnt3_C32E
	.word pnt3_C352
	.word pnt3_C32E
	.word pnt3_C3A6
	.word pnt3_C3BA
	.word pnt3_C3CE
	.word pnt3_C3D6
	.word pnt3_C3DE
	.word pnt3_C3B2
	.word pnt3_C3E6
	.word pnt3_C3EE
	.word pnt3_C3F6
	.word pnt3_C40A
	.word pnt3_C412
	.word pnt3_C3B2
	.word pnt3_C41E
PlayerBig_AnimTbl2:
	.word pnt3_C426
	.word pnt3_C42E
	.word pnt3_C452
	.word pnt3_C42E
	.word pnt3_C4A6
	.word pnt3_C3BA
	.word pnt3_C3CE
	.word pnt3_C4B2
	.word pnt3_C3DE
	.word pnt3_C3EE
	.word pnt3_C4C2
	.word pnt3_C3EE
	.word pnt3_C4CA
	.word pnt3_C40A
	.word pnt3_C412
	.word pnt3_C3EE
	.word pnt3_C41E
pnt3_C326:
	.word PlayerBig_Stand
	.byte $0A
	.byte $00
	.word PlayerBig_Stand
	.byte $80
	.byte $00
pnt3_C32E:
	.word PlayerBig_Walk1
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Stand
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Walk1
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Stand
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Walk1
	.byte $80
	.byte $00
pnt3_C352:
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Run1
	.byte $02
	.byte $00
	.word PlayerBig_Run2
	.byte $02
	.byte $00
	.word PlayerBig_Run3
	.byte $02
	.byte $00
	.word PlayerBig_Run2
	.byte $02
	.byte $00
	.word PlayerBig_Run1
	.byte $90
	.byte $00
pnt3_C3A6:
	.word PlayerBig_Jump
	.byte $23
	.byte $00
	.word PlayerBig_Fall
	.byte $02
	.byte $00
	.word PlayerBig_Fall
	.byte $81
	.byte $00
pnt3_C3B2:
	.word PlayerBig_RunJump
	.byte $0A
	.byte $00
	.word PlayerBig_RunJump
	.byte $80
	.byte $00
pnt3_C3BA:
	.word PlayerBig_Front
	.byte $01
	.byte $00
	.word PlayerBig_Back
	.byte $01
	.byte $00
	.word PlayerBig_Side1
	.byte $01
	.byte $00
	.word PlayerBig_Side2
	.byte $01
	.byte $00
	.word PlayerBig_Front
	.byte $80
	.byte $00
pnt3_C3CE:
	.word PlayerBig_Turn
	.byte $0A
	.byte $00
	.word PlayerBig_Turn
	.byte $80
	.byte $00
pnt3_C3D6:
	.word PlayerBig_Duck
	.byte $08
	.byte $00
	.word PlayerBig_Duck
	.byte $80
	.byte $00
pnt3_C3DE:
	.word PlayerBig_LookUp
	.byte $02
	.byte $00
	.word PlayerBig_LookUp
	.byte $80
	.byte $00
pnt3_C3E6:
	.word PlayerBig_Fall
	.byte $02
	.byte $00
	.word PlayerBig_Fall
	.byte $80
	.byte $00
pnt3_C3EE:
	.word PlayerBig_Swim1
	.byte $01
	.byte $00
	.word PlayerBig_Swim1
	.byte $80
	.byte $00
pnt3_C3F6:
	.word PlayerBig_RunJump
	.byte $03
	.byte $00
	.word PlayerBig_Swim2
	.byte $03
	.byte $00
	.word PlayerBig_Swim1
	.byte $03
	.byte $00
	.word PlayerBig_Swim2
	.byte $03
	.byte $00
	.word PlayerBig_Fall
	.byte $80
	.byte $00
pnt3_C40A:
	.word PlayerBig_Climb1
	.byte $08
	.byte $00
	.word PlayerBig_Climb1
	.byte $80
	.byte $00
pnt3_C412:
	.word PlayerBig_Climb1
	.byte $08
	.byte $00
	.word PlayerBig_Climb2
	.byte $08
	.byte $00
	.word PlayerBig_Climb1
	.byte $80
	.byte $00
pnt3_C41E:
	.word PlayerBig_Victory
	.byte $0A
	.byte $00
	.word PlayerBig_Victory
	.byte $80
	.byte $00
pnt3_C426:
	.word PlayerBig_Hold
	.byte $0A
	.byte $00
	.word PlayerBig_Hold
	.byte $80
	.byte $00
pnt3_C42E:
	.word PlayerBig_HoldWalk1
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerBig_Hold
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerBig_Hold
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $80
	.byte $00
pnt3_C452:
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_Hold
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_Hold
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_Hold
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_Hold
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_Hold
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $90
	.byte $00
pnt3_C4A6:
	.word PlayerBig_HoldWalk1
	.byte $23
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk1
	.byte $81
	.byte $00
pnt3_C4B2:
	.word PlayerBig_DuckHold
	.byte $08
	.byte $00
	.word PlayerBig_DuckHold
	.byte $80
	.byte $00
	.word PlayerBig_LookUp
	.byte $02
	.byte $00
	.word PlayerBig_LookUp
	.byte $80
	.byte $00
pnt3_C4C2:
	.word PlayerBig_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerBig_HoldWalk2
	.byte $80
	.byte $00
pnt3_C4CA:
	.word PlayerBig_Swim1
	.byte $03
	.byte $00
	.word PlayerBig_Swim1
	.byte $03
	.byte $00
	.word PlayerBig_Swim1
	.byte $03
	.byte $00
	.word PlayerBig_Swim1
	.byte $03
	.byte $00
	.word PlayerBig_Swim1
	.byte $80
	.byte $00
PlayerBig_Stand:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $38
PlayerBig_Walk1:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $31, $23
	.byte $2A, $2C
	.byte $2D, $2F
	.byte $2E, $30
PlayerBig_Walk2:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $21, $23
	.byte $22, $24
	.byte $25, $27
	.byte $26, $28
PlayerBig_Run1:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $64, $65, $68
	.byte $66, $67, $FF
PlayerBig_Run3:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $6D, $6E, $68
	.byte $6F, $70, $FF
PlayerBig_Run2:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $69, $6A, $68
	.byte $6B, $6C, $FF
PlayerBig_RunJump:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $71, $72, $68
	.byte $73, $74, $76
PlayerBig_Jump:
	.byte $02
	.byte $04
	.byte $89
	.byte $08
	.byte $61, $62
	.byte $63, $64
	.byte $65, $6E
	.byte $67, $70
PlayerBig_Fall:
	.byte $02
	.byte $04
	.byte $89
	.byte $08
	.byte $69, $6A
	.byte $6B, $6C
	.byte $6D, $6E
	.byte $6F, $70
PlayerBig_Front:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $21, $22
	.byte $23, $24
	.byte $25, $26
	.byte $27, $28
PlayerBig_Back:
	.byte $42
	.byte $04
	.byte $89
	.byte $08
	.byte $74, $7B
	.byte $76, $7C
	.byte $78, $77
	.byte $7A, $79
PlayerBig_Side1:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $38
PlayerBig_Side2:
	.byte $42
	.byte $04
	.byte $84
	.byte $08
	.byte $33, $29
	.byte $34, $32
	.byte $37, $35
	.byte $38, $36
PlayerBig_Turn:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $A8, $AA
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
PlayerBig_Duck:
	.byte $02
	.byte $03
	.byte $84
	.byte $08
	.byte $39, $3A
	.byte $3B, $3D
	.byte $3C, $2B
PlayerBig_LookUp:
	.byte $02
	.byte $04
	.byte $87
	.byte $08
	.byte $F3, $F4
	.byte $F5, $F6
	.byte $F7, $F8
	.byte $F9, $FA
PlayerBig_Swim1:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $7C, $7D, $FF
	.byte $73, $7B, $75
PlayerBig_Swim2:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $77, $78, $FF
	.byte $73, $7A, $76
PlayerBig_Climb1:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $29, $2A
	.byte $2B, $2C
	.byte $2D, $2E
	.byte $2F, $30
PlayerBig_Climb2:
	.byte $42
	.byte $04
	.byte $88
	.byte $08
	.byte $2A, $29
	.byte $2C, $2B
	.byte $2E, $2D
	.byte $30, $2F
PlayerBig_Victory:
	.byte $02
	.byte $04
	.byte $8B
	.byte $08
	.byte $E9, $EA
	.byte $EB, $EC
	.byte $ED, $EE
	.byte $EF, $F0
PlayerBig_Hold:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $B0, $B2
	.byte $B1, $B3
PlayerBig_HoldWalk1:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $A4, $A6
	.byte $A5, $A7
PlayerBig_HoldWalk2:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $AA, $AC
	.byte $AB, $AD
PlayerBig_DuckHold:
	.byte $02
	.byte $03
	.byte $86
	.byte $08
	.byte $B4, $B5
	.byte $B6, $B7
	.byte $B8, $B9
PlayerFire_AnimTbl:
	.word pnt3_C66E
	.word pnt3_C676
	.word pnt3_C69A
	.word pnt3_C676
	.word pnt3_C6EE
	.word pnt3_C702
	.word pnt3_C716
	.word pnt3_C71E
	.word pnt3_C726
	.word pnt3_C6FA
	.word pnt3_C72E
	.word pnt3_C736
	.word pnt3_C73E
	.word pnt3_C752
	.word pnt3_C75A
	.word pnt3_C6FA
	.word pnt3_C766
	.word pnt3_C76E
	.word pnt3_C776
	.word pnt3_C782
PlayerFire_AnimTbl2:
	.word pnt3_C78A
	.word pnt3_C792
	.word pnt3_C7B6
	.word pnt3_C792
	.word pnt3_C80A
	.word pnt3_C702
	.word pnt3_C716
	.word pnt3_C816
	.word pnt3_C726
	.word pnt3_C736
	.word pnt3_C81E
	.word pnt3_C736
	.word pnt3_C73E
	.word pnt3_C752
	.word pnt3_C75A
	.word pnt3_C736
	.word pnt3_C766
	.word pnt3_C76E
	.word pnt3_C776
	.word pnt3_C782
pnt3_C66E:
	.word PlayerFire_Stand
	.byte $0A
	.byte $00
	.word PlayerFire_Stand
	.byte $80
	.byte $00
pnt3_C676:
	.word PlayerFire_Walk1
	.byte $04
	.byte $00
	.word PlayerFire_Walk2
	.byte $04
	.byte $00
	.word PlayerFire_Stand
	.byte $04
	.byte $00
	.word PlayerFire_Walk2
	.byte $04
	.byte $00
	.word PlayerFire_Walk1
	.byte $04
	.byte $00
	.word PlayerFire_Walk2
	.byte $04
	.byte $00
	.word PlayerFire_Stand
	.byte $04
	.byte $00
	.word PlayerFire_Walk2
	.byte $04
	.byte $00
	.word PlayerFire_Walk1
	.byte $80
	.byte $00
pnt3_C69A:
	.word PlayerFire_Walk1
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Stand
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Walk1
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Stand
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Walk1
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Stand
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Walk1
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Stand
	.byte $02
	.byte $00
	.word PlayerFire_Walk2
	.byte $02
	.byte $00
	.word PlayerFire_Run1
	.byte $02
	.byte $00
	.word PlayerFire_Run2
	.byte $02
	.byte $00
	.word PlayerFire_Run3
	.byte $02
	.byte $00
	.word PlayerFire_Run2
	.byte $02
	.byte $00
	.word PlayerFire_Run1
	.byte $90
	.byte $00
pnt3_C6EE:
	.word PlayerFire_Jump
	.byte $23
	.byte $00
	.word PlayerFire_Fall
	.byte $02
	.byte $00
	.word PlayerFire_Fall
	.byte $81
	.byte $00
pnt3_C6FA:
	.word PlayerFire_RunJump
	.byte $0A
	.byte $00
	.word PlayerFire_RunJump
	.byte $80
	.byte $00
pnt3_C702:
	.word PlayerFire_Front
	.byte $01
	.byte $00
	.word PlayerFire_Back
	.byte $01
	.byte $00
	.word PlayerFire_Stand
	.byte $01
	.byte $00
	.word PlayerFire_Flipped
	.byte $01
	.byte $00
	.word PlayerFire_Front
	.byte $80
	.byte $00
pnt3_C716:
	.word PlayerFire_Turn
	.byte $0A
	.byte $00
	.word PlayerFire_Turn
	.byte $80
	.byte $00
pnt3_C71E:
	.word PlayerFire_Duck
	.byte $08
	.byte $00
	.word PlayerFire_Duck
	.byte $80
	.byte $00
pnt3_C726:
	.word PlayerFire_LookUp
	.byte $02
	.byte $00
	.word PlayerFire_LookUp
	.byte $80
	.byte $00
pnt3_C72E:
	.word PlayerFire_Fall
	.byte $02
	.byte $00
	.word PlayerFire_Fall
	.byte $80
	.byte $00
pnt3_C736:
	.word PlayerFire_Swim1
	.byte $01
	.byte $00
	.word PlayerFire_Swim1
	.byte $80
	.byte $00
pnt3_C73E:
	.word PlayerFire_RunJump
	.byte $03
	.byte $00
	.word PlayerFire_Swim2
	.byte $03
	.byte $00
	.word PlayerFire_Swim1
	.byte $03
	.byte $00
	.word PlayerFire_Swim2
	.byte $03
	.byte $00
	.word PlayerFire_Fall
	.byte $80
	.byte $00
pnt3_C752:
	.word PlayerFire_Climb1
	.byte $08
	.byte $00
	.word PlayerFire_Climb1
	.byte $80
	.byte $00
pnt3_C75A:
	.word PlayerFire_Climb1
	.byte $08
	.byte $00
	.word PlayerFire_Climb2
	.byte $08
	.byte $00
	.word PlayerFire_Climb1
	.byte $80
	.byte $00
pnt3_C766:
	.word PlayerFire_Victory
	.byte $0A
	.byte $00
	.word PlayerFire_Victory
	.byte $80
	.byte $00
pnt3_C76E:
	.word PlayerFire_Swim1
	.byte $03
	.byte $00
	.word PlayerFire_Swim1
	.byte $80
	.byte $00
pnt3_C776:
	.word PlayerFire_Swim2
	.byte $03
	.byte $00
	.word PlayerFire_Swim1
	.byte $03
	.byte $00
	.word PlayerFire_Swim1
	.byte $80
	.byte $00
pnt3_C782:
	.word PlayerFire_Shoot
	.byte $03
	.byte $00
	.word PlayerFire_Shoot
	.byte $80
	.byte $00
pnt3_C78A:
	.word PlayerFire_Hold
	.byte $0A
	.byte $00
	.word PlayerFire_Hold
	.byte $80
	.byte $00
pnt3_C792:
	.word PlayerFire_HoldWalk1
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerFire_Hold
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerFire_Hold
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $04
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $80
	.byte $00
pnt3_C7B6:
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_Hold
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_Hold
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_Hold
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_Hold
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_Hold
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $90
	.byte $00
pnt3_C80A:
	.word PlayerFire_HoldWalk1
	.byte $23
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk1
	.byte $81
	.byte $00
pnt3_C816:
	.word PlayerFire_DuckHold
	.byte $08
	.byte $00
	.word PlayerFire_DuckHold
	.byte $80
	.byte $00
pnt3_C81E:
	.word PlayerFire_HoldWalk2
	.byte $02
	.byte $00
	.word PlayerFire_HoldWalk2
	.byte $80
	.byte $00
PlayerFire_Stand:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $2C, $2E
	.byte $2D, $2F
	.byte $18, $1A
	.byte $19, $1B
PlayerFire_Walk1:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $00, $02
	.byte $01, $03
	.byte $04, $06
	.byte $05, $07
PlayerFire_Walk2:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $0A, $0C
	.byte $0B, $0D
	.byte $0E, $28
	.byte $0F, $29
PlayerFire_Run1:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F0, $F2, $FC
	.byte $F1, $F3, $FF
PlayerFire_Run3:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F8, $FA, $FC
	.byte $F9, $FB, $FF
PlayerFire_Run2:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F4, $F6, $FC
	.byte $F5, $F7, $FF
PlayerFire_RunJump:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $C0, $C2, $C6
	.byte $C1, $C3, $C7
PlayerFire_Jump:
	.byte $02
	.byte $04
	.byte $83
	.byte $08
	.byte $D8, $DA
	.byte $D9, $DB
	.byte $DC, $E0
	.byte $DD, $E1
PlayerFire_Fall:
	.byte $02
	.byte $04
	.byte $83
	.byte $08
	.byte $E9, $EA
	.byte $EB, $EC
	.byte $E6, $E0
	.byte $E8, $E1
PlayerFire_Front:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $24, $16
	.byte $25, $2A
	.byte $26, $2B
	.byte $27, $30
PlayerFire_Back:
	.byte $42
	.byte $04
	.byte $80
	.byte $08
	.byte $32, $20
	.byte $39, $21
	.byte $3A, $22
	.byte $3B, $23
PlayerFire_Flipped:
	.byte $42
	.byte $04
	.byte $80
	.byte $08
	.byte $2E, $2C
	.byte $2F, $2D
	.byte $1A, $18
	.byte $1B, $19
PlayerFire_Turn:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $A8, $AA
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
PlayerFire_Duck:
	.byte $02
	.byte $03
	.byte $80
	.byte $08
	.byte $31, $33
	.byte $34, $36
	.byte $35, $37
PlayerFire_LookUp:
	.byte $02
	.byte $04
	.byte $81
	.byte $08
	.byte $40, $41
	.byte $42, $43
	.byte $44, $45
	.byte $46, $47
PlayerFire_Swim1:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $CC, $CE, $FF
	.byte $CD, $CF, $E7
PlayerFire_Swim2:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $C8, $CA, $FF
	.byte $C9, $CB, $C7
PlayerFire_Climb1:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $B0, $B2
	.byte $B1, $B3
	.byte $B4, $B6
	.byte $B5, $B7
PlayerFire_Climb2:
	.byte $42
	.byte $04
	.byte $82
	.byte $08
	.byte $B2, $B0
	.byte $B3, $B1
	.byte $B6, $B4
	.byte $B7, $B5
PlayerFire_Victory:
	.byte $02
	.byte $04
	.byte $81
	.byte $08
	.byte $68, $69
	.byte $6A, $6B
	.byte $6C, $6D
	.byte $6E, $6F
PlayerFire_Shoot:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $08, $0C
	.byte $09, $0D
	.byte $1C, $1E
	.byte $1D, $1F
PlayerFire_Hold:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $A1, $A3
PlayerFire_DuckHold:
	.byte $02
	.byte $03
	.byte $81
	.byte $08
	.byte $78, $79
	.byte $7A, $7B
	.byte $7C, $7D
PlayerFire_HoldWalk1:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $85, $87
PlayerFire_HoldWalk2:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $8B, $8D
PlayerCape_AnimTbl:
	.word pnt3_C9AA
	.word pnt3_C9B2
	.word pnt3_C9D6
	.word pnt3_C32E
	.word pnt3_C3A6
	.word pnt3_CA2A
	.word pnt3_C3CE
	.word pnt3_C3D6
	.word pnt3_CA3E
	.word pnt3_C3B2
	.word pnt3_C3E6
	.word pnt3_C3EE
	.word pnt3_C3F6
	.word pnt3_CA46
	.word pnt3_CA4E
	.word pnt3_C3B2
	.word pnt3_C41E
PlayerCape_AnimTbl2:
	.word pnt3_CA5A
	.word pnt3_C42E
	.word pnt3_C9D6
	.word pnt3_C42E
	.word pnt3_C4A6
	.word pnt3_CA2A
	.word pnt3_C3CE
	.word pnt3_C4B2
	.word pnt3_CA3E
	.word pnt3_C3EE
	.word pnt3_C4C2
	.word pnt3_C3EE
	.word pnt3_C4CA
	.word pnt3_CA46
	.word pnt3_CA4E
	.word pnt3_C3EE
	.word pnt3_C41E
pnt3_C9AA:
	.word PlayerCape_Stand
	.byte $0A
	.byte $00
	.word PlayerCape_Stand
	.byte $80
	.byte $00
pnt3_C9B2:
	.word PlayerBig_Walk1
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerCape_Stand
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Walk1
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerCape_Stand
	.byte $04
	.byte $00
	.word PlayerBig_Walk2
	.byte $04
	.byte $00
	.word PlayerBig_Walk1
	.byte $80
	.byte $00
pnt3_C9D6:
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerCape_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerCape_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerCape_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Walk1
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerCape_Stand
	.byte $02
	.byte $00
	.word PlayerBig_Walk2
	.byte $02
	.byte $00
	.word PlayerBig_Run1
	.byte $02
	.byte $00
	.word PlayerBig_Run2
	.byte $02
	.byte $00
	.word PlayerBig_Run3
	.byte $02
	.byte $00
	.word PlayerBig_Run2
	.byte $02
	.byte $00
	.word PlayerBig_Run1
	.byte $90
	.byte $00
pnt3_CA2A:
	.word PlayerBig_Front
	.byte $01
	.byte $00
	.word PlayerCape_Back
	.byte $01
	.byte $00
	.word PlayerBig_Side1
	.byte $01
	.byte $00
	.word PlayerBig_Side2
	.byte $01
	.byte $00
	.word PlayerBig_Front
	.byte $80
	.byte $00
pnt3_CA3E:
	.word PlayerCape_LookUp
	.byte $02
	.byte $00
	.word PlayerCape_LookUp
	.byte $80
	.byte $00
pnt3_CA46:
	.word PlayerCape_Climb1
	.byte $08
	.byte $00
	.word PlayerCape_Climb1
	.byte $80
	.byte $00
pnt3_CA4E:
	.word PlayerCape_Climb1
	.byte $08
	.byte $00
	.word PlayerCape_Climb2
	.byte $08
	.byte $00
	.word PlayerCape_Climb1
	.byte $80
	.byte $00
pnt3_CA5A:
	.word PlayerCape_Hold
	.byte $0A
	.byte $00
	.word PlayerCape_Hold
	.byte $80
	.byte $00
PlayerCape_Stand:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $3F
PlayerCape_LookUp:
	.byte $02
	.byte $04
	.byte $87
	.byte $08
	.byte $F3, $F4
	.byte $F5, $F6
	.byte $F7, $F8
	.byte $F9, $FB
PlayerCape_Back:
	.byte $03
	.byte $04
	.byte $89
	.byte $10
	.byte $71, $73, $74
	.byte $72, $75, $76
	.byte $FF, $77, $78
	.byte $FF, $79, $7A
PlayerCape_Climb1:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $29, $2A
	.byte $2B, $2C
	.byte $31, $32
	.byte $33, $34
PlayerCape_Climb2:
	.byte $42
	.byte $04
	.byte $88
	.byte $08
	.byte $2A, $29
	.byte $2C, $2B
	.byte $32, $31
	.byte $34, $33
PlayerCape_Hold:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $B0, $B2
	.byte $B1, $BB
pnt3_CAAE:
	.word pnt3_C326
	.word pnt3_C32E
	.word pnt3_C352
	.word pnt3_C32E
	.word pnt3_C4A6
	.word pnt3_C3BA
	.word pnt3_C3CE
	.word pnt3_C3D6
	.word pnt3_C3DE
	.word pnt3_C3B2
	.word pnt3_C3E6
	.word pnt3_C3EE
	.word pnt3_C3F6
	.word pnt3_CA46
	.word pnt3_CA4E
	.word pnt3_C3B2
	.word pnt3_C41E
pnt3_CAD0:
	.word pnt3_C426
	.word pnt3_C42E
	.word pnt3_C452
	.word pnt3_C42E
	.word pnt3_C4A6
	.word pnt3_C3BA
	.word pnt3_C3CE
	.word pnt3_C4B2
	.word pnt3_C3DE
	.word pnt3_C3EE
	.word pnt3_C4C2
	.word pnt3_C3EE
	.word pnt3_C4CA
	.word pnt3_CA46
	.word pnt3_CA4E
	.word pnt3_C3EE
	.word pnt3_C41E
pnt3_CAF2:
	.word Yoshi_AnimTbl
	.word Yoshi_AnimTbl
	.word Yoshi_AnimTbl
	.word Yoshi_AnimTbl
	.word Yoshi_AnimTbl
Yoshi_AnimTbl:
	.word Anim_YoshiStand ;Standing
	.word Anim_YoshiWalk ;Walking
	.word Anim_YoshiRun ;Running
	.word Anim_YoshiWalk ;The forbidden action
	.word Anim_YoshiJump ;Jumping
	.word Anim_YoshiJump ;Spinning. Unseen for obvious reasons
	.word Anim_YoshiTongueDuck ;Tongue out (Ducking)
	.word Anim_YoshiDucking ;Ducking
	.word Anim_YoshiStand ;Looking up
	.word Anim_YoshiJump ;Running jump
	.word Anim_YoshiFall ;Falling
	.word Anim_YoshiFall ;Sinking
	.word Anim_YoshiSwim ;Swimming
	.word Anim_YoshiTongue ;Tongue out (Idle)
	.word Anim_YoshiTongueWalk ;Tongue out (While moving)
	.word Anim_YoshiJump ;Flying. Technically used, although rarely seen due to a control bug
	.word Anim_YoshiStand ;Victory pose.
Anim_YoshiStand:
	.word Yoshi_Stand
	.byte $0A
	.byte $00
	.word Yoshi_Stand
	.byte $80
	.byte $00
Anim_YoshiWalk:
	.word Yoshi_Walk1
	.byte $04
	.byte $00
	.word Yoshi_Stand
	.byte $04
	.byte $00
	.word Yoshi_Walk1
	.byte $04
	.byte $00
	.word Yoshi_Stand
	.byte $80
	.byte $00
Anim_YoshiRun:
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Stand
	.byte $80
	.byte $00
Anim_YoshiJump:
	.word Yoshi_Jump
	.byte $23
	.byte $00
	.word Yoshi_Walk1
	.byte $02
	.byte $00
	.word Yoshi_Jump
	.byte $81
	.byte $00
Anim_YoshiSwim:
	.word Yoshi_Jump
	.byte $01
	.byte $00
	.word Yoshi_Jump
	.byte $80
	.byte $00
Anim_YoshiDucking:
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $80
	.byte $00
Anim_YoshiFall:
	.word Yoshi_Walk1
	.byte $01
	.byte $00
	.word Yoshi_Walk1
	.byte $80
	.byte $00
	.word Yoshi_Stand
	.byte $0A
	.byte $00
	.word Yoshi_Stand
	.byte $80
	.byte $00
Anim_YoshiTongue:
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue4
	.byte $04
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Flinch1
	.byte $80
	.byte $00
Anim_YoshiTongueDuck:
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Duck
	.byte $01
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue4
	.byte $04
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Flinch1
	.byte $80
	.byte $00
Anim_YoshiTongueWalk:
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch1
	.byte $01
	.byte $00
	.word Yoshi_Flinch2
	.byte $01
	.byte $00
	.word Yoshi_Flinch2
	.byte $01
	.byte $00
	.word Yoshi_Flinch2
	.byte $01
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue4
	.byte $04
	.byte $00
	.word Yoshi_Tongue3
	.byte $02
	.byte $00
	.word Yoshi_Tongue2
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Tongue1
	.byte $02
	.byte $00
	.word Yoshi_Flinch1
	.byte $80
	.byte $00
Yoshi_Stand:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $FF, $76, $77, $FF
	.byte $78, $79, $7A, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
Yoshi_Walk1:
	.byte $04
	.byte $04
	.byte $93
	.byte $18
	.byte $FF, $F8, $F9, $FF
	.byte $FA, $FB, $EB, $FF
	.byte $FF, $EC, $ED, $EE
	.byte $FF, $FF, $EF, $F0
Yoshi_Jump:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $71, $72, $73, $FF
	.byte $FF, $74, $75, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $7B, $7C
Yoshi_Flinch1:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $71, $72, $73, $FF
	.byte $FF, $74, $75, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
Yoshi_Tongue1:
	.byte $04
	.byte $03
	.byte $9A
	.byte $18
	.byte $AB, $AC, $FF, $FF
	.byte $B8, $AF, $AE, $AD
	.byte $B6, $B5, $B4, $B3
Yoshi_Tongue2:
	.byte $05
	.byte $03
	.byte $9A
	.byte $20
	.byte $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B0, $AF, $AE, $AD
	.byte $FF, $B6, $B5, $B4, $B3
Yoshi_Tongue3:
	.byte $06
	.byte $03
	.byte $9A
	.byte $28
	.byte $FF, $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B1, $B0, $AF, $AE, $AD
	.byte $FF, $FF, $B6, $B5, $B4, $B3
Yoshi_Tongue4:
	.byte $07
	.byte $03
	.byte $9A
	.byte $30
	.byte $FF, $FF, $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B1, $B1, $B0, $AF, $AE, $AD
	.byte $FF, $FF, $FF, $B6, $B5, $B4, $B3
Yoshi_Flinch2:
	.byte $04
	.byte $04
	.byte $93
	.byte $18
	.byte $F1, $F2, $F3, $FF
	.byte $F4, $F5, $F6, $FF
	.byte $FF, $FF, $F7, $EE
	.byte $FF, $FF, $EF, $F0
Yoshi_Duck:
	.byte $04
	.byte $04
	.byte $92
	.byte $18
	.byte $FF, $B8, $B9, $FF
	.byte $BA, $BB, $AB, $FF
	.byte $FF, $AC, $AD, $AE
	.byte $FF, $FF, $AF, $B0
pnt3_CD2C:
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
pnt3_CD36:
	.word pnt3_CD58
	.word pnt3_CD60
	.word pnt3_CD6C
	.word pnt3_CD60
	.word pnt3_CD78
	.word pnt3_CD78
	.word pnt3_CDA4
	.word pnt3_CD8C
	.word pnt3_CD58
	.word pnt3_CD78
	.word pnt3_CD94
	.word pnt3_CD94
	.word pnt3_CD84
	.word pnt3_CDB0
	.word pnt3_CDC4
	.word pnt3_CD78
	.word pnt3_CD58
pnt3_CD58:
	.word YoshiEat_Stand
	.byte $0A
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD60:
	.word YoshiEat_Walk2
	.byte $04
	.byte $00
	.word YoshiEat_Stand
	.byte $04
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD6C:
	.word YoshiEat_Stand
	.byte $01
	.byte $00
	.word YoshiEat_Walk2
	.byte $01
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD78:
	.word YoshiEat_Jump
	.byte $23
	.byte $00
	.word YoshiEat_Walk2
	.byte $02
	.byte $00
	.word YoshiEat_Jump
	.byte $81
	.byte $00
pnt3_CD84:
	.word YoshiEat_Jump
	.byte $01
	.byte $00
	.word YoshiEat_Jump
	.byte $80
	.byte $00
pnt3_CD8C:
	.word YoshiEat_Duck
	.byte $01
	.byte $00
	.word YoshiEat_Duck
	.byte $80
	.byte $00
pnt3_CD94:
	.word YoshiEat_Walk2
	.byte $01
	.byte $00
	.word YoshiEat_Walk2
	.byte $80
	.byte $00
	.word YoshiEat_Stand
	.byte $0A
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CDA4:
	.word YoshiSpit_Duck
	.byte $04
	.byte $00
	.word YoshiSpit_Duck
	.byte $04
	.byte $00
	.word YoshiSpit_Duck
	.byte $80
	.byte $00
pnt3_CDB0:
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $80
	.byte $00
pnt3_CDC4:
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $02
	.byte $00
	.word YoshiSpit_Stand
	.byte $80
	.byte $00
YoshiEat_Stand:
	.byte $04
	.byte $05
	.byte $9B
	.byte $18
	.byte $FF, $FF, $F6, $FF
	.byte $F7, $F8, $F9, $FF
	.byte $FA, $FB, $FC, $FF
	.byte $FF, $FF, $FD, $F2
	.byte $FF, $FF, $EB, $F5
YoshiEat_Walk2:
	.byte $03
	.byte $04
	.byte $A3
	.byte $10
	.byte $FA, $F9, $FF
	.byte $FB, $FC, $FF
	.byte $FD, $F0, $EB
	.byte $FF, $F4, $F3
YoshiEat_Jump:
	.byte $04
	.byte $04
	.byte $9B
	.byte $18
	.byte $F7, $EC, $ED, $FF
	.byte $EE, $EF, $F0, $FF
	.byte $FF, $FF, $F1, $F2
	.byte $FF, $FF, $F3, $F4
YoshiEat_Duck:
	.byte $04
	.byte $04
	.byte $A0
	.byte $18
	.byte $FF, $36, $37, $FF
	.byte $38, $39, $3A, $FF
	.byte $FF, $3B, $3C, $3D
	.byte $FF, $FF, $3F, $35
YoshiSpit_Stand:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $FF, $7D, $7F, $FF
	.byte $FF, $6B, $6C, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
YoshiSpit_Duck:
	.byte $04
	.byte $04
	.byte $A0
	.byte $18
	.byte $FF, $2B, $2C, $FF
	.byte $2D, $2E, $2F, $FF
	.byte $FF, $30, $31, $32
	.byte $FF, $FF, $33, $34
pnt3_CE54:
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
pnt3_CE5E:
	.word pnt3_CE80
	.word pnt3_CE8C
	.word pnt3_CE98
	.word pnt3_CE8C
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CEA0
	.word pnt3_CE98
	.word pnt3_CE80
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CEA0
	.word pnt3_CEB4
	.word pnt3_CE98
	.word pnt3_CE80
pnt3_CE80:
	.word YoshiEat_Stand
	.byte $04
	.byte $00
	.word Yoshi_Stand
	.byte $04
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CE8C:
	.word YoshiEat_Walk2
	.byte $04
	.byte $00
	.word Yoshi_Stand
	.byte $04
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CE98:
	.word YoshiEat_Stand
	.byte $0A
	.byte $00
	.word YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CEA0:
	.word pnt3_CED8
	.byte $04
	.byte $00
	.word pnt3_CED8
	.byte $04
	.byte $00
	.word pnt3_CEF0
	.byte $04
	.byte $00
	.word pnt3_CEF0
	.byte $04
	.byte $00
	.word pnt3_CED8
	.byte $80
	.byte $00
pnt3_CEB4:
	.word pnt3_CED8
	.byte $02
	.byte $00
	.word pnt3_CED8
	.byte $02
	.byte $00
	.word pnt3_CF04
	.byte $02
	.byte $00
	.word pnt3_CF04
	.byte $02
	.byte $00
	.word pnt3_CEF0
	.byte $02
	.byte $00
	.word pnt3_CEF0
	.byte $02
	.byte $00
	.word pnt3_CF14
	.byte $02
	.byte $00
	.word pnt3_CF14
	.byte $02
	.byte $00
	.word pnt3_CED8
	.byte $80
	.byte $00
pnt3_CED8:
	.byte $04
	.byte $05
	.byte $A1
	.byte $18
	.byte $FF
	.byte $75
	.byte $76
	.byte $FF
	.byte $77
	.byte $78
	.byte $79
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $FF
	.byte $FF
	.byte $7F
	.byte $7D
	.byte $72
	.byte $FF
	.byte $FF
	.byte $73
	.byte $74
pnt3_CEF0:
	.byte $04
	.byte $04
	.byte $A1
	.byte $18
	.byte $FF
	.byte $6B
	.byte $6C
	.byte $FF
	.byte $6D
	.byte $6E
	.byte $6F
	.byte $FF
	.byte $FF
	.byte $70
	.byte $71
	.byte $72
	.byte $FF
	.byte $FF
	.byte $73
	.byte $74
pnt3_CF04:
	.byte $03
	.byte $04
	.byte $A2
	.byte $10
	.byte $AB
	.byte $AC
	.byte $FF
	.byte $AD
	.byte $AE
	.byte $FF
	.byte $AF
	.byte $B0
	.byte $B1
	.byte $FF
	.byte $B2
	.byte $B3
pnt3_CF14:
	.byte $04
	.byte $04
	.byte $A2
	.byte $18
	.byte $FF
	.byte $B4
	.byte $B5
	.byte $FF
	.byte $B6
	.byte $B7
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $B9
	.byte $BA
	.byte $B1
	.byte $FF
	.byte $FF
	.byte $B2
	.byte $B3
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
;SPECIAL WARP DATA
;This is used for special warps such as the bonus room and cannon pipes.
SpecialWarpSettings:
	.word pnt3_D07C
	.word pnt3_D080
	.word pnt3_D084
	.word pnt3_D088
	.word pnt3_D08C
	.word pnt3_D090
	.word pnt3_D094
	.word pnt3_D098
	.word pnt3_D09C
	.word pnt3_D0A0
	.word pnt3_D0A4
	.word pnt3_D0A8
	.word pnt3_D0AC
	.word pnt3_D0B0
	.word pnt3_D0B4
	.word pnt3_D0B8
	.word pnt3_D0BC
	.word pnt3_D0C0
	.word pnt3_D0C4
	.word pnt3_D0C8
	.word pnt3_D0CC
	.word pnt3_D0D0
	.word pnt3_D0D4
	.word pnt3_D0D8
	.word pnt3_D0DC
	.word pnt3_D0E0
	.word pnt3_D0E4
	.word pnt3_D0E8
	.word SPWarp_BonusRoomSettings
	.word SPWarp_6_3_CannonSettings
	.word pnt3_D1D0
SpecialWarpCoords:
	.word pnt3_D0EC
	.word pnt3_D0F4
	.word pnt3_D0FC
	.word pnt3_D104
	.word pnt3_D10C
	.word pnt3_D114
	.word pnt3_D11C
	.word pnt3_D124
	.word pnt3_D12C
	.word pnt3_D134
	.word pnt3_D13C
	.word pnt3_D144
	.word pnt3_D14C
	.word pnt3_D154
	.word pnt3_D15C
	.word pnt3_D164
	.word pnt3_D16C
	.word pnt3_D174
	.word pnt3_D17C
	.word pnt3_D184
	.word pnt3_D18C
	.word pnt3_D194
	.word pnt3_D19C
	.word pnt3_D1A4
	.word pnt3_D1AC
	.word pnt3_D1B4
	.word pnt3_D1BC
	.word pnt3_D1C4
	.word SPWarp_BonusRoomPos
	.word SPWarp_6_3_CannonPos
	.word pnt3_D1DC
;Warp Level Settings Format
;Byte 1: Level flags and ID(?)
; Format: UUPLLLLL
; >UU: Underwater bits. Which one is set is irrelevant.
; >P: BG Priority bit. Player priority seems to be overriden by the level being warped to.
; >LLLLL: Destination level ID
;Byte 2: Tileset
;Byte 3: Second PRG Bank
;Byte 4: Palette ID
pnt3_D07C:
	.byte $00
	.byte $00
	.byte $1C
	.byte $00
pnt3_D080:
	.byte $01
	.byte $01
	.byte $1C
	.byte $01
pnt3_D084:
	.byte $02
	.byte $02
	.byte $1C
	.byte $02
pnt3_D088:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D08C:
	.byte $04
	.byte $04
	.byte $1D
	.byte $04
pnt3_D090:
	.byte $05
	.byte $05
	.byte $1D
	.byte $05
pnt3_D094:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D098:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D09C:
	.byte $08
	.byte $08
	.byte $1E
	.byte $08
pnt3_D0A0:
	.byte $49
	.byte $09
	.byte $1E
	.byte $09
pnt3_D0A4:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0A8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0AC:
	.byte $0C
	.byte $0C
	.byte $1F
	.byte $0C
pnt3_D0B0:
	.byte $0D
	.byte $0D
	.byte $1F
	.byte $0D
pnt3_D0B4:
	.byte $0E
	.byte $0E
	.byte $1F
	.byte $0E
pnt3_D0B8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0BC:
	.byte $10
	.byte $10
	.byte $20
	.byte $10
pnt3_D0C0:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0C4:
	.byte $52
	.byte $12
	.byte $20
	.byte $12
pnt3_D0C8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0CC:
	.byte $14
	.byte $14
	.byte $21
	.byte $14
pnt3_D0D0:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0D4:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
pnt3_D0D8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0DC:
	.byte $18
	.byte $18
	.byte $22
	.byte $18
pnt3_D0E0:
	.byte $19
	.byte $19
	.byte $22
	.byte $19
pnt3_D0E4:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0E8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0EC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D0F4:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D0FC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D104:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D10C:
	.byte $0A
	.byte $01
	.byte $80
	.byte $A8
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D114:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D11C:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D124:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D12C:
	.byte $06
	.byte $00
	.byte $90
	.byte $58
	.byte $FF
	.byte $11
	.byte $FF
	.byte $00
pnt3_D134:
	.byte $03
	.byte $00
	.byte $70
	.byte $48
	.byte $FF
	.byte $0C
	.byte $FF
	.byte $00
pnt3_D13C:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D144:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D14C:
	.byte $0B
	.byte $01
	.byte $80
	.byte $C8
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D154:
	.byte $0B
	.byte $01
	.byte $70
	.byte $A8
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D15C:
	.byte $06
	.byte $01
	.byte $70
	.byte $38
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D164:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D16C:
	.byte $0B
	.byte $01
	.byte $80
	.byte $98
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D174:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D17C:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $0E
	.byte $FF
	.byte $01
pnt3_D184:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D18C:
	.byte $00
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D194:
	.byte $00
	.byte $01
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $00
	.byte $01
pnt3_D19C:
	.byte $0F
	.byte $01
	.byte $80
	.byte $98
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1A4:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D1AC:
	.byte $00
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1B4:
	.byte $08
	.byte $01
	.byte $60
	.byte $18
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1BC:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D1C4:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
SPWarp_6_3_CannonSettings:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
pnt3_D1D0:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
SPWarp_6_3_CannonPos:
	.byte $06
	.byte $01
	.byte $90
	.byte $5C
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1DC:
	.byte $10
	.byte $01
	.byte $80
	.byte $5C
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
SPWarp_BonusRoomSettings:
	.byte $23
	.byte $22
	.byte $2B
	.byte $25
SPWarp_BonusRoomPos:
	.byte $00
	.byte $01
	.byte $10
	.byte $B0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $01
;End of special warp data
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $C0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80 ;Why the hell is this here? Seriously, why? All this does is prevent me from padding the rest of this bank.
