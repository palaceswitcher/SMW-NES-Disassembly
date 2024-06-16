; 0x048010-0x04A00F
lda_36_C000:
	dw pnt3_C014
	dw pnt3_CAF2
	dw pnt3_CD2C
	dw pnt3_CD2C
	dw pnt3_CD2C
	dw pnt3_CD2C
	dw pnt3_CE54
	dw pnt3_CE54
	dw pnt3_CE54
	dw pnt3_CE54
pnt3_C014:
	dw PlayerSmall_AnimTbl
	dw PlayerBig_AnimTbl
	dw PlayerFire_AnimTbl
	dw PlayerCape_AnimTbl
	dw pnt3_CAAE
	dw PlayerSmall_AnimTbl2
	dw PlayerBig_AnimTbl2
	dw PlayerFire_AnimTbl2
	dw PlayerCape_AnimTbl2
	dw pnt3_CAD0
PlayerSmall_AnimTbl:
	dw pnt3_C070
	dw pnt3_C078
	dw pnt3_C084
	dw pnt3_C078
	dw pnt3_C0D8
	dw pnt3_C0EC
	dw pnt3_C100
	dw pnt3_C108
	dw pnt3_C110
	dw pnt3_C0E4
	dw pnt3_C118
	dw pnt3_C120
	dw pnt3_C128
	dw pnt3_C134
	dw pnt3_C13C
	dw pnt3_C0E4
	dw pnt3_C148
	dw pnt3_C150
PlayerSmall_AnimTbl2:
	dw pnt3_C160
	dw pnt3_C168
	dw pnt3_C174
	dw pnt3_C168
	dw pnt3_C1C8
	dw pnt3_C0EC
	dw pnt3_C100
	dw pnt3_C1D4
	dw pnt3_C110
	dw pnt3_C1C8
	dw pnt3_C1E4
	dw pnt3_C1EC
	dw pnt3_C1F4
	dw pnt3_C134
	dw pnt3_C13C
	dw pnt3_C1C8
	dw pnt3_C148
	dw pnt3_C150
pnt3_C070:
	dw PlayerSmall_Stand
	db $0A
	db $00
	dw PlayerSmall_Stand
	db $80
	db $00
pnt3_C078:
	dw PlayerSmall_Stand
	db $04
	db $00
	dw PlayerSmall_Walk1
	db $04
	db $00
	dw PlayerSmall_Stand
	db $80
	db $00
pnt3_C084:
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Stand
	db $02
	db $00
	dw PlayerSmall_Walk1
	db $02
	db $00
	dw PlayerSmall_Run1
	db $02
	db $00
	dw PlayerSmall_Run2
	db $02
	db $00
	dw PlayerSmall_Run1
	db $02
	db $00
	dw PlayerSmall_Run2
	db $02
	db $00
	dw PlayerSmall_Run1
	db $90
	db $00
pnt3_C0D8:
	dw PlayerSmall_Jump
	db $23
	db $00
	dw PlayerSmall_Fall
	db $02
	db $00
	dw PlayerSmall_Fall
	db $81
	db $00
pnt3_C0E4:
	dw PlayerSmall_RunJump
	db $0A
	db $00
	dw PlayerSmall_RunJump
	db $80
	db $00
pnt3_C0EC:
	dw PlayerSmall_Stand
	db $01
	db $00
	dw PlayerSmall_Back
	db $01
	db $00
	dw PlayerSmall_Flipped
	db $01
	db $00
	dw PlayerSmall_Front
	db $01
	db $00
	dw PlayerSmall_Stand
	db $80
	db $00
pnt3_C100:
	dw PlayerSmall_Turn
	db $0A
	db $00
	dw PlayerSmall_Turn
	db $80
	db $00
pnt3_C108:
	dw PlayerSmall_Duck
	db $08
	db $00
	dw PlayerSmall_Duck
	db $80
	db $00
pnt3_C110:
	dw PlayerSmall_LookUp
	db $02
	db $00
	dw PlayerSmall_LookUp
	db $80
	db $00
pnt3_C118:
	dw PlayerSmall_Fall
	db $02
	db $00
	dw PlayerSmall_Fall
	db $80
	db $00
pnt3_C120:
	dw PlayerSmall_Swim1
	db $01
	db $00
	dw PlayerSmall_Swim1
	db $80
	db $00
pnt3_C128:
	dw PlayerSmall_RunJump
	db $03
	db $00
	dw PlayerSmall_Swim1
	db $03
	db $00
	dw PlayerSmall_RunJump
	db $80
	db $00
pnt3_C134:
	dw PlayerSmall_Climb1
	db $08
	db $00
	dw PlayerSmall_Climb1
	db $80
	db $00
pnt3_C13C:
	dw PlayerSmall_Climb1
	db $08
	db $00
	dw PlayerSmall_Climb2
	db $08
	db $00
	dw PlayerSmall_Climb1
	db $80
	db $00
pnt3_C148:
	dw PlayerSmall_Victory
	db $0A
	db $00
	dw PlayerSmall_Victory
	db $80
	db $00
pnt3_C150:
	dw PlayerSmall_Death1
	db $28
	db $00
	dw PlayerSmall_Death1
	db $08
	db $00
	dw PlayerSmall_Death2
	db $08
	db $00
	dw PlayerSmall_Death1
	db $81
	db $00
pnt3_C160:
	dw PlayerSmall_Hold
	db $0A
	db $00
	dw PlayerSmall_Hold
	db $80
	db $00
pnt3_C168:
	dw PlayerSmall_Hold
	db $04
	db $00
	dw PlayerSmall_HoldWalk
	db $04
	db $00
	dw PlayerSmall_Hold
	db $80
	db $00
pnt3_C174:
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_Hold
	db $90
	db $00
pnt3_C1C8:
	dw PlayerSmall_HoldWalk
	db $23
	db $00
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $81
	db $00
pnt3_C1D4:
	dw PlayerSmall_DuckHold
	db $08
	db $00
	dw PlayerSmall_DuckHold
	db $80
	db $00
	dw PlayerSmall_Hold
	db $02
	db $00
	dw PlayerSmall_Hold
	db $80
	db $00
pnt3_C1E4:
	dw PlayerSmall_HoldWalk
	db $02
	db $00
	dw PlayerSmall_HoldWalk
	db $80
	db $00
pnt3_C1EC:
	dw pnt3_C2D8
	db $01
	db $00
	dw pnt3_C2D8
	db $80
	db $00
pnt3_C1F4:
	dw pnt3_C2D8
	db $03
	db $00
	dw pnt3_C2D8
	db $03
	db $00
	dw pnt3_C2D8
	db $80
	db $00
PlayerSmall_Stand:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $60, $61
PlayerSmall_Walk1:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $6A, $6B
PlayerSmall_Run1:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $60, $6C
PlayerSmall_Run2:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $6A, $6D
PlayerSmall_RunJump:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $68, $69
PlayerSmall_Jump:
	db $02
	db $03
	db $99
	db $08
	db $74, $75
	db $76, $77
	db $78, $79
PlayerSmall_Fall:
	db $02
	db $03
	db $99
	db $08
	db $7A, $7B
	db $7C, $7D
	db $57, $5C
PlayerSmall_Back:
	db $02
	db $03
	db $99
	db $08
	db $48, $49
	db $4A, $4B
	db $4C, $4D
PlayerSmall_Flipped:
	db $42
	db $03
	db $99
	db $08
	db $65, $64
	db $7F, $66
	db $61, $60
PlayerSmall_Front:
	db $02
	db $03
	db $99
	db $08
	db $4E, $4F
	db $56, $58
	db $59, $5A
PlayerSmall_Turn:
	db $02
	db $03
	db $9A
	db $08
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
PlayerSmall_Duck:
	db $02
	db $02
	db $99
	db $08
	db $50, $51
	db $52, $53
PlayerSmall_LookUp:
	db $02
	db $03
	db $99
	db $08
	db $5B, $5D
	db $5E, $5F
	db $60, $61
PlayerSmall_Swim1:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $62, $63
PlayerSmall_Climb1:
	db $02
	db $03
	db $99
	db $08
	db $48, $49
	db $4A, $4B
	db $72, $73
PlayerSmall_Climb2:
	db $42
	db $03
	db $99
	db $08
	db $49, $48
	db $4B, $4A
	db $73, $72
PlayerSmall_Victory:
	db $02
	db $03
	db $98
	db $08
	db $0E, $0D
	db $10, $0F
	db $12, $11
PlayerSmall_Death1:
	db $02
	db $03
	db $98
	db $08
	db $18, $19
	db $1A, $1B
	db $1C, $1D
PlayerSmall_Death2:
	db $42
	db $03
	db $98
	db $08
	db $19, $18
	db $1B, $1A
	db $1D, $1C
PlayerSmall_Hold:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $40, $41
PlayerSmall_HoldWalk:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $42, $43
PlayerSmall_DuckHold:
	db $02
	db $02
	db $99
	db $08
	db $44, $45
	db $46, $47
pnt3_C2D8:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $62, $63
PlayerBig_AnimTbl:
	dw pnt3_C326
	dw pnt3_C32E
	dw pnt3_C352
	dw pnt3_C32E
	dw pnt3_C3A6
	dw pnt3_C3BA
	dw pnt3_C3CE
	dw pnt3_C3D6
	dw pnt3_C3DE
	dw pnt3_C3B2
	dw pnt3_C3E6
	dw pnt3_C3EE
	dw pnt3_C3F6
	dw pnt3_C40A
	dw pnt3_C412
	dw pnt3_C3B2
	dw pnt3_C41E
PlayerBig_AnimTbl2:
	dw pnt3_C426
	dw pnt3_C42E
	dw pnt3_C452
	dw pnt3_C42E
	dw pnt3_C4A6
	dw pnt3_C3BA
	dw pnt3_C3CE
	dw pnt3_C4B2
	dw pnt3_C3DE
	dw pnt3_C3EE
	dw pnt3_C4C2
	dw pnt3_C3EE
	dw pnt3_C4CA
	dw pnt3_C40A
	dw pnt3_C412
	dw pnt3_C3EE
	dw pnt3_C41E
pnt3_C326:
	dw PlayerBig_Stand
	db $0A
	db $00
	dw PlayerBig_Stand
	db $80
	db $00
pnt3_C32E:
	dw PlayerBig_Walk1
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Stand
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Walk1
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Stand
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Walk1
	db $80
	db $00
pnt3_C352:
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Run1
	db $02
	db $00
	dw PlayerBig_Run2
	db $02
	db $00
	dw PlayerBig_Run3
	db $02
	db $00
	dw PlayerBig_Run2
	db $02
	db $00
	dw PlayerBig_Run1
	db $90
	db $00
pnt3_C3A6:
	dw PlayerBig_Jump
	db $23
	db $00
	dw PlayerBig_Fall
	db $02
	db $00
	dw PlayerBig_Fall
	db $81
	db $00
pnt3_C3B2:
	dw PlayerBig_RunJump
	db $0A
	db $00
	dw PlayerBig_RunJump
	db $80
	db $00
pnt3_C3BA:
	dw PlayerBig_Front
	db $01
	db $00
	dw PlayerBig_Back
	db $01
	db $00
	dw PlayerBig_Side1
	db $01
	db $00
	dw PlayerBig_Side2
	db $01
	db $00
	dw PlayerBig_Front
	db $80
	db $00
pnt3_C3CE:
	dw PlayerBig_Turn
	db $0A
	db $00
	dw PlayerBig_Turn
	db $80
	db $00
pnt3_C3D6:
	dw PlayerBig_Duck
	db $08
	db $00
	dw PlayerBig_Duck
	db $80
	db $00
pnt3_C3DE:
	dw PlayerBig_LookUp
	db $02
	db $00
	dw PlayerBig_LookUp
	db $80
	db $00
pnt3_C3E6:
	dw PlayerBig_Fall
	db $02
	db $00
	dw PlayerBig_Fall
	db $80
	db $00
pnt3_C3EE:
	dw PlayerBig_Swim1
	db $01
	db $00
	dw PlayerBig_Swim1
	db $80
	db $00
pnt3_C3F6:
	dw PlayerBig_RunJump
	db $03
	db $00
	dw PlayerBig_Swim2
	db $03
	db $00
	dw PlayerBig_Swim1
	db $03
	db $00
	dw PlayerBig_Swim2
	db $03
	db $00
	dw PlayerBig_Fall
	db $80
	db $00
pnt3_C40A:
	dw PlayerBig_Climb1
	db $08
	db $00
	dw PlayerBig_Climb1
	db $80
	db $00
pnt3_C412:
	dw PlayerBig_Climb1
	db $08
	db $00
	dw PlayerBig_Climb2
	db $08
	db $00
	dw PlayerBig_Climb1
	db $80
	db $00
pnt3_C41E:
	dw PlayerBig_Victory
	db $0A
	db $00
	dw PlayerBig_Victory
	db $80
	db $00
pnt3_C426:
	dw PlayerBig_Hold
	db $0A
	db $00
	dw PlayerBig_Hold
	db $80
	db $00
pnt3_C42E:
	dw PlayerBig_HoldWalk1
	db $04
	db $00
	dw PlayerBig_HoldWalk2
	db $04
	db $00
	dw PlayerBig_Hold
	db $04
	db $00
	dw PlayerBig_HoldWalk2
	db $04
	db $00
	dw PlayerBig_HoldWalk1
	db $04
	db $00
	dw PlayerBig_HoldWalk2
	db $04
	db $00
	dw PlayerBig_Hold
	db $04
	db $00
	dw PlayerBig_HoldWalk2
	db $04
	db $00
	dw PlayerBig_HoldWalk1
	db $80
	db $00
pnt3_C452:
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_Hold
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_Hold
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_Hold
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_Hold
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_Hold
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $90
	db $00
pnt3_C4A6:
	dw PlayerBig_HoldWalk1
	db $23
	db $00
	dw PlayerBig_HoldWalk1
	db $02
	db $00
	dw PlayerBig_HoldWalk1
	db $81
	db $00
pnt3_C4B2:
	dw PlayerBig_DuckHold
	db $08
	db $00
	dw PlayerBig_DuckHold
	db $80
	db $00
	dw PlayerBig_LookUp
	db $02
	db $00
	dw PlayerBig_LookUp
	db $80
	db $00
pnt3_C4C2:
	dw PlayerBig_HoldWalk2
	db $02
	db $00
	dw PlayerBig_HoldWalk2
	db $80
	db $00
pnt3_C4CA:
	dw PlayerBig_Swim1
	db $03
	db $00
	dw PlayerBig_Swim1
	db $03
	db $00
	dw PlayerBig_Swim1
	db $03
	db $00
	dw PlayerBig_Swim1
	db $03
	db $00
	dw PlayerBig_Swim1
	db $80
	db $00
PlayerBig_Stand:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $38
PlayerBig_Walk1:
	db $02
	db $04
	db $84
	db $08
	db $31, $23
	db $2A, $2C
	db $2D, $2F
	db $2E, $30
PlayerBig_Walk2:
	db $02
	db $04
	db $84
	db $08
	db $21, $23
	db $22, $24
	db $25, $27
	db $26, $28
PlayerBig_Run1:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $64, $65, $68
	db $66, $67, $FF
PlayerBig_Run3:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $6D, $6E, $68
	db $6F, $70, $FF
PlayerBig_Run2:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $69, $6A, $68
	db $6B, $6C, $FF
PlayerBig_RunJump:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $71, $72, $68
	db $73, $74, $76
PlayerBig_Jump:
	db $02
	db $04
	db $89
	db $08
	db $61, $62
	db $63, $64
	db $65, $6E
	db $67, $70
PlayerBig_Fall:
	db $02
	db $04
	db $89
	db $08
	db $69, $6A
	db $6B, $6C
	db $6D, $6E
	db $6F, $70
PlayerBig_Front:
	db $02
	db $04
	db $88
	db $08
	db $21, $22
	db $23, $24
	db $25, $26
	db $27, $28
PlayerBig_Back:
	db $42
	db $04
	db $89
	db $08
	db $74, $7B
	db $76, $7C
	db $78, $77
	db $7A, $79
PlayerBig_Side1:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $38
PlayerBig_Side2:
	db $42
	db $04
	db $84
	db $08
	db $33, $29
	db $34, $32
	db $37, $35
	db $38, $36
PlayerBig_Turn:
	db $02
	db $04
	db $86
	db $08
	db $A8, $AA
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
PlayerBig_Duck:
	db $02
	db $03
	db $84
	db $08
	db $39, $3A
	db $3B, $3D
	db $3C, $2B
PlayerBig_LookUp:
	db $02
	db $04
	db $87
	db $08
	db $F3, $F4
	db $F5, $F6
	db $F7, $F8
	db $F9, $FA
PlayerBig_Swim1:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $7C, $7D, $FF
	db $73, $7B, $75
PlayerBig_Swim2:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $77, $78, $FF
	db $73, $7A, $76
PlayerBig_Climb1:
	db $02
	db $04
	db $88
	db $08
	db $29, $2A
	db $2B, $2C
	db $2D, $2E
	db $2F, $30
PlayerBig_Climb2:
	db $42
	db $04
	db $88
	db $08
	db $2A, $29
	db $2C, $2B
	db $2E, $2D
	db $30, $2F
PlayerBig_Victory:
	db $02
	db $04
	db $8B
	db $08
	db $E9, $EA
	db $EB, $EC
	db $ED, $EE
	db $EF, $F0
PlayerBig_Hold:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $B0, $B2
	db $B1, $B3
PlayerBig_HoldWalk1:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $A4, $A6
	db $A5, $A7
PlayerBig_HoldWalk2:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $AA, $AC
	db $AB, $AD
PlayerBig_DuckHold:
	db $02
	db $03
	db $86
	db $08
	db $B4, $B5
	db $B6, $B7
	db $B8, $B9
PlayerFire_AnimTbl:
	dw pnt3_C66E
	dw pnt3_C676
	dw pnt3_C69A
	dw pnt3_C676
	dw pnt3_C6EE
	dw pnt3_C702
	dw pnt3_C716
	dw pnt3_C71E
	dw pnt3_C726
	dw pnt3_C6FA
	dw pnt3_C72E
	dw pnt3_C736
	dw pnt3_C73E
	dw pnt3_C752
	dw pnt3_C75A
	dw pnt3_C6FA
	dw pnt3_C766
	dw pnt3_C76E
	dw pnt3_C776
	dw pnt3_C782
PlayerFire_AnimTbl2:
	dw pnt3_C78A
	dw pnt3_C792
	dw pnt3_C7B6
	dw pnt3_C792
	dw pnt3_C80A
	dw pnt3_C702
	dw pnt3_C716
	dw pnt3_C816
	dw pnt3_C726
	dw pnt3_C736
	dw pnt3_C81E
	dw pnt3_C736
	dw pnt3_C73E
	dw pnt3_C752
	dw pnt3_C75A
	dw pnt3_C736
	dw pnt3_C766
	dw pnt3_C76E
	dw pnt3_C776
	dw pnt3_C782
pnt3_C66E:
	dw PlayerFire_Stand
	db $0A
	db $00
	dw PlayerFire_Stand
	db $80
	db $00
pnt3_C676:
	dw PlayerFire_Walk1
	db $04
	db $00
	dw PlayerFire_Walk2
	db $04
	db $00
	dw PlayerFire_Stand
	db $04
	db $00
	dw PlayerFire_Walk2
	db $04
	db $00
	dw PlayerFire_Walk1
	db $04
	db $00
	dw PlayerFire_Walk2
	db $04
	db $00
	dw PlayerFire_Stand
	db $04
	db $00
	dw PlayerFire_Walk2
	db $04
	db $00
	dw PlayerFire_Walk1
	db $80
	db $00
pnt3_C69A:
	dw PlayerFire_Walk1
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Stand
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Walk1
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Stand
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Walk1
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Stand
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Walk1
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Stand
	db $02
	db $00
	dw PlayerFire_Walk2
	db $02
	db $00
	dw PlayerFire_Run1
	db $02
	db $00
	dw PlayerFire_Run2
	db $02
	db $00
	dw PlayerFire_Run3
	db $02
	db $00
	dw PlayerFire_Run2
	db $02
	db $00
	dw PlayerFire_Run1
	db $90
	db $00
pnt3_C6EE:
	dw PlayerFire_Jump
	db $23
	db $00
	dw PlayerFire_Fall
	db $02
	db $00
	dw PlayerFire_Fall
	db $81
	db $00
pnt3_C6FA:
	dw PlayerFire_RunJump
	db $0A
	db $00
	dw PlayerFire_RunJump
	db $80
	db $00
pnt3_C702:
	dw PlayerFire_Front
	db $01
	db $00
	dw PlayerFire_Back
	db $01
	db $00
	dw PlayerFire_Stand
	db $01
	db $00
	dw PlayerFire_Flipped
	db $01
	db $00
	dw PlayerFire_Front
	db $80
	db $00
pnt3_C716:
	dw PlayerFire_Turn
	db $0A
	db $00
	dw PlayerFire_Turn
	db $80
	db $00
pnt3_C71E:
	dw PlayerFire_Duck
	db $08
	db $00
	dw PlayerFire_Duck
	db $80
	db $00
pnt3_C726:
	dw PlayerFire_LookUp
	db $02
	db $00
	dw PlayerFire_LookUp
	db $80
	db $00
pnt3_C72E:
	dw PlayerFire_Fall
	db $02
	db $00
	dw PlayerFire_Fall
	db $80
	db $00
pnt3_C736:
	dw PlayerFire_Swim1
	db $01
	db $00
	dw PlayerFire_Swim1
	db $80
	db $00
pnt3_C73E:
	dw PlayerFire_RunJump
	db $03
	db $00
	dw PlayerFire_Swim2
	db $03
	db $00
	dw PlayerFire_Swim1
	db $03
	db $00
	dw PlayerFire_Swim2
	db $03
	db $00
	dw PlayerFire_Fall
	db $80
	db $00
pnt3_C752:
	dw PlayerFire_Climb1
	db $08
	db $00
	dw PlayerFire_Climb1
	db $80
	db $00
pnt3_C75A:
	dw PlayerFire_Climb1
	db $08
	db $00
	dw PlayerFire_Climb2
	db $08
	db $00
	dw PlayerFire_Climb1
	db $80
	db $00
pnt3_C766:
	dw PlayerFire_Victory
	db $0A
	db $00
	dw PlayerFire_Victory
	db $80
	db $00
pnt3_C76E:
	dw PlayerFire_Swim1
	db $03
	db $00
	dw PlayerFire_Swim1
	db $80
	db $00
pnt3_C776:
	dw PlayerFire_Swim2
	db $03
	db $00
	dw PlayerFire_Swim1
	db $03
	db $00
	dw PlayerFire_Swim1
	db $80
	db $00
pnt3_C782:
	dw PlayerFire_Shoot
	db $03
	db $00
	dw PlayerFire_Shoot
	db $80
	db $00
pnt3_C78A:
	dw PlayerFire_Hold
	db $0A
	db $00
	dw PlayerFire_Hold
	db $80
	db $00
pnt3_C792:
	dw PlayerFire_HoldWalk1
	db $04
	db $00
	dw PlayerFire_HoldWalk2
	db $04
	db $00
	dw PlayerFire_Hold
	db $04
	db $00
	dw PlayerFire_HoldWalk2
	db $04
	db $00
	dw PlayerFire_HoldWalk1
	db $04
	db $00
	dw PlayerFire_HoldWalk2
	db $04
	db $00
	dw PlayerFire_Hold
	db $04
	db $00
	dw PlayerFire_HoldWalk2
	db $04
	db $00
	dw PlayerFire_HoldWalk1
	db $80
	db $00
pnt3_C7B6:
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_Hold
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_Hold
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_Hold
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_Hold
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_Hold
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $90
	db $00
pnt3_C80A:
	dw PlayerFire_HoldWalk1
	db $23
	db $00
	dw PlayerFire_HoldWalk1
	db $02
	db $00
	dw PlayerFire_HoldWalk1
	db $81
	db $00
pnt3_C816:
	dw PlayerFire_DuckHold
	db $08
	db $00
	dw PlayerFire_DuckHold
	db $80
	db $00
pnt3_C81E:
	dw PlayerFire_HoldWalk2
	db $02
	db $00
	dw PlayerFire_HoldWalk2
	db $80
	db $00
PlayerFire_Stand:
	db $02
	db $04
	db $80
	db $08
	db $2C, $2E
	db $2D, $2F
	db $18, $1A
	db $19, $1B
PlayerFire_Walk1:
	db $02
	db $04
	db $80
	db $08
	db $00, $02
	db $01, $03
	db $04, $06
	db $05, $07
PlayerFire_Walk2:
	db $02
	db $04
	db $80
	db $08
	db $0A, $0C
	db $0B, $0D
	db $0E, $28
	db $0F, $29
PlayerFire_Run1:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F0, $F2, $FC
	db $F1, $F3, $FF
PlayerFire_Run3:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F8, $FA, $FC
	db $F9, $FB, $FF
PlayerFire_Run2:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F4, $F6, $FC
	db $F5, $F7, $FF
PlayerFire_RunJump:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $C0, $C2, $C6
	db $C1, $C3, $C7
PlayerFire_Jump:
	db $02
	db $04
	db $83
	db $08
	db $D8, $DA
	db $D9, $DB
	db $DC, $E0
	db $DD, $E1
PlayerFire_Fall:
	db $02
	db $04
	db $83
	db $08
	db $E9, $EA
	db $EB, $EC
	db $E6, $E0
	db $E8, $E1
PlayerFire_Front:
	db $02
	db $04
	db $80
	db $08
	db $24, $16
	db $25, $2A
	db $26, $2B
	db $27, $30
PlayerFire_Back:
	db $42
	db $04
	db $80
	db $08
	db $32, $20
	db $39, $21
	db $3A, $22
	db $3B, $23
PlayerFire_Flipped:
	db $42
	db $04
	db $80
	db $08
	db $2E, $2C
	db $2F, $2D
	db $1A, $18
	db $1B, $19
PlayerFire_Turn:
	db $02
	db $04
	db $82
	db $08
	db $A8, $AA
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
PlayerFire_Duck:
	db $02
	db $03
	db $80
	db $08
	db $31, $33
	db $34, $36
	db $35, $37
PlayerFire_LookUp:
	db $02
	db $04
	db $81
	db $08
	db $40, $41
	db $42, $43
	db $44, $45
	db $46, $47
PlayerFire_Swim1:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $CC, $CE, $FF
	db $CD, $CF, $E7
PlayerFire_Swim2:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $C8, $CA, $FF
	db $C9, $CB, $C7
PlayerFire_Climb1:
	db $02
	db $04
	db $82
	db $08
	db $B0, $B2
	db $B1, $B3
	db $B4, $B6
	db $B5, $B7
PlayerFire_Climb2:
	db $42
	db $04
	db $82
	db $08
	db $B2, $B0
	db $B3, $B1
	db $B6, $B4
	db $B7, $B5
PlayerFire_Victory:
	db $02
	db $04
	db $81
	db $08
	db $68, $69
	db $6A, $6B
	db $6C, $6D
	db $6E, $6F
PlayerFire_Shoot:
	db $02
	db $04
	db $80
	db $08
	db $08, $0C
	db $09, $0D
	db $1C, $1E
	db $1D, $1F
PlayerFire_Hold:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $A1, $A3
PlayerFire_DuckHold:
	db $02
	db $03
	db $81
	db $08
	db $78, $79
	db $7A, $7B
	db $7C, $7D
PlayerFire_HoldWalk1:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $85, $87
PlayerFire_HoldWalk2:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $8B, $8D
PlayerCape_AnimTbl:
	dw pnt3_C9AA
	dw pnt3_C9B2
	dw pnt3_C9D6
	dw pnt3_C32E
	dw pnt3_C3A6
	dw pnt3_CA2A
	dw pnt3_C3CE
	dw pnt3_C3D6
	dw pnt3_CA3E
	dw pnt3_C3B2
	dw pnt3_C3E6
	dw pnt3_C3EE
	dw pnt3_C3F6
	dw pnt3_CA46
	dw pnt3_CA4E
	dw pnt3_C3B2
	dw pnt3_C41E
PlayerCape_AnimTbl2:
	dw pnt3_CA5A
	dw pnt3_C42E
	dw pnt3_C9D6
	dw pnt3_C42E
	dw pnt3_C4A6
	dw pnt3_CA2A
	dw pnt3_C3CE
	dw pnt3_C4B2
	dw pnt3_CA3E
	dw pnt3_C3EE
	dw pnt3_C4C2
	dw pnt3_C3EE
	dw pnt3_C4CA
	dw pnt3_CA46
	dw pnt3_CA4E
	dw pnt3_C3EE
	dw pnt3_C41E
pnt3_C9AA:
	dw PlayerCape_Stand
	db $0A
	db $00
	dw PlayerCape_Stand
	db $80
	db $00
pnt3_C9B2:
	dw PlayerBig_Walk1
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerCape_Stand
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Walk1
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerCape_Stand
	db $04
	db $00
	dw PlayerBig_Walk2
	db $04
	db $00
	dw PlayerBig_Walk1
	db $80
	db $00
pnt3_C9D6:
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerCape_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerCape_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerCape_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Walk1
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerCape_Stand
	db $02
	db $00
	dw PlayerBig_Walk2
	db $02
	db $00
	dw PlayerBig_Run1
	db $02
	db $00
	dw PlayerBig_Run2
	db $02
	db $00
	dw PlayerBig_Run3
	db $02
	db $00
	dw PlayerBig_Run2
	db $02
	db $00
	dw PlayerBig_Run1
	db $90
	db $00
pnt3_CA2A:
	dw PlayerBig_Front
	db $01
	db $00
	dw PlayerCape_Back
	db $01
	db $00
	dw PlayerBig_Side1
	db $01
	db $00
	dw PlayerBig_Side2
	db $01
	db $00
	dw PlayerBig_Front
	db $80
	db $00
pnt3_CA3E:
	dw PlayerCape_LookUp
	db $02
	db $00
	dw PlayerCape_LookUp
	db $80
	db $00
pnt3_CA46:
	dw PlayerCape_Climb1
	db $08
	db $00
	dw PlayerCape_Climb1
	db $80
	db $00
pnt3_CA4E:
	dw PlayerCape_Climb1
	db $08
	db $00
	dw PlayerCape_Climb2
	db $08
	db $00
	dw PlayerCape_Climb1
	db $80
	db $00
pnt3_CA5A:
	dw PlayerCape_Hold
	db $0A
	db $00
	dw PlayerCape_Hold
	db $80
	db $00
PlayerCape_Stand:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $3F
PlayerCape_LookUp:
	db $02
	db $04
	db $87
	db $08
	db $F3, $F4
	db $F5, $F6
	db $F7, $F8
	db $F9, $FB
PlayerCape_Back:
	db $03
	db $04
	db $89
	db $10
	db $71, $73, $74
	db $72, $75, $76
	db $FF, $77, $78
	db $FF, $79, $7A
PlayerCape_Climb1:
	db $02
	db $04
	db $88
	db $08
	db $29, $2A
	db $2B, $2C
	db $31, $32
	db $33, $34
PlayerCape_Climb2:
	db $42
	db $04
	db $88
	db $08
	db $2A, $29
	db $2C, $2B
	db $32, $31
	db $34, $33
PlayerCape_Hold:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $B0, $B2
	db $B1, $BB
pnt3_CAAE:
	dw pnt3_C326
	dw pnt3_C32E
	dw pnt3_C352
	dw pnt3_C32E
	dw pnt3_C4A6
	dw pnt3_C3BA
	dw pnt3_C3CE
	dw pnt3_C3D6
	dw pnt3_C3DE
	dw pnt3_C3B2
	dw pnt3_C3E6
	dw pnt3_C3EE
	dw pnt3_C3F6
	dw pnt3_CA46
	dw pnt3_CA4E
	dw pnt3_C3B2
	dw pnt3_C41E
pnt3_CAD0:
	dw pnt3_C426
	dw pnt3_C42E
	dw pnt3_C452
	dw pnt3_C42E
	dw pnt3_C4A6
	dw pnt3_C3BA
	dw pnt3_C3CE
	dw pnt3_C4B2
	dw pnt3_C3DE
	dw pnt3_C3EE
	dw pnt3_C4C2
	dw pnt3_C3EE
	dw pnt3_C4CA
	dw pnt3_CA46
	dw pnt3_CA4E
	dw pnt3_C3EE
	dw pnt3_C41E
pnt3_CAF2:
	dw Yoshi_AnimTbl
	dw Yoshi_AnimTbl
	dw Yoshi_AnimTbl
	dw Yoshi_AnimTbl
	dw Yoshi_AnimTbl
Yoshi_AnimTbl:
	dw Anim_YoshiStand ;Standing
	dw Anim_YoshiWalk ;Walking
	dw Anim_YoshiRun ;Running
	dw Anim_YoshiWalk ;The forbidden action
	dw Anim_YoshiJump ;Jumping
	dw Anim_YoshiJump ;Spinning. Unseen for obvious reasons
	dw Anim_YoshiTongueDuck ;Tongue out (Ducking)
	dw Anim_YoshiDucking ;Ducking
	dw Anim_YoshiStand ;Looking up
	dw Anim_YoshiJump ;Running jump
	dw Anim_YoshiFall ;Falling
	dw Anim_YoshiFall ;Sinking
	dw Anim_YoshiSwim ;Swimming
	dw Anim_YoshiTongue ;Tongue out (Idle)
	dw Anim_YoshiTongueWalk ;Tongue out (While moving)
	dw Anim_YoshiJump ;Flying. Technically used, although rarely seen due to a control bug
	dw Anim_YoshiStand ;Victory pose.
Anim_YoshiStand:
	dw Yoshi_Stand
	db $0A
	db $00
	dw Yoshi_Stand
	db $80
	db $00
Anim_YoshiWalk:
	dw Yoshi_Walk1
	db $04
	db $00
	dw Yoshi_Stand
	db $04
	db $00
	dw Yoshi_Walk1
	db $04
	db $00
	dw Yoshi_Stand
	db $80
	db $00
Anim_YoshiRun:
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $01
	db $00
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Stand
	db $80
	db $00
Anim_YoshiJump:
	dw Yoshi_Jump
	db $23
	db $00
	dw Yoshi_Walk1
	db $02
	db $00
	dw Yoshi_Jump
	db $81
	db $00
Anim_YoshiSwim:
	dw Yoshi_Jump
	db $01
	db $00
	dw Yoshi_Jump
	db $80
	db $00
Anim_YoshiDucking:
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $80
	db $00
Anim_YoshiFall:
	dw Yoshi_Walk1
	db $01
	db $00
	dw Yoshi_Walk1
	db $80
	db $00
	dw Yoshi_Stand
	db $0A
	db $00
	dw Yoshi_Stand
	db $80
	db $00
Anim_YoshiTongue:
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue4
	db $04
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Flinch1
	db $80
	db $00
Anim_YoshiTongueDuck:
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Duck
	db $01
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue4
	db $04
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Flinch1
	db $80
	db $00
Anim_YoshiTongueWalk:
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch1
	db $01
	db $00
	dw Yoshi_Flinch2
	db $01
	db $00
	dw Yoshi_Flinch2
	db $01
	db $00
	dw Yoshi_Flinch2
	db $01
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue4
	db $04
	db $00
	dw Yoshi_Tongue3
	db $02
	db $00
	dw Yoshi_Tongue2
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Tongue1
	db $02
	db $00
	dw Yoshi_Flinch1
	db $80
	db $00
Yoshi_Stand:
	db $04
	db $04
	db $91
	db $18
	db $FF, $76, $77, $FF
	db $78, $79, $7A, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
Yoshi_Walk1:
	db $04
	db $04
	db $93
	db $18
	db $FF, $F8, $F9, $FF
	db $FA, $FB, $EB, $FF
	db $FF, $EC, $ED, $EE
	db $FF, $FF, $EF, $F0
Yoshi_Jump:
	db $04
	db $04
	db $91
	db $18
	db $71, $72, $73, $FF
	db $FF, $74, $75, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $7B, $7C
Yoshi_Flinch1:
	db $04
	db $04
	db $91
	db $18
	db $71, $72, $73, $FF
	db $FF, $74, $75, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
Yoshi_Tongue1:
	db $04
	db $03
	db $9A
	db $18
	db $AB, $AC, $FF, $FF
	db $B8, $AF, $AE, $AD
	db $B6, $B5, $B4, $B3
Yoshi_Tongue2:
	db $05
	db $03
	db $9A
	db $20
	db $FF, $AB, $AC, $FF, $FF
	db $B2, $B0, $AF, $AE, $AD
	db $FF, $B6, $B5, $B4, $B3
Yoshi_Tongue3:
	db $06
	db $03
	db $9A
	db $28
	db $FF, $FF, $AB, $AC, $FF, $FF
	db $B2, $B1, $B0, $AF, $AE, $AD
	db $FF, $FF, $B6, $B5, $B4, $B3
Yoshi_Tongue4:
	db $07
	db $03
	db $9A
	db $30
	db $FF, $FF, $FF, $AB, $AC, $FF, $FF
	db $B2, $B1, $B1, $B0, $AF, $AE, $AD
	db $FF, $FF, $FF, $B6, $B5, $B4, $B3
Yoshi_Flinch2:
	db $04
	db $04
	db $93
	db $18
	db $F1, $F2, $F3, $FF
	db $F4, $F5, $F6, $FF
	db $FF, $FF, $F7, $EE
	db $FF, $FF, $EF, $F0
Yoshi_Duck:
	db $04
	db $04
	db $92
	db $18
	db $FF, $B8, $B9, $FF
	db $BA, $BB, $AB, $FF
	db $FF, $AC, $AD, $AE
	db $FF, $FF, $AF, $B0
pnt3_CD2C:
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
pnt3_CD36:
	dw pnt3_CD58
	dw pnt3_CD60
	dw pnt3_CD6C
	dw pnt3_CD60
	dw pnt3_CD78
	dw pnt3_CD78
	dw pnt3_CDA4
	dw pnt3_CD8C
	dw pnt3_CD58
	dw pnt3_CD78
	dw pnt3_CD94
	dw pnt3_CD94
	dw pnt3_CD84
	dw pnt3_CDB0
	dw pnt3_CDC4
	dw pnt3_CD78
	dw pnt3_CD58
pnt3_CD58:
	dw YoshiEat_Stand
	db $0A
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CD60:
	dw YoshiEat_Walk2
	db $04
	db $00
	dw YoshiEat_Stand
	db $04
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CD6C:
	dw YoshiEat_Stand
	db $01
	db $00
	dw YoshiEat_Walk2
	db $01
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CD78:
	dw YoshiEat_Jump
	db $23
	db $00
	dw YoshiEat_Walk2
	db $02
	db $00
	dw YoshiEat_Jump
	db $81
	db $00
pnt3_CD84:
	dw YoshiEat_Jump
	db $01
	db $00
	dw YoshiEat_Jump
	db $80
	db $00
pnt3_CD8C:
	dw YoshiEat_Duck
	db $01
	db $00
	dw YoshiEat_Duck
	db $80
	db $00
pnt3_CD94:
	dw YoshiEat_Walk2
	db $01
	db $00
	dw YoshiEat_Walk2
	db $80
	db $00
	dw YoshiEat_Stand
	db $0A
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CDA4:
	dw YoshiSpit_Duck
	db $04
	db $00
	dw YoshiSpit_Duck
	db $04
	db $00
	dw YoshiSpit_Duck
	db $80
	db $00
pnt3_CDB0:
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $80
	db $00
pnt3_CDC4:
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $02
	db $00
	dw YoshiSpit_Stand
	db $80
	db $00
YoshiEat_Stand:
	db $04
	db $05
	db $9B
	db $18
	db $FF, $FF, $F6, $FF
	db $F7, $F8, $F9, $FF
	db $FA, $FB, $FC, $FF
	db $FF, $FF, $FD, $F2
	db $FF, $FF, $EB, $F5
YoshiEat_Walk2:
	db $03
	db $04
	db $A3
	db $10
	db $FA, $F9, $FF
	db $FB, $FC, $FF
	db $FD, $F0, $EB
	db $FF, $F4, $F3
YoshiEat_Jump:
	db $04
	db $04
	db $9B
	db $18
	db $F7, $EC, $ED, $FF
	db $EE, $EF, $F0, $FF
	db $FF, $FF, $F1, $F2
	db $FF, $FF, $F3, $F4
YoshiEat_Duck:
	db $04
	db $04
	db $A0
	db $18
	db $FF, $36, $37, $FF
	db $38, $39, $3A, $FF
	db $FF, $3B, $3C, $3D
	db $FF, $FF, $3F, $35
YoshiSpit_Stand:
	db $04
	db $04
	db $91
	db $18
	db $FF, $7D, $7F, $FF
	db $FF, $6B, $6C, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
YoshiSpit_Duck:
	db $04
	db $04
	db $A0
	db $18
	db $FF, $2B, $2C, $FF
	db $2D, $2E, $2F, $FF
	db $FF, $30, $31, $32
	db $FF, $FF, $33, $34
pnt3_CE54:
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
pnt3_CE5E:
	dw pnt3_CE80
	dw pnt3_CE8C
	dw pnt3_CE98
	dw pnt3_CE8C
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CEA0
	dw pnt3_CE98
	dw pnt3_CE80
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CEA0
	dw pnt3_CEB4
	dw pnt3_CE98
	dw pnt3_CE80
pnt3_CE80:
	dw YoshiEat_Stand
	db $04
	db $00
	dw Yoshi_Stand
	db $04
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CE8C:
	dw YoshiEat_Walk2
	db $04
	db $00
	dw Yoshi_Stand
	db $04
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CE98:
	dw YoshiEat_Stand
	db $0A
	db $00
	dw YoshiEat_Stand
	db $80
	db $00
pnt3_CEA0:
	dw pnt3_CED8
	db $04
	db $00
	dw pnt3_CED8
	db $04
	db $00
	dw pnt3_CEF0
	db $04
	db $00
	dw pnt3_CEF0
	db $04
	db $00
	dw pnt3_CED8
	db $80
	db $00
pnt3_CEB4:
	dw pnt3_CED8
	db $02
	db $00
	dw pnt3_CED8
	db $02
	db $00
	dw pnt3_CF04
	db $02
	db $00
	dw pnt3_CF04
	db $02
	db $00
	dw pnt3_CEF0
	db $02
	db $00
	dw pnt3_CEF0
	db $02
	db $00
	dw pnt3_CF14
	db $02
	db $00
	dw pnt3_CF14
	db $02
	db $00
	dw pnt3_CED8
	db $80
	db $00
pnt3_CED8:
	db $04
	db $05
	db $A1
	db $18
	db $FF
	db $75
	db $76
	db $FF
	db $77
	db $78
	db $79
	db $FF
	db $7A
	db $7B
	db $7C
	db $FF
	db $FF
	db $7F
	db $7D
	db $72
	db $FF
	db $FF
	db $73
	db $74
pnt3_CEF0:
	db $04
	db $04
	db $A1
	db $18
	db $FF
	db $6B
	db $6C
	db $FF
	db $6D
	db $6E
	db $6F
	db $FF
	db $FF
	db $70
	db $71
	db $72
	db $FF
	db $FF
	db $73
	db $74
pnt3_CF04:
	db $03
	db $04
	db $A2
	db $10
	db $AB
	db $AC
	db $FF
	db $AD
	db $AE
	db $FF
	db $AF
	db $B0
	db $B1
	db $FF
	db $B2
	db $B3
pnt3_CF14:
	db $04
	db $04
	db $A2
	db $18
	db $FF
	db $B4
	db $B5
	db $FF
	db $B6
	db $B7
	db $B8
	db $FF
	db $FF
	db $B9
	db $BA
	db $B1
	db $FF
	db $FF
	db $B2
	db $B3
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
;SPECIAL WARP DATA
;This is used for special warps such as the bonus room and cannon pipes.
SpecialWarpSettings:
	dw pnt3_D07C
	dw pnt3_D080
	dw pnt3_D084
	dw pnt3_D088
	dw pnt3_D08C
	dw pnt3_D090
	dw pnt3_D094
	dw pnt3_D098
	dw pnt3_D09C
	dw pnt3_D0A0
	dw pnt3_D0A4
	dw pnt3_D0A8
	dw pnt3_D0AC
	dw pnt3_D0B0
	dw pnt3_D0B4
	dw pnt3_D0B8
	dw pnt3_D0BC
	dw pnt3_D0C0
	dw pnt3_D0C4
	dw pnt3_D0C8
	dw pnt3_D0CC
	dw pnt3_D0D0
	dw pnt3_D0D4
	dw pnt3_D0D8
	dw pnt3_D0DC
	dw pnt3_D0E0
	dw pnt3_D0E4
	dw pnt3_D0E8
;	dw SPWarp_BonusRoomSettings
	dw SPWarp_6_3_CannonSettings
	dw SPWarp_6_3_CannonSettings
	dw pnt3_D1D0
SpecialWarpCoords:
	dw pnt3_D0EC
	dw pnt3_D0F4
	dw pnt3_D0FC
	dw pnt3_D104
	dw pnt3_D10C
	dw pnt3_D114
	dw pnt3_D11C
	dw pnt3_D124
	dw pnt3_D12C
	dw pnt3_D134
	dw pnt3_D13C
	dw pnt3_D144
	dw pnt3_D14C
	dw pnt3_D154
	dw pnt3_D15C
	dw pnt3_D164
	dw pnt3_D16C
	dw pnt3_D174
	dw pnt3_D17C
	dw pnt3_D184
	dw pnt3_D18C
	dw pnt3_D194
	dw pnt3_D19C
	dw pnt3_D1A4
	dw pnt3_D1AC
	dw pnt3_D1B4
	dw pnt3_D1BC
	dw pnt3_D1C4
	dw SPWarp_BonusRoomPos
	dw SPWarp_6_3_CannonPos
	dw pnt3_D1DC
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
	db $00
	db $00
	db $1C
	db $00
pnt3_D080:
	db $01
	db $01
	db $1C
	db $01
pnt3_D084:
	db $02
	db $02
	db $1C
	db $02
pnt3_D088:
	db $03
	db $23
	db $23
	db $1D
pnt3_D08C:
	db $04
	db $04
	db $1D
	db $04
pnt3_D090:
	db $05
	db $05
	db $1D
	db $05
pnt3_D094:
	db $03
	db $27
	db $23
	db $1C
pnt3_D098:
	db $03
	db $23
	db $23
	db $1D
pnt3_D09C:
	db $08
	db $08
	db $1E
	db $08
pnt3_D0A0:
	db $49
	db $09
	db $1E
	db $09
pnt3_D0A4:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0A8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0AC:
	db $0C
	db $0C
	db $1F
	db $0C
pnt3_D0B0:
	db $0D
	db $0D
	db $1F
	db $0D
pnt3_D0B4:
	db $0E
	db $0E
	db $1F
	db $0E
pnt3_D0B8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0BC:
	db $10
	db $10
	db $20
	db $10
pnt3_D0C0:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0C4:
	db $52
	db $12
	db $20
	db $12
pnt3_D0C8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0CC:
	db $14
	db $14
	db $21
	db $14
pnt3_D0D0:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0D4:
	db $16
	db $15
	db $21
	db $16
pnt3_D0D8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0DC:
	db $18
	db $18
	db $22
	db $18
pnt3_D0E0:
	db $19
	db $19
	db $22
	db $19
pnt3_D0E4:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0E8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0EC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D0F4:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D0FC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D104:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D10C:
	db $0A
	db $01
	db $80
	db $A8
	db $FF
	db $11
	db $FF
	db $01
pnt3_D114:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D11C:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D124:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D12C:
	db $06
	db $00
	db $90
	db $58
	db $FF
	db $11
	db $FF
	db $00
pnt3_D134:
	db $03
	db $00
	db $70
	db $48
	db $FF
	db $0C
	db $FF
	db $00
pnt3_D13C:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D144:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D14C:
	db $0B
	db $01
	db $80
	db $C8
	db $FF
	db $11
	db $FF
	db $01
pnt3_D154:
	db $0B
	db $01
	db $70
	db $A8
	db $FF
	db $11
	db $00
	db $01
pnt3_D15C:
	db $06
	db $01
	db $70
	db $38
	db $FF
	db $11
	db $FF
	db $01
pnt3_D164:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D16C:
	db $0B
	db $01
	db $80
	db $98
	db $FF
	db $11
	db $00
	db $01
pnt3_D174:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D17C:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $0E
	db $FF
	db $01
pnt3_D184:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D18C:
	db $00
	db $01
	db $80
	db $B0
	db $FF
	db $11
	db $00
	db $01
pnt3_D194:
	db $00
	db $01
	db $40
	db $C0
	db $FF
	db $00
	db $00
	db $01
pnt3_D19C:
	db $0F
	db $01
	db $80
	db $98
	db $FF
	db $11
	db $00
	db $01
pnt3_D1A4:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D1AC:
	db $00
	db $01
	db $80
	db $B0
	db $FF
	db $11
	db $00
	db $01
pnt3_D1B4:
	db $08
	db $01
	db $60
	db $18
	db $FF
	db $11
	db $00
	db $01
pnt3_D1BC:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D1C4:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
SPWarp_6_3_CannonSettings:
	db $16
	db $15
	db $21
	db $16
pnt3_D1D0:
	db $16
	db $15
	db $21
	db $16
SPWarp_6_3_CannonPos:
	db $06
	db $01
	db $90
	db $5C
	db $FF
	db $11
	db $00
	db $01
pnt3_D1DC:
	db $10
	db $01
	db $80
	db $5C
	db $FF
	db $11
	db $00
	db $01
SPWarp_BonusRoomSettings:
	db $23
	db $22
	db $2B
	db $25
SPWarp_BonusRoomPos:
	db $00
	db $01
	db $10
	db $B0
	db $FF
	db $00
	db $FF
	db $01
;End of special warp data
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $C0
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $80 ;Why the hell is this here? Seriously, why? All this does is prevent me from padding the rest of this bank.
