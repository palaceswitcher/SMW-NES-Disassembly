.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xE0
obj0xE0:
	LDX $A4
	objDistCalc bra_814A

bra_814A:
	LDA objVar,X
	BMI bra_8152
	JMP loc_82A7
bra_8152:
	LDY objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	STA objXLo+1,Y
	LDA objXHi,X
	STA objXHi,Y
	STA objXHi+1,Y
	LDA objYLo,X
	STA objYLo,Y
	STA objYLo+1,Y
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	LDA objYLo,Y
	SEC
	SBC #$90
	STA objYLo,Y
	BCS bra_8196
	SEC
	SBC #$10
	STA objYLo,Y
	LDA objYHi,Y
	SEC
	SBC #$01
	STA objYHi,Y
bra_8196:
	LDA objXLo+1,Y
	CLC
	ADC #$04
	STA objXLo+1,Y
	LDA objXHi+1,Y
	ADC #$00
	STA objXHi+1,Y
	LDA #$80
	STA objVar,Y
	LDA #$00
	STA objVar,X
	STA objVar+1,Y
	STA objFlags,Y
	STA objFlags+1,Y
	STA objState+1,Y
	LDA objSlot,X
	AND #$01
	CLC
	ADC #OBJ_SPIKE_DOWN
	STA objSlot,Y
	LDA #OBJ_SPIKE_HURTBOX
	STA objSlot+1,Y
	RTS

.export obj0xF4
obj0xF4:
	LDX $A4
	objDistCalc bra_8234

bra_8234:
	LDA objVar,X
	BPL loc_82A7
	LDA #$00
	STA objVar,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$00
	STA objState,Y
	STA objFlags,Y
	STA objVar,Y
	LDA #OBJ_SPIKE_HURTBOX
	STA objSlot,Y
	LDA objXLo,Y
	CLC
	ADC #$04
	STA objXLo,Y
	LDA objXHi,Y
	ADC #$00
	STA objXHi,Y
	LDA #$00
	STA objState,Y
	LDA objSlot,X
	CMP #OBJ_SPIKE_DOWN
	BCC bra_82A6_RTS
	LDA #$01
	STA objState,Y
	LDA objYLo,Y
	CLC
	ADC #$38
	STA objYLo,Y
	BCC bra_82A6_RTS
	CLC
	ADC #$10
	STA objYLo,Y
	LDA objYHi,Y
	CLC
	ADC #$01
	STA objYHi,Y
bra_82A6_RTS:
	RTS

.export loc_82A7
loc_82A7:
	JSR sub_82C9
	LDY #$00
	LDA objSlot,X
	CMP #OBJ_SPIKE_DOWN
	BCC bra_82B4
	INY
bra_82B4:
	TYA
	STA enemyAnimFrame,X
	CLC
	ADC #$46
	STA $32
	LDA frameCount
	AND #$01
	BNE bra_82C8_RTS
	LDA $32
	JSR parseMovementData
bra_82C8_RTS:
	RTS

.export sub_82C9
sub_82C9:
	JSR sub_82EA
	LDA playerMoveFlags
	AND #PMOVE_HORIZ
	BNE bra_82DF
		LDA objXDistHi,X
		BMI loc_82E9_RTS
		LDA #$01
		STA playerXMovementLocked
		JMP loc_82E9_RTS
	bra_82DF:
		LDA objXDistHi,X
		BPL loc_82E9_RTS
		LDA #$01
		STA playerXMovementLocked
	loc_82E9_RTS:
		RTS
