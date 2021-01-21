;disassembled by BZK 6502 Disassmebler
c_8000:	LDX $A4
c_8002:	LDA ObjectXPos,X
c_8005:	SEC
c_8006:	SBC PlayerXPosDup
c_8008:	STA $05A0,X
c_800B:	LDA ObjectXScreen,X
c_800E:	SBC PlayerXScreenDup
c_8010:	STA $05B4,X
c_8013:	STA $28
c_8015:	BEQ $801E
c_8017:	CMP #$FF
c_8019:	BEQ $801E
c_801B:	JMP $A6B5
c_801E:	LDA ObjectYPos,X
c_8021:	SEC
c_8022:	SBC PlayerYPosDup
c_8024:	STA $05C8,X
c_8027:	LDA ObjectYScreen,X
c_802A:	SBC PlayerYScreenDup
c_802C:	STA $05DC,X
c_802F:	LDA PlayerYScreenDup
c_8031:	CMP ObjectYScreen,X
c_8034:	BEQ $8060
c_8036:	LDA $05DC,X
c_8039:	BPL $804F
c_803B:	LDA $05C8,X
c_803E:	CLC
c_803F:	ADC #$10
c_8041:	STA $05C8,X
c_8044:	LDA $05DC,X
c_8047:	ADC #$00
c_8049:	STA $05DC,X
c_804C:	JMP $8060
c_804F:	LDA $05C8,X
c_8052:	SEC
c_8053:	SBC #$10
c_8055:	STA $05C8,X
c_8058:	LDA $05DC,X
c_805B:	SBC #$00
c_805D:	STA $05DC,X
c_8060:	LDA FreezeFlag
c_8063:	BEQ $8066
c_8065:	RTS
c_8066:	JSR $8096
c_8069:	LDY #$03
c_806B:	LDA $062B
c_806E:	AND #$08
c_8070:	BEQ $8073
c_8072:	INY
c_8073:	TYA
c_8074:	STA EnemyAnimFrame,X
c_8077:	LDA ObjectSlot,X
c_807A:	CMP #$36
c_807C:	BCC $808A
c_807E:	LDA $06
c_8080:	AND #$01
c_8082:	BNE $8089
c_8084:	LDA #$10
c_8086:	JSR $B1DA
c_8089:	RTS
c_808A:	LDA $06
c_808C:	AND #$01
c_808E:	BNE $8095
c_8090:	LDA #$10
c_8092:	JSR $B3B4
c_8095:	RTS
c_8096:	LDA #$04
c_8098:	STA $25
c_809A:	LDX $A4
c_809C:	LDA ObjectXPos,X
c_809F:	SEC
c_80A0:	SBC PlayerXPosDup
c_80A2:	STA $05A0,X
c_80A5:	LDA ObjectXScreen,X
c_80A8:	SBC PlayerXScreenDup
c_80AA:	STA $05B4,X
c_80AD:	STA $28
c_80AF:	BEQ $80B8
c_80B1:	CMP #$FF
c_80B3:	BEQ $80B8
c_80B5:	JMP $A6B5
c_80B8:	LDA ObjectYPos,X
c_80BB:	SEC
c_80BC:	SBC PlayerYPosDup
c_80BE:	STA $05C8,X
c_80C1:	LDA ObjectYScreen,X
c_80C4:	SBC PlayerYScreenDup
c_80C6:	STA $05DC,X
c_80C9:	LDA PlayerYScreenDup
c_80CB:	CMP ObjectYScreen,X
c_80CE:	BEQ $80FA
c_80D0:	LDA $05DC,X
c_80D3:	BPL $80E9
c_80D5:	LDA $05C8,X
c_80D8:	CLC
c_80D9:	ADC #$10
c_80DB:	STA $05C8,X
c_80DE:	LDA $05DC,X
c_80E1:	ADC #$00
c_80E3:	STA $05DC,X
c_80E6:	JMP $80FA
c_80E9:	LDA $05C8,X
c_80EC:	SEC
c_80ED:	SBC #$10
c_80EF:	STA $05C8,X
c_80F2:	LDA $05DC,X
c_80F5:	SBC #$00
c_80F7:	STA $05DC,X
c_80FA:	LDA FreezeFlag
c_80FD:	BEQ $8100
c_80FF:	RTS
c_8100:	LDA ObjectState,X
c_8103:	AND #$1F
c_8105:	ASL
c_8106:	TAY
c_8107:	LDA $8114,Y
c_810A:	STA $32
c_810C:	LDA $8115,Y
c_810F:	STA $33
c_8111:	JMP ($32)
c_8114:	.db $BB
c_8115:	.db $A7
c_8116:	.db $7B
c_8117:	.db $AA
c_8118:	.db $29
c_8119:	.db $AB
c_811A:	.db $1E
c_811B:	.db $81
c_811C:	.db $01
c_811D:	.db $82
c_811E:	JSR $A6D4
c_8121:	JSR $BEBC
c_8124:	JSR $A74D
c_8127:	JSR $BCBE
c_812A:	LDA #$10
c_812C:	BMI $8147
c_812E:	CLC
c_812F:	ADC ObjectYPos,X
c_8132:	STA ObjectYPos,X
c_8135:	BCS $813B
c_8137:	CMP #$F0
c_8139:	BCC $8159
c_813B:	CLC
c_813C:	ADC #$10
c_813E:	STA ObjectYPos,X
c_8141:	INC ObjectYScreen,X
c_8144:	JMP $8159
c_8147:	CLC
c_8148:	ADC ObjectYPos,X
c_814B:	STA ObjectYPos,X
c_814E:	BCS $8159
c_8150:	SEC
c_8151:	SBC #$10
c_8153:	STA ObjectYPos,X
c_8156:	DEC ObjectYScreen,X
c_8159:	LDA ObjectXPos,X
c_815C:	SEC
c_815D:	SBC PlayerXPosDup
c_815F:	STA $05A0,X
c_8162:	LDA ObjectXScreen,X
c_8165:	SBC PlayerXScreenDup
c_8167:	STA $05B4,X
c_816A:	STA $28
c_816C:	BEQ $8175
c_816E:	CMP #$FF
c_8170:	BEQ $8175
c_8172:	JMP $A6B5
c_8175:	LDA ObjectYPos,X
c_8178:	SEC
c_8179:	SBC PlayerYPosDup
c_817B:	STA $05C8,X
c_817E:	LDA ObjectYScreen,X
c_8181:	SBC PlayerYScreenDup
c_8183:	STA $05DC,X
c_8186:	LDA PlayerYScreenDup
c_8188:	CMP ObjectYScreen,X
c_818B:	BEQ $81B7
c_818D:	LDA $05DC,X
c_8190:	BPL $81A6
c_8192:	LDA $05C8,X
c_8195:	CLC
c_8196:	ADC #$10
c_8198:	STA $05C8,X
c_819B:	LDA $05DC,X
c_819E:	ADC #$00
c_81A0:	STA $05DC,X
c_81A3:	JMP $81B7
c_81A6:	LDA $05C8,X
c_81A9:	SEC
c_81AA:	SBC #$10
c_81AC:	STA $05C8,X
c_81AF:	LDA $05DC,X
c_81B2:	SBC #$00
c_81B4:	STA $05DC,X
c_81B7:	LDA FreezeFlag
c_81BA:	BEQ $81BD
c_81BC:	RTS
c_81BD:	LDY ObjectCount
c_81BF:	INC ObjectCount
c_81C1:	LDA ObjectXPos,X
c_81C4:	STA ObjectXPos,Y
c_81C7:	LDA ObjectXScreen,X
c_81CA:	STA ObjectXScreen,Y
c_81CD:	LDA ObjectYPos,X
c_81D0:	STA ObjectYPos,Y
c_81D3:	LDA ObjectYScreen,X
c_81D6:	STA ObjectYScreen,Y
c_81D9:	LDA ObjectState,X
c_81DC:	AND #$40
c_81DE:	ORA #$80
c_81E0:	STA ObjectState,Y
c_81E3:	LDA #$80
c_81E5:	STA $0578,Y
c_81E8:	STA GuidedObjStatus,Y
c_81EB:	LDA ObjectSlot,X
c_81EE:	AND #$01
c_81F0:	CLC
c_81F1:	ADC #$12
c_81F3:	STA ObjectSlot,Y
c_81F6:	LDA #$04
c_81F8:	STA ObjectSlot,X
c_81FB:	LDA #$08
c_81FD:	STA ObjectState,X
c_8200:	RTS
c_8201:	LDX $A4
c_8203:	LDA #$04
c_8205:	STA ObjectSlot,X
c_8208:	LDA #$00
c_820A:	STA $0578,X
c_820D:	RTS
c_820E:	LDX $A4
c_8210:	LDA EnemyAnimFrame,X
c_8213:	ASL
c_8214:	TAX
c_8215:	LDA KoopaMappings,X
c_8218:	STA $32
c_821A:	LDA $823B,X
c_821D:	STA $33
c_821F:	LDY #$80
c_8221:	LDX $A4
c_8223:	LDA ObjectSlot,X
c_8226:	AND #$01
c_8228:	BEQ $822C
c_822A:	LDY #$C0
c_822C:	STY $36
c_822E:	LDA ObjectState,X
c_8231:	AND #$40
c_8233:	STA $05F0
c_8236:	JSR $A118
c_8239:	RTS
KoopaMappings:
;Beach Koopa:
.db $48					;Location of 1st walk sprite
c_823B:	.db $82, $4F	;Location of 2nd walk sprite
.db $82, $56			;Location of sliding sprite

;Koopa:
.db $82, $5D	;Location of 1st walk sprite
.db $82, $68	;Location of 2nd walk sprite

;Paratroopa
.db $82, $73	;Location of 1st sprite
.db $82, $86	;Location of 2nd sprite
.db $82

;Beach Koopa 1st walk sprite:
.db $02 ;tiles wide
.db $02	;tiles tall
.db $94	;chr bank
.db $01, $02	;1st row
.db $06, $07	;2nd row

;Beach Koopa 2nd walk sprite:
.db $02	;tiles wide
.db $02	;tiles tall
.db $94	;chr bank
.db $01, $03	;1st row
.db $08, $09	;2nd row

;Beach Koopa sliding sprite:
.db $02	;tiles wide
.db $02	;tiles tall
.db $94	;chr bank
.db $04, $05	;1st row
.db $0A, $0B	;2nd row

;Koopa 1st walking sprite:
.db $02	;tiles wide
.db $04	;tiles tall
.db $94	;chr bank
.db $0E, $0F	;1st row
.db $18, $19	;2nd row
.db $27, $28	;3rd row
.db $35, $36	;4th row

;Koopa 2nd walking sprite:
.db $02	;tiles wide
.db $04	;tiles tall
.db $94	;chr bank
.db $10, $11	;1st row
.db $1A, $1B	;2nd row
.db $29, $2A	;3rd row
.db $37, $38	;4th row

;Paratroopa 1st sprite
.db $04	;tiles wide
.db $04	;tiles tall
.db $94	;chr bank
.db $FF, $12, $13, $FF	;1st row
.db $1C, $1D, $1E, $1F	;2nd row
.db $FF, $2C, $2D, $2E	;3rd row
.db $FF, $39, $3A, $FF	;4th row

;Paratroopa 2nd sprite:
.db $04	;tiles wide
.db $04	;tiles tall
.db $94	;chr bank
.db $FF, $16, $17, $FF	;1st row
.db $23, $24, $25, $26	;2nd row
.db $31, $32, $33, $34	;3rd row
.db $FF, $3E, $3F, $FF	;4th row

c_8299:	LDX $A4
c_829B:	LDA ObjectXPos,X
c_829E:	SEC
c_829F:	SBC PlayerXPosDup
c_82A1:	STA $05A0,X
c_82A4:	LDA ObjectXScreen,X
c_82A7:	SBC PlayerXScreenDup
c_82A9:	STA $05B4,X
c_82AC:	STA $28
c_82AE:	BEQ $82B7
c_82B0:	CMP #$FF
c_82B2:	BEQ $82B7
c_82B4:	JMP $A6B5
c_82B7:	LDA ObjectYPos,X
c_82BA:	SEC
c_82BB:	SBC PlayerYPosDup
c_82BD:	STA $05C8,X
c_82C0:	LDA ObjectYScreen,X
c_82C3:	SBC PlayerYScreenDup
c_82C5:	STA $05DC,X
c_82C8:	LDA PlayerYScreenDup
c_82CA:	CMP ObjectYScreen,X
c_82CD:	BEQ $82F9
c_82CF:	LDA $05DC,X
c_82D2:	BPL $82E8
c_82D4:	LDA $05C8,X
c_82D7:	CLC
c_82D8:	ADC #$10
c_82DA:	STA $05C8,X
c_82DD:	LDA $05DC,X
c_82E0:	ADC #$00
c_82E2:	STA $05DC,X
c_82E5:	JMP $82F9
c_82E8:	LDA $05C8,X
c_82EB:	SEC
c_82EC:	SBC #$10
c_82EE:	STA $05C8,X
c_82F1:	LDA $05DC,X
c_82F4:	SBC #$00
c_82F6:	STA $05DC,X
c_82F9:	LDA FreezeFlag
c_82FC:	BEQ $82FF
c_82FE:	RTS
c_82FF:	LDA $0578,X
c_8302:	BPL $8308
c_8304:	JSR $B5BB
c_8307:	RTS
c_8308:	JSR $83D0
c_830B:	LDA $06
c_830D:	AND #$01
c_830F:	BNE $8316
c_8311:	LDA #$12
c_8313:	JSR $B1DA
c_8316:	LDY #$05
c_8318:	LDA $062B
c_831B:	AND #$08
c_831D:	BEQ $8320
c_831F:	INY
c_8320:	TYA
c_8321:	STA EnemyAnimFrame,X
c_8324:	RTS
c_8325:	LDX $A4
c_8327:	LDA ObjectXPos,X
c_832A:	SEC
c_832B:	SBC PlayerXPosDup
c_832D:	STA $05A0,X
c_8330:	LDA ObjectXScreen,X
c_8333:	SBC PlayerXScreenDup
c_8335:	STA $05B4,X
c_8338:	STA $28
c_833A:	BEQ $8343
c_833C:	CMP #$FF
c_833E:	BEQ $8343
c_8340:	JMP $A6B5
c_8343:	LDA ObjectYPos,X
c_8346:	SEC
c_8347:	SBC PlayerYPosDup
c_8349:	STA $05C8,X
c_834C:	LDA ObjectYScreen,X
c_834F:	SBC PlayerYScreenDup
c_8351:	STA $05DC,X
c_8354:	LDA PlayerYScreenDup
c_8356:	CMP ObjectYScreen,X
c_8359:	BEQ $8385
c_835B:	LDA $05DC,X
c_835E:	BPL $8374
c_8360:	LDA $05C8,X
c_8363:	CLC
c_8364:	ADC #$10
c_8366:	STA $05C8,X
c_8369:	LDA $05DC,X
c_836C:	ADC #$00
c_836E:	STA $05DC,X
c_8371:	JMP $8385
c_8374:	LDA $05C8,X
c_8377:	SEC
c_8378:	SBC #$10
c_837A:	STA $05C8,X
c_837D:	LDA $05DC,X
c_8380:	SBC #$00
c_8382:	STA $05DC,X
c_8385:	LDA FreezeFlag
c_8388:	BEQ $838B
c_838A:	RTS
c_838B:	LDA $0578,X
c_838E:	BPL $8394
c_8390:	JSR $B5BB
c_8393:	RTS
c_8394:	JSR $83D0
c_8397:	LDA ObjectSlot,X
c_839A:	BMI $83B6
c_839C:	LDA $06
c_839E:	AND #$03
c_83A0:	BNE $83A7
c_83A2:	LDA #$3A
c_83A4:	JSR $B11D
c_83A7:	LDY #$05
c_83A9:	LDA $062B
c_83AC:	AND #$08
c_83AE:	BEQ $83B1
c_83B0:	INY
c_83B1:	TYA
c_83B2:	STA EnemyAnimFrame,X
c_83B5:	RTS
c_83B6:	LDA $06
c_83B8:	AND #$03
c_83BA:	BNE $83C1
c_83BC:	LDA #$21
c_83BE:	JSR $B11D
c_83C1:	LDY #$05
c_83C3:	LDA $062B
c_83C6:	AND #$08
c_83C8:	BEQ $83CB
c_83CA:	INY
c_83CB:	TYA
c_83CC:	STA EnemyAnimFrame,X
c_83CF:	RTS
c_83D0:	LDA #$04
c_83D2:	STA $25
c_83D4:	LDX $A4
c_83D6:	LDA ObjectXPos,X
c_83D9:	SEC
c_83DA:	SBC PlayerXPosDup
c_83DC:	STA $05A0,X
c_83DF:	LDA ObjectXScreen,X
c_83E2:	SBC PlayerXScreenDup
c_83E4:	STA $05B4,X
c_83E7:	STA $28
c_83E9:	BEQ $83F2
c_83EB:	CMP #$FF
c_83ED:	BEQ $83F2
c_83EF:	JMP $A6B5
c_83F2:	LDA ObjectYPos,X
c_83F5:	SEC
c_83F6:	SBC PlayerYPosDup
c_83F8:	STA $05C8,X
c_83FB:	LDA ObjectYScreen,X
c_83FE:	SBC PlayerYScreenDup
c_8400:	STA $05DC,X
c_8403:	LDA PlayerYScreenDup
c_8405:	CMP ObjectYScreen,X
c_8408:	BEQ $8434
c_840A:	LDA $05DC,X
c_840D:	BPL $8423
c_840F:	LDA $05C8,X
c_8412:	CLC
c_8413:	ADC #$10
c_8415:	STA $05C8,X
c_8418:	LDA $05DC,X
c_841B:	ADC #$00
c_841D:	STA $05DC,X
c_8420:	JMP $8434
c_8423:	LDA $05C8,X
c_8426:	SEC
c_8427:	SBC #$10
c_8429:	STA $05C8,X
c_842C:	LDA $05DC,X
c_842F:	SBC #$00
c_8431:	STA $05DC,X
c_8434:	LDA FreezeFlag
c_8437:	BEQ $843A
c_8439:	RTS
c_843A:	LDA ObjectState,X
c_843D:	AND #$1F
c_843F:	ASL
c_8440:	TAY
c_8441:	LDA $844E,Y
c_8444:	STA $32
c_8446:	LDA $844F,Y
c_8449:	STA $33
c_844B:	JMP ($32)
c_844E:	.db $BB
c_844F:	.db $A7
c_8450:	.db $7B
c_8451:	.db $AA
c_8452:	.db $29
c_8453:	.db $AB
c_8454:	.db $58
c_8455:	.db $84
c_8456:	.db $7B
c_8457:	.db $84
c_8458:	JSR $BEBC
c_845B:	JSR $A74D
c_845E:	LDA InvincibilityTimer
c_8461:	CMP #$F7
c_8463:	BCS $847A
c_8465:	JSR $BCA7
c_8468:	LDX $A4
c_846A:	LDA ObjectSlot,X
c_846D:	AND #$01
c_846F:	CLC
c_8470:	ADC #$36
c_8472:	STA ObjectSlot,X
c_8475:	LDA #$00
c_8477:	STA ObjectState,X
c_847A:	RTS
c_847B:	LDX $A4
c_847D:	LDA #$04
c_847F:	STA ObjectSlot,X
c_8482:	LDA #$00
c_8484:	STA $0578,X
c_8487:	RTS
c_8488:	LDX $A4
c_848A:	LDA $0578,X
c_848D:	BPL $84F7
c_848F:	LDA ObjectXPos,X
c_8492:	SEC
c_8493:	SBC PlayerXPosDup
c_8495:	STA $05A0,X
c_8498:	LDA ObjectXScreen,X
c_849B:	SBC PlayerXScreenDup
c_849D:	STA $05B4,X
c_84A0:	STA $28
c_84A2:	BEQ $84AB
c_84A4:	CMP #$FF
c_84A6:	BEQ $84AB
c_83A8:	JMP $A6B5
c_84AB:	LDA ObjectYPos,X
c_84AE:	SEC
c_84AF:	SBC PlayerYPosDup
c_84B1:	STA $05C8,X
c_84B4:	LDA ObjectYScreen,X
c_84B7:	SBC PlayerYScreenDup
c_84B9:	STA $05DC,X
c_84BC:	LDA PlayerYScreenDup
c_84BE:	CMP ObjectYScreen,X
c_84C1:	BEQ $84ED
c_84C3:	LDA $05DC,X
c_84C6:	BPL $84DC
c_84C8:	LDA $05C8,X
c_84CB:	CLC
c_84CC:	ADC #$10
c_84CE:	STA $05C8,X
c_84D1:	LDA $05DC,X
c_84D4:	ADC #$00
c_84D6:	STA $05DC,X
c_84D9:	JMP $84ED
c_84DC:	LDA $05C8,X
c_84DF:	SEC
c_84E0:	SBC #$10
c_84E2:	STA $05C8,X
c_84E5:	LDA $05DC,X
c_84E8:	SBC #$00
c_84EA:	STA $05DC,X
c_84ED:	LDA FreezeFlag
c_84F0:	BEQ $84F3
c_84F2:	RTS
c_84F3:	JSR $B5BB
c_84F6:	RTS
c_84F7:	LDA #$06
c_84F9:	STA $25
c_84FB:	LDX $A4
c_84FD:	LDA ObjectXPos,X
c_8500:	SEC
c_8501:	SBC PlayerXPosDup
c_8503:	STA $05A0,X
c_8506:	LDA ObjectXScreen,X
c_8509:	SBC PlayerXScreenDup
c_850B:	STA $05B4,X
c_850E:	STA $28
c_8510:	BEQ $8519
c_8512:	CMP #$FF
c_8514:	BEQ $8519
c_8516:	JMP $A6B5
c_8519:	LDA ObjectYPos,X
c_851C:	SEC
c_851D:	SBC PlayerYPosDup
c_851F:	STA $05C8,X
c_8522:	LDA ObjectYScreen,X
c_8525:	SBC PlayerYScreenDup
c_8527:	STA $05DC,X
c_852A:	LDA PlayerYScreenDup
c_852C:	CMP ObjectYScreen,X
c_852F:	BEQ $855B
c_8531:	LDA $05DC,X
c_8534:	BPL $854A
c_8536:	LDA $05C8,X
c_8539:	CLC
c_853A:	ADC #$10
c_853C:	STA $05C8,X
c_853F:	LDA $05DC,X
c_8542:	ADC #$00
c_8544:	STA $05DC,X
c_8547:	JMP $855B
c_854A:	LDA $05C8,X
c_854D:	SEC
c_854E:	SBC #$10
c_8550:	STA $05C8,X
c_8553:	LDA $05DC,X
c_8556:	SBC #$00
c_8558:	STA $05DC,X
c_855B:	LDA FreezeFlag
c_855E:	BEQ $8561
c_8560:	RTS
c_8561:	LDA ObjectState,X
c_8564:	AND #$1F
c_8566:	ASL
c_8567:	TAY
c_8568:	LDA $8575,Y
c_856B:	STA $32
c_856D:	LDA $8576,Y
c_8570:	STA $33
c_8572:	JMP ($32)
c_8575:	.db $BB
c_8576:	.db $A7
c_8577:	.db $7B
c_8578:	.db $AA
c_8579:	.db $29
c_857A:	.db $AB
c_857B:	.db $7F
c_857C:	.db $85
c_857D:	.db $88
c_857E:	.db $AD
c_857F:	LDY #$13
c_8581:	LDA ObjectSlot,X
c_8584:	CMP #$18
c_8586:	BCC $8589
c_8588:	INY
c_8589:	STY $25
c_858B:	LDA $06
c_858D:	AND #$00
c_858F:	BNE $8596
c_8591:	LDA $25
c_8593:	JSR $B1DA
c_8596:	JSR $A6D4
c_8599:	JSR $BEBC
c_859C:	JSR $A74D
c_859F:	LDA ObjectSlot,X
c_85A2:	LSR
c_85A3:	CMP #$0C
c_85A5:	BCC $85B5
c_85A7:	LDA #$0F
c_85A9:	STA ObjectSlot,X
c_85AC:	LDA #$00
c_85AE:	STA ObjectState,X
c_85B1:	JSR $BCC2
c_85B4:	RTS
c_85B5:	LDA #$10
c_85B7:	BMI $85D2
c_85B9:	CLC
c_85BA:	ADC ObjectYPos,X
c_85BD:	STA ObjectYPos,X
c_85C0:	BCS $85C6
c_85C2:	CMP #$F0
c_85C4:	BCC $85E4
c_85C6:	CLC
c_85C7:	ADC #$10
c_85C9:	STA ObjectYPos,X
c_85CC:	INC ObjectYScreen,X
c_85CF:	JMP $85E4
c_85D2:	CLC
c_85D3:	ADC ObjectYPos,X
c_85D6:	STA ObjectYPos,X
c_85D9:	BCS $85E4
c_85DB:	SEC
c_85DC:	SBC #$10
c_85DE:	STA ObjectYPos,X
c_85E1:	DEC ObjectYScreen,X
c_85E4:	LDA ObjectXPos,X
c_85E7:	SEC
c_85E8:	SBC PlayerXPosDup
c_85EA:	STA $05A0,X
c_85ED:	LDA ObjectXScreen,X
c_85F0:	SBC PlayerXScreenDup
c_85F2:	STA $05B4,X
c_85F5:	STA $28
c_85F7:	BEQ $8600
c_85F9:	CMP #$FF
c_85FB:	BEQ $8600
c_85FD:	JMP $A6B5
c_8600:	LDA ObjectYPos,X
c_8603:	SEC
c_8604:	SBC PlayerYPosDup
c_8606:	STA $05C8,X
c_8609:	LDA ObjectYScreen,X
c_860C:	SBC PlayerYScreenDup
c_860E:	STA $05DC,X
c_8611:	LDA PlayerYScreenDup
c_8613:	CMP ObjectYScreen,X
c_8616:	BEQ $8642
c_8618:	LDA $05DC,X
c_861B:	BPL $8631
c_861D:	LDA $05C8,X
c_8620:	CLC
c_8621:	ADC #$10
c_8623:	STA $05C8,X
c_8626:	LDA $05DC,X
c_8629:	ADC #$00
c_862B:	STA $05DC,X
c_862E:	JMP $8642
c_8631:	LDA $05C8,X
c_8634:	SEC
c_8635:	SBC #$10
c_8637:	STA $05C8,X
c_863A:	LDA $05DC,X
c_863D:	SBC #$00
c_863F:	STA $05DC,X
c_8642:	LDA FreezeFlag
c_8645:	BEQ $8648
c_8647:	RTS
c_8648:	INC ObjectSlot,X
c_864B:	INC ObjectSlot,X
c_864E:	LDA #$00
c_8650:	STA ObjectState,X
c_8653:	JSR $BCBE
c_8656:	RTS
c_8657:	LDY #$00
c_8659:	BEQ $865F
c_865B:	LDX $A4
c_865D:	LDY #$03
c_865F:	LDA $062B
c_8662:	AND #$08
c_8664:	BEQ $8667
c_8666:	INY
c_8667:	TYA
c_8668:	ASL
c_8669:	TAX
c_866A:	LDA $868F,X
c_866D:	STA $32
c_866F:	LDA $8690,X
c_8672:	STA $33
c_8674:	LDY #$80
c_8676:	LDX $A4
c_8678:	LDA ObjectSlot,X
c_867B:	AND #$01
c_867D:	BEQ $8681
c_867F:	LDY #$C0
c_8681:	STY $36
c_8683:	LDA ObjectState,X
c_8686:	AND #$40
c_8688:	STA $05F0
c_868B:	JSR $A118
c_868E:	RTS
c_868F:	.db $99	;rex mappings
c_8690:	.db $86
c_8691:	.db $A8
c_8692:	.db $86
c_8693:	.db $B7
c_8694:	.db $86
c_8695:	.db $BC
c_8696:	.db $86
c_8697:	.db $C3
c_8698:	.db $86
c_8699:	.db $03
c_869A:	.db $04
c_869B:	.db $95
c_869C:	.db $21
c_869D:	.db $22
c_869E:	.db $FF
c_869F:	.db $25
c_86A0:	.db $26
c_86A1:	.db $FF
c_86A2:	.db $29
c_86A3:	.db $2A
c_86A4:	.db $2B
c_86A5:	.db $33
c_86A6:	.db $34
c_86A7:	.db $35
c_86A8:	.db $03
c_86A9:	.db $04
c_86AA:	.db $95
c_86AB:	.db $23
c_86AC:	.db $24
c_86AD:	.db $FF
c_86AE:	.db $27
c_86AF:	.db $28
c_86B0:	.db $FF
c_86B1:	.db $2C
c_86B2:	.db $2D
c_86B3:	.db $2E
c_86B4:	.db $36
c_86B5:	.db $37
c_86B6:	.db $38
c_86B7:	.db $02
c_86B8:	.db $01
c_86B9:	.db $95
c_86BA:	.db $39
c_86BB:	.db $3A
c_86BC:	.db $02
c_86BD:	.db $02
c_86BE:	.db $95
c_86BF:	.db $2F
c_86C0:	.db $30
c_86C1:	.db $3B
c_86C2:	.db $3C
c_86C3:	.db $02
c_86C4:	.db $02
c_86C5:	.db $95
c_86C6:	.db $31
c_86C7:	.db $32
c_86C8:	.db $3D
c_86C9:	.db $3E
c_86CA:	LDX $A4
c_86CC:	LDA ObjectXPos,X
c_86CF:	SEC
c_86D0:	SBC PlayerXPosDup
c_86D2:	STA $05A0,X
c_86D5:	LDA ObjectXScreen,X
c_86D8:	SBC PlayerXScreenDup
c_86DA:	STA $05B4,X
c_86DD:	STA $28
c_86DF:	BEQ $86E8
c_86E1:	CMP #$FF
c_86E3:	BEQ $86E8
c_86E5:	JMP $A6B5
c_86E8:	LDA ObjectYPos,X
c_86EB:	SEC
c_86EC:	SBC PlayerYPosDup
c_86EE:	STA $05C8,X
c_86F1:	LDA ObjectYScreen,X
c_86F4:	SBC PlayerYScreenDup
c_86F6:	STA $05DC,X
c_86F9:	LDA PlayerYScreenDup
c_86FB:	CMP ObjectYScreen,X
c_86FE:	BEQ $872A
c_8700:	LDA $05DC,X
c_8703:	BPL $8719
c_8705:	LDA $05C8,X
c_8708:	CLC
c_8709:	ADC #$10
c_870B:	STA $05C8,X
c_870E:	LDA $05DC,X
c_8711:	ADC #$00
c_8713:	STA $05DC,X
c_8716:	JMP $872A
c_8719:	LDA $05C8,X
c_871C:	SEC
c_871D:	SBC #$10
c_871F:	STA $05C8,X
c_8722:	LDA $05DC,X
c_8725:	SBC #$00
c_8727:	STA $05DC,X
c_872A:	LDA FreezeFlag
c_872D:	BEQ $8730
c_872F:	RTS
c_8730:	LDA $0578,X
c_8733:	BPL $8776
c_8735:	LDA #$00
c_8737:	STA $0578,X
c_873A:	LDA ObjectXPos,X
c_873D:	CLC
c_873E:	ADC #$08
c_8740:	STA ObjectXPos,X
c_8743:	LDA ObjectXScreen,X
c_8746:	ADC #$00
c_8748:	STA ObjectXScreen,X
c_874B:	LDY ObjectCount
c_874D:	INC ObjectCount
c_874F:	LDA ObjectXPos,X
c_8752:	STA ObjectXPos,Y
c_8755:	LDA ObjectXScreen,X
c_8758:	STA ObjectXScreen,Y
c_875B:	LDA ObjectYPos,X
c_875E:	STA ObjectYPos,Y
c_8761:	LDA ObjectYScreen,X
c_8764:	STA ObjectYScreen,Y
c_8767:	LDA ObjectSlot,X
c_876A:	CLC
c_876B:	ADC #$02
c_876D:	STA ObjectSlot,Y
c_8770:	LDA #$F3
c_8772:	STA GuidedObjStatus,Y
c_8775:	RTS
c_8776:	LDA #$06
c_8778:	STA $25
c_877A:	LDX $A4
c_877C:	LDA ObjectXPos,X
c_877F:	SEC
c_8780:	SBC PlayerXPosDup
c_8782:	STA $05A0,X
c_8785:	LDA ObjectXScreen,X
c_8788:	SBC PlayerXScreenDup
c_878A:	STA $05B4,X
c_878D:	STA $28
c_878F:	BEQ $8798
c_8791:	CMP #$FF
c_8793:	BEQ $8798
c_8795:	JMP $A6B5
c_8798:	LDA ObjectYPos,X
c_879B:	SEC
c_879C:	SBC PlayerYPosDup
c_879E:	STA $05C8,X
c_87A1:	LDA ObjectYScreen,X
c_87A4:	SBC PlayerYScreenDup
c_87A6:	STA $05DC,X
c_87A9:	LDA PlayerYScreenDup
c_87AB:	CMP ObjectYScreen,X
c_87AE:	BEQ $87DA
c_87B0:	LDA $05DC,X
c_87B3:	BPL $87C9
c_87B5:	LDA $05C8,X
c_87B8:	CLC
c_87B9:	ADC #$10
c_87BB:	STA $05C8,X
c_87BE:	LDA $05DC,X
c_87C1:	ADC #$00
c_87C3:	STA $05DC,X
c_87C6:	JMP $87DA
c_87C9:	LDA $05C8,X
c_87CC:	SEC
c_87CD:	SBC #$10
c_87CF:	STA $05C8,X
c_87D2:	LDA $05DC,X
c_87D5:	SBC #$00
c_87D7:	STA $05DC,X
c_87DA:	LDA FreezeFlag
c_87DD:	BEQ $87E0
c_87DF:	RTS
c_87E0:	LDA ObjectState,X
c_87E3:	AND #$1F
c_87E5:	ASL
c_87E6:	TAY
c_87E7:	LDA $87F4,Y
c_87EA:	STA $32
c_87EC:	LDA $87F5,Y
c_87EF:	STA $33
c_87F1:	JMP ($32)
c_87F4:	.db $FE
c_87F5:	.db $87
c_87F6:	.db $0D
c_87F7:	.db $88
c_87F8:	.db $1C
c_87F9:	.db $88
c_87FA:	.db $2B
c_87FB:	.db $88
c_87FC:	.db $88
c_87FD:	.db $AD
c_87FE:	LDA $06
c_8800:	AND #$03
c_8802:	BNE $8809
c_8804:	LDA #$15
c_8806:	JSR $B11D
c_8809:	JSR $A7BB
c_880C:	RTS
c_880D:	LDA $06
c_880F:	AND #$03
c_8811:	BNE $8818
c_8813:	LDA #$15
c_8815:	JSR $B11D
c_8818:	JSR $AA7B
c_881B:	RTS
c_881C:	LDA $06
c_881E:	AND #$03
c_8820:	BNE $8827
c_8822:	LDA #$15
c_8824:	JSR $B11D
c_8827:	JSR $AB29
c_882A:	RTS
c_882B:	LDA $06
c_882D:	AND #$03
c_882F:	BNE $8836
c_8831:	LDA #$15
c_8833:	JSR $B11D
c_8836:	LDA $0578,X
c_8839:	CMP #$10
c_883B:	BCC $884A
c_883D:	CMP #$35
c_883F:	BCS $884A
c_8841:	JSR $A6D4
c_8844:	JSR $BC3E
c_8847:	JSR $BF74
c_884A:	RTS
c_884B:	LDX $A4
c_884D:	LDA $0578,X
c_8850:	BPL $8853
c_8852:	RTS
c_8853:	LDA $062B
c_8856:	AND #$18
c_8858:	LSR
c_8859:	LSR
c_885A:	LSR
c_885B:	ASL
c_885C:	TAX
c_885D:	LDA $887F,X
c_8860:	STA $32
c_8862:	LDA $8880,X
c_8865:	STA $33
c_8867:	LDY #$80
c_8869:	LDX $A4
c_886B:	LDA ObjectSlot,X
c_886E:	AND #$01
c_8870:	BEQ $8874
c_8872:	LDY #$C0
c_8874:	STY $36
c_8876:	LDA #$00
c_8878:	STA $05F0
c_887B:	JSR $A118
c_887E:	RTS
c_887F:	.db $87	;piranha plant mappings
c_8880:	.db $88
c_8881:	.db $90
c_8882:	.db $88
c_8883:	.db $99
c_8884:	.db $88
c_8885:	.db $A2
c_8886:	.db $88
c_8887:	.db $02
c_8888:	.db $03
c_8889:	.db $97
c_888A:	.db $0D
c_888B:	.db $0E
c_888C:	.db $11
c_888D:	.db $12
c_888E:	.db $15
c_888F:	.db $16
c_8890:	.db $02
c_8891:	.db $03
c_8892:	.db $97
c_8893:	.db $0F
c_8894:	.db $10
c_8895:	.db $13
c_8896:	.db $14
c_8897:	.db $17
c_8898:	.db $18
c_8899:	.db $02
c_889A:	.db $03
c_889B:	.db $97
c_889C:	.db $0D
c_889D:	.db $0E
c_889E:	.db $11
c_889F:	.db $12
c_88A0:	.db $19
c_88A1:	.db $1A
c_88A2:	.db $02
c_88A3:	.db $03
c_88A4:	.db $97
c_88A5:	.db $0F
c_88A6:	.db $10
c_88A7:	.db $13
c_88A8:	.db $14
c_88A9:	.db $19
c_88AA:	.db $1B
c_88AB:	LDX $A4
c_88AD:	LDA ObjectXPos,X
c_88B0:	SEC
c_88B1:	SBC PlayerXPosDup
c_88B3:	STA $05A0,X
c_88B6:	LDA ObjectXScreen,X
c_88B9:	SBC PlayerXScreenDup
c_88BB:	STA $05B4,X
c_88BE:	STA $28
c_88C0:	BEQ $88C9
c_88C2:	CMP #$FF
c_88C4:	BEQ $88C9
c_88C6:	JMP $A6B5
c_88C9:	LDA ObjectYPos,X
c_88CC:	SEC
c_88CD:	SBC PlayerYPosDup
c_88CF:	STA $05C8,X
c_88D2:	LDA ObjectYScreen,X
c_88D5:	SBC PlayerYScreenDup
c_88D7:	STA $05DC,X
c_88DA:	LDA PlayerYScreenDup
c_88DC:	CMP ObjectYScreen,X
c_88DF:	BEQ $890B
c_88E1:	LDA $05DC,X
c_88E4:	BPL $88FA
c_88E6:	LDA $05C8,X
c_88E9:	CLC
c_88EA:	ADC #$10
c_88EC:	STA $05C8,X
c_88EF:	LDA $05DC,X
c_88F2:	ADC #$00
c_88F4:	STA $05DC,X
c_88F7:	JMP $890B
c_88FA:	LDA $05C8,X
c_88FD:	SEC
c_88FE:	SBC #$10
c_8900:	STA $05C8,X
c_8903:	LDA $05DC,X
c_8906:	SBC #$00
c_8908:	STA $05DC,X
c_890B:	LDA FreezeFlag
c_890E:	BEQ $8911
c_8910:	RTS
c_8911:	RTS
c_8912:	RTS
c_8913:	LDX $A4
c_8915:	LDA ObjectXPos,X
c_8918:	SEC
c_8919:	SBC PlayerXPosDup
c_891B:	STA $05A0,X
c_891E:	LDA ObjectXScreen,X
c_8921:	SBC PlayerXScreenDup
c_8923:	STA $05B4,X
c_8926:	STA $28
c_8928:	BEQ $8931
c_892A:	CMP #$FF
c_892C:	BEQ $8931
c_892E:	JMP $A6B5
c_8931:	LDA ObjectYPos,X
c_8934:	SEC
c_8935:	SBC PlayerYPosDup
c_8937:	STA $05C8,X
c_893A:	LDA ObjectYScreen,X
c_893D:	SBC PlayerYScreenDup
c_893F:	STA $05DC,X
c_8942:	LDA PlayerYScreenDup
c_8944:	CMP ObjectYScreen,X
c_8947:	BEQ $8973
c_8949:	LDA $05DC,X
c_894C:	BPL $8962
c_894E:	LDA $05C8,X
c_8951:	CLC
c_8952:	ADC #$10
c_8954:	STA $05C8,X
c_8957:	LDA $05DC,X
c_895A:	ADC #$00
c_895C:	STA $05DC,X
c_895F:	JMP $8973
c_8962:	LDA $05C8,X
c_8965:	SEC
c_8966:	SBC #$10
c_8968:	STA $05C8,X
c_896B:	LDA $05DC,X
c_896E:	SBC #$00
c_8970:	STA $05DC,X
c_8973:	LDA FreezeFlag
c_8976:	BEQ $8979
c_8978:	RTS
c_8979:	LDA $0578,X
c_897C:	CMP #$80
c_897E:	BNE $8995
c_8980:	LDA ObjectYPos,X
c_8983:	SEC
c_8984:	SBC #$08
c_8986:	STA ObjectYPos,X
c_8989:	LDA ObjectYScreen,X
c_898C:	SBC #$00
c_898E:	STA ObjectYScreen,X
c_8991:	JSR $B5BB
c_8994:	RTS
c_8995:	LDA GuidedObjStatus,X
c_8998:	BEQ $89CF
c_899A:	CMP #$02
c_899C:	BEQ $89CB
c_899E:	LDY ObjectCount
c_89A0:	INC ObjectCount
c_89A2:	LDA ObjectXPos,X
c_89A5:	STA ObjectXPos,Y
c_89A8:	LDA ObjectXScreen,X
c_89AB:	STA ObjectXScreen,Y
c_89AE:	LDA ObjectYPos,X
c_89B1:	STA ObjectYPos,Y
c_89B4:	LDA ObjectYScreen,X
c_89B7:	STA ObjectYScreen,Y
c_89BA:	LDA #$00
c_89BC:	STA $0578,Y
c_89BF:	STA ObjectState,Y
c_89C2:	LDA #$0D
c_89C4:	STA ObjectSlot,Y
c_89C7:	INC GuidedObjStatus,X
c_89CA:	RTS
c_89CB:	JSR $B4FC
c_89CE:	RTS
c_89CF:	JSR $89F6
c_89D2:	LDX $A4
c_89D4:	LDA ObjectState,X
c_89D7:	AND #$0F
c_89D9:	CMP #$04
c_89DB:	BNE $89DE
c_89DD:	RTS
c_89DE:	LDA ObjectSlot,X
c_89E1:	SEC
c_89E2:	SBC #$10
c_89E4:	LSR
c_89E5:	CLC
c_89E6:	ADC #$10
c_89E8:	STA $25
c_89EA:	LDA $06
c_89EC:	AND #$01
c_89EE:	BNE $89F5
c_89F0:	LDA $25
c_89F2:	JSR $B11D
c_89F5:	RTS
c_89F6:	LDA #$06
c_89F8:	STA $25
c_89FA:	LDX $A4
c_89FC:	LDA ObjectXPos,X
c_89FF:	SEC
c_8A00:	SBC PlayerXPosDup
c_8A02:	STA $05A0,X
c_8A05:	LDA ObjectXScreen,X
c_8A08:	SBC PlayerXScreenDup
c_8A0A:	STA $05B4,X
c_8A0D:	STA $28
c_8A0F:	BEQ $8A18
c_8A11:	CMP #$FF
c_8A13:	BEQ $8A18
c_8A15:	JMP $A6B5
c_8A18:	LDA ObjectYPos,X
c_8A1B:	SEC
c_8A1C:	SBC PlayerYPosDup
c_8A1E:	STA $05C8,X
c_8A21:	LDA ObjectYScreen,X
c_8A24:	SBC PlayerYScreenDup
c_8A26:	STA $05DC,X
c_8A29:	LDA PlayerYScreenDup
c_8A2B:	CMP ObjectYScreen,X
c_8A2E:	BEQ $8A5A
c_8A30:	LDA $05DC,X
c_8A33:	BPL $8A49
c_8A35:	LDA $05C8,X
c_8A38:	CLC
c_8A39:	ADC #$10
c_8A3B:	STA $05C8,X
c_8A3E:	LDA $05DC,X
c_8A41:	ADC #$00
c_8A43:	STA $05DC,X
c_8A46:	JMP $8A5A
c_8A49:	LDA $05C8,X
c_8A4C:	SEC
c_8A4D:	SBC #$10
c_8A4F:	STA $05C8,X
c_8A52:	LDA $05DC,X
c_8A55:	SBC #$00
c_8A57:	STA $05DC,X
c_8A5A:	LDA FreezeFlag
c_8A5D:	BEQ $8A60
c_8A5F:	RTS
c_8A60:	LDA ObjectState,X
c_8A63:	AND #$1F
c_8A65:	ASL
c_8A66:	TAY
c_8A67:	LDA $8A74,Y
c_8A6A:	STA $32
c_8A6C:	LDA $8A75,Y
c_8A6F:	STA $33
c_8A71:	JMP ($32)
c_8A74:	.db $BB
c_8A75:	.db $A7
c_8A76:	.db $7B
c_8A77:	.db $AA
c_8A78:	.db $29
c_8A79:	.db $AB
c_8A7A:	.db $7E
c_8A7B:	.db $8A
c_8A7C:	.db $88
c_8A7D:	.db $AD
c_8A7E:	JSR $A6D4
c_8A81:	JSR $BEBC
c_8A84:	JSR $A74D
c_8A87:	JSR $BCBE
c_8A8A:	LDX $A4
c_8A8C:	LDY #$01
c_8A8E:	LDA ObjectSlot,X
c_8A91:	CMP #$20
c_8A93:	BCC $8A96
c_8A95:	INY
c_8A96:	TYA
c_8A97:	STA GuidedObjStatus,X
c_8A9A:	LDA #$81
c_8A9C:	STA $0578,X
c_8A9F:	RTS
c_8AA0:	LDX $A4
c_8AA2:	LDA $0578,X
c_8AA5:	BPL $8AAB
c_8AA7:	LDY #$0C
c_8AA9:	BNE $8AC9
c_8AAB:	AND #$7F
c_8AAD:	TAY
c_8AAE:	LDA $8AF1,Y
c_8AB1:	TAY
c_8AB2:	LDA ObjectSlot,X
c_8AB5:	CMP #$20
c_8AB7:	BCC $8AC1
c_8AB9:	CMP #$22
c_8ABB:	BCC $8ABF
c_8ABD:	LDY #$08
c_8ABF:	INY
c_8AC0:	INY
c_8AC1:	LDA $062B
c_8AC4:	AND #$04
c_8AC6:	BNE $8AC9
c_8AC8:	INY
c_8AC9:	TYA
c_8ACA:	ASL
c_8ACB:	TAX
c_8ACC:	LDA $8B05,X
c_8ACF:	STA $32
c_8AD1:	LDA $8B06,X
c_8AD4:	STA $33
c_8AD6:	LDY #$80
c_8AD8:	LDX $A4
c_8ADA:	LDA ObjectSlot,X
c_8ADD:	AND #$01
c_8ADF:	BEQ $8AE3
c_8AE1:	LDY #$C0
c_8AE3:	STY $36
c_8AE5:	LDA ObjectState,X
c_8AE8:	AND #$40
c_8AEA:	STA $05F0
c_8AED:	JSR $A118
c_8AF0:	RTS
c_8AF1:	.db $00
c_8AF2:	.db $00
c_8AF3:	.db $00
c_8AF4:	.db $00
c_8AF5:	.db $04
c_8AF6:	.db $04
c_8AF7:	.db $04
c_8AF8:	.db $04
c_8AF9:	.db $04
c_8AFA:	.db $04
c_8AFB:	.db $04
c_8AFC:	.db $04
c_8AFD:	.db $04
c_8AFE:	.db $08
c_8AFF:	.db $08
c_8B00:	.db $08
c_8B01:	.db $08
c_8B02:	.db $08
c_8B03:	.db $08
c_8B04:	.db $08
c_8B05:	.db $1F	;cape koopa mappings
c_8B06:	.db $8B
c_8B07:	.db $2B
c_8B08:	.db $8B
c_8B09:	.db $1F
c_8B0A:	.db $8B
c_8B0B:	.db $2B
c_8B0C:	.db $8B
c_8B0D:	.db $43
c_8B0E:	.db $8B
c_8B0F:	.db $67
c_8B10:	.db $8B
c_8B11:	.db $43
c_8B12:	.db $8B
c_8B13:	.db $37
c_8B14:	.db $8B
c_8B15:	.db $5B
c_8B16:	.db $8B
c_8B17:	.db $73
c_8B18:	.db $8B
c_8B19:	.db $5B
c_8B1A:	.db $8B
c_8B1B:	.db $4F
c_8B1C:	.db $8B
c_8B1D:	.db $7F
c_8B1E:	.db $8B
c_8B1F:	.db $03
c_8B20:	.db $03
c_8B21:	.db $96
c_8B22:	.db $FF
c_8B23:	.db $FF
c_8B24:	.db $FF
c_8B25:	.db $06
c_8B26:	.db $1A
c_8B27:	.db $1B
c_8B28:	.db $21
c_8B29:	.db $22
c_8B2A:	.db $23
c_8B2B:	.db $03
c_8B2C:	.db $03
c_8B2D:	.db $96
c_8B2E:	.db $FF
c_8B2F:	.db $FF
c_8B30:	.db $FF
c_8B31:	.db $1C
c_8B32:	.db $1D
c_8B33:	.db $1E
c_8B34:	.db $24
c_8B35:	.db $25
c_8B36:	.db $23
c_8B37:	.db $03
c_8B38:	.db $03
c_8B39:	.db $96
c_8B3A:	.db $FF
c_8B3B:	.db $01
c_8B3C:	.db $02
c_8B3D:	.db $06
c_8B3E:	.db $07
c_8B3F:	.db $08
c_8B40:	.db $10
c_8B41:	.db $11
c_8B42:	.db $FF
c_8B43:	.db $03
c_8B44:	.db $03
c_8B45:	.db $96
c_8B46:	.db $03
c_8B47:	.db $04
c_8B48:	.db $05
c_8B49:	.db $09
c_8B4A:	.db $0A
c_8B4B:	.db $0B
c_8B4C:	.db $12
c_8B4D:	.db $13
c_8B4E:	.db $FF
c_8B4F:	.db $03
c_8B50:	.db $03
c_8B51:	.db $96
c_8B52:	.db $FF
c_8B53:	.db $FF
c_8B54:	.db $FF
c_8B55:	.db $06
c_8B56:	.db $0C
c_8B57:	.db $0D
c_8B58:	.db $14
c_8B59:	.db $15
c_8B5A:	.db $16
c_8B5B:	.db $03
c_8B5C:	.db $03
c_8B5D:	.db $96
c_8B5E:	.db $FF
c_8B5F:	.db $FF
c_8B60:	.db $FF
c_8B61:	.db $06
c_8B62:	.db $0E
c_8B63:	.db $0F
c_8B64:	.db $14
c_8B65:	.db $17
c_8B66:	.db $18
c_8B67:	.db $03
c_8B68:	.db $03
c_8B69:	.db $96
c_8B6A:	.db $FF
c_8B6B:	.db $01
c_8B6C:	.db $3A
c_8B6D:	.db $06
c_8B6E:	.db $38
c_8B6F:	.db $39
c_8B70:	.db $10
c_8B71:	.db $11
c_8B72:	.db $FF
c_8B73:	.db $03
c_8B74:	.db $03
c_8B75:	.db $96
c_8B76:	.db $FF
c_8B77:	.db $FF
c_8B78:	.db $FF
c_8B79:	.db $06
c_8B7A:	.db $3B
c_8B7B:	.db $3C
c_8B7C:	.db $14
c_8B7D:	.db $3D
c_8B7E:	.db $3E
c_8B7F:	.db $03
c_8B80:	.db $03
c_8B81:	.db $96
c_8B82:	.db $FF
c_8B83:	.db $19
c_8B84:	.db $FF
c_8B85:	.db $1F
c_8B86:	.db $20
c_8B87:	.db $1E
c_8B88:	.db $26
c_8B89:	.db $27
c_8B8A:	.db $28
c_8B8B:	LDX $A4
c_8B8D:	LDA ObjectState,X
c_8B90:	CMP #$04
c_8B92:	BCS $8BB3
c_8B94:	LDA $062B
c_8B97:	AND #$07
c_8B99:	BNE $8BB3
c_8B9B:	LDA $0578,X
c_8B9E:	CMP #$1F
c_8BA0:	BCC $8BA9
c_8BA2:	LDA #$00
c_8BA4:	STA $0578,X
c_8BA7:	BEQ $8BB3
c_8BA9:	CMP #$04
c_8BAB:	BNE $8BB0
c_8BAD:	JSR $8C53
c_8BB0:	INC $0578,X
c_8BB3:	LDA #$06
c_8BB5:	STA $25
c_8BB7:	LDX $A4
c_8BB9:	LDA ObjectXPos,X
c_8BBC:	SEC
c_8BBD:	SBC PlayerXPosDup
c_8BBF:	STA $05A0,X
c_8BC2:	LDA ObjectXScreen,X
c_8BC5:	SBC PlayerXScreenDup
c_8BC7:	STA $05B4,X
c_8BCA:	STA $28
c_8BCC:	BEQ $8BD5
c_8BCE:	CMP #$FF
c_8BD0:	BEQ $8BD5
c_8BD2:	JMP $A6B5
c_8BD5:	LDA ObjectYPos,X
c_8BD8:	SEC
c_8BD9:	SBC PlayerYPosDup
c_8BDB:	STA $05C8,X
c_8BDE:	LDA ObjectYScreen,X
c_8BE1:	SBC PlayerYScreenDup
c_8BE3:	STA $05DC,X
c_8BE6:	LDA PlayerYScreenDup
c_8BE8:	CMP ObjectYScreen,X
c_8BEB:	BEQ $8C17
c_8BED:	LDA $05DC,X
c_8BF0:	BPL $8C06
c_8BF2:	LDA $05C8,X
c_8BF5:	CLC
c_8BF6:	ADC #$10
c_8BF8:	STA $05C8,X
c_8BFB:	LDA $05DC,X
c_8BFE:	ADC #$00
c_8C00:	STA $05DC,X
c_8C03:	JMP $8C17
c_8C06:	LDA $05C8,X
c_8C09:	SEC
c_8C0A:	SBC #$10
c_8C0C:	STA $05C8,X
c_8C0F:	LDA $05DC,X
c_8C12:	SBC #$00
c_8C14:	STA $05DC,X
c_8C17:	LDA FreezeFlag
c_8C1A:	BEQ $8C1D
c_8C1C:	RTS
c_8C1D:	LDA ObjectState,X
c_8C20:	AND #$1F
c_8C22:	ASL
c_8C23:	TAY
c_8C24:	LDA $8C31,Y
c_8C27:	STA $32
c_8C29:	LDA $8C32,Y
c_8C2C:	STA $33
c_8C2E:	JMP ($32)
c_8C31:	.db $BB
c_8C32:	.db $A7
c_8C33:	.db $7B
c_8C34:	.db $AA
c_8C35:	.db $29
c_8C36:	.db $AB
c_8C37:	.db $3B
c_8C38:	.db $8C
c_8C39:	.db $48
c_8C3A:	.db $8C
c_8C3B:	JSR $A6D4
c_8C3E:	JSR $BC3E
c_8C41:	JSR $A74D
c_8C44:	JSR $BF74
c_8C47:	RTS
c_8C48:	LDA #$0F
c_8C4A:	STA ObjectSlot,X
c_8C4D:	LDA #$00
c_8C4F:	STA ObjectState,X
c_8C52:	RTS
c_8C53:	LDY ObjectCount
c_8C55:	INC ObjectCount
c_8C57:	INC ObjectCount
c_8C59:	INC ObjectCount
c_8C5B:	INC ObjectCount
c_8C5D:	LDA ObjectXPos,X
c_8C60:	CLC
c_8C61:	ADC #$0C
c_8C63:	STA ObjectXPos,Y
c_8C66:	STA ObjectXPos2,Y
c_8C69:	STA ObjectXPos3,Y
c_8C6C:	STA ObjectXPos4,Y
c_8C6F:	LDA ObjectXScreen,X
c_8C72:	STA ObjectXScreen,Y
c_8C75:	STA ObjectXScreen2,Y
c_8C78:	STA ObjectXScreen3,Y
c_8C7B:	STA ObjectXScreen4,Y
c_8C7E:	LDA ObjectYPos,X
c_8C81:	STA ObjectYPos,Y
c_8C84:	STA ObjectYPos2,Y
c_8C87:	STA ObjectYPos3,Y
c_8C8A:	STA ObjectYPos4,Y
c_8C8D:	LDA ObjectYScreen,X
c_8C90:	STA ObjectYScreen,Y
c_8C93:	STA ObjectYScreen2,Y
c_8C96:	STA ObjectYScreen3,Y
c_8C99:	STA ObjectYScreen4,Y
c_8C9C:	LDA ObjectSlot,X
c_8C9F:	CLC
c_8CA0:	ADC #$02
c_8CA2:	STA ObjectSlot,Y
c_8CA5:	CLC
c_8CA6:	ADC #$02
c_8CA8:	STA ObjectSlot2,Y
c_8CAB:	CLC
c_8CAC:	ADC #$02
c_8CAE:	STA ObjectSlot3,Y
c_8CB1:	CLC
c_8CB2:	ADC #$02
c_8CB4:	STA ObjectSlot4,Y
c_8CB7:	LDA #$00
c_8CB9:	STA ObjectState,Y
c_8CBC:	STA ObjectState2,Y
c_8CBF:	STA ObjectState3,Y
c_8CC2:	STA ObjectState4,Y
c_8CC5:	STA $0578,Y
c_8CC8:	STA $0579,Y
c_8CCB:	STA $057A,Y
c_8CCE:	STA $057B,Y
c_8CD1:	STA GuidedObjStatus,Y
c_8CD4:	STA GuidedObjStatus2,Y
c_8CD7:	STA GuidedObjStatus3,Y
c_8CDA:	STA GuidedObjStatus4,Y
c_8CDD:	RTS
c_8CDE:	LDX $A4
c_8CE0:	LDA $0578,X
c_8CE3:	TAY
c_8CE4:	LDA $8D0B,Y
c_8CE7:	ASL
c_8CE8:	TAX
c_8CE9:	LDA $8D2B,X
c_8CEC:	STA $32
c_8CEE:	LDA $8D2C,X
c_8CF1:	STA $33
c_8CF3:	LDY #$80
c_8CF5:	LDX $A4
c_8CF7:	LDA ObjectSlot,X
c_8CFA:	AND #$01
c_8CFC:	BEQ $8D00
c_8CFE:	LDY #$C0
c_8D00:	STY $36
c_8D02:	LDA #$00
c_8D04:	STA $05F0
c_8D07:	JSR $A118
c_8D0A:	RTS
c_8D0B:	.db $00	;lotus mappings
c_8D0C:	.db $00
c_8D0D:	.db $00
c_8D0E:	.db $00
c_8D0F:	.db $02
c_8D10:	.db $02
c_8D11:	.db $02
c_8D12:	.db $02
c_8D13:	.db $02
c_8D14:	.db $02
c_8D15:	.db $02
c_8D16:	.db $02
c_8D17:	.db $00
c_8D18:	.db $01
c_8D19:	.db $00
c_8D1A:	.db $01
c_8D1B:	.db $00
c_8D1C:	.db $01
c_8D1D:	.db $00
c_8D1E:	.db $01
c_8D1F:	.db $00
c_8D20:	.db $01
c_8D21:	.db $00
c_8D22:	.db $01
c_8D23:	.db $00
c_8D24:	.db $01
c_8D25:	.db $00
c_8D26:	.db $01
c_8D27:	.db $00
c_8D28:	.db $00
c_8D29:	.db $00
c_8D2A:	.db $00
c_8D2B:	.db $31
c_8D2C:	.db $8D
c_8D2D:	.db $3C
c_8D2E:	.db $8D
c_8D2F:	.db $47
c_8D30:	.db $8D
c_8D31:	.db $04
c_8D32:	.db $02
c_8D33:	.db $97
c_8D34:	.db $FF
c_8D35:	.db $05
c_8D36:	.db $06
c_8D37:	.db $FF
c_8D38:	.db $09
c_8D39:	.db $0A
c_8D3A:	.db $0B
c_8D3B:	.db $0C
c_8D3C:	.db $04
c_8D3D:	.db $02
c_8D3E:	.db $97
c_8D3F:	.db $FF
c_8D40:	.db $03
c_8D41:	.db $04
c_8D42:	.db $FF
c_8D43:	.db $09
c_8D44:	.db $0A
c_8D45:	.db $0B
c_8D46:	.db $0C
c_8D47:	.db $04
c_8D48:	.db $02
c_8D49:	.db $97
c_8D4A:	.db $FF
c_8D4B:	.db $01
c_8D4C:	.db $02
c_8D4D:	.db $FF
c_8D4E:	.db $09
c_8D4F:	.db $0A
c_8D50:	.db $0B
c_8D51:	.db $0C
c_8D52:	LDA #$07
c_8D54:	STA $25
c_8D56:	LDX $A4
c_8D58:	LDA ObjectXPos,X
c_8D5B:	SEC
c_8D5C:	SBC PlayerXPosDup
c_8D5E:	STA $05A0,X
c_8D61:	LDA ObjectXScreen,X
c_8D64:	SBC PlayerXScreenDup
c_8D66:	STA $05B4,X
c_8D69:	STA $28
c_8D6B:	BEQ $8D74
c_8D6D:	CMP #$FF
c_8D6F:	BEQ $8D74
c_8D71:	JMP $A6B5
c_8D74:	LDA ObjectYPos,X
c_8D77:	SEC
c_8D78:	SBC PlayerYPosDup
c_8D7A:	STA $05C8,X
c_8D7D:	LDA ObjectYScreen,X
c_8D80:	SBC PlayerYScreenDup
c_8D82:	STA $05DC,X
c_8D85:	LDA PlayerYScreenDup
c_8D87:	CMP ObjectYScreen,X
c_8D8A:	BEQ $8DB6
c_8D8C:	LDA $05DC,X
c_8D8F:	BPL $8DA5
c_8D91:	LDA $05C8,X
c_8D94:	CLC
c_8D95:	ADC #$10
c_8D97:	STA $05C8,X
c_8D9A:	LDA $05DC,X
c_8D9D:	ADC #$00
c_8D9F:	STA $05DC,X
c_8DA2:	JMP $8DB6
c_8DA5:	LDA $05C8,X
c_8DA8:	SEC
c_8DA9:	SBC #$10
c_8DAB:	STA $05C8,X
c_8DAE:	LDA $05DC,X
c_8DB1:	SBC #$00
c_8DB3:	STA $05DC,X
c_8DB6:	LDA FreezeFlag
c_8DB9:	BEQ $8DBC
c_8DBB:	RTS
c_8DBC:	LDA ObjectState,X
c_8DBF:	AND #$1F
c_8DC1:	ASL
c_8DC2:	TAY
c_8DC3:	LDA $8DD0,Y
c_8DC6:	STA $32
c_8DC8:	LDA $8DD1,Y
c_8DCB:	STA $33
c_8DCD:	JMP ($32)
c_8DD0:	.db $DA
c_8DD1:	.db $8D
c_8DD2:	.db $DA
c_8DD3:	.db $8D
c_8DD4:	.db $DA
c_8DD5:	.db $8D
c_8DD6:	.db $DA
c_8DD7:	.db $8D
c_8DD8:	.db $0E
c_8DD9:	.db $8E
c_8DDA:	LDA ObjectSlot,X
c_8DDD:	SEC
c_8DDE:	SBC #$10
c_8DE0:	LSR
c_8DE1:	CLC
c_8DE2:	ADC #$10
c_8DE4:	STA $25
c_8DE6:	LDA $06
c_8DE8:	AND #$03
c_8DEA:	BNE $8DF1
c_8DEC:	LDA $25
c_8DEE:	JSR $B470
c_8DF1:	LDA ObjectYPos,X
c_8DF4:	CMP #$E0
c_8DF6:	BCC $8E04
c_8DF8:	LDA #$00
c_8DFA:	STA ObjectSlot,X
c_8DFD:	STA ObjectState,X
c_8E00:	STA $0578,X
c_8E03:	RTS
c_8E04:	JSR $A6D4
c_8E07:	JSR $BC3E
c_8E0A:	JSR $BF74
c_8E0D:	RTS
c_8E0E:	LDA #$00
c_8E10:	STA ObjectSlot,X
c_8E13:	STA ObjectState,X
c_8E16:	RTS
c_8E17:	LDY #$00
c_8E19:	LDA $062B
c_8E1C:	AND #$04
c_8E1E:	BEQ $8E21
c_8E20:	INY
c_8E21:	TYA
c_8E22:	ASL
c_8E23:	TAX
c_8E24:	LDA $8E46,X
c_8E27:	STA $32
c_8E29:	LDA $8E47,X
c_8E2C:	STA $33
c_8E2E:	LDY #$80
c_8E30:	LDX $A4
c_8E32:	LDA ObjectSlot,X
c_8E35:	AND #$01
c_8E37:	BEQ $8E3B
c_8E39:	LDY #$C0
c_8E3B:	STY $36
c_8E3D:	LDA #$00
c_8E3F:	STA $05F0
c_8E42:	JSR $A118
c_8E45:	RTS
c_8E46:	.db $4A
c_8E47:	.db $8E
c_8E48:	.db $4E
c_8E49:	.db $8E
c_8E4A:	.db $01
c_8E4B:	.db $01
c_8E4C:	.db $97
c_8E4D:	.db $07
c_8E4E:	.db $01
c_8E4F:	.db $01
c_8E50:	.db $97
c_8E51:	.db $08
c_8E52:	LDX $A4
c_8E54:	LDA $0578,X
c_8E57:	BMI $8E5C
c_8E59:	JMP $8EE9
c_8E5C:	LDA ObjectXPos,X
c_8E5F:	SEC
c_8E60:	SBC PlayerXPosDup
c_8E62:	STA $05A0,X
c_8E65:	LDA ObjectXScreen,X
c_8E68:	SBC PlayerXScreenDup
c_8E6A:	STA $05B4,X
c_8E6D:	STA $28
c_8E6F:	BEQ $8E78
c_8E71:	CMP #$FF
c_8E73:	BEQ $8E78
c_8E75:	JMP $A6B5
c_8E78:	LDA ObjectYPos,X
c_8E7B:	SEC
c_8E7C:	SBC PlayerYPosDup
c_8E7E:	STA $05C8,X
c_8E81:	LDA ObjectYScreen,X
c_8E84:	SBC PlayerYScreenDup
c_8E86:	STA $05DC,X
c_8E89:	LDA PlayerYScreenDup
c_8E8B:	CMP ObjectYScreen,X
c_8E8E:	BEQ $8EBA
c_8E90:	LDA $05DC,X
c_8E93:	BPL $8EA9
c_8E95:	LDA $05C8,X
c_8E98:	CLC
c_8E99:	ADC #$10
c_8E9B:	STA $05C8,X
c_8E9E:	LDA $05DC,X
c_8EA1:	ADC #$00
c_8EA3:	STA $05DC,X
c_8EA6:	JMP $8EBA
c_8EA9:	LDA $05C8,X
c_8EAC:	SEC
c_8EAD:	SBC #$10
c_8EAF:	STA $05C8,X
c_8EB2:	LDA $05DC,X
c_8EB5:	SBC #$00
c_8EB7:	STA $05DC,X
c_8EBA:	LDA FreezeFlag
c_8EBD:	BEQ $8EC0
c_8EBF:	RTS
c_8EC0:	LDA $0578,X
c_8EC3:	CMP #$80
c_8EC5:	BNE $8ED9
c_8EC7:	LDA $05A0,X
c_8ECA:	BPL $8ED1
c_8ECC:	EOR #$FF
c_8ECE:	CLC
c_8ECF:	ADC #$01
c_8ED1:	CMP #$40
c_8ED3:	BCS $8ED8
c_8ED5:	INC $0578,X
c_8ED8:	RTS
c_8ED9:	CMP #$81
c_8EDB:	BNE $8EE5
c_8EDD:	LDA #$10
c_8EDF:	STA SFXRegister
c_8EE1:	JSR $B5BB
c_8EE4:	RTS
c_8EE5:	JSR $B4FC
c_8EE8:	RTS
c_8EE9:	LDA #$06
c_8EEB:	STA $25
c_8EED:	LDX $A4
c_8EEF:	LDA ObjectXPos,X
c_8EF2:	SEC
c_8EF3:	SBC PlayerXPosDup
c_8EF5:	STA $05A0,X
c_8EF8:	LDA ObjectXScreen,X
c_8EFB:	SBC PlayerXScreenDup
c_8EFD:	STA $05B4,X
c_8F00:	STA $28
c_8F02:	BEQ $8F0B
c_8F04:	CMP #$FF
c_8F06:	BEQ $8F0B
c_8F08:	JMP $A6B5
c_8F0B:	LDA ObjectYPos,X
c_8F0E:	SEC
c_8F0F:	SBC PlayerYPosDup
c_8F11:	STA $05C8,X
c_8F14:	LDA ObjectYScreen,X
c_8F17:	SBC PlayerYScreenDup
c_8F19:	STA $05DC,X
c_8F1C:	LDA PlayerYScreenDup
c_8F1E:	CMP ObjectYScreen,X
c_8F21:	BEQ $8F4D
c_8F23:	LDA $05DC,X
c_8F26:	BPL $8F3C
c_8F28:	LDA $05C8,X
c_8F2B:	CLC
c_8F2C:	ADC #$10
c_8F2E:	STA $05C8,X
c_8F31:	LDA $05DC,X
c_8F34:	ADC #$00
c_8F36:	STA $05DC,X
c_8F39:	JMP $8F4D
c_8F3C:	LDA $05C8,X
c_8F3F:	SEC
c_8F40:	SBC #$10
c_8F42:	STA $05C8,X
c_8F45:	LDA $05DC,X
c_8F48:	SBC #$00
c_8F4A:	STA $05DC,X
c_8F4D:	LDA FreezeFlag
c_8F50:	BEQ $8F53
c_8F52:	RTS
c_8F53:	LDA ObjectState,X
c_8F56:	AND #$1F
c_8F58:	ASL
c_8F59:	TAY
c_8F5A:	LDA $8F67,Y
c_8F5D:	STA $32
c_8F5F:	LDA $8F68,Y
c_8F62:	STA $33
c_8F64:	JMP ($32)
c_8F67:	.db $BB
c_8F68:	.db $A7
c_8F69:	.db $7B
c_8F6A:	.db $AA
c_8F6B:	.db $29
c_8F6C:	.db $AB
c_8F6D:	.db $71
c_8F6E:	.db $8F
c_8F6F:	.db $88
c_8F70:	.db $AD
c_8F71:	LDA $06
c_8F73:	AND #$00
c_8F75:	BNE $8F7C
c_8F77:	LDA #$1F
c_8F79:	JSR $B11D
c_8F7C:	JSR $A6D4
c_8F7F:	JSR $BEBC
c_8F82:	JSR $A74D
c_8F85:	JSR $BCBE
c_8F88:	LDX $A4
c_8F8A:	LDA #$82
c_8F8C:	STA $0578,X
c_8F8F:	RTS
c_8F90:	LDX $A4
c_8F92:	LDA $0578,X
c_8F95:	BPL $8FA1
c_8F97:	LDY #$00
c_8F99:	CMP #$82
c_8F9B:	BCC $8FAB
c_8F9D:	LDY #$02
c_8F9F:	BNE $8FAB
c_8FA1:	LDY #$01
c_8FA3:	LDA $062B
c_8FA6:	AND #$04
c_8FA8:	BEQ $8FAB
c_8FAA:	INY
c_8FAB:	TYA
c_8FAC:	ASL
c_8FAD:	TAX
c_8FAE:	LDA $8FD3,X
c_8FB1:	STA $32
c_8FB3:	LDA $8FD4,X
c_8FB6:	STA $33
c_8FB8:	LDY #$80
c_8FBA:	LDX $A4
c_8FBC:	LDA ObjectSlot,X
c_8FBF:	AND #$01
c_8FC1:	BEQ $8FC5
c_8FC3:	LDY #$C0
c_8FC5:	STY $36
c_8FC7:	LDA ObjectState,X
c_8FCA:	AND #$40
c_8FCC:	STA $05F0
c_8FCF:	JSR $A118
c_8FD2:	RTS
c_8FD3:	.db $D9	;swooper mappings
c_8FD4:	.db $8F
c_8FD5:	.db $E2
c_8FD6:	.db $8F
c_8FD7:	.db $EB
c_8FD8:	.db $8F
c_8FD9:	.db $03
c_8FDA:	.db $02
c_8FDB:	.db $96
c_8FDC:	.db $FF
c_8FDD:	.db $2E
c_8FDE:	.db $2F
c_8FDF:	.db $FF
c_8FE0:	.db $36
c_8FE1:	.db $37
c_8FE2:	.db $03
c_8FE3:	.db $02
c_8FE4:	.db $96
c_8FE5:	.db $FF
c_8FE6:	.db $29
c_8FE7:	.db $2A
c_8FE8:	.db $30
c_8FE9:	.db $31
c_8FEA:	.db $32
c_8FEB:	.db $03
c_8FEC:	.db $02
c_8FED:	.db $96
c_8FEE:	.db $2B
c_8FEF:	.db $2C
c_8FF0:	.db $2D
c_8FF1:	.db $33
c_8FF2:	.db $34
c_8FF3:	.db $35
c_8FF4:	LDX $A4
c_8FF6:	LDA $0578,X
c_8FF9:	BPL c_9063
c_8FFB:	LDA ObjectXPos,X
c_8FFE:	SEC
c_8FFF:	SBC PlayerXPosDup
c_9001:	STA $05A0,X
c_9004:	LDA ObjectXScreen,X
c_9007:	SBC PlayerXScreenDup
c_9009:	STA $05B4,X
c_900C:	STA $28
c_900E:	BEQ $9017
c_9010:	CMP #$FF
c_9012:	BEQ $9017
c_9014:	JMP $A6B5
c_9017:	LDA ObjectYPos,X
c_901A:	SEC
c_901B:	SBC PlayerYPosDup
c_901D:	STA $05C8,X
c_9020:	LDA ObjectYScreen,X
c_9023:	SBC PlayerYScreenDup
c_9025:	STA $05DC,X
c_9028:	LDA PlayerYScreenDup
c_902A:	CMP ObjectYScreen,X
c_902D:	BEQ $9059
c_902F:	LDA $05DC,X
c_9032:	BPL $9048
c_9034:	LDA $05C8,X
c_9037:	CLC
c_9038:	ADC #$10
c_903A:	STA $05C8,X
c_903D:	LDA $05DC,X
c_9040:	ADC #$00
c_9042:	STA $05DC,X
c_9045:	JMP $9059
c_9048:	LDA $05C8,X
c_904B:	SEC
c_904C:	SBC #$10
c_904E:	STA $05C8,X
c_9051:	LDA $05DC,X
c_9054:	SBC #$00
c_9056:	STA $05DC,X
c_9059:	LDA FreezeFlag
c_905C:	BEQ $905F
c_905E:	RTS
c_905F:	JSR $B5BB
c_9062:	RTS
c_9063:	LDA #$06
c_9065:	STA $25
c_9067:	LDX $A4
c_9069:	LDA ObjectXPos,X
c_906C:	SEC
c_906D:	SBC PlayerXPosDup
c_906F:	STA $05A0,X
c_9072:	LDA ObjectXScreen,X
c_9075:	SBC PlayerXScreenDup
c_9077:	STA $05B4,X
c_907A:	STA $28
c_907C:	BEQ $9085
c_907E:	CMP #$FF
c_9080:	BEQ $9085
c_9082:	JMP $A6B5
c_9085:	LDA ObjectYPos,X
c_9088:	SEC
c_9089:	SBC PlayerYPosDup
c_908B:	STA $05C8,X
c_908E:	LDA ObjectYScreen,X
c_9091:	SBC PlayerYScreenDup
c_9093:	STA $05DC,X
c_9096:	LDA PlayerYScreenDup
c_9098:	CMP ObjectYScreen,X
c_909B:	BEQ $90C7
c_909D:	LDA $05DC,X
c_90A0:	BPL $90B6
c_90A2:	LDA $05C8,X
c_90A5:	CLC
c_90A6:	ADC #$10
c_90A8:	STA $05C8,X
c_90AB:	LDA $05DC,X
c_90AE:	ADC #$00
c_90B0:	STA $05DC,X
c_90B3:	JMP $90C7
c_90B6:	LDA $05C8,X
c_90B9:	SEC
c_90BA:	SBC #$10
c_90BC:	STA $05C8,X
c_90BF:	LDA $05DC,X
c_90C2:	SBC #$00
c_90C4:	STA $05DC,X
c_90C7:	LDA FreezeFlag
c_90CA:	BEQ $90CD
c_90CC:	RTS
c_90CD:	LDA ObjectState,X
c_90D0:	AND #$1F
c_90D2:	ASL
c_90D3:	TAY
c_90D4:	LDA $90E1,Y
c_90D7:	STA $32
c_90D9:	LDA $90E2,Y
c_90DC:	STA $33
c_90DE:	JMP ($32)
c_90E1:	.db $BB
c_90E2:	.db $A7
c_90E3:	.db $7B
c_90E4:	.db $AA
c_90E5:	.db $29
c_90E6:	.db $AB
c_90E7:	.db $EB
c_90E8:	.db $90
c_90E9:	.db $88
c_90EA:	.db $AD
c_90EB:	LDA ObjectSlot,X
c_90EE:	AND #$FE
c_90F0:	CMP #$52
c_90F2:	BEQ $910B
c_90F4:	LDA ObjectSlot,X
c_90F7:	SEC
c_90F8:	SBC #$10
c_90FA:	LSR
c_90FB:	CLC
c_90FC:	ADC #$10
c_90FE:	STA $25
c_9100:	LDA $06
c_9102:	AND #$00
c_9104:	BNE $910B
c_9106:	LDA $25
c_9108:	JSR $B11D
c_910B:	JSR $A6D4
c_910E:	JSR $BC3E
c_9111:	JSR $A74D
c_9114:	JSR $BF74
c_9117:	RTS
c_9118:	LDY #$00
c_911A:	LDX $A4
c_911C:	LDA ObjectState,X
c_911F:	AND #$0F
c_9121:	CMP #$04
c_9123:	BNE $912B
c_9125:	LDY #$02
c_9127:	LDA #$80
c_9129:	BNE $9130
c_912B:	LDA ObjectState,X
c_912E:	AND #$40
c_9130:	STA $05F0
c_9133:	LDA $062B
c_9136:	AND #$04
c_9138:	BEQ $913B
c_913A:	INY
c_913B:	TYA
c_913C:	ASL
c_913D:	TAX
c_913E:	LDA $915B,X
c_9141:	STA $32
c_9143:	LDA $915C,X
c_9146:	STA $33
c_9148:	LDY #$80
c_914A:	LDX $A4
c_914C:	LDA ObjectSlot,X
c_914F:	AND #$01
c_9151:	BEQ $9155
c_9153:	LDY #$C0
c_9155:	STY $36
c_9157:	JSR $A118
c_915A:	RTS
c_915B:	.db $63	;blurp mappings
c_915C:	.db $91
c_915D:	.db $6A
c_915E:	.db $91
c_915F:	.db $71
c_9160:	.db $91
c_9161:	.db $78
c_9162:	.db $91
c_9163:	.db $02
c_9164:	.db $02
c_9165:	.db $A6
c_9166:	.db $03
c_9167:	.db $04
c_9168:	.db $0D
c_9169:	.db $0E
c_916A:	.db $02
c_916B:	.db $02
c_916C:	.db $A6
c_916D:	.db $05
c_916E:	.db $06
c_916F:	.db $0F
c_9170:	.db $0E
c_9171:	.db $02
c_9172:	.db $02
c_9173:	.db $A6
c_9174:	.db $0D
c_9175:	.db $0E
c_9176:	.db $03
c_9177:	.db $04
c_9178:	.db $02
c_9179:	.db $02
c_917A:	.db $A6
c_917B:	.db $0F
c_917C:	.db $0E
c_917D:	.db $05
c_917E:	.db $06
c_917F:	LDX $A4
c_9181:	LDA $0578,X
c_9184:	BMI $9189
c_9186:	JMP $9202
c_9189:	LDA ObjectYPos,X
c_918C:	CLC
c_918D:	ADC #$08
c_918F:	STA ObjectYPos,X
c_9192:	LDA ObjectYScreen,X
c_9195:	ADC #$00
c_9197:	STA ObjectYScreen,X
c_919A:	LDA ObjectXPos,X
c_919D:	SEC
c_919E:	SBC PlayerXPosDup
c_91A0:	STA $05A0,X
c_91A3:	LDA ObjectXScreen,X
c_91A6:	SBC PlayerXScreenDup
c_91A8:	STA $05B4,X
c_91AB:	STA $28
c_91AD:	BEQ $91B6
c_91AF:	CMP #$FF
c_91B1:	BEQ $91B6
c_91B3:	JMP $A6B5
c_91B6:	LDA ObjectYPos,X
c_91B9:	SEC
c_91BA:	SBC PlayerYPosDup
c_91BC:	STA $05C8,X
c_91BF:	LDA ObjectYScreen,X
c_91C2:	SBC PlayerYScreenDup
c_91C4:	STA $05DC,X
c_91C7:	LDA PlayerYScreenDup
c_91C9:	CMP ObjectYScreen,X
c_91CC:	BEQ $91F8
c_91CE:	LDA $05DC,X
c_91D1:	BPL $91E7
c_91D3:	LDA $05C8,X
c_91D6:	CLC
c_91D7:	ADC #$10
c_91D9:	STA $05C8,X
c_91DC:	LDA $05DC,X
c_91DF:	ADC #$00
c_91E1:	STA $05DC,X
c_91E4:	JMP $91F8
c_91E7:	LDA $05C8,X
c_91EA:	SEC
c_91EB:	SBC #$10
c_91ED:	STA $05C8,X
c_91F0:	LDA $05DC,X
c_91F3:	SBC #$00
c_91F5:	STA $05DC,X
c_91F8:	LDA FreezeFlag
c_91FB:	BEQ $91FE
c_91FD:	RTS
c_91FE:	JSR $B5BB
c_9201:	RTS
c_9202:	LDA GuidedObjStatus,X
c_9205:	BNE $920A
c_9207:	JMP $9287
c_920A:	CMP #$10
c_920C:	BCC $9214
c_920E:	LDA #$00
c_9210:	STA GuidedObjStatus,X
c_9213:	RTS
c_9214:	INC GuidedObjStatus,X
c_9217:	LDA $06
c_9219:	AND #$01
c_921B:	BNE $9222
c_921D:	LDA #$4B
c_921F:	JSR $B1DA
c_9222:	LDA ObjectXPos,X
c_9225:	SEC
c_9226:	SBC PlayerXPosDup
c_9228:	STA $05A0,X
c_922B:	LDA ObjectXScreen,X
c_922E:	SBC PlayerXScreenDup
c_9230:	STA $05B4,X
c_9233:	STA $28
c_9235:	BEQ $923E
c_9237:	CMP #$FF
c_9239:	BEQ $923E
c_923B:	JMP $A6B5
c_923E:	LDA ObjectYPos,X
c_9241:	SEC
c_9242:	SBC PlayerYPosDup
c_9244:	STA $05C8,X
c_9247:	LDA ObjectYScreen,X
c_924A:	SBC PlayerYScreenDup
c_924C:	STA $05DC,X
c_924F:	LDA PlayerYScreenDup
c_9251:	CMP ObjectYScreen,X
c_9254:	BEQ $9280
c_9256:	LDA $05DC,X
c_9259:	BPL $926F
c_925B:	LDA $05C8,X
c_925E:	CLC
c_925F:	ADC #$10
c_9261:	STA $05C8,X
c_9264:	LDA $05DC,X
c_9267:	ADC #$00
c_9269:	STA $05DC,X
c_926C:	JMP $9280
c_926F:	LDA $05C8,X
c_9272:	SEC
c_9273:	SBC #$10
c_9275:	STA $05C8,X
c_9278:	LDA $05DC,X
c_927B:	SBC #$00
c_927D:	STA $05DC,X
c_9280:	LDA FreezeFlag
c_9283:	BEQ $9286
c_9285:	RTS
c_9286:	RTS
c_9287:	LDA #$07
c_9289:	STA $25
c_928B:	LDX $A4
c_928D:	LDA ObjectXPos,X
c_9290:	SEC
c_9291:	SBC PlayerXPosDup
c_9293:	STA $05A0,X
c_9296:	LDA ObjectXScreen,X
c_9299:	SBC PlayerXScreenDup
c_929B:	STA $05B4,X
c_929E:	STA $28
c_92A0:	BEQ $92A9
c_92A2:	CMP #$FF
c_92A4:	BEQ $92A9
c_92A6:	JMP $A6B5
c_92A9:	LDA ObjectYPos,X
c_92AC:	SEC
c_92AD:	SBC PlayerYPosDup
c_92AF:	STA $05C8,X
c_92B2:	LDA ObjectYScreen,X
c_92B5:	SBC PlayerYScreenDup
c_92B7:	STA $05DC,X
c_92BA:	LDA PlayerYScreenDup
c_92BC:	CMP ObjectYScreen,X
c_92BF:	BEQ $92EB
c_92C1:	LDA $05DC,X
c_92C4:	BPL $92DA
c_92C6:	LDA $05C8,X
c_92C9:	CLC
c_92CA:	ADC #$10
c_92CC:	STA $05C8,X
c_92CF:	LDA $05DC,X
c_92D2:	ADC #$00
c_92D4:	STA $05DC,X
c_92D7:	JMP $92EB
c_92DA:	LDA $05C8,X
c_92DD:	SEC
c_92DE:	SBC #$10
c_92E0:	STA $05C8,X
c_92E3:	LDA $05DC,X
c_92E6:	SBC #$00
c_92E8:	STA $05DC,X
c_92EB:	LDA FreezeFlag
c_92EE:	BEQ $92F1
c_92F0:	RTS
c_92F1:	LDA ObjectState,X
c_92F4:	AND #$1F
c_92F6:	ASL
c_92F7:	TAY
c_92F8:	LDA $9305,Y
c_92FB:	STA $32
c_92FD:	LDA $9306,Y
c_9300:	STA $33
c_9302:	JMP ($32)
c_9305:	.db $BB
c_9306:	.db $A7
c_9307:	.db $7B
c_9308:	.db $AA
c_9309:	.db $29
c_930A:	.db $AB
c_930B:	.db PlayerXPosDup
c_930C:	.db $93
c_930D:	.db $88
c_930E:	.db $AD
c_930F:	LDA $06
c_9311:	AND #$00
c_9313:	BNE $931A
c_9315:	LDA #$13
c_9317:	JSR $B1DA
c_931A:	JSR $BEBC
c_931D:	JSR $A74D
c_9320:	JSR $BCBE
c_9323:	LDA $0578,X
c_9326:	AND #$06
c_9328:	LSR
c_9329:	TAY
c_932A:	LDA $9345,Y
c_932D:	CLC
c_932E:	ADC ObjectSlot,X
c_9331:	STA ObjectSlot,X
c_9334:	LDA #$00
c_9336:	STA $0641,X
c_9339:	STA $0578,X
c_933C:	LDA ObjectState,X
c_933F:	AND #$40
c_9341:	STA ObjectState,X
c_9344:	RTS
c_9345:	.db $02
c_9346:	.db $04
c_9347:	.db $06
c_9348:	.db $04
c_9349:	LDX $A4
c_934B:	LDA $0578,X
c_934E:	AND #$06
c_9350:	LSR
c_9351:	ASL
c_9352:	TAX
c_9353:	LDA $9395,X
c_9356:	STA $32
c_9358:	LDA $9396,X
c_935B:	STA $33
c_935D:	LDY #$80
c_935F:	LDX $A4
c_9361:	LDA ObjectSlot,X
c_9364:	AND #$01
c_9366:	BEQ $936A
c_9368:	LDY #$C0
c_936A:	STY $36
c_936C:	LDA ObjectState,X
c_936F:	AND #$40
c_9371:	STA $05F0
c_9374:	LDA $06E1
c_9377:	PHA
c_9378:	LDA $04F5
c_937B:	CMP #$26
c_937D:	BNE $938D
c_937F:	LDY #$00
c_9381:	LDA ObjectYPos,X
c_9384:	CMP #$A0
c_9386:	BCC $938A
c_9388:	LDY #$20
c_938A:	STY $06E1
c_938D:	JSR $A118
c_9390:	PLA
c_9391:	STA $06E1
c_9394:	RTS
c_9395:	.db $9D	;mechakoopa mappings
c_9396:	.db $93
c_9397:	.db $AC
c_9398:	.db $93
c_9399:	.db $BB
c_939A:	.db $93
c_939B:	.db $AC
c_939C:	.db $93
c_939D:	.db $04
c_939E:	.db $03
c_939F:	.db $AE
c_93A0:	.db $01
c_93A1:	.db $02
c_93A2:	.db $03
c_93A3:	.db $FF
c_93A4:	.db $09
c_93A5:	.db $0A
c_93A6:	.db $0B
c_93A7:	.db $0C
c_93A8:	.db $14
c_93A9:	.db $15
c_93AA:	.db $16
c_93AB:	.db $17
c_93AC:	.db $04
c_93AD:	.db $03
c_93AE:	.db $AE
c_93AF:	.db $04
c_93B0:	.db $05
c_93B1:	.db $06
c_93B2:	.db $FF
c_93B3:	.db $0D
c_93B4:	.db $0E
c_93B5:	.db $0F
c_93B6:	.db $10
c_93B7:	.db $18
c_93B8:	.db $19
c_93B9:	.db $1A
c_93BA:	.db $1B
c_93BB:	.db $04
c_93BC:	.db $03
c_93BD:	.db $AE
c_93BE:	.db $01
c_93BF:	.db $07
c_93C0:	.db $08
c_93C1:	.db $FF
c_93C2:	.db $09
c_93C3:	.db $11
c_93C4:	.db $12
c_93C5:	.db $13
c_93C6:	.db $14
c_93C7:	.db $1C
c_93C8:	.db $1D
c_93C9:	.db $1E
c_93CA:	LDX $A4
c_93CC:	LDA $0641,X
c_93CF:	CMP #$F0
c_93D1:	BCC $9419
c_93D3:	LDA ObjectSlot,X
c_93D6:	AND #$01
c_93D8:	CLC
c_93D9:	ADC #$3A
c_93DB:	STA ObjectSlot,X
c_93DE:	LDA #$00
c_93E0:	STA ObjectState,X
c_93E3:	STA $0578,X
c_93E6:	STA $0641,X
c_93E9:	LDA #$F8
c_93EB:	BMI $9406
c_93ED:	CLC
c_93EE:	ADC ObjectYPos,X
c_93F1:	STA ObjectYPos,X
c_93F4:	BCS $93FA
c_93F6:	CMP #$F0
c_93F8:	BCC $9418
c_93FA:	CLC
c_93FB:	ADC #$10
c_93FD:	STA ObjectYPos,X
c_9400:	INC ObjectYScreen,X
c_9403:	JMP $9418
c_9406:	CLC
c_9407:	ADC ObjectYPos,X
c_940A:	STA ObjectYPos,X
c_940D:	BCS $9418
c_940F:	SEC
c_9410:	SBC #$10
c_9412:	STA ObjectYPos,X
c_9415:	DEC ObjectYScreen,X
c_9418:	RTS
c_9419:	LDA $062B
c_941C:	AND #$03
c_941E:	BNE $9423
c_9420:	INC $0641,X
c_9423:	LDA #$07
c_9425:	STA $25
c_9427:	LDX $A4
c_9429:	LDA ObjectXPos,X
c_942C:	SEC
c_942D:	SBC PlayerXPosDup
c_942F:	STA $05A0,X
c_9432:	LDA ObjectXScreen,X
c_9435:	SBC PlayerXScreenDup
c_9437:	STA $05B4,X
c_943A:	STA $28
c_943C:	BEQ $9445
c_943E:	CMP #$FF
c_9440:	BEQ $9445
c_9442:	JMP $A6B5
c_9445:	LDA ObjectYPos,X
c_9448:	SEC
c_9449:	SBC PlayerYPosDup
c_944B:	STA $05C8,X
c_944E:	LDA ObjectYScreen,X
c_9451:	SBC PlayerYScreenDup
c_9453:	STA $05DC,X
c_9456:	LDA PlayerYScreenDup
c_9458:	CMP ObjectYScreen,X
c_945B:	BEQ $9487
c_945D:	LDA $05DC,X
c_9460:	BPL $9476
c_9462:	LDA $05C8,X
c_9465:	CLC
c_9466:	ADC #$10
c_9468:	STA $05C8,X
c_946B:	LDA $05DC,X
c_946E:	ADC #$00
c_9470:	STA $05DC,X
c_9473:	JMP $9487
c_9476:	LDA $05C8,X
c_9479:	SEC
c_947A:	SBC #$10
c_947C:	STA $05C8,X
c_947F:	LDA $05DC,X
c_9482:	SBC #$00
c_9484:	STA $05DC,X
c_9487:	LDA FreezeFlag
c_948A:	BEQ $948D
c_948C:	RTS
c_948D:	LDA ObjectState,X
c_9490:	AND #$1F
c_9492:	ASL
c_9493:	TAY
c_9494:	LDA $94A1,Y
c_9497:	STA $32
c_9499:	LDA $94A2,Y
c_949C:	STA $33
c_949E:	JMP ($32)
c_94A1:	.db $BB
c_94A2:	.db $A7
c_94A3:	.db $7B
c_94A4:	.db $AA
c_94A5:	.db $29
c_94A6:	.db $AB
c_94A7:	.db $B1
c_94A8:	.db $94
c_94A9:	.db $88
c_94AA:	.db $AD
c_94AB:	.db $64
c_94AC:	.db $95
c_94AD:	.db $79
c_94AE:	.db $AD
c_94AF:	.db $9C
c_94B0:	.db $95
c_94B1:	JSR $ACC3
c_94B4:	LDA $0636
c_94B7:	BEQ $94BA
c_94B9:	RTS
c_94BA:	LDA $06
c_94BC:	AND #$00
c_94BE:	BNE $94C5
c_94C0:	LDA #$27
c_94C2:	JSR $B1DA
c_94C5:	LDA ObjectXPos,X
c_94C8:	SEC
c_94C9:	SBC PlayerXPosDup
c_94CB:	STA $05A0,X
c_94CE:	LDA ObjectXScreen,X
c_94D1:	SBC PlayerXScreenDup
c_94D3:	STA $05B4,X
c_94D6:	STA $28
c_94D8:	BEQ $94E1
c_94DA:	CMP #$FF
c_94DC:	BEQ $94E1
c_94DE:	JMP $A6B5
c_94E1:	LDA ObjectYPos,X
c_94E4:	SEC
c_94E5:	SBC PlayerYPosDup
c_94E7:	STA $05C8,X
c_94EA:	LDA ObjectYScreen,X
c_94ED:	SBC PlayerYScreenDup
c_94EF:	STA $05DC,X
c_94F2:	LDA PlayerYScreenDup
c_94F4:	CMP ObjectYScreen,X
c_94F7:	BEQ $9523
c_94F9:	LDA $05DC,X
c_94FC:	BPL $9512
c_94FE:	LDA $05C8,X
c_9501:	CLC
c_9502:	ADC #$10
c_9504:	STA $05C8,X
c_9507:	LDA $05DC,X
c_950A:	ADC #$00
c_950C:	STA $05DC,X
c_950F:	JMP $9523
c_9512:	LDA $05C8,X
c_9515:	SEC
c_9516:	SBC #$10
c_9518:	STA $05C8,X
c_951B:	LDA $05DC,X
c_951E:	SBC #$00
c_9520:	STA $05DC,X
c_9523:	LDA FreezeFlag
c_9526:	BEQ $9529
c_9528:	RTS
c_9529:	JSR $A773
c_952C:	JSR $AB6B
c_952F:	LDA $1E
c_9531:	CMP #$05
c_9533:	BEQ $9541
c_9535:	INC ObjectState,X
c_9538:	INC ObjectState,X
c_953B:	LDA #$00
c_953D:	STA $0578,X
c_9540:	RTS
c_9541:	LDA PlayerYSpeed
c_9543:	BEQ $9535
c_9545:	LDA #$20
c_9547:	STA PlayerYSpeed
c_9549:	LDA PlayerAttributes
c_954B:	ORA #$04
c_954D:	STA PlayerAttributes
c_954F:	LDA #$04
c_9551:	STA PlayerAction
c_9553:	LDA #$0F
c_9555:	STA SFXRegister
c_9557:	LDX $A4
c_9559:	LDA #$0F
c_955B:	STA ObjectSlot,X
c_955E:	LDA #$00
c_9560:	STA ObjectState,X
c_9563:	RTS
c_9564:	LDA $05B4,X
c_9567:	BPL $9570
c_9569:	LDA ObjectState,X
c_956C:	ORA #$40
c_956E:	BNE $9575
c_9570:	LDA ObjectState,X
c_9573:	AND #$BF
c_9575:	STA ObjectState,X
c_9578:	LDA $06
c_957A:	AND #$00
c_957C:	BNE $9583
c_957E:	LDA #$23
c_9580:	JSR $B1DA
c_9583:	LDA $0578,X
c_9586:	CMP #$07
c_9588:	BCC $959B
c_958A:	LDA ObjectState,X
c_958D:	AND #$E0
c_958F:	STA ObjectState,X
c_9592:	AND #$20
c_9594:	BNE $959B
c_9596:	LDA #$00
c_9598:	STA $0578,X
c_959B:	RTS
c_959C:	LDA $06
c_959E:	AND #$00
c_95A0:	BNE $95A7
c_95A2:	LDA #$45
c_95A4:	JSR $B1DA
c_95A7:	LDA #$20
c_95A9:	JSR $AEA8
c_95AC:	JSR $AD54
c_95AF:	LDA #$01
c_95B1:	STA $06E4
c_95B4:	RTS
c_95B5:	LDX $A4
c_95B7:	LDA $0641,X
c_95BA:	CMP #$D0
c_95BC:	BCC $95C6
c_95BE:	LDA $062B
c_95C1:	AND #$04
c_95C3:	BNE $95C6
c_95C5:	RTS
c_95C6:	LDA ObjectSlot,X
c_95C9:	LSR
c_95CA:	SEC
c_95CB:	SBC #$1E
c_95CD:	TAY
c_95CE:	LDA ObjectState,X
c_95D1:	AND #$1F
c_95D3:	CMP #$05
c_95D5:	BNE $95DC
c_95D7:	TYA
c_95D8:	CLC
c_95D9:	ADC #$03
c_95DB:	TAY
c_95DC:	TYA
c_95DD:	ASL
c_95DE:	TAX
c_95DF:	LDA $9612,X
c_95E2:	STA $32
c_95E4:	LDA $9613,X
c_95E7:	STA $33
c_95E9:	LDY #$80
c_95EB:	LDX $A4
c_95ED:	LDA ObjectSlot,X
c_95F0:	AND #$01
c_95F2:	BEQ $95F6
c_95F4:	LDY #$C0
c_95F6:	STY $36
c_95F8:	LDA ObjectState,X
c_95FB:	BPL $960A
c_95FD:	AND #$BF
c_95FF:	STA $34
c_9601:	LDA PlayerAttributes
c_9603:	AND #$40
c_9605:	ORA $34
c_9607:	STA ObjectState,X
c_960A:	AND #$40
c_960C:	STA $05F0
c_960F:	JMP $9374
c_9612:	.db $1E	;stunned mechakoopa mappings
c_9613:	.db $96
c_9614:	.db $2A
c_9615:	.db $96
c_9616:	.db $36
c_9617:	.db $96
c_9618:	.db $42
c_9619:	.db $96
c_961A:	.db $4E
c_961B:	.db $96
c_961C:	.db $5A
c_961D:	.db $96
c_961E:	.db $03
c_961F:	.db $03
c_9620:	.db $AE
c_9621:	.db $FF
c_9622:	.db $FF
c_9623:	.db $FF
c_9624:	.db $1F
c_9625:	.db $20
c_9626:	.db $21
c_9627:	.db $24
c_9628:	.db $25
c_9629:	.db $26
c_962A:	.db $03
c_962B:	.db $03
c_962C:	.db $AE
c_962D:	.db $FF
c_962E:	.db $FF
c_962F:	.db $FF
c_9630:	.db $1F
c_9631:	.db $20
c_9632:	.db $23
c_9633:	.db $24
c_9634:	.db $25
c_9635:	.db $26
c_9636:	.db $03
c_9637:	.db $03
c_9638:	.db $AE
c_9639:	.db $FF
c_963A:	.db $FF
c_963B:	.db $FF
c_963C:	.db $1F
c_963D:	.db $20
c_963E:	.db $31
c_963F:	.db $24
c_9640:	.db $25
c_9641:	.db $26
c_9642:	.db $03
c_9643:	.db $03
c_9644:	.db $AE
c_9645:	.db $27
c_9646:	.db $28
c_9647:	.db $FF
c_9648:	.db $29
c_9649:	.db $2A
c_964A:	.db $2B
c_964B:	.db $2D
c_964C:	.db $2E
c_964D:	.db $2F
c_964E:	.db $03
c_964F:	.db $03
c_9650:	.db $AE
c_9651:	.db $27
c_9652:	.db $28
c_9653:	.db $FF
c_9654:	.db $29
c_9655:	.db $2A
c_9656:	.db $30
c_9657:	.db $2D
c_9658:	.db $2E
c_9659:	.db $2F
c_965A:	.db $03
c_965B:	.db $03
c_965C:	.db $AE
c_965D:	.db $27
c_965E:	.db $28
c_965F:	.db $FF
c_9660:	.db $29
c_9661:	.db $2A
c_9662:	.db $32
c_9663:	.db $2D
c_9664:	.db $2E
c_9665:	.db $2F
c_9666:	LDX $A4
c_9668:	LDA ObjectXPos,X
c_966B:	SEC
c_966C:	SBC PlayerXPosDup
c_966E:	STA $05A0,X
c_9671:	LDA ObjectXScreen,X
c_9674:	SBC PlayerXScreenDup
c_9676:	STA $05B4,X
c_9679:	STA $28
c_967B:	BEQ $9684
c_967D:	CMP #$FF
c_967F:	BEQ $9684
c_9681:	JMP $A6B5
c_9684:	LDA ObjectYPos,X
c_9687:	SEC
c_9688:	SBC PlayerYPosDup
c_968A:	STA $05C8,X
c_968D:	LDA ObjectYScreen,X
c_9690:	SBC PlayerYScreenDup
c_9692:	STA $05DC,X
c_9695:	LDA PlayerYScreenDup
c_9697:	CMP ObjectYScreen,X
c_969A:	BEQ $96C6
c_969C:	LDA $05DC,X
c_969F:	BPL $96B5
c_96A1:	LDA $05C8,X
c_96A4:	CLC
c_96A5:	ADC #$10
c_96A7:	STA $05C8,X
c_96AA:	LDA $05DC,X
c_96AD:	ADC #$00
c_96AF:	STA $05DC,X
c_96B2:	JMP $96C6
c_96B5:	LDA $05C8,X
c_96B8:	SEC
c_96B9:	SBC #$10
c_96BB:	STA $05C8,X
c_96BE:	LDA $05DC,X
c_96C1:	SBC #$00
c_96C3:	STA $05DC,X
c_96C6:	LDA FreezeFlag
c_96C9:	BEQ $96CC
c_96CB:	RTS
c_96CC:	LDA $0578,X
c_96CF:	CMP #$F0
c_96D1:	BEQ $96D6
c_96D3:	JMP $975A
c_96D6:	JSR $B5BB
c_96D9:	LDA #$00
c_96DB:	STA EnemyAnimFrame,X
c_96DE:	RTS
c_96DF:	LDX $A4
c_96E1:	LDA ObjectXPos,X
c_96E4:	SEC
c_96E5:	SBC PlayerXPosDup
c_96E7:	STA $05A0,X
c_96EA:	LDA ObjectXScreen,X
c_96ED:	SBC PlayerXScreenDup
c_96EF:	STA $05B4,X
c_96F2:	STA $28
c_96F4:	BEQ $96FD
c_96F6:	CMP #$FF
c_96F8:	BEQ $96FD
c_96FA:	JMP $A6B5
c_96FD:	LDA ObjectYPos,X
c_9700:	SEC
c_9701:	SBC PlayerYPosDup
c_9703:	STA $05C8,X
c_9706:	LDA ObjectYScreen,X
c_9709:	SBC PlayerYScreenDup
c_970B:	STA $05DC,X
c_970E:	LDA PlayerYScreenDup
c_9710:	CMP ObjectYScreen,X
c_9713:	BEQ $973F
c_9715:	LDA $05DC,X
c_9718:	BPL $972E
c_971A:	LDA $05C8,X
c_971D:	CLC
c_971E:	ADC #$10
c_9720:	STA $05C8,X
c_9723:	LDA $05DC,X
c_9726:	ADC #$00
c_9728:	STA $05DC,X
c_972B:	JMP $973F
c_972E:	LDA $05C8,X
c_9731:	SEC
c_9732:	SBC #$10
c_9734:	STA $05C8,X
c_9737:	LDA $05DC,X
c_973A:	SBC #$00
c_973C:	STA $05DC,X
c_973F:	LDA FreezeFlag
c_9742:	BEQ $9745
c_9744:	RTS
c_9745:	LDA $0578,X
c_9748:	CMP #$F0
c_974A:	BNE $975A
c_974C:	LDA #$40
c_974E:	STA ObjectState,X
c_9751:	LDA #$00
c_9753:	STA EnemyAnimFrame,X
c_9756:	STA $0578,X
c_9759:	RTS
c_975A:	JSR $97B6
c_975D:	LDX $A4
c_975F:	LDA ObjectState,X
c_9762:	AND #$0F
c_9764:	CMP #$04
c_9766:	BCC $9769
c_9768:	RTS
c_9769:	JSR $9856
c_976C:	LDA $0578,X
c_976F:	BPL $979C
c_9771:	AND #$7F
c_9773:	CMP #$20
c_9775:	BCC $977D
c_9777:	LDA #$00
c_9779:	STA $0578,X
c_977C:	RTS
c_977D:	LDA #$08
c_977F:	STA $36
c_9781:	LDA #$08
c_9783:	JSR $B7A2
c_9786:	BEQ $978B
c_9788:	INC $0578,X
c_978B:	LDA $06
c_978D:	AND #$00
c_978F:	BNE $9796
c_9791:	LDA #$23
c_9793:	JSR $B1DA
c_9796:	LDA #$02
c_9798:	STA EnemyAnimFrame,X
c_979B:	RTS
c_979C:	LDA $06
c_979E:	AND #$01
c_97A0:	BNE $97A7
c_97A2:	LDA #$11
c_97A4:	JSR $B1DA
c_97A7:	LDY #$00
c_97A9:	LDA $062B
c_97AC:	AND #$08
c_97AE:	BEQ $97B1
c_97B0:	INY
c_97B1:	TYA
c_97B2:	STA EnemyAnimFrame,X
c_97B5:	RTS
c_97B6:	LDA #$06
c_97B8:	STA $25
c_97BA:	LDX $A4
c_97BC:	LDA ObjectXPos,X
c_97BF:	SEC
c_97C0:	SBC PlayerXPosDup
c_97C2:	STA $05A0,X
c_97C5:	LDA ObjectXScreen,X
c_97C8:	SBC PlayerXScreenDup
c_97CA:	STA $05B4,X
c_97CD:	STA $28
c_97CF:	BEQ $97D8
c_97D1:	CMP #$FF
c_97D3:	BEQ $97D8
c_97D5:	JMP $A6B5
c_97D8:	LDA ObjectYPos,X
c_97DB:	SEC
c_97DC:	SBC PlayerYPosDup
c_97DE:	STA $05C8,X
c_97E1:	LDA ObjectYScreen,X
c_97E4:	SBC PlayerYScreenDup
c_97E6:	STA $05DC,X
c_97E9:	LDA PlayerYScreenDup
c_97EB:	CMP ObjectYScreen,X
c_97EE:	BEQ $981A
c_97F0:	LDA $05DC,X
c_97F3:	BPL $9809
c_97F5:	LDA $05C8,X
c_97F8:	CLC
c_97F9:	ADC #$10
c_97FB:	STA $05C8,X
c_97FE:	LDA $05DC,X
c_9801:	ADC #$00
c_9803:	STA $05DC,X
c_9806:	JMP $981A
c_9809:	LDA $05C8,X
c_980C:	SEC
c_980D:	SBC #$10
c_980F:	STA $05C8,X
c_9812:	LDA $05DC,X
c_9815:	SBC #$00
c_9817:	STA $05DC,X
c_981A:	LDA FreezeFlag
c_981D:	BEQ $9820
c_981F:	RTS
c_9820:	LDA ObjectState,X
c_9823:	AND #$1F
c_9825:	ASL
c_9826:	TAY
c_9827:	LDA $9834,Y
c_982A:	STA $32
c_982C:	LDA $9835,Y
c_982F:	STA $33
c_9831:	JMP ($32)
c_9834:	.db $BB
c_9835:	.db $A7
c_9836:	.db $7B
c_9837:	.db $AA
c_9838:	.db $29
c_9839:	.db $AB
c_983A:	.db $3E
c_983B:	.db $98
c_983C:	.db $88
c_983D:	.db $AD
c_983E:	JSR $A6D4
c_9841:	JSR $BEBC
c_9844:	JSR $BCC2
c_9847:	LDA #$04
c_9849:	STA PlayerAction
c_984B:	LDA #$0F
c_984D:	STA ObjectSlot,X
c_9850:	LDA #$00
c_9852:	STA ObjectState,X
c_9855:	RTS
c_9856:	LDA #$0F
c_9858:	STA $36
c_985A:	LDA #$08
c_985C:	JSR $B7A2
c_985F:	BNE $9871
c_9861:	LDA GuidedObjStatus,X
c_9864:	BEQ $9870
c_9866:	LDA #$00
c_9868:	STA GuidedObjStatus,X
c_986B:	LDA #$80
c_986D:	STA $0578,X
c_9870:	RTS
c_9871:	CMP #$03
c_9873:	BNE $9870
c_9875:	LDA $06
c_9877:	AND #$00
c_9879:	BNE $9880
c_987B:	LDA #$3D
c_987D:	JSR $B470
c_9880:	LDA #$02
c_9882:	STA EnemyAnimFrame,X
c_9885:	LDA #$01
c_9887:	STA GuidedObjStatus,X
c_988A:	PLA
c_988B:	PLA
c_988C:	RTS
c_988D:	LDX $A4
c_988F:	LDA ObjectXPos,X
c_9892:	SEC
c_9893:	SBC PlayerXPosDup
c_9895:	STA $05A0,X
c_9898:	LDA ObjectXScreen,X
c_989B:	SBC PlayerXScreenDup
c_989D:	STA $05B4,X
c_98A0:	STA $28
c_98A2:	BEQ $98AB
c_98A4:	CMP #$FF
c_98A6:	BEQ $98AB
c_98A8:	JMP $A6B5
c_98AB:	LDA ObjectYPos,X
c_98AE:	SEC
c_98AF:	SBC PlayerYPosDup
c_98B1:	STA $05C8,X
c_98B4:	LDA ObjectYScreen,X
c_98B7:	SBC PlayerYScreenDup
c_98B9:	STA $05DC,X
c_98BC:	LDA PlayerYScreenDup
c_98BE:	CMP ObjectYScreen,X
c_98C1:	BEQ $98ED
c_98C3:	LDA $05DC,X
c_98C6:	BPL $98DC
c_98C8:	LDA $05C8,X
c_98CB:	CLC
c_98CC:	ADC #$10
c_98CE:	STA $05C8,X
c_98D1:	LDA $05DC,X
c_98D4:	ADC #$00
c_98D6:	STA $05DC,X
c_98D9:	JMP $98ED
c_98DC:	LDA $05C8,X
c_98DF:	SEC
c_98E0:	SBC #$10
c_98E2:	STA $05C8,X
c_98E5:	LDA $05DC,X
c_98E8:	SBC #$00
c_98EA:	STA $05DC,X
c_98ED:	LDA FreezeFlag
c_98F0:	BEQ $98F3
c_98F2:	RTS
c_98F3:	LDA $0578,X
c_98F6:	CMP #$F0
c_98F8:	BNE $9908
c_98FA:	LDA #$40
c_98FC:	STA ObjectState,X
c_98FF:	LDA #$00
c_9901:	STA EnemyAnimFrame,X
c_9904:	STA $0578,X
c_9907:	RTS
c_9908:	JSR $97B6
c_990B:	LDX $A4
c_990D:	LDA ObjectState,X
c_9910:	AND #$0F
c_9912:	CMP #$04
c_9914:	BCC $9917
c_9916:	RTS
c_9917:	LDA GuidedObjStatus,X
c_991A:	BNE $9940
c_991C:	LDA $06
c_991E:	AND #$00
c_9920:	BNE $9927
c_9922:	LDA #$3E
c_9924:	JSR $B470
c_9927:	LDA #$02
c_9929:	STA EnemyAnimFrame,X
c_992C:	LDA $0578,X
c_992F:	AND #$7F
c_9931:	CMP #$2A
c_9933:	BCC $993F
c_9935:	LDA #$80
c_9937:	STA $0578,X
c_993A:	LDA #$01
c_993C:	STA GuidedObjStatus,X
c_993F:	RTS
c_9940:	JMP $976C
c_9943:	LDX $A4
c_9945:	LDA ObjectXPos,X
c_9948:	SEC
c_9949:	SBC PlayerXPosDup
c_994B:	STA $05A0,X
c_994E:	LDA ObjectXScreen,X
c_9951:	SBC PlayerXScreenDup
c_9953:	STA $05B4,X
c_9956:	STA $28
c_9958:	BEQ $9961
c_995A:	CMP #$FF
c_995C:	BEQ $9961
c_995E:	JMP $A6B5
c_9961:	LDA ObjectYPos,X
c_9964:	SEC
c_9965:	SBC PlayerYPosDup
c_9967:	STA $05C8,X
c_996A:	LDA ObjectYScreen,X
c_996D:	SBC PlayerYScreenDup
c_996F:	STA $05DC,X
c_9972:	LDA PlayerYScreenDup
c_9974:	CMP ObjectYScreen,X
c_9977:	BEQ $99A3
c_9979:	LDA $05DC,X
c_997C:	BPL $9992
c_997E:	LDA $05C8,X
c_9981:	CLC
c_9982:	ADC #$10
c_9984:	STA $05C8,X
c_9987:	LDA $05DC,X
c_998A:	ADC #$00
c_998C:	STA $05DC,X
c_998F:	JMP $99A3
c_9992:	LDA $05C8,X
c_9995:	SEC
c_9996:	SBC #$10
c_9998:	STA $05C8,X
c_999B:	LDA $05DC,X
c_999E:	SBC #$00
c_99A0:	STA $05DC,X
c_99A3:	LDA FreezeFlag
c_99A6:	BEQ $99A9
c_99A8:	RTS
c_99A9:	LDY #$00
c_99AB:	LDA $05B4,X
c_99AE:	BMI $99B2
c_99B0:	LDY #$20
c_99B2:	STY $06E0
c_99B5:	RTS
c_99B6:	LDX $A4
c_99B8:	LDA ObjectXPos,X
c_99BB:	SEC
c_99BC:	SBC PlayerXPosDup
c_99BE:	STA $05A0,X
c_99C1:	LDA ObjectXScreen,X
c_99C4:	SBC PlayerXScreenDup
c_99C6:	STA $05B4,X
c_99C9:	STA $28
c_99CB:	BEQ $99D4
c_99CD:	CMP #$FF
c_99CF:	BEQ $99D4
c_99D1:	JMP $A6B5
c_99D4:	LDA ObjectYPos,X
c_99D7:	SEC
c_99D8:	SBC PlayerYPosDup
c_99DA:	STA $05C8,X
c_99DD:	LDA ObjectYScreen,X
c_99E0:	SBC PlayerYScreenDup
c_99E2:	STA $05DC,X
c_99E5:	LDA PlayerYScreenDup
c_99E7:	CMP ObjectYScreen,X
c_99EA:	BEQ $9A16
c_99EC:	LDA $05DC,X
c_99EF:	BPL $9A05
c_99F1:	LDA $05C8,X
c_99F4:	CLC
c_99F5:	ADC #$10
c_99F7:	STA $05C8,X
c_99FA:	LDA $05DC,X
c_99FD:	ADC #$00
c_99FF:	STA $05DC,X
c_9A02:	JMP $9A16
c_9A05:	LDA $05C8,X
c_9A08:	SEC
c_9A09:	SBC #$10
c_9A0B:	STA $05C8,X
c_9A0E:	LDA $05DC,X
c_9A11:	SBC #$00
c_9A13:	STA $05DC,X
c_9A16:	LDA FreezeFlag
c_9A19:	BEQ $9A1C
c_9A1B:	RTS
c_9A1C:	LDA ObjectYScreen,X
c_9A1F:	CMP PlayerYScreenDup
c_9A21:	BNE $9A77
c_9A23:	LDY #$00
c_9A25:	LDA ObjectSlot,X
c_9A28:	CMP #$F2
c_9A2A:	BNE $9A6D
c_9A2C:	LDA $0578,X
c_9A2F:	BPL $9A66
c_9A31:	LDA #$00
c_9A33:	STA $0578,X
c_9A36:	LDA #$03
c_9A38:	BMI $9A53
c_9A3A:	CLC
c_9A3B:	ADC ObjectYPos,X
c_9A3E:	STA ObjectYPos,X
c_9A41:	BCS $9A47
c_9A43:	CMP #$F0
c_9A45:	BCC $9A65
c_9A47:	CLC
c_9A48:	ADC #$10
c_9A4A:	STA ObjectYPos,X
c_9A4D:	INC ObjectYScreen,X
c_9A50:	JMP $9A65
c_9A53:	CLC
c_9A54:	ADC ObjectYPos,X
c_9A57:	STA ObjectYPos,X
c_9A5A:	BCS $9A65
c_9A5C:	SEC
c_9A5D:	SBC #$10
c_9A5F:	STA ObjectYPos,X
c_9A62:	DEC ObjectYScreen,X
c_9A65:	RTS
c_9A66:	LDA $05DC,X
c_9A69:	BPL $9A72
c_9A6B:	BMI $9A74
c_9A6D:	LDA $05DC,X
c_9A70:	BPL $9A74
c_9A72:	LDY #$20
c_9A74:	STY $06E0
c_9A77:	RTS
c_9A78:	BEQ $9A7F
c_9A7A:	ASL
c_9A7B:	TAX
c_9A7C:	LDA $9A99,X
c_9A7F:	STA $32
c_9A81:	LDA $9A9A,X
c_9A84:	STA $33
c_9A86:	LDY #$80
c_9A88:	LDX $A4
c_9A8A:	LDA ObjectSlot,X
c_9A8D:	AND #$01
c_9A8F:	BEQ $9A93
c_9A91:	LDY #$C0
c_9A93:	STY $36
c_9A95:	JSR $A118
c_9A98:	RTS
c_9A99:	.db ObjectCount	;unknown mappings
c_9A9A:	.db $9A
c_9A9B:	.db $AA
c_9A9C:	.db $9A
c_9A9D:	.db $B1
c_9A9E:	.db $9A
c_9A9F:	.db $AA
c_9AA0:	.db $9A
c_9AA1:	.db $B8
c_9AA2:	.db $9A
c_9AA3:	.db $02
c_9AA4:	.db $02
c_9AA5:	.db $97
c_9AA6:	.db $1C
c_9AA7:	.db $1D
c_9AA8:	.db $22
c_9AA9:	.db $23
c_9AAA:	.db $02
c_9AAB:	.db $02
c_9AAC:	.db $97
c_9AAD:	.db $1C
c_9AAE:	.db $1D
c_9AAF:	.db $24
c_9AB0:	.db $25
c_9AB1:	.db $02
c_9AB2:	.db $02
c_9AB3:	.db $97
c_9AB4:	.db $1C
c_9AB5:	.db $1D
c_9AB6:	.db $2A
c_9AB7:	.db $2B
c_9AB8:	.db $02
c_9AB9:	.db $02
c_9ABA:	.db $97
c_9ABB:	.db $2A
c_9ABC:	.db $2B
c_9ABD:	.db $1C
c_9ABE:	.db $1D
c_9ABF:	.db $A6
c_9AC0:	.db $A4
c_9AC1:	LDA ObjectXPos,X
c_9AC4:	SEC
c_9AC5:	SBC PlayerXPosDup
c_9AC7:	STA $05A0,X
c_9ACA:	LDA ObjectXScreen,X
c_9ACD:	SBC PlayerXScreenDup
c_9ACF:	STA $05B4,X
c_9AD2:	STA $28
c_9AD4:	BEQ $9ADD
c_9AD6:	CMP #$FF
c_9AD8:	BEQ $9ADD
c_9ADA:	JMP $A6B5
c_9ADD:	LDA ObjectYPos,X
c_9AE0:	SEC
c_9AE1:	SBC PlayerYPosDup
c_9AE3:	STA $05C8,X
c_9AE6:	LDA ObjectYScreen,X
c_9AE9:	SBC PlayerYScreenDup
c_9AEB:	STA $05DC,X
c_9AEE:	LDA PlayerYScreenDup
c_9AF0:	CMP ObjectYScreen,X
c_9AF3:	BEQ $9B1F
c_9AF5:	LDA $05DC,X
c_9AF8:	BPL $9B0E
c_9AFA:	LDA $05C8,X
c_9AFD:	CLC
c_9AFE:	ADC #$10
c_9B00:	STA $05C8,X
c_9B03:	LDA $05DC,X
c_9B06:	ADC #$00
c_9B08:	STA $05DC,X
c_9B0B:	JMP $9B1F
c_9B0E:	LDA $05C8,X
c_9B11:	SEC
c_9B12:	SBC #$10
c_9B14:	STA $05C8,X
c_9B17:	LDA $05DC,X
c_9B1A:	SBC #$00
c_9B1C:	STA $05DC,X
c_9B1F:	LDA FreezeFlag
c_9B22:	BEQ $9B25
c_9B24:	RTS
c_9B25:	LDA $0578,X
c_9B28:	BPL $9B4E
c_9B2A:	LDA #$00
c_9B2C:	STA $0578,X
c_9B2F:	LDA $04F6
c_9B32:	ASL
c_9B33:	ASL
c_9B34:	CLC
c_9B35:	ADC $04F7
c_9B38:	TAY
c_9B39:	LDA $0399
c_9B3C:	BEQ $9B43
c_9B3E:	TYA
c_9B3F:	CLC
c_9B40:	ADC #$1C
c_9B42:	TAY
c_9B43:	LDA CheckpointFlag,Y
c_9B46:	BEQ $9B4E
c_9B48:	LDA #$00
c_9B4A:	STA ObjectSlot,X
c_9B4D:	RTS
c_9B4E:	LDA #$07
c_9B50:	STA $25
c_9B52:	LDA ObjectState,X
c_9B55:	AND #$1F
c_9B57:	ASL
c_9B58:	TAY
c_9B59:	LDA $9B66,Y
c_9B5C:	STA $32
c_9B5E:	LDA $9B67,Y
c_9B61:	STA $33
c_9B63:	JMP ($32)
c_9B66:	.db $BB
c_9B67:	.db $A7
c_9B68:	.db $7B
c_9B69:	.db $AA
c_9B6A:	.db $29
c_9B6B:	.db $AB
c_9B6C:	.db $6E
c_9B6D:	.db $9B
c_9B6E:	LDA $05B4,X
c_9B71:	BPL $9B80
c_9B73:	LDA #$08
c_9B75:	CLC
c_9B76:	ADC #$10
c_9B78:	CLC
c_9B79:	ADC $05A0,X
c_9B7C:	BCS $9B87
c_9B7E:	BCC $9BA7
c_9B80:	LDA $05A0,X
c_9B83:	CMP #$08
c_9B85:	BCS $9BA7
c_9B87:	LDA $05DC,X
c_9B8A:	BEQ $9B9D
c_9B8C:	CMP #$FF
c_9B8E:	BNE $9BA7
c_9B90:	LDA #$18
c_9B92:	CLC
c_9B93:	ADC #$03
c_9B95:	CLC
c_9B96:	ADC $05C8,X
c_9B99:	BCS $9BA4
c_9B9B:	BCC $9BA7
c_9B9D:	LDA $05C8,X
c_9BA0:	CMP #$00
c_9BA2:	BCS $9BA7
c_9BA4:	CLC
c_9BA5:	BCC $9BA8
c_9BA7:	SEC
c_9BA8:	BCC $9BB3
c_9BAA:	LDA ObjectState,X
c_9BAD:	AND #$E0
c_9BAF:	STA ObjectState,X
c_9BB2:	RTS
c_9BB3:	JSR $9EE5
c_9BB6:	LDX $A4
c_9BB8:	LDA #$1C
c_9BBA:	STA SFXRegister
c_9BBC:	LDA #$00
c_9BBE:	STA ObjectSlot,X
c_9BC1:	LDA $04F6
c_9BC4:	ASL
c_9BC5:	ASL
c_9BC6:	CLC
c_9BC7:	ADC $04F7
c_9BCA:	TAY
c_9BCB:	LDA $0399
c_9BCE:	BEQ $9BD5
c_9BD0:	TYA
c_9BD1:	CLC
c_9BD2:	ADC #$1C
c_9BD4:	TAY
c_9BD5:	LDA #$01
c_9BD7:	STA CheckpointFlag,Y
c_9BDA:	RTS
c_9BDB:	LDA #$0F
c_9BDD:	ASL
c_9BDE:	TAX
c_9BDF:	LDA $95AB,X
c_9BE2:	STA $32
c_9BE4:	LDA $95AC,X
c_9BE7:	STA $33
c_9BE9:	LDA #$40
c_9BEB:	STA $36
c_9BED:	LDA #$40
c_9BEF:	STA $05F0
c_9BF2:	JSR $A118
c_9BF5:	RTS
c_9BF6:	.db $02
c_9BF7:	.db $01
c_9BF8:	.db $90
c_9BF9:	.db $3E
c_9BFA:	.db $3E
c_9BFB:	LDA #$10
c_9BFD:	ASL
c_9BFE:	TAX
c_9BFF:	LDA $95AB,X
c_9C02:	STA $32
c_9C04:	LDA $95AC,X
c_9C07:	STA $33
c_9C09:	LDY #$80
c_9C0B:	LDX $A4
c_9C0D:	LDA ObjectSlot,X
c_9C10:	AND #$01
c_9C12:	BEQ $9C16
c_9C14:	LDY #$C0
c_9C16:	STY $36
c_9C18:	LDA #$40
c_9C1A:	STA $05F0
c_9C1D:	JSR $A118
c_9C20:	RTS
c_9C21:	.db $03
c_9C22:	.db $01
c_9C23:	.db $A6
c_9C24:	.db $37
c_9C25:	.db $36
c_9C26:	.db $36
c_9C27:	.db $36
c_9C28:	LDX $A4
c_9C2A:	LDA $0578,X
c_9C2D:	BMI $9C32
c_9C2F:	JMP $9D0B
c_9C32:	LDA ObjectXPos,X
c_9C35:	SEC
c_9C36:	SBC PlayerXPosDup
c_9C38:	STA $05A0,X
c_9C3B:	LDA ObjectXScreen,X
c_9C3E:	SBC $0E
c_9C40:	STA $05B4,X
c_9C43:	STA $28
c_9C45:	BEQ $9C4E
c_9C47:	CMP #$FF
c_9C49:	BEQ $9C4E
c_9C4B:	JMP $A6B5
c_9C4E:	LDA ObjectYPos,X
c_9C51:	SEC
c_9C52:	SBC PlayerYPosDup
c_9C54:	STA $05C8,X
c_9C57:	LDA ObjectYScreen,X
c_9C5A:	SBC PlayerYScreenDup
c_9C5C:	STA $05DC,X
c_9C5F:	LDA PlayerYScreenDup
c_9C61:	CMP ObjectYScreen,X
c_9C64:	BEQ $9C90
c_9C66:	LDA $05DC,X
c_9C69:	BPL $9C7F
c_9C6B:	LDA $05C8,X
c_9C6E:	CLC
c_9C6F:	ADC #$10
c_9C71:	STA $05C8,X
c_9C74:	LDA $05DC,X
c_9C77:	ADC #$00
c_9C79:	STA $05DC,X
c_9C7C:	JMP $9C90
c_9C7F:	LDA $05C8,X
c_9C82:	SEC
c_9C83:	SBC #$10
c_9C85:	STA $05C8,X
c_9C88:	LDA $05DC,X
c_9C8B:	SBC #$00
c_9C8D:	STA $05DC,X
c_9C90:	LDA FreezeFlag
c_9C93:	BEQ $9C96
c_9C95:	RTS
c_9C96:	LDA $0578,X
c_9C99:	CMP #$80
c_9C9B:	BNE c_9D07
c_9C9D:	JSR $B5BB
c_9CA0:	LDY ObjectCount
c_9CA2:	INC ObjectCount
c_9CA4:	INC ObjectCount
c_9CA6:	LDA ObjectXPos,X
c_9CA9:	STA ObjectXPos2,Y
c_9CAC:	LDA ObjectState,X
c_9CAF:	AND #$40
c_9CB1:	BNE $9CBC
c_9CB3:	LDA ObjectXPos,X
c_9CB6:	CLC
c_9CB7:	ADC #$10
c_9CB9:	JMP $9CC2
c_9CBC:	LDA ObjectXPos,X
c_9CBF:	SEC
c_9CC0:	SBC #$10
c_9CC2:	STA ObjectXPos,Y
c_9CC5:	LDA ObjectXScreen,X
c_9CC8:	STA ObjectXScreen,Y
c_9CCB:	STA ObjectXScreen2,Y
c_9CCE:	LDA ObjectYPos,X
c_9CD1:	CLC
c_9CD2:	ADC #$10
c_9CD4:	STA ObjectYPos,Y
c_9CD7:	CLC
c_9CD8:	ADC #$10
c_9CDA:	STA $053D,Y
c_9CDD:	LDA ObjectYScreen,X
c_9CE0:	STA ObjectYScreen,Y
c_9CE3:	STA ObjectYScreen2,Y
c_9CE6:	LDA ObjectSlot,X
c_9CE9:	STA ObjectSlot,Y
c_9CEC:	STA ObjectSlot2,Y
c_9CEF:	LDA ObjectState,X
c_9CF2:	STA ObjectState,Y
c_9CF5:	STA ObjectState2,Y
c_9CF8:	LDA #$00
c_9CFA:	STA $0578,Y
c_9CFD:	STA $0579,Y
c_9D00:	STA GuidedObjStatus,Y
c_9D03:	STA GuidedObjStatus2,Y
c_9D06:	RTS
c_9D07:	JSR $B4FC
c_9D0A:	RTS
c_9D0B:	LDA #$07
c_9D0D:	STA $25
c_9D0F:	LDX $A4
c_9D11:	LDA ObjectXPos,X
c_9D14:	SEC
c_9D15:	SBC PlayerXPosDup
c_9D17:	STA $05A0,X
c_9D1A:	LDA ObjectXScreen,X
c_9D1D:	SBC $0E
c_9D1F:	STA $05B4,X
c_9D22:	STA $28
c_9D24:	BEQ $9D2D
c_9D26:	CMP #$FF
c_9D28:	BEQ $9D2D
c_9D2A:	JMP $A6B5
c_9D2D:	LDA ObjectYPos,X
c_9D30:	SEC
c_9D31:	SBC PlayerYPosDup
c_9D33:	STA $05C8,X
c_9D36:	LDA ObjectYScreen,X
c_9D39:	SBC PlayerYScreenDup
c_9D3B:	STA $05DC,X
c_9D3E:	LDA PlayerYScreenDup
c_9D40:	CMP ObjectYScreen,X
c_9D43:	BEQ $9D6F
c_9D45:	LDA $05DC,X
c_9D48:	BPL $9D5E
c_9D4A:	LDA $05C8,X
c_9D4D:	CLC
c_9D4E:	ADC #$10
c_9D50:	STA $05C8,X
c_9D53:	LDA $05DC,X
c_9D56:	ADC #$00
c_9D58:	STA $05DC,X
c_9D5B:	JMP $9D6F
c_9D5E:	LDA $05C8,X
c_9D61:	SEC
c_9D62:	SBC #$10
c_9D64:	STA $05C8,X
c_9D67:	LDA $05DC,X
c_9D6A:	SBC #$00
c_9D6C:	STA $05DC,X
c_9D6F:	LDA FreezeFlag
c_9D72:	BEQ $9D75
c_9D74:	RTS
c_9D75:	LDA ObjectState,X
c_9D78:	AND #$1F
c_9D7A:	ASL
c_9D7B:	TAY
c_9D7C:	LDA $9D89,Y
c_9D7F:	STA $32
c_9D81:	LDA $9D8A,Y
c_9D84:	STA $33
c_9D86:	JMP ($32)
c_9D89:	.db $BB
c_9D8A:	.db $A7
c_9D8B:	.db $7B
c_9D8C:	.db $AA
c_9D8D:	.db $29
c_9D8E:	.db $AB
c_9D8F:	.db $93
c_9D90:	STA $AD88,X
c_9D93:	LDA $06
c_9D95:	AND #$00
c_9D97:	BNE $9D9E
c_9D99:	LDA #$25
c_9D9B:	JSR $B11D
c_9D9E:	JSR $BC3E
c_9DA1:	JSR $BF74
c_9DA4:	RTS
c_9DA5:	LDA #$00
c_9DA7:	ASL
c_9DA8:	TAX
c_9DA9:	LDA $971B,X
c_9DAC:	STA $32
c_9DAE:	LDA $971C,X
c_9DB1:	STA $33
c_9DB3:	LDA #$40
c_9DB5:	STA $36
c_9DB7:	LDX $A4
c_9DB9:	LDX $A4
c_9DBB:	LDA ObjectState,X
c_9DBE:	AND #$40
c_9DC0:	STA $05F0
c_9DC3:	JSR $A118
c_9DC6:	RTS
c_9DC7:	LDX $A4
c_9DC9:	LDA ObjectXPos,X
c_9DCC:	SEC
c_9DCD:	SBC PlayerXPosDup
c_9DCF:	STA $05A0,X
c_9DD2:	LDA ObjectXScreen,X
c_9DD5:	SBC $0E
c_9DD7:	STA $05B4,X
c_9DDA:	STA $28
c_9DDC:	BEQ $9DE5
c_9DDE:	CMP #$FF
c_9DE0:	BEQ $9DE5
c_9DE2:	JMP $A6B5
c_9DE5:	LDA ObjectYPos,X
c_9DE8:	SEC
c_9DE9:	SBC PlayerYPosDup
c_9DEB:	STA $05C8,X
c_9DEE:	LDA ObjectYScreen,X
c_9DF1:	SBC PlayerYScreenDup
c_9DF3:	STA $05DC,X
c_9DF6:	LDA PlayerYScreenDup
c_9DF8:	CMP ObjectYScreen,X
c_9DFB:	BEQ $9E27
c_9DFD:	LDA $05DC,X
c_9E00:	BPL $9E16
c_9E02:	LDA $05C8,X
c_9E05:	CLC
c_9E06:	ADC #$10
c_9E08:	STA $05C8,X
c_9E0B:	LDA $05DC,X
c_9E0E:	ADC #$00
c_9E10:	STA $05DC,X
c_9E13:	JMP $9E27
c_9E16:	LDA $05C8,X
c_9E19:	SEC
c_9E1A:	SBC #$10
c_9E1C:	STA $05C8,X
c_9E1F:	LDA $05DC,X
c_9E22:	SBC #$00
c_9E24:	STA $05DC,X
c_9E27:	LDA FreezeFlag
c_9E2A:	BEQ $9E2D
c_9E2C:	RTS
c_9E2D:	LDA $0578,X
c_9E30:	BPL $9E4F
c_9E32:	LDA #$00
c_9E34:	STA $0578,X
c_9E37:	STA $0641,X
c_9E3A:	STA GuidedObjStatus,X
c_9E3D:	LDA ObjectXPos,X
c_9E40:	CLC
c_9E41:	ADC #$08
c_9E43:	STA ObjectXPos,X
c_9E46:	LDA ObjectXScreen,X
c_9E49:	ADC #$00
c_9E4B:	STA ObjectXScreen,X
c_9E4E:	RTS
c_9E4F:	INC $0641,X
c_9E52:	LDA $0641,X
c_9E55:	CMP #$60
c_9E57:	BCC $9E66
c_9E59:	LDA #$00
c_9E5B:	STA $0641,X
c_9E5E:	LDA GuidedObjStatus,X
c_9E61:	EOR #$01
c_9E63:	STA GuidedObjStatus,X
c_9E66:	LDA GuidedObjStatus,X
c_9E69:	BNE $9E82
c_9E6B:	LDA ObjectYPos,X
c_9E6E:	SEC
c_9E6F:	SBC #$01
c_9E71:	STA ObjectYPos,X
c_9E74:	BCS $9E98
c_9E76:	SEC
c_9E77:	SBC #$10
c_9E79:	STA ObjectYPos,X
c_9E7C:	DEC ObjectYScreen,X
c_9E7F:	JMP $9E98
c_9E82:	LDA ObjectYPos,X
c_9E85:	CLC
c_9E86:	ADC #$01
c_9E88:	STA ObjectYPos,X
c_9E8B:	CMP #$F0
c_9E8D:	BCC $9E98
c_9E8F:	CLC
c_9E90:	ADC #$10
c_9E92:	STA ObjectYPos,X
c_9E95:	INC ObjectYScreen,X
c_9E98:	LDA #$07
c_9E9A:	STA $25
c_9E9C:	LDA ObjectState,X
c_9E9F:	AND #$1F
c_9EA1:	ASL
c_9EA2:	TAY
c_9EA3:	LDA $9EB0,Y
c_9EA6:	STA $32
c_9EA8:	LDA $9EB1,Y
c_9EAB:	STA $33
c_9EAD:	JMP ($32)
c_9EB0:	.db $BB
c_9EB1:	.db $A7
c_9EB2:	.db $7B
c_9EB3:	.db $AA
c_9EB4:	.db $29
c_9EB5:	.db $AB
c_9EB6:	.db $B8
c_9EB7:	.db $9E
c_9EB8:	LDA $05B4,X
c_9EBB:	BPL $9EE4
c_9EBD:	LDA #$23
c_9EBF:	STA $8E
c_9EC1:	LDA #$06
c_9EC3:	STA $DF
c_9EC5:	LDA $04F6
c_9EC8:	ASL
c_9EC9:	ASL
c_9ECA:	CLC
c_9ECB:	ADC $04F7
c_9ECE:	TAY
c_9ECF:	LDA $0399
c_9ED2:	BEQ $9ED9
c_9ED4:	TYA
c_9ED5:	CLC
c_9ED6:	ADC #$1C
c_9ED8:	TAY
c_9ED9:	LDA #$00
c_9EDB:	STA CheckpointFlag,Y
c_9EDE:	STA InvincibilityTimer
c_9EE1:	STA $0626
c_9EE4:	RTS
c_9EE5:	LDA $0624
c_9EE8:	BNE $9EF6
c_9EEA:	INC $0624
c_9EED:	LDA #$07
c_9EEF:	STA $DF
c_9EF1:	LDA #$01
c_9EF3:	STA $0626
c_9EF6:	RTS
c_9EF7:	LDX $A4
c_9EF9:	LDA ObjectXPos,X
c_9EFC:	SEC
c_9EFD:	SBC PlayerXPosDup
c_9EFF:	STA $05A0,X
c_9F02:	LDA ObjectXScreen,X
c_9F05:	SBC $0E
c_9F07:	STA $05B4,X
c_9F0A:	STA $28
c_9F0C:	BEQ $9F15
c_9F0E:	CMP #$FF
c_9F10:	BEQ $9F15
c_9F12:	JMP $A6B5
c_9F15:	LDA ObjectYPos,X
c_9F18:	SEC
c_9F19:	SBC PlayerYPosDup
c_9F1B:	STA $05C8,X
c_9F1E:	LDA ObjectYScreen,X
c_9F21:	SBC PlayerYScreenDup
c_9F23:	STA $05DC,X
c_9F26:	LDA PlayerYScreenDup
c_9F28:	CMP ObjectYScreen,X
c_9F2B:	BEQ $9F57
c_9F2D:	LDA $05DC,X
c_9F30:	BPL $9F46
c_9F32:	LDA $05C8,X
c_9F35:	CLC
c_9F36:	ADC #$10
c_9F38:	STA $05C8,X
c_9F3B:	LDA $05DC,X
c_9F3E:	ADC #$00
c_9F40:	STA $05DC,X
c_9F43:	JMP $9F57
c_9F46:	LDA $05C8,X
c_9F49:	SEC
c_9F4A:	SBC #$10
c_9F4C:	STA $05C8,X
c_9F4F:	LDA $05DC,X
c_9F52:	SBC #$00
c_9F54:	STA $05DC,X
c_9F57:	LDA FreezeFlag
c_9F5A:	BEQ $9F5D
c_9F5C:	RTS
c_9F5D:	LDA $0578,X
c_9F60:	BPL $9F78
c_9F62:	LDA $058C,X
c_9F65:	CMP #$02
c_9F67:	BEQ $9F78
c_9F69:	LDA #$00
c_9F6B:	STA $0578,X
c_9F6E:	LDA ObjectXPos,X
c_9F71:	CLC
c_9F72:	ADC #$0F
c_9F74:	STA ObjectXPos,X
c_9F77:	RTS
c_9F78:	LDA $058C,X
c_9F7B:	CMP #$02
c_9F7D:	BEQ $9F8D
c_9F7F:	LDA $05B4,X
c_9F82:	BPL $9F8C
c_9F84:	INC $E0
c_9F86:	LDX $0399
c_9F89:	INC $036A,X
c_9F8C:	RTS
c_9F8D:	LDA $05B4,X
c_9F90:	BPL $9F84
c_9F92:	RTS
c_9F93:	.db $23
c_9F94:	.db $23
c_9F95:	.db $23
c_9F96:	.db $23
c_9F97:	.db $23
c_9F98:	.db $23
c_9F99:	.db $23
c_9F9A:	.db $23
c_9F9B:	.db $23
c_9F9C:	.db $23
c_9F9D:	.db $23
c_9F9E:	.db $23
c_9F9F:	.db $23
c_9FA0:	.db $23
c_9FA1:	.db $23
c_9FA2:	.db $23
c_9FA3:	.db $23
c_9FA4:	.db $23
c_9FA5:	.db $23
c_9FA6:	.db $23
c_9FA7:	.db $23
c_9FA8:	.db $23
c_9FA9:	.db $23
c_9FAA:	.db $23
c_9FAB:	.db $23
c_9FAC:	.db $23