.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export tbl6_8D45
tbl6_8D45:
	.word ofs_90CF
	.word ofs_90ED
	.word ofs_90FC
	.word ofs_9129
	.word ofs_9135
	.word ofs_9159 ; unlogged
	.word ofs_9168 ; unlogged
	.word ofs_9177 ; unlogged
	.word ofs_90DE ; unlogged
	.word ofs_910B
	.word ofs_911A
	.word ofs_9141
	.word ofs_914D
	.word ofs_9186 ; unlogged
	.word ofs_9195 ; unlogged
	.word ofs_91A4 ; unlogged
	.word ofs_91B3
	.word ofs_91C6
	.word ofs_91E2
	.word ofs_91F5
	.word ofs_9211
	.word ofs_9224
	.word ofs_9237
	.word ofs_9246
	.word ofs_925D
	.word ofs_9274
	.word ofs_928B
	.word ofs_92A2
	.word ofs_92B9
	.word ofs_8F4A
	.word ofs_8F5D
	.word ofs_8F70
	.word ofs_8F83
	.word ofs_8F96
	.word ofs_8FA9
	.word ofs_8FBC
	.word ofs_8FCF ; unlogged
	.word ofs_8FE2
	.word ofs_8FF5
	.word ofs_9008
	.word ofs_901B
	.word ofs_9032
	.word ofs_9049
	.word ofs_9058
	.word ofs_9067
	.word ofs_9076
	.word ofs_90CF ; unlogged
	.word ofs_90CF ; unlogged
	.word ofs_90CF ; unlogged
	.word ofs_90CF ; unlogged
	.word ofs_9089
	.word ofs_909C
	.word ofs_90AF
	.word ofs_90B6
	.word ofs_90BD
	.word ofs_90C4
	.word ofs_90CB
.export tbl6_8DB7
tbl6_8DB7:
	.word wendyLook1
	.word wendyLook2
	.word wendyStare
	.word wendySideLook
	.word wendyMouthOpen
	.word wendyWeirdFace1
	.word wendyWeirdFace2
	.word ofs_8E6A
	.word ofs_8E7D
	.word ofs_8E90
	.word ofs_8EA3
	.word ofs_8EB6
	.word ofs_8ECD
	.word ofs_8EE4
	.word ofs_8F02
	.word ofs_8F02
	.word ofs_8F11
	.word ofs_8F37 ; unlogged
	.word ofs_8F37 ; unlogged
	.word ofs_8F37 ; unlogged
	.word ofs_8F37 ; unlogged
	.word ofs_8F24
	.word ofs_8F37
wendyLook1:
	.byte $04 ; Tile Width
	.byte $04 ; Tile Height
	.byte $B8 ; 1K CHR Bank
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $0F, $10, $FF
	.byte $22, $26, $27, $25
	.byte $32, $36, $37, $35
wendyLook2:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $0D, $0E, $FF
	.byte $22, $23, $24, $25
	.byte $32, $33, $34, $35
wendyStare:
	.byte $04
	.byte $04
	.byte $B8
	.byte $01, $02, $03, $FF
	.byte $04, $05, $06, $FF
	.byte $11, $12, $13, $FF
	.byte $FF, $28, $29, $FF
wendySideLook:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $07, $08, $FF
	.byte $14, $15, $16, $FF
	.byte $FF, $28, $29, $FF
wendyMouthOpen:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF, $FF, $FF, $FF
	.byte $09, $0A, $FF, $FF
	.byte $17, $18, $19, $FF
	.byte $FF, $28, $29, $FF
wendyWeirdFace1:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $42, $43, $FF
	.byte $4E, $4F, $50, $51
	.byte $5C, $5D, $5E, $5F
wendyWeirdFace2:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $44, $45, $FF
	.byte $4E, $52, $53, $51
	.byte $5C, $60, $61, $5F
ofs_8E6A:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $FF
	.byte $30
	.byte $31
	.byte $FF
ofs_8E7D:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $6A
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $75
	.byte $76
	.byte $77
	.byte $FF
ofs_8E90:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $66
	.byte $67
	.byte $68
	.byte $69
	.byte $5C
	.byte $72
	.byte $73
	.byte $74
ofs_8EA3:
	.byte $04
	.byte $04
	.byte $B9
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $FF
	.byte $64
	.byte $65
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $70
	.byte $71
ofs_8EB6:
	.byte $04
	.byte $05
	.byte $B9
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $66
	.byte $67
	.byte $68
	.byte $69
	.byte $5C
	.byte $72
	.byte $73
	.byte $74
	.byte $FF
	.byte $78
	.byte $79
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_8ECD:
	.byte $04
	.byte $05
	.byte $B9
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $FF
	.byte $64
	.byte $65
	.byte $FF
	.byte $6E
	.byte $6F
	.byte $70
	.byte $71
	.byte $FF
	.byte $78
	.byte $79
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_8EE4:
	.byte $04 ; wendy dummy mappings
	.byte $03
	.byte $B9
	.byte $FF, $FF, $FF, $FF
	.byte $4A, $4B, $4C, $4D
	.byte $58, $59, $5A, $5B
; Unused Wendy dummy frame
	.byte $04
	.byte $03
	.byte $B8
	.byte $FF, $FF, $FF, $FF
	.byte $38, $39, $3A, $3B
	.byte $3C, $3D, $3E, $3F
ofs_8F02:
	.byte $04
	.byte $03
	.byte $B9
	.byte $FF, $40, $41, $FF
	.byte $46, $47, $48, $49
	.byte $54, $55, $56, $57
ofs_8F11:
	.byte $04
	.byte $04
	.byte $B8
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $0B, $0C, $FF
	.byte $1A, $1B, $1C, $1D
	.byte $FF, $2A, $2B, $FF
ofs_8F24:
	.byte $04
	.byte $04
	.byte $BA
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF
	.byte $80, $81, $82, $83
	.byte $88, $89, $8A, $8B
ofs_8F37:
	.byte $04
	.byte $04
	.byte $BA
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $FF, $FF, $FF
	.byte $84, $85, $86, $87
	.byte $FF, $8C, $8D, $FF
ofs_8F4A:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $03, $04, $FF
	.byte $0E, $0F, $10, $11
	.byte $1D, $1E, $1F, $20
ofs_8F5D:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $05, $06, $FF
	.byte $0E, $12, $13, $11
	.byte $1D, $21, $22, $20
ofs_8F70:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $01
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $07
	.byte $08
	.byte $FF
	.byte $14
	.byte $15
	.byte $16
	.byte $FF
	.byte $FF
	.byte $23
	.byte $24
	.byte $FF
ofs_8F83:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $02
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $FF
	.byte $17
	.byte $18
	.byte $19
	.byte $FF
	.byte $FF
	.byte $25
	.byte $24
	.byte $FF
ofs_8F96:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $FF
	.byte $1A
	.byte $1B
	.byte $1C
	.byte $FF
	.byte $FF
	.byte $25
	.byte $24
	.byte $FF
ofs_8FA9:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $26
	.byte $27
	.byte $FF
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $35
	.byte $36
	.byte $37
	.byte $38
ofs_8FBC:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $28
	.byte $29
	.byte $FF
	.byte $2B
	.byte $2F
	.byte $30
	.byte $2E
	.byte $35
	.byte $39
	.byte $3A
	.byte $38
ofs_8FCF:
	.byte $04
	.byte $04
	.byte $B4
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $28
	.byte $2A
	.byte $FF
	.byte $31
	.byte $32
	.byte $33
	.byte $34
	.byte $FF
	.byte $3B
	.byte $3C
	.byte $FF
ofs_8FE2:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $48
	.byte $49
	.byte $4A
	.byte $4B
	.byte $FF
	.byte $54
	.byte $55
	.byte $FF
ofs_8FF5:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
ofs_9008:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $46
	.byte $47
	.byte $FF
	.byte $50
	.byte $51
	.byte $52
	.byte $53
ofs_901B:
	.byte $04
	.byte $05
	.byte $B5
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $45
	.byte $4C
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $56
	.byte $57
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
ofs_9032:
	.byte $04
	.byte $05
	.byte $B5
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $46
	.byte $47
	.byte $FF
	.byte $50
	.byte $51
	.byte $52
	.byte $53
	.byte $56
	.byte $57
	.byte $58
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
ofs_9049:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $5E
	.byte $5F
	.byte $FF
	.byte $64
	.byte $65
	.byte $66
	.byte $67
	.byte $73
	.byte $74
	.byte $75
	.byte $76
ofs_9058:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $68
	.byte $69
	.byte $6A
	.byte $FF
	.byte $77
	.byte $78
	.byte $79
	.byte $FF
ofs_9067:
	.byte $04
	.byte $03
	.byte $B5
	.byte $FF
	.byte $60
	.byte $61
	.byte $FF
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $6E
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
ofs_9076:
	.byte $04
	.byte $04
	.byte $B5
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $62
	.byte $63
	.byte $FF
	.byte $6F
	.byte $70
	.byte $71
	.byte $72
	.byte $FF
	.byte $7E
	.byte $7F
	.byte $FF
ofs_9089:
	.byte $04
	.byte $04
	.byte $B7
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $BF
	.byte $C0
	.byte $C1
	.byte $C2
	.byte $FF
	.byte $C7
	.byte $C8
	.byte $FF
ofs_909C:
	.byte $04
	.byte $04
	.byte $B7
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C3
	.byte $C4
	.byte $C5
	.byte $C6
	.byte $C9
	.byte $CA
	.byte $CB
	.byte $CC
ofs_90AF:
	.byte $02 ; diagonal podoboo mappings
	.byte $02
	.byte $A7
	.byte $2B
	.byte $2C
	.byte $36
	.byte $37
ofs_90B6:
	.byte $02
	.byte $02
	.byte $A7
	.byte $2D
	.byte $2E
	.byte $38
	.byte $39
ofs_90BD:
	.byte $02
	.byte $02
	.byte $A7
	.byte $36
	.byte $37
	.byte $2B
	.byte $2C
ofs_90C4:
	.byte $02
	.byte $02
	.byte $A7
	.byte $38
	.byte $39
	.byte $2D
	.byte $2E
ofs_90CB:
	.byte $01
	.byte $01
	.byte $A7
	.byte $FF
ofs_90CF:
	.byte $03 ; morton mappings (7 unused frames)
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $28
	.byte $29
	.byte $2A
ofs_90DE:
	.byte $03
	.byte $04
	.byte $B0
	.byte $28
	.byte $29
	.byte $2A
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_90ED:
	.byte $03
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $2B
	.byte $2C
	.byte $2D
ofs_90FC:
	.byte $03
	.byte $04
	.byte $B0
	.byte $01
	.byte $FF
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $18
	.byte $19
	.byte $1A
	.byte $2E
	.byte $2F
	.byte $30
ofs_910B:
	.byte $03
	.byte $04
	.byte $B0
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_911A:
	.byte $03
	.byte $04
	.byte $B0
	.byte $2E
	.byte $2F
	.byte $30
	.byte $18
	.byte $19
	.byte $1A
	.byte $09
	.byte $0A
	.byte $0B
	.byte $01
	.byte $FF
	.byte $FF
ofs_9129:
	.byte $03
	.byte $03
	.byte $B0
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $31
	.byte $32
	.byte $33
ofs_9135:
	.byte $03
	.byte $03
	.byte $B0
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $1E
	.byte $1C
	.byte $1D
	.byte $34
	.byte $32
	.byte $33
ofs_9141:
	.byte $03
	.byte $03
	.byte $B0
	.byte $31
	.byte $32
	.byte $33
	.byte $1B
	.byte $1C
	.byte $1D
	.byte $0C
	.byte $0D
	.byte $0E
ofs_914D:
	.byte $03
	.byte $03
	.byte $B0
	.byte $34
	.byte $32
	.byte $33
	.byte $1E
	.byte $1C
	.byte $1D
	.byte $0C
	.byte $0D
	.byte $0E
ofs_9159:
	.byte $03
	.byte $04
	.byte $B0
	.byte $FF
	.byte $02
	.byte $03
	.byte $0F
	.byte $10
	.byte $11
	.byte $1F
	.byte $20
	.byte $21
	.byte $35
	.byte $36
	.byte $37
ofs_9168:
	.byte $03
	.byte $04
	.byte $B0
	.byte $04
	.byte $05
	.byte $06
	.byte $12
	.byte $13
	.byte $14
	.byte $22
	.byte $23
	.byte $24
	.byte $38
	.byte $39
	.byte $3A
ofs_9177:
	.byte $03
	.byte $04
	.byte $B0
	.byte $07
	.byte $08
	.byte $FF
	.byte $15
	.byte $16
	.byte $17
	.byte $25
	.byte $26
	.byte $27
	.byte $3B
	.byte $3C
	.byte $3D
ofs_9186:
	.byte $03
	.byte $04
	.byte $B0
	.byte $35
	.byte $36
	.byte $37
	.byte $1F
	.byte $20
	.byte $21
	.byte $0F
	.byte $10
	.byte $11
	.byte $FF
	.byte $02
	.byte $03
ofs_9195:
	.byte $03
	.byte $04
	.byte $B0
	.byte $38
	.byte $39
	.byte $3A
	.byte $22
	.byte $23
	.byte $24
	.byte $12
	.byte $13
	.byte $14
	.byte $04
	.byte $05
	.byte $06
ofs_91A4:
	.byte $03
	.byte $04
	.byte $B0
	.byte $3B
	.byte $3C
	.byte $3D
	.byte $25
	.byte $26
	.byte $27
	.byte $15
	.byte $16
	.byte $17
	.byte $07
	.byte $08
	.byte $FF
ofs_91B3:
	.byte $04
	.byte $04
	.byte $B1
	.byte $45
	.byte $46
	.byte $47
	.byte $48
	.byte $55
	.byte $56
	.byte $57
	.byte $58
	.byte $67
	.byte $68
	.byte $69
	.byte $6A
	.byte $FF
	.byte $76
	.byte $77
	.byte $FF
ofs_91C6:
	.byte $05
	.byte $05
	.byte $B1
	.byte $FF
	.byte $40
	.byte $41
	.byte $FF
	.byte $FF
	.byte $49
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $FF
	.byte $59
	.byte $5A
	.byte $5B
	.byte $5C
	.byte $5D
	.byte $6B
	.byte $6C
	.byte $6D
	.byte $6E
	.byte $FF
	.byte $FF
	.byte $79
	.byte $78
	.byte $FF
	.byte $FF
ofs_91E2:
	.byte $04
	.byte $04
	.byte $B1
	.byte $4D
	.byte $4E
	.byte $4F
	.byte $50
	.byte $5E
	.byte $5F
	.byte $60
	.byte $61
	.byte $6F
	.byte $70
	.byte $71
	.byte $72
	.byte $FF
	.byte $7A
	.byte $7B
	.byte $7C
ofs_91F5:
	.byte $05
	.byte $05
	.byte $B1
	.byte $FF
	.byte $42
	.byte $43
	.byte $44
	.byte $FF
	.byte $51
	.byte $52
	.byte $53
	.byte $54
	.byte $FF
	.byte $62
	.byte $63
	.byte $64
	.byte $65
	.byte $66
	.byte $FF
	.byte $73
	.byte $74
	.byte $75
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $7D
	.byte $FF
	.byte $FF
ofs_9211:
	.byte $04
	.byte $04
	.byte $B2
	.byte $FF
	.byte $80
	.byte $81
	.byte $FF
	.byte $86
	.byte $87
	.byte $88
	.byte $89
	.byte $96
	.byte $97
	.byte $98
	.byte $99
	.byte $A6
	.byte $A7
	.byte $A8
	.byte $A9
ofs_9224:
	.byte $04
	.byte $04
	.byte $B2
	.byte $FF
	.byte $82
	.byte $83
	.byte $FF
	.byte $8A
	.byte $8B
	.byte $8C
	.byte $8D
	.byte $9A
	.byte $9B
	.byte $9C
	.byte $9D
	.byte $AA
	.byte $AB
	.byte $AC
	.byte $AD
ofs_9237:
	.byte $03
	.byte $04
	.byte $B2
	.byte $84
	.byte $85
	.byte $FF
	.byte $8E
	.byte $8F
	.byte $90
	.byte $9E
	.byte $9F
	.byte $A0
	.byte $AE
	.byte $AF
	.byte $B0
ofs_9246:
	.byte $05
	.byte $04
	.byte $B2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $91
	.byte $92
	.byte $93
	.byte $94
	.byte $95
	.byte $A1
	.byte $A2
	.byte $A3
	.byte $A4
	.byte $A5
	.byte $B1
	.byte $B2
	.byte $B3
	.byte $B4
	.byte $B5
ofs_925D:
	.byte $05
	.byte $04
	.byte $B2
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $B6
	.byte $B7
	.byte $B8
	.byte $B9
	.byte $BA
	.byte $BB
	.byte $BC
	.byte $BD
	.byte $BE
	.byte $BF
ofs_9274:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C0
	.byte $C1
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C2
	.byte $C3
	.byte $FF
ofs_928B:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C5
	.byte $C6
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CB
	.byte $CC
	.byte $FF
ofs_92A2:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C7
	.byte $C8
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CD
	.byte $CE
	.byte $FF
ofs_92B9:
	.byte $05
	.byte $04
	.byte $B3
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $C9
	.byte $CA
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $CF
	.byte $D0
	.byte $FF
