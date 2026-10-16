.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xED
obj0xED:
	LDX $A4
	objDistCalc bra5_9877

bra5_9877:
	LDA objVar,X
	BPL bra5_98A4
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	CLC
	ADC #$08
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
	RTS
bra5_98A4:
	LDA gameState
	CMP #GAMESTATE_DEFAULT
	BNE bra5_9920_RTS
	LDA objXDistHi,X
	BPL bra5_98BC
	LDA #$00
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_98C3
	BCC bra5_98E3
bra5_98BC:
	LDA objXDistLo,X
	CMP #$00
	BCS bra5_98E3
bra5_98C3:
	LDA objYDistHi,X
	BEQ bra5_98D9
	CMP #$FF
	BNE bra5_98E3
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_98E0
	BCC bra5_98E3
bra5_98D9:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_98E3
bra5_98E0:
	CLC
	BCC bra5_98E4
bra5_98E3:
	SEC
bra5_98E4:
	BCS bra5_9920_RTS
	LDA objSlot,X
	CMP #OBJ_PIPE_CANNON
	BEQ bra5_98F6
	CMP #OBJ_PIPE_CANNON+1
	BEQ bra5_98F6
	LDA playerYoshiState
	BNE bra5_9920_RTS
bra5_98F6:
	LDY #$06
	LDA playerMoveFlags
	AND #$40
	BEQ bra5_9900
	LDY #$0A
bra5_9900:
	STY $25
	LDA objSlot,X
	SEC
	SBC #OBJ_PIPE_CANNON-1
	TAY
	LDA objSlot,X
	CMP #OBJ_PIPE_BONUS_EXIT
	BEQ bra5_9940
	CMP #OBJ_PIPE_CANNON-1
	BNE bra5_9921
	LDA #$01
	STA $06E9
	LDA btnHeld
	AND #$08
	BNE bra5_992C
bra5_9920_RTS:
	RTS
bra5_9921:
	LDA #$00
	STA $06E9
	LDA playerPrevAction
	CMP #$07
	BNE bra5_9920_RTS
bra5_992C:
	LDA objXLo,X
	CLC
	ADC $25
	STA playerXLoDup
	LDA objXHi,X
	ADC #$00
	STA playerXHiDup
	LDA #$20
	STA $06E0
bra5_9940:
	LDA tbl5_994A,Y
	STA gameState
	LDA #$00
	STA gameSubstate
	RTS
tbl5_994A:
	.byte GAMESTATE_PIPEENTERUP
	.byte GAMESTATE_PIPECANNONENTER
	.byte GAMESTATE_PIPECANNONENTER2
	.byte $FF
	.byte $FF
	.byte GAMESTATE_PIPEENTERDOWN
	.byte GAMESTATE_PIPELEVELENTER
