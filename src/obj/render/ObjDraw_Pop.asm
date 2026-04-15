.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_97C3
ptr6_97C3:
	LDA #$40
	STA $05F0
	LDA #$08
	STA $25
	LDA $05F0
	AND #$40
	BEQ bra7_9817
	LDX #$00
	LDY $A4
	LDA objXDistLo,Y
	CLC
	ADC playerSprX
	STA $28
	LDA objXDistHi,Y
	ADC #$00
	BMI bra7_97F9
	BEQ bra7_97E9
	RTS
bra7_97E9:
	LDA $28
bra7_97EB:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	CLC
	ADC #$08
	BCC bra7_97EB
	BCS bra7_980C
bra7_97F9:
	LDA $28
	LDY #$00
bra7_97FD:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_980B_RTS
	CLC
	ADC #$08
	BCC bra7_97FD
	BCS bra7_97EB
bra7_980B_RTS:
	RTS
bra7_980C:
	LDA #$00
bra7_980E:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_980E
	BCS bra7_9862
bra7_9817:
	LDX #$00
	STX $41
	LDY $A4
	LDA $25
	CLC
	ADC playerSprX
	BCC bra7_9826
	INC $41
bra7_9826:
	CLC
	ADC objXDistLo,Y
	STA $28
	LDA objXDistHi,Y
	ADC $41
	BMI bra7_9846
	BEQ bra7_9836
	RTS
bra7_9836:
	LDA $28
bra7_9838:
	STA $41,X
	INX
	CPX #$02
	BCS bra7_9862
	SEC
	SBC #$08
	BCS bra7_9838
	BCC bra7_9859
bra7_9846:
	LDA $28
	LDY #$00
bra7_984A:
	STY $41,X
	INX
	CPX #$02
	BCS bra7_9858_RTS
	SEC
	SBC #$08
	BCS bra7_984A
	BCC bra7_9838
bra7_9858_RTS:
	RTS
bra7_9859:
	LDA #$00
bra7_985B:
	STA $41,X
	INX
	CPX #$02
	BCC bra7_985B
bra7_9862:
	LDX #$00
	LDY $A4
	LDA objYDistLo,Y
	CLC
	ADC playerSprY
	STA $2B
	LDA objYDistHi,Y
	ADC #$00
	BMI bra7_9890
	BEQ bra7_9878
	RTS
bra7_9878:
	LDA $2B
	CMP #$C8
	BCC bra7_9880
	LDA #$F8
bra7_9880:
	STA $B2,X
	INX
	CPX #$02
	BCS bra7_98AC
	CLC
	ADC #$08
	STA $2B
	BCC bra7_9878
	BCS bra7_98A3
bra7_9890:
	LDA $2B
	LDY #$00
bra7_9894:
	STY $B2,X
	INX
	CPX #$02
	BCS bra7_98A2
	CLC
	ADC #$08
	BCC bra7_9894
	BCS bra7_9880
bra7_98A2:
	RTS
bra7_98A3:
	LDA #$00
bra7_98A5:
	STA $B2,X
	INX
	CPX #$02
	BCC bra7_98A5
bra7_98AC:
	LDA $B2
	STA spriteMem+4
	LDA $B2
	STA spriteMem+8
	LDA $B3
	STA spriteMem+12
	LDA $B3
	STA $0210
	LDA $41
	STA spriteMem+7
	LDA $42
	STA spriteMem+11
	LDA $41
	STA spriteMem+15
	LDA $42
	STA $0213
	LDA #$59 ; Pop effect upper left tile
	STA spriteMem+5
	LDA #$61 ; Pop effect upper right tile
	STA spriteMem+9
	LDA #$61 ; Pop effect lower left tile
	STA spriteMem+13
	LDA #$59 ; Pop effect lower right tile
	STA $0211
	LDA #$01
	STA spriteMem+6
	LDA #$C1
	STA spriteMem+10
	LDA #$01
	STA spriteMem+14
	LDA #$C1
	STA $0212
	RTS
