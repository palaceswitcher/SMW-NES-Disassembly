ofs_8100:
	db 0, 0
	ofs_8100Loop:
	instjump ofs_8100Loop
ofs_8104:
	db $05
	db $0F
	db $02
	db $0C
	db $04
	db $04
	db $08
	db $02
	db $08
	db $01
	db $FF
	db $00
ofs_8110:
	db $01
	db $06
	db $FE
	db $04
	db $FF
	db $FE
ofs_8116:
	db $01
	db $04
	db $FE
	db $02
	db $FF
	db $FE
ofs_811C:
	db $08
	db $00
	db $08
	db $40
	db $FE
	db $80
	db $FF
	db $FE
ofs_8124:
	db $01
	db $14
	db $01
	db $0A
	db $01
	db $05
	db $01
	db $03
	db $0A
	db $00
	db $01
	db $01
	db $01
	db $02
	db $01
	db $01
	db $01
	db $00
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $00
	db $01
	db $00
	db $FF
	db $F0
ofs_8140:
	db $06
	db $0F
	db $FE
	db $00
	db $FF
	db $00
ofs_8146:
	db $FE
	db $80
	db $FF
	db $FE
ofs_814A:
	db $01, $01
	db $01, $03
	db $02, $05
	db $03, $04
	db $06, $03
	db $FE, $02
	db $FF
	db $FE
ofs_8158:
	db $FE
	db $40
	db $FF
	db $FE
ofs_815C:
	db $49
	db $10
	db $42
	db $08
	db $04
	db $04
	db $C8
	db $02
	db $01
	db $02
	db $02
	db $04
	db $01
	db $02
	db $02
	db $00
	db $01
	db $FE
	db $02
	db $FC
	db $01
	db $FE
	db $02
	db $00
	db $FF
	db $F0
ofs_8176:
	db $06
	db $0F
	db $02
	db $00
	db $03
	db $0F
	db $FE
	db $00
	db $FF
	db $00
ofs_8180:
	db $01
	db $03
	db $01
	db $06
	db $01
	db $03
	db $FE
	db $01
	db $FF
	db $FE
ofs_818A:
	db $01
	db $02
	db $01
	db $04
	db $01
	db $02
	db $FE
	db $01
	db $FF
	db $FE
ofs_8194:
	db $01
	db $00
	db $01
	db $40
	db $FE
	db $80
	db $FF
	db $FE
ofs_819C:
	db $02
	db $00
	db $02
	db $01
	db $02
	db $02
	db $02
	db $01
	db $FF
	db $F8
ofs_81A6:
	db $0A
	db $0F
	db $FE
	db $00
	db $FF
	db $FE
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
	db $00 ; This probably shouldn't be here
	dutyrle 1, 1
	dutyrle 2, 1
	dutyrle 1, 1
	db $10, $00
	db $FF, -10

ofs_81CD:
	db $12, $0F
	db $FE, $00
	db $01, $80
	db $01, $40
	db $FE, $00
	db $FF, $FE
ofs_81D9:
	db $01
	db $02
	db $01
	db $04
	db $01
	db $08
	db $FE
	db $04
	db $FF
	db $FE
ofs_81E3:
	db $01
	db $01
	db $01
	db $02
	db $01
	db $04
	db $FE
	db $02
	db $FF
	db $FE
ofs_81ED:
	db $03
	db $01
	db $03
	db $02
	db $03
	db $01
	db $03
	db $00
	db $FF
	db $F8
ofs_81F7:
	db $01
	db $80
	db $01
	db $40
	db $FE
	db $00
	db $FF
	db $00
ofs_81FF:
	db $FE
	db $0F
	db $FF
	db $FE
ofs_8203:
	db $01
	db $08
	db $01
	db $06
	db $11
	db $04
	db $01
	db $00
	db $01
	db $04
	db $01
	db $03
	db $11
	db $02
	db $01
	db $00
	db $01
	db $02
	db $12
	db $01
	db $01
	db $00
	db $13
	db $01
	db $FE
	db $00
	db $FF
	db $FE
ofs_821F:
	db $01
	db $00
	db $01
	db $40
	db $01
	db $80
	db $01
	db $40
	db $10
	db $00
	db $FF
	db $F6
ofs_822B:
	db $01
	db $08
	db $01
	db $06
	db $01
	db $04
	db $01
	db $03
	db $01
	db $02
	db $01
	db $01
	db $0E
	db $00
	db $FF
	db $F2
ofs_823B:
	db $28
	db $0F
	db $FE
	db $00
	db $FF
	db $FE
ofs_8241:
	db $FE
	db $04
	db $FF
	db $FE
ofs_8245:
	db $FE
	db $02
	db $FF
	db $FE
ofs_8249:
	db $01
	db $80
	db $FE
	db $00
	db $FF
	db $FE
ofs_824F:
	db $01
	db $0F
	db $01
	db $0E
	db $02
	db $0D
	db $02
	db $0C
	db $02
	db $0B
	db $03
	db $0A
	db $03
	db $09
	db $03
	db $08
	db $03
	db $07
	db $04
	db $06
	db $0E
	db $05
	db $04
	db $04
	db $04
	db $03
	db $DE
	db $02
	db $05
	db $01
	db $FF
	db $00
ofs_826F:
	db $01
	db $00
	db $FE
	db $0F
	db $FF
	db $FE
ofs_8275:
	db $0A
	db $00
	db $03
	db $01
	db $05
	db $00
	db $FF
	db $FC
ofs_827D:
	db $01
	db $04
	db $0F
	db $07
	db $0F
	db $06
	db $0F
	db $04
	db $0F
	db $03
	db $0F
	db $02
	db $0F
	db $01
	db $FF
	db $00
ofs_828D:
	db $FE
	db $80
	db $FF
	db $FE
ofs_8291:
	db $FF
	db $01
ofs_8293:
	db $01
	db $F6
	db $0A
	db $00
	db $03
	db $03
	db $03
	db $00
	db $FF
	db $FC
ofs_829D:
	db $02
	db $0B
	db $03
	db $0A
	db $03
	db $09
	db $03
	db $08
	db $03
	db $07
	db $04
	db $06
	db $0E
	db $05
	db $04
	db $04
	db $04
	db $03
	db $DE
	db $02
	db $05
	db $01
	db $FF
	db $00
ofs_82B5:
	db $01
	db $08
	db $01
	db $04
	db $01
	db $02
	db $FE
	db $01
	db $FF
	db $FE
ofs_82BF:
	db $01
	db $C0
	db $01
	db $80
	db $01
	db $40
	db $03
	db $00
	db $FF
	db $F8
ofs_82C9:
	db $01
	db $04
	db $01
	db $08
	db $FE
	db $04
	db $FF
	db $FE
ofs_82D1:
	db $01
	db $01
	db $01
	db $02
	db $01
	db $04
	db $01
	db $08
	db $01
	db $04
	db $01
	db $02
	db $02
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $01
	db $04
	db $01
	db $02
	db $01
	db $01
	db $02
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $01
	db $01
	db $01
	db $01
	db $02
	db $00
	db $FF
	db $00
ofs_82FD:
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $01
	db $04
	db $01
	db $02
	db $01
	db $01
	db $02
	db $00
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $02
	db $01
	db $01
	db $01
	db $01
	db $02
	db $00
	db $FF
	db $00
ofs_831B:
	ofs_831BLoop:
	dutyrle 3, 1
	dutyrle 2, 1
	dutyrle 1, 1
	dutyrle 0 ,1
	dutyrle 1, 1
	instjump ofs_831BLoop ; Loop at start
ofs_8327:
	db $01
	db $0E
	db $04
	db $0F
	db $01
	db $0C
	db $04
	db $0E
	db $01
	db $0B
	db $03
	db $0C
	db $FE
	db $0A
	db $FF
	db $FE
ofs_8337:
	db $01
	db $80
	db $01
	db $40
	db $01
	db $C0
	db $FF
	db $F6
ofs_833F:
	db $FE
	db $80
	db $FF
	db $00
ofs_8343:
	db $01, $00
	db $01, $FE
	db $01, $FE
	db $01, $FD
	db $01, $FC
	db $FF, $F6
ofs_834F:
	db $02
	db $04
	db $02
	db $02
	db $01
	db $04
	db $02
	db $02
	db $02
	db $01
	db $01
	db $02
	db $03
	db $01
	db $FF
	db $00
Vol_PlinkEcho:
	db $01, $0F
	db $02, $08
	db $02, $04
	db $01, $08
	db $02, $04
	db $02, $02
	db $01, $04
	db $02, $02
	db $02, $01
	db $01, $02
	db $03, $01
	db $FE
	db $00
	db $FF
	db $FE
ofs_8379:
	db $03
	db $00
	db $03
	db $40
	db $04
	db $80
	db $FF
	db $FA
ofs_8381:
	db $01
	db $00
	db $01
	db $14
	db $01
	db $04
	db $01
	db $18
	db $01
	db $08
	db $01
	db $1C
	db $01
	db $10
	db $01
	db $24
	db $01
	db $20
	db $01
	db $34
	db $FF
	db $EC
ofs_8397:
	db $01
	db $00
	db $01
	db $80
	db $01
	db $40
	db $01
	db $C0
	db $FF
	db $F6
ofs_83A1:
	db $01
	db $0F
	db $05
	db $00
	db $05
	db $0E
	db $05
	db $00
	db $05
	db $0A
	db $05
	db $00
	db $05
	db $04
	db $FE
	db $00
	db $FF
	db $F6
ofs_83B3:
	db $05
	db $0F
	db $05
	db $0C
	db $05
	db $0A
	db $05
	db $08
	db $0A
	db $04
	db $0A
	db $02
	db $0A
	db $01
	db $0A
	db $00
	db $A0
	db $01
	db $FF
	db $00
ofs_83C7:
	db $05
	db $01
	db $05
	db $01
	db $05
	db $02
	db $05
	db $03
	db $05
	db $04
	db $05
	db $05
	db $05
	db $06
	db $05
	db $07
	db $05
	db $08
	db $05
	db $09
	db $05
	db $0A
	db $05
	db $0B
	db $05
	db $0C
	db $05
	db $0D
	db $05
	db $0E
	db $05
	db $0F
	db $05
	db $0F
	db $05
	db $0E
	db $05
	db $0D
	db $05
	db $0C
	db $05
	db $0B
	db $05
	db $0A
	db $05
	db $09
	db $05
	db $08
	db $05
	db $07
	db $05
	db $06
	db $05
	db $05
	db $05
	db $04
	db $05
	db $03
	db $05
	db $02
	db $05
	db $01
	db $05
	db $01
	db $A0
	db $01
	db $FF
	db $00
ofs_840B:
	db $FE
	db $0F
	db $FF
	db $00
ofs_840F:
	db $01
	db $00
	db $FF
	db $00
ofs_8413:
	db $04
	db $F6
	db $04
	db $EC
	db $1E
	db $E2
	db $04
	db $D8
	db $04
	db $E2
	db $04
	db $EC
	db $04
	db $F6
	db $04
	db $00
	db $FF
	db $F0
ofs_8425:
	db $01
	db $05
	db $FE
	db $03
	db $FF
	db $FE
ofs_842B:
	db $01
	db $80
	db $FE
	db $40
	db $FF
	db $FE
ofs_8431:
	db $03
	db $00
	db $0F
	db $01
	db $FF
	db $FC
ofs_8437:
	db $03
	db $01
	db $03
	db $02
	db $FF
	db $FC
ofs_843D:
	instrle 35, 8
	instrle 25, 7
	instrle 15, 6
	instrle 15, 5
	instrle 15, 4
	instrle 15, 3
	instrle 15, 2
	instrle -1, 1
	db $FE
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
	db $01, $0F
	db $02, $08
	db $04, $04
	db $08, $02
	db $08, $01
	db $FF
	db $00
ofs_846E:
	db $FE
	db $80
	db $FF
	db $00
ofs_8472:
	db $01
	db $00
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $FD
	db $01
	db $FD
	db $01
	db $FD
	db $01
	db $FC
	db $FF
	db $F6
ofs_8486:
	db $02
	db $08
	db $02
	db $07
	db $02
	db $06
	db $02
	db $05
	db $02
	db $07
	db $02
	db $06
	db $02
	db $05
	db $02
	db $04
	db $03
	db $06
	db $03
	db $05
	db $03
	db $04
	db $03
	db $03
	db $03
	db $05
	db $03
	db $04
	db $03
	db $03
	db $03
	db $02
	db $03
	db $04
	db $03
	db $03
	db $03
	db $02
	db $03
	db $01
	db $FF
	db $14
ofs_84B0:
	db $FE
	db $80
	db $FF
	db $00
ofs_84B4:
	db $01
	db $00
	db $01
	db $FE
	db $01
	db $FE
	db $01
	db $FD
	db $01
	db $FC
	db $FF
	db $F6
ofs_84C0:
	db $05
	db $0F
	db $02
	db $0C
	db $04
	db $04
	db $08
	db $02
	db $08
	db $01
	db $FF
	db $00
ofs_84CC:
	dutyrle 2, 254
	ofs_84CCLoop:
	instjump ofs_84CCLoop
ofs_84D0:
	db $04
	db $10
	db $04
	db $0F
	db $04
	db $0E
	db $04
	db $0C
	db $04
	db $0B
	db $04
	db $0A
	db $FF
	db $00
ofs_84DE:
	db $02
	db $10
	db $02
	db $0F
	db $01
	db $0E
	db $02
	db $0D
	db $02
	db $08
	db $01
	db $07
	db $03
	db $06
	db $FF
	db $FA
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
	db $04
	db $10
	db $04
	db $0F
	db $04
	db $0E
	db $04
	db $0D
	db $04
	db $0C
	db $04
	db $0B
	db $04
	db $0A
	db $04
	db $09
	db $04
	db $08
	db $04
	db $07
	db $04
	db $06
	db $FF
	db $F8
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
	db $40
	db $14
	db $01
	db $14
	db $01
	db $14
	db $01
	db $14
	db $01
	db $16
	db $01
	db $18
	db $01
	db $1A
	db $01
	db $1B
	db $01
	db $1C
	db $01
	db $1D
	db $FF
	db $FC
ofs_8554:
	db $01
	db $50
	db $01
	db $46
	db $01
	db $3C
	db $01
	db $32
	db $01
	db $28
	db $01
	db $1E
	db $01
	db $14
	db $01
	db $0A
	db $01
	db $F6
	db $01
	db $EC
	db $01
	db $E2
	db $01
	db $D8
	db $01
	db $CE
	db $01
	db $C4
	db $01
	db $BA
	db $01
	db $B0
	db $FF
	db $FE
ofs_8576:
	db $01
	db $B0
	db $01
	db $BA
	db $01
	db $C4
	db $01
	db $CE
	db $01
	db $D8
	db $01
	db $E2
	db $01
	db $EC
	db $01
	db $F6
	db $01
	db $0A
	db $01
	db $14
	db $01
	db $1E
	db $01
	db $28
	db $01
	db $32
	db $01
	db $3C
	db $01
	db $46
	db $01
	db $50
	db $FF
	db $FE
ofs_8598:
	db $FF
	db $00
ofs_859A:
	db $02
	db $01
	db $02
	db $00
	db $FF
	db $F8
ofs_85A0:
	db $04
	db $03
	db $DE
	db $02
	db $05
	db $01
	db $FF
	db $00
ofs_85A8:
	db $00
	db $01
	db $40
	db $01
	db $80
	db $01
	db $40
	db $10
	db $00
	db $FF
	db $F6
ofs_85B3:
	db $00
	db $01
	db $40
	db $01
	db $80
	db $01
	db $40
	db $10
	db $00
	db $FF
	db $F6
