.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub_82EA
sub_82EA:
	LDY objSlot,X
	LDA objectXHitBoxSizes,Y
	STA $36
	LDA objectYHitBoxSizes,Y
	STA $38
	LDY #$10
	LDA playerPowerup
	BEQ bra_8300
	LDY #$18
bra_8300:
	LDA playerAction
	CMP #PACT_DUCK
	BNE bra_8308
	LDY #$08
bra_8308:
	STY $32
	LDA objXDistHi,X
	BPL bra_831C
	LDA #$05
	CLC
	ADC $36
	CLC
	ADC objXDistLo,X
	BCS bra_8323
	BCC bra_8343
bra_831C:
	LDA objXDistLo,X
	CMP #$05
	BCS bra_8343
bra_8323:
	LDA objYDistHi,X
	BEQ bra_8339
	CMP #$FF
	BNE bra_8343
	LDA $32
	CLC
	ADC $38
	CLC
	ADC objYDistLo,X
	BCS bra_8340
	BCC bra_8343
bra_8339:
	LDA objYDistLo,X
	CMP #$00
	BCS bra_8343
bra_8340:
	CLC
	BCC bra_8344
bra_8343:
	SEC
bra_8344:
	BCC bra_8348_RTS
	PLA
	PLA
bra_8348_RTS:
	RTS
