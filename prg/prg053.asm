b53_00: LDA $05F2
		SEC
		SBC PlayerXPos2
		STA $05F9
		LDA $05F3
		SBC PlayerXScreen2
		STA $05FA
		BEQ b53_01
		CMP #$FF
		BEQ b53_01
		RTS
;------------------
b53_01: LDA $05F4
		SEC
		SBC PlayerYPos2
		STA $05FB
		LDA $05F5
		SBC PlayerYScreen2
		STA $05FC
		LDA PlayerYScreen2
		CMP $05F5
		BEQ b53_03
		LDA $05FC
		BPL b53_02
		LDA $05FB
		CLC
		ADC #$10
		STA $05FB
		LDA $05FC
		ADC #$00
		STA $05FC
		JMP b53_03
b53_02: LDA $05FB
		SEC
		SBC #$10
		STA $05FB
		LDA $05FC
		SBC #$00
		STA $05FC
b53_03: LDA $05F1
		AND #$7F
		ASL
		TAY
		LDA b53_04,Y
		STA $32
		LDA b53_05,Y
		STA $33
		JMP ($0032)
b53_04: .db $78
b53_05: .db $80, $79, $80, $AB, $80, $50, $81, $97, $81, $60
		LDA $06
		AND #$07
		BNE b53_06
		LDA $05F6
		AND #$0F
		TAX
		LDA b53_08,X
		BMI b53_07
		STA $05F8
		INC $05F6
b53_06: RTS
;------------------
b53_07: INC $05F1
		LDA $05F6
		AND #$F0
		STA $05F6
		LDA #$00
		STA FreezeFlag
		RTS
;------------------
b53_08: .db $00, $01, $00, $01, $02, $03, $02, $03, $80
		LDX $05F6
		LDA b53_17,X
		CMP #$02
		BNE b53_09
		JSR $B758
		BNE b53_09
		LDA #$04
		STA $05F1
		LDA #$00
		STA $05F7
		RTS
;------------------
b53_09: JSR $820C
		LDA $06
		AND #$03
		BEQ b53_10
		RTS
;------------------
b53_10: LDA $05F6
		AND #$0F
		TAY 
		LDA b53_16,Y
		BPL b53_11
		LDA $05F6
		AND #$F0
		STA $05F6
		LDY #$00
		LDA b53_16
b53_11: LDX $0621
		CPX #$01
		BEQ b53_12
		LDA #$09
b53_12: STA $05F8
		LDA b53_17,Y
		BMI b53_14
		CLC
		ADC $05F4
		STA $05F4
		BCS b53_13
		CMP #$F0
		BCC b53_15
b53_13: CLC
		ADC #$10
		STA $05F4
		INC $05D5
		JMP b53_15
b53_14: CLC
		ADC $05F4
		STA $05F4
		BCS b53_15
		SEC
		SBC #$10
		STA $05F4
		DEC $05F5
b53_15: INC $05F6
		RTS
;------------------
b53_16: .dsb 16, $03
		.dsb 4, $04
		.db $80
b53_17: .db $FE ,$FF ,$01 ,$02
		.db $FE ,$FF ,$01 ,$02
		.db $FE ,$FF ,$01 ,$02
		.db $FE ,$FF ,$01 ,$02
		.db $FE ,$FF ,$01 ,$02
		LDA #$22
		JSR $B5cd
		JSR b53_29
		LDA $06
		AND #$03
		BNE b53_20
		LDA $05F6
		AND #$0F
		TAY
		LDA b53_21,Y
		BPL b53_18
		LDA $05F6
		AND #$F0
		STA $05F6
		LDY #$00
		LDA b53_21
b53_18: LDX $0621
		CPX #$01
		BEQ b53_19
		TYA
		AND #$01
		CLC
		ADC #$0A
b53_19: STA $05F8
		INC $05F6
b53_20: RTS
;------------------
b53_21: .db $05, $06
		.db $05, $06
		.db $05, $06
		.db $05, $06
		.db $07, $08
		.db $07, $08
		.db $80
		JSR $B758
		BNE b53_26
		LDA #$06
		STA $05F8
		LDA $05F7
		AND #$7F
		CMP #$07
		BCS b53_22
		INC $05F7
b53_22: LDA $05F7
		BMI b53_24
		CLC
		ADC $05F4
		STA $05F4
		BCS b53_23
		CMP #$F0
		BCC b53_25
b53_23: CLC
		ADC #$10
		STA $05F4
		INC $05F5
		JMP b53_25
b53_24: CLC
		ADC $05F4
		STA $05F4
		BCS b53_25
		SEC
		SBC #$10
		STA $05F4
		DEC $05F5
b53_25: RTS
;------------------
b53_26: LDA $AA
		AND #$0F
		STA $25
		LDX $A4
		LDA $05F4
		SEC
		SBC $25
		BCS b53_27
		DEC $05F5
		SEC
		SBC #$10
b53_27: STA $05F4
		LDA #$00
		STA $05F7
		LDY #$02
		LDA $50
		BEQ $8208
		LDA #$00
		STA $50
		LDY #$03
b53_28: STY $05F1
		RTS
;------------------
b53_29: LDA $0636
		BNE b53_33
		LDA $0622
		AND #$40
		BNE b53_30
		LDA $05F2
		CLC
		ADC #$10
		PHA
		JMP b53_31
b53_30: LDA $05F2
		CLC
		ADC #$24
		PHA
b53_31: LDA $05F3
		ADC #$00
		STA $34
		PLA
		SEC
		SBC PlayerXPos2
		STA $32
		LDA $34
		SBC PlayerXScreen2
		BNE b53_32
		LDA $32
		CMP #$14
		BCS b53_32
		LDA $05F4
		CLC
		ADC #$10
		PHA
		LDA $05F5
		ADC #$00
		STA $34
		PLA
		SEC
		SBC PlayerYPos2
		STA $32
		LDA $34
		SBC PlayerYScreen2
		BNE b53_32
		LDA $32
		CMP #$08
		BCS b53_32
		LDA $19
		AND #$04
		BNE b53_32
		LDA #$06
		STA $E1
b53_32: LDA $E1
		CMP #$07
		BNE b53_33
		LDA #$00
		STA $05F1
		LDA #$0D
		STA SFX
b53_33: RTS
;------------------
		LDA $05FA
		BEQ b53_34
		CMP #$FF
		BEQ b53_34
		RTS
;------------------
b53_34: LDA $05F1
		BNE b53_35
		RTS
;------------------
b53_35: LDA $05F8
		ASL
		TAX
		LDA $82a2,X
		STA $32
		LDA $82a3,X
		STA $33
		LDA #$40
		STA $36
		JMP $a436
b53_36: .db $BA
b53_37: .db $82, $C5, $82, $D0
		.db $82, $E3, $82, $F6
		.db $82, $09, $83, $1C
		.db $83, $2F, $83, $42
		.db $83, $55, $83, $68
		.db $83, $7B, $83, $02
		.db $04, $90, $FF, $FF
		.db $FF, $FF, $37, $38
		.db $39, $3A, $02, $04
		.db $90, $FF, $FF, $FF
		.db $FF, $2B, $2C, $2D
		.db $2E, $04, $04, $92
		.db $FF, $FF, $FF, $FF
		.db $FF, $B1, $B2, $FF
		.db $B3, $B4, $B5, $B6
		.db $FF, $B7, $AF, $B0
		.db $04, $04, $92, $FF
		.db $B8, $B9, $FF, $BA
		.db $BB, $AB, $FF, $FF
		.db $AC, $AD, $AE, $FF
		.db $FF, $AF, $B0, $04
		.db $04, $A0, $FF, $2B
		.db $2C, $FF, $2D, $2E
		.db $2F, $FF, $FF, $30
		.db $31, $32, $FF, $FF
		.db $33, $34, $04, $04
		.db $91, $FF, $76, $77
		.db $FF, $78, $79, $7A
		.db $FF, $FF, $FF, $6D
		.db $6E, $FF, $FF, $6F
		.db $70, $04, $04, $93
		.db $FF, $F8, $F9, $FF
		.db $FA, $FB, $EB, $FF
		.db $FF, $EC, $ED, $EE
		.db $FF, $FF, $EF, $F0
		.db $04, $04, $91, $71
		.db $72, $73, $FF, $FF
		.db $74, $75, $FF, $FF
		.db $FF, $6D, $6E, $FF
		.db $FF, $6F, $70, $04
		.db $04, $93, $F1, $F2
		.db $F3, $FF, $F4, $F5
		.db $F6, $FF, $FF, $FF
		.db $F7, $EE, $FF, $FF
		.db $EF, $F0, $04, $04
		.db $A0, $FF, $36, $37
		.db $FF, $38, $39, $3A
		.db $FF, $FF, $3B, $3C
		.db $3D, $FF, $FF, $3F
		.db $35, $04, $04, $A3
		.db $FF, $FA, $F9, $FF
		.db $FF, $FB, $FC, $FF
		.db $FF, $FD, $FE, $EB
		.db $FF, $FF, $F4, $F3
		.db $04, $04, $9B, $F7
		.db $F8, $F9, $FF, $FA
		.db $FB, $FC, $FF, $FF
		.db $FF, $FD, $F2, $FF
		.db $FF, $EB, $F5
		LDX $A4
		LDA $0514,X
		SEC
		SBC PlayerXPos2
		STA $050A,X
		LDA $0528,X
		SBC PlayerXScreen2
		STA $05B4,X
		STA $28
		BEQ b53_38
		CMP #$FF
		BEQ b53_38
		JMP $A6B5
b53_38: LDA $053C,X
		SEC
		SBC PlayerYPos2
		STA $05C8,X
		LDA $0550,X
		SBC PlayerXScreen2
		STA $05DC,X
		LDA PlayerXScreen2
		CMP $0550,X
		BEQ b53_40
		LDA $05DC,X
		BPL b53_39
		LDA $05C8,X
		CLC
		ADC #$10
		STA $05C8,X
		LDA $05DC,X
		ADC #$00
		STA $05DC,X
		JMP b53_40
b53_39: LDA $05C8,X
		SEC
		SBC #$10
		STA $05C8,X
		LDA $05DC,X
		SBC #$00
		STA $05DC,X
b53_40: JSR $BD3D
		LDA Player1YoshiStatus
		BNE b53_41
		LDA $05F1
		BEQ b53_42
b53_41: LDA #$05
		STA ObjectSlot,X
		LDA #$00
		STA $0578
		LDA #$04
		STA $0564,X
		RTS
;------------------		
b53_42: LDA $06
		AND #$03
		BNE b53_43
		LDA #$01
		JSR $B11D
b53_43: LDA $0514,X
		SEC
		SBC PlayerXPos2
		STA $050A,X
		LDA $0528,X
		SBC PlayerXScreen2
		STA $05B4,X
		STA $28
		;continue at 1A:8429