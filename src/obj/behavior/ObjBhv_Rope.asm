.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x5C
obj0x5C:
	LDX $A4
	objDistCalc bra5_900F

bra5_900F:
	LDA objVar,X
	BPL bra5_902C
	JSR objFacePlayer
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056
	RTS
bra5_902C:
	LDA objFrameCount
	AND #$07
	BNE bra5_9037
		LDA #SFX_CUTTER
		STA sndSfx
bra5_9037:
	JSR ropeClimbCheck
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_904A
	RTS
bra5_904A:
	ASL
	TAY
	JSR jmp_54_B896
	JSR ropeMoveSelf
	JSR sub5_9056
	RTS

; TODO: DECIDE ON SPLITTING THIS OFF INTO A SEPARATE CODE FILE
.export sub5_9056
sub5_9056:
	LDA objSlot,X
	AND #$FE
	CMP #OBJ_CHAINSAW_DOWN
	BNE bra5_9063
	LDA #$E2
	BNE bra5_9074
bra5_9063:
	LDA objSlot,X
	AND #$FE
	SEC
	SBC #OBJ_ROPE-2
	STA $32
	LSR
	CLC
	ADC $32
	CLC
	ADC #OBJ_ROPE-3
bra5_9074:
	STA $32
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA tbl5_9089,Y
	CLC
	ADC $32
	STA enemyAnimFrame,X
	RTS
tbl5_9089:
	.byte $00
	.byte $01
	.byte $00
	.byte $02
