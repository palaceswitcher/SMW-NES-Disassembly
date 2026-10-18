.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xAC
obj0xAC:
	LDX $A4
	LDA objVar,X
	CMP #$05
	BCS bra9_9303
	JSR sub9_9385
	JMP loc9_9306
bra9_9303:
	JSR sub9_939E
loc9_9306:
	objDistCalc bra9_936A

bra9_936A:
	LDA objVar,X
	CMP #$10
	BCC bra9_9384_RTS
	LDA objSlot,X
	SEC
	SBC #$02
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	LDA #$80
	STA objVar,X
bra9_9384_RTS:
	RTS
sub9_9385:
	LDA frameCount
	AND #$3F
	BEQ bra9_938C
	RTS
bra9_938C:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	RTS
sub9_939E:
	LDA frameCount
	AND #$02
	BEQ bra9_93A5
	RTS
bra9_93A5:
	LDA #$8C
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub3_B485
	RTS
