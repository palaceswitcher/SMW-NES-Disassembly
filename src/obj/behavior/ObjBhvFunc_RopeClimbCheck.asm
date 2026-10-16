.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ropeClimbCheck
ropeClimbCheck:
	LDA playerYoshiState
	BNE bra5_92E1_RTS
	LDA playerHoldFlag
	BEQ bra5_92E2
bra5_92E1_RTS:
	RTS
bra5_92E2:
	LDA $06DC
	BEQ bra5_9329
	LDA objXDistHi,X
	BPL bra5_92F9
	LDA #$05
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9300
	BCC bra5_9320
bra5_92F9:
	LDA objXDistLo,X
	CMP #$05
	BCS bra5_9320
bra5_9300:
	LDA objYDistHi,X
	BEQ bra5_9316
	CMP #$FF
	BNE bra5_9320
	LDA #$10
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_931D
	BCC bra5_9320
bra5_9316:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9320
bra5_931D:
	CLC
	BCC bra5_9321
bra5_9320:
	SEC
bra5_9321:
	BCS bra5_9329
	LDA #$01
	STA $06DD
	RTS
bra5_9329:
	LDY #80 ; Short rope height
	LDA objSlot,X
	CMP #OBJ_ROPE_LONG
	BCC bra5_9334
	LDY #136 ; Long rope height
bra5_9334:
	STY $38
	LDA objXDistHi,X
	BPL bra5_9348
	LDA #$04
	CLC
	ADC #$04
	CLC
	ADC objXDistLo,X
	BCS bra5_934F
	BCC bra5_936F
bra5_9348:
	LDA objXDistLo,X
	CMP #$00
	BCS bra5_936F
bra5_934F:
	LDA objYDistHi,X
	BEQ bra5_9365
	CMP #$FF
	BNE bra5_936F
	LDA #$10
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra5_936C
	BCC bra5_936F
bra5_9365:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_936F
bra5_936C:
	CLC
	BCC bra5_9370
bra5_936F:
	SEC
bra5_9370:
	BCS bra5_9395
	LDA playerPrevAction
	CMP #PACT_CLIMBIDLE
	BEQ bra5_9394_RTS
	CMP #BTN_UP|BTN_DOWN|BTN_LEFT
	BEQ bra5_9394_RTS
	LDA btnHeld
	AND #BTN_UP
	BEQ bra5_9394_RTS
	LDA #$00
	STA playerYSpd
	STA playerXSpd
	LDA #PSTATE_CLIMBING
	STA playerState
	STA $06DC
	LDA #PACT_CLIMBIDLE
	STA playerAction
bra5_9394_RTS:
	RTS
bra5_9395:
	LDA playerPrevAction
	CMP #PACT_CLIMBIDLE
	BEQ bra5_939F
	CMP #PACT_CLIMBMOVE
	BNE bra5_93A7_RTS
bra5_939F:
	LDA #$00
	STA playerState
	LDA #PACT_FALL
	STA playerAction
bra5_93A7_RTS:
	RTS
