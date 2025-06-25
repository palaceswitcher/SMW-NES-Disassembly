ofs_8100:
	.byte 0, 0
	ofs_8100Loop:
	instjump ofs_8100Loop
ofs_8104:
	.byte $05
	.byte $0F
	.byte $02
	.byte $0C
	.byte $04
	.byte $04
	.byte $08
	.byte $02
	.byte $08
	.byte $01
	.byte $FF
	.byte $00
ofs_8110:
	.byte $01
	.byte $06
	.byte $FE
	.byte $04
	.byte $FF
	.byte $FE
ofs_8116:
	.byte $01
	.byte $04
	.byte $FE
	.byte $02
	.byte $FF
	.byte $FE
ofs_811C:
	.byte $08
	.byte $00
	.byte $08
	.byte $40
	.byte $FE
	.byte $80
	.byte $FF
	.byte $FE
ofs_8124:
	.byte $01
	.byte $14
	.byte $01
	.byte $0A
	.byte $01
	.byte $05
	.byte $01
	.byte $03
	.byte $0A
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $00
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $FF
	.byte $F0
ofs_8140:
	.byte $06
	.byte $0F
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
ofs_8146:
	.byte $FE
	.byte $80
	.byte $FF
	.byte $FE
ofs_814A:
	.byte $01, $01
	.byte $01, $03
	.byte $02, $05
	.byte $03, $04
	.byte $06, $03
	.byte $FE, $02
	.byte $FF
	.byte $FE
ofs_8158:
	.byte $FE
	.byte $40
	.byte $FF
	.byte $FE
ofs_815C:
	.byte $49
	.byte $10
	.byte $42
	.byte $08
	.byte $04
	.byte $04
	.byte $C8
	.byte $02
	.byte $01
	.byte $02
	.byte $02
	.byte $04
	.byte $01
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $FE
	.byte $02
	.byte $FC
	.byte $01
	.byte $FE
	.byte $02
	.byte $00
	.byte $FF
	.byte $F0
ofs_8176:
	.byte $06
	.byte $0F
	.byte $02
	.byte $00
	.byte $03
	.byte $0F
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
ofs_8180:
	.byte $01
	.byte $03
	.byte $01
	.byte $06
	.byte $01
	.byte $03
	.byte $FE
	.byte $01
	.byte $FF
	.byte $FE
ofs_818A:
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $01
	.byte $02
	.byte $FE
	.byte $01
	.byte $FF
	.byte $FE
ofs_8194:
	.byte $01
	.byte $00
	.byte $01
	.byte $40
	.byte $FE
	.byte $80
	.byte $FF
	.byte $FE
ofs_819C:
	.byte $02
	.byte $00
	.byte $02
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $01
	.byte $FF
	.byte $F8
ofs_81A6:
	.byte $0A
	.byte $0F
	.byte $FE
	.byte $00
	.byte $FF
	.byte $FE
Vol_LongEcho1:
	instrle 6, 1
	instrle 4, 17
	instrle 1, 2
	instrle 3, 1
	instrle 2, 17
	instrle 1, 2
	instrle 2, 1
	instrle 1, 17
	instrle 1, 2
	Vol_LongEcho1Loop:
	instrle 1, 254
	instjump Vol_LongEcho1Loop ; Repeat previous RLE command

; This was likely encoded wrong
ofs_81C2:
	.byte $00 ; This probably shouldn't be here
	dutyrle 1, 1
	dutyrle 2, 1
	dutyrle 1, 1
	.byte $10, $00
	.byte $FF, -10

ofs_81CD:
	.byte $12, $0F
	.byte $FE, $00
	.byte $01, $80
	.byte $01, $40
	.byte $FE, $00
	.byte $FF, $FE
ofs_81D9:
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $01
	.byte $08
	.byte $FE
	.byte $04
	.byte $FF
	.byte $FE
ofs_81E3:
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $FE
	.byte $02
	.byte $FF
	.byte $FE
ofs_81ED:
	.byte $03
	.byte $01
	.byte $03
	.byte $02
	.byte $03
	.byte $01
	.byte $03
	.byte $00
	.byte $FF
	.byte $F8
ofs_81F7:
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $FE
	.byte $00
	.byte $FF
	.byte $00
ofs_81FF:
	.byte $FE
	.byte $0F
	.byte $FF
	.byte $FE
ofs_8203:
	.byte $01
	.byte $08
	.byte $01
	.byte $06
	.byte $11
	.byte $04
	.byte $01
	.byte $00
	.byte $01
	.byte $04
	.byte $01
	.byte $03
	.byte $11
	.byte $02
	.byte $01
	.byte $00
	.byte $01
	.byte $02
	.byte $12
	.byte $01
	.byte $01
	.byte $00
	.byte $13
	.byte $01
	.byte $FE
	.byte $00
	.byte $FF
	.byte $FE
ofs_821F:
	.byte $01
	.byte $00
	.byte $01
	.byte $40
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $10
	.byte $00
	.byte $FF
	.byte $F6
ofs_822B:
	.byte $01
	.byte $08
	.byte $01
	.byte $06
	.byte $01
	.byte $04
	.byte $01
	.byte $03
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $0E
	.byte $00
	.byte $FF
	.byte $F2
ofs_823B:
	.byte $28
	.byte $0F
	.byte $FE
	.byte $00
	.byte $FF
	.byte $FE
ofs_8241:
	.byte $FE
	.byte $04
	.byte $FF
	.byte $FE
ofs_8245:
	.byte $FE
	.byte $02
	.byte $FF
	.byte $FE
ofs_8249:
	.byte $01
	.byte $80
	.byte $FE
	.byte $00
	.byte $FF
	.byte $FE
ofs_824F:
	.byte $01
	.byte $0F
	.byte $01
	.byte $0E
	.byte $02
	.byte $0D
	.byte $02
	.byte $0C
	.byte $02
	.byte $0B
	.byte $03
	.byte $0A
	.byte $03
	.byte $09
	.byte $03
	.byte $08
	.byte $03
	.byte $07
	.byte $04
	.byte $06
	.byte $0E
	.byte $05
	.byte $04
	.byte $04
	.byte $04
	.byte $03
	.byte $DE
	.byte $02
	.byte $05
	.byte $01
	.byte $FF
	.byte $00
ofs_826F:
	.byte $01
	.byte $00
	.byte $FE
	.byte $0F
	.byte $FF
	.byte $FE
ofs_8275:
	.byte $0A
	.byte $00
	.byte $03
	.byte $01
	.byte $05
	.byte $00
	.byte $FF
	.byte $FC
ofs_827D:
	.byte $01
	.byte $04
	.byte $0F
	.byte $07
	.byte $0F
	.byte $06
	.byte $0F
	.byte $04
	.byte $0F
	.byte $03
	.byte $0F
	.byte $02
	.byte $0F
	.byte $01
	.byte $FF
	.byte $00
ofs_828D:
	.byte $FE
	.byte $80
	.byte $FF
	.byte $FE
ofs_8291:
	.byte $FF
	.byte $01
ofs_8293:
	.byte $01
	.byte $F6
	.byte $0A
	.byte $00
	.byte $03
	.byte $03
	.byte $03
	.byte $00
	.byte $FF
	.byte $FC
ofs_829D:
	.byte $02
	.byte $0B
	.byte $03
	.byte $0A
	.byte $03
	.byte $09
	.byte $03
	.byte $08
	.byte $03
	.byte $07
	.byte $04
	.byte $06
	.byte $0E
	.byte $05
	.byte $04
	.byte $04
	.byte $04
	.byte $03
	.byte $DE
	.byte $02
	.byte $05
	.byte $01
	.byte $FF
	.byte $00
ofs_82B5:
	.byte $01
	.byte $08
	.byte $01
	.byte $04
	.byte $01
	.byte $02
	.byte $FE
	.byte $01
	.byte $FF
	.byte $FE
ofs_82BF:
	.byte $01
	.byte $C0
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $03
	.byte $00
	.byte $FF
	.byte $F8
ofs_82C9:
	.byte $01
	.byte $04
	.byte $01
	.byte $08
	.byte $FE
	.byte $04
	.byte $FF
	.byte $FE
ofs_82D1:
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $01
	.byte $08
	.byte $01
	.byte $04
	.byte $01
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $02
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $00
	.byte $FF
	.byte $00
ofs_82FD:
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $04
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $02
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $00
	.byte $FF
	.byte $00
ofs_831B:
	ofs_831BLoop:
	dutyrle 3, 1
	dutyrle 2, 1
	dutyrle 1, 1
	dutyrle 0 ,1
	dutyrle 1, 1
	instjump ofs_831BLoop ; Loop at start
ofs_8327:
	.byte $01
	.byte $0E
	.byte $04
	.byte $0F
	.byte $01
	.byte $0C
	.byte $04
	.byte $0E
	.byte $01
	.byte $0B
	.byte $03
	.byte $0C
	.byte $FE
	.byte $0A
	.byte $FF
	.byte $FE
ofs_8337:
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $01
	.byte $C0
	.byte $FF
	.byte $F6
ofs_833F:
	.byte $FE
	.byte $80
	.byte $FF
	.byte $00
ofs_8343:
	.byte $01, $00
	.byte $01, $FE
	.byte $01, $FE
	.byte $01, $FD
	.byte $01, $FC
	.byte $FF, $F6
ofs_834F:
	.byte $02
	.byte $04
	.byte $02
	.byte $02
	.byte $01
	.byte $04
	.byte $02
	.byte $02
	.byte $02
	.byte $01
	.byte $01
	.byte $02
	.byte $03
	.byte $01
	.byte $FF
	.byte $00
Vol_PlinkEcho:
	.byte $01, $0F
	.byte $02, $08
	.byte $02, $04
	.byte $01, $08
	.byte $02, $04
	.byte $02, $02
	.byte $01, $04
	.byte $02, $02
	.byte $02, $01
	.byte $01, $02
	.byte $03, $01
	.byte $FE
	.byte $00
	.byte $FF
	.byte $FE
ofs_8379:
	.byte $03
	.byte $00
	.byte $03
	.byte $40
	.byte $04
	.byte $80
	.byte $FF
	.byte $FA
ofs_8381:
	.byte $01
	.byte $00
	.byte $01
	.byte $14
	.byte $01
	.byte $04
	.byte $01
	.byte $18
	.byte $01
	.byte $08
	.byte $01
	.byte $1C
	.byte $01
	.byte $10
	.byte $01
	.byte $24
	.byte $01
	.byte $20
	.byte $01
	.byte $34
	.byte $FF
	.byte $EC
ofs_8397:
	.byte $01
	.byte $00
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $01
	.byte $C0
	.byte $FF
	.byte $F6
ofs_83A1:
	.byte $01
	.byte $0F
	.byte $05
	.byte $00
	.byte $05
	.byte $0E
	.byte $05
	.byte $00
	.byte $05
	.byte $0A
	.byte $05
	.byte $00
	.byte $05
	.byte $04
	.byte $FE
	.byte $00
	.byte $FF
	.byte $F6
ofs_83B3:
	.byte $05
	.byte $0F
	.byte $05
	.byte $0C
	.byte $05
	.byte $0A
	.byte $05
	.byte $08
	.byte $0A
	.byte $04
	.byte $0A
	.byte $02
	.byte $0A
	.byte $01
	.byte $0A
	.byte $00
	.byte $A0
	.byte $01
	.byte $FF
	.byte $00
ofs_83C7:
	.byte $05
	.byte $01
	.byte $05
	.byte $01
	.byte $05
	.byte $02
	.byte $05
	.byte $03
	.byte $05
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $05
	.byte $07
	.byte $05
	.byte $08
	.byte $05
	.byte $09
	.byte $05
	.byte $0A
	.byte $05
	.byte $0B
	.byte $05
	.byte $0C
	.byte $05
	.byte $0D
	.byte $05
	.byte $0E
	.byte $05
	.byte $0F
	.byte $05
	.byte $0F
	.byte $05
	.byte $0E
	.byte $05
	.byte $0D
	.byte $05
	.byte $0C
	.byte $05
	.byte $0B
	.byte $05
	.byte $0A
	.byte $05
	.byte $09
	.byte $05
	.byte $08
	.byte $05
	.byte $07
	.byte $05
	.byte $06
	.byte $05
	.byte $05
	.byte $05
	.byte $04
	.byte $05
	.byte $03
	.byte $05
	.byte $02
	.byte $05
	.byte $01
	.byte $05
	.byte $01
	.byte $A0
	.byte $01
	.byte $FF
	.byte $00
ofs_840B:
	.byte $FE
	.byte $0F
	.byte $FF
	.byte $00
ofs_840F:
	.byte $01
	.byte $00
	.byte $FF
	.byte $00
ofs_8413:
	.byte $04
	.byte $F6
	.byte $04
	.byte $EC
	.byte $1E
	.byte $E2
	.byte $04
	.byte $D8
	.byte $04
	.byte $E2
	.byte $04
	.byte $EC
	.byte $04
	.byte $F6
	.byte $04
	.byte $00
	.byte $FF
	.byte $F0
ofs_8425:
	.byte $01
	.byte $05
	.byte $FE
	.byte $03
	.byte $FF
	.byte $FE
ofs_842B:
	.byte $01
	.byte $80
	.byte $FE
	.byte $40
	.byte $FF
	.byte $FE
ofs_8431:
	.byte $03
	.byte $00
	.byte $0F
	.byte $01
	.byte $FF
	.byte $FC
ofs_8437:
	.byte $03
	.byte $01
	.byte $03
	.byte $02
	.byte $FF
	.byte $FC
ofs_843D:
	instrle 35, 8
	instrle 25, 7
	instrle 15, 6
	instrle 15, 5
	instrle 15, 4
	instrle 15, 3
	instrle 15, 2
	instrle -1, 1
	.byte $FE
ofs_844E:
	instrle 7, 35
	instrle 6, 25
	instrle 5, 15
	instrle 4, 15
	instrle 3, 15
	instrle 2, 15
	ofs_844ELoop:
	instrle 1, 15
	instjump ofs_844ELoop

; volume
ofs_845E:
	instrle 15, 254
	ofs_845ELoop:
	instjump ofs_845ELoop
ofs_8462:
	.byte $01, $0F
	.byte $02, $08
	.byte $04, $04
	.byte $08, $02
	.byte $08, $01
	.byte $FF
	.byte $00
ofs_846E:
	.byte $FE
	.byte $80
	.byte $FF
	.byte $00
ofs_8472:
	.byte $01
	.byte $00
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $FD
	.byte $01
	.byte $FD
	.byte $01
	.byte $FD
	.byte $01
	.byte $FC
	.byte $FF
	.byte $F6
ofs_8486:
	.byte $02
	.byte $08
	.byte $02
	.byte $07
	.byte $02
	.byte $06
	.byte $02
	.byte $05
	.byte $02
	.byte $07
	.byte $02
	.byte $06
	.byte $02
	.byte $05
	.byte $02
	.byte $04
	.byte $03
	.byte $06
	.byte $03
	.byte $05
	.byte $03
	.byte $04
	.byte $03
	.byte $03
	.byte $03
	.byte $05
	.byte $03
	.byte $04
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $03
	.byte $04
	.byte $03
	.byte $03
	.byte $03
	.byte $02
	.byte $03
	.byte $01
	.byte $FF
	.byte $14
ofs_84B0:
	.byte $FE
	.byte $80
	.byte $FF
	.byte $00
ofs_84B4:
	.byte $01
	.byte $00
	.byte $01
	.byte $FE
	.byte $01
	.byte $FE
	.byte $01
	.byte $FD
	.byte $01
	.byte $FC
	.byte $FF
	.byte $F6
ofs_84C0:
	.byte $05
	.byte $0F
	.byte $02
	.byte $0C
	.byte $04
	.byte $04
	.byte $08
	.byte $02
	.byte $08
	.byte $01
	.byte $FF
	.byte $00
ofs_84CC:
	dutyrle 2, 254
	ofs_84CCLoop:
	instjump ofs_84CCLoop
ofs_84D0:
	.byte $04
	.byte $10
	.byte $04
	.byte $0F
	.byte $04
	.byte $0E
	.byte $04
	.byte $0C
	.byte $04
	.byte $0B
	.byte $04
	.byte $0A
	.byte $FF
	.byte $00
ofs_84DE:
	.byte $02
	.byte $10
	.byte $02
	.byte $0F
	.byte $01
	.byte $0E
	.byte $02
	.byte $0D
	.byte $02
	.byte $08
	.byte $01
	.byte $07
	.byte $03
	.byte $06
	.byte $FF
	.byte $FA
ofs_84EE:
	instrle 64, 2
	instrle 32, 2
	instrle 16, 2
	instrle 8, 2
	instrle 4, 2
	instrle 2, 2
	instrle -2, 2
	instrle -4, 2
	instrle -8, 2
	instrle -16, 2
	instrle -32, 2
	instrle -64, 2
	ofs_84EELoop:
	instjump ofs_84EELoop
ofs_8508:
	.byte $04
	.byte $10
	.byte $04
	.byte $0F
	.byte $04
	.byte $0E
	.byte $04
	.byte $0D
	.byte $04
	.byte $0C
	.byte $04
	.byte $0B
	.byte $04
	.byte $0A
	.byte $04
	.byte $09
	.byte $04
	.byte $08
	.byte $04
	.byte $07
	.byte $04
	.byte $06
	.byte $FF
	.byte $F8
ofs_8520:
	dutyrle 3, 5
	ofs_8520Loop:
	dutyrle 0, 4
	dutyrle 0, 3
	instjump ofs_8520Loop,1 ; This seems to be encoded wrong
ofs_8528:
	instrle 8, 3
	instrle 7, 3
	instrle 5, 3
	instrle 3, 3
	instrle 2, 3
	instrle 0, 2
	instrle 0, 3
	instrle 0, 2
	instrle 0, 2
	instrle 0, 2
	ofs_8528Loop:
	instjump ofs_8528Loop
ofs_853E:
	.byte $40
	.byte $14
	.byte $01
	.byte $14
	.byte $01
	.byte $14
	.byte $01
	.byte $14
	.byte $01
	.byte $16
	.byte $01
	.byte $18
	.byte $01
	.byte $1A
	.byte $01
	.byte $1B
	.byte $01
	.byte $1C
	.byte $01
	.byte $1D
	.byte $FF
	.byte $FC
ofs_8554:
	.byte $01
	.byte $50
	.byte $01
	.byte $46
	.byte $01
	.byte $3C
	.byte $01
	.byte $32
	.byte $01
	.byte $28
	.byte $01
	.byte $1E
	.byte $01
	.byte $14
	.byte $01
	.byte $0A
	.byte $01
	.byte $F6
	.byte $01
	.byte $EC
	.byte $01
	.byte $E2
	.byte $01
	.byte $D8
	.byte $01
	.byte $CE
	.byte $01
	.byte $C4
	.byte $01
	.byte $BA
	.byte $01
	.byte $B0
	.byte $FF
	.byte $FE
ofs_8576:
	.byte $01
	.byte $B0
	.byte $01
	.byte $BA
	.byte $01
	.byte $C4
	.byte $01
	.byte $CE
	.byte $01
	.byte $D8
	.byte $01
	.byte $E2
	.byte $01
	.byte $EC
	.byte $01
	.byte $F6
	.byte $01
	.byte $0A
	.byte $01
	.byte $14
	.byte $01
	.byte $1E
	.byte $01
	.byte $28
	.byte $01
	.byte $32
	.byte $01
	.byte $3C
	.byte $01
	.byte $46
	.byte $01
	.byte $50
	.byte $FF
	.byte $FE
ofs_8598:
	.byte $FF
	.byte $00
ofs_859A:
	.byte $02
	.byte $01
	.byte $02
	.byte $00
	.byte $FF
	.byte $F8
ofs_85A0:
	.byte $04
	.byte $03
	.byte $DE
	.byte $02
	.byte $05
	.byte $01
	.byte $FF
	.byte $00
ofs_85A8:
	.byte $00
	.byte $01
	.byte $40
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $10
	.byte $00
	.byte $FF
	.byte $F6
ofs_85B3:
	.byte $00
	.byte $01
	.byte $40
	.byte $01
	.byte $80
	.byte $01
	.byte $40
	.byte $10
	.byte $00
	.byte $FF
	.byte $F6
