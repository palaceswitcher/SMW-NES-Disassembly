.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; SUBROUTINE ($9522)
; Moves a rope while the player is climbing on it
;----------------------------------------
.export ropeMoveSelf
ropeMoveSelf:
	LDA playerState
	CMP #PSTATE_CLIMBING
	BEQ bra5_9529
	RTS

bra5_9529:
	LDA #$00
	STA playerXSpd ; Lock X speed while climbing
	LDA playerXLoDup
	CLC
	ADC $28
	STA playerXLoDup
	LDA $28
	BMI bra5_953F
	LDA playerXHiDup
	ADC #$00
	JMP loc5_9543
bra5_953F:
	LDA playerXHiDup
	SBC #$00
loc5_9543:
	STA playerXHiDup
	LDA $2B
	BMI bra5_955E
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS bra5_9554
	CMP #256-16
	BCC loc5_957A
bra5_9554:
	CLC
	ADC #16
	STA playerYLoDup
	INC playerYHiDup
	JMP loc5_957A
bra5_955E:
	CLC
	ADC playerYLoDup
	STA playerYLoDup
	BCS loc5_957A
	SEC
	SBC #16
	STA playerYLoDup
	DEC playerYHiDup
	LDY scrollBoundTop
	CPY playerYHiDup
	BNE loc5_957A
	INY
	STY playerYHiDup
	LDA #$00
	STA playerYLoDup

loc5_957A:
	objDistCalc bra5_95DE_RTS

bra5_95DE_RTS:
	RTS
