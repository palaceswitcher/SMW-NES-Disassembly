.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x54
obj0x54:
	LDX $A4
	objDistCalc bra5_8EB5

bra5_8EB5:
	LDA objVar,X
	BMI bra5_8EBD
	JMP loc5_8F3F
bra5_8EBD:
	JSR objFacePlayer
	LDA objSlot,X
	CMP #OBJ_LINEPLATFORM_ALT
	BCC bra5_8EEB
	CMP #OBJ_CHAINPLATFORM_GREEN
	BEQ bra5_8F25
	CMP #OBJ_CHAINPLATFORM_RED
	BCC bra5_8F0D
	BEQ bra5_8EE2
; 0x55
	LDA objXLo,X
	SEC
	SBC #$08
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
bra5_8EE2:
	LDA objYLo,X
	SEC
	SBC #$08
	JMP loc5_8F02
; 0x54
bra5_8EEB:
	LDA objXLo,X
	SEC
	SBC #$07
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$04
loc5_8F02:
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
; 0x57
bra5_8F0D:
	LDY objSlot,X
	CPY #OBJ_CHAINPLATFORM_RED
	BNE bra5_8F18
	LDY #OBJ_LINEPLATFORM
	BNE bra5_8F1E
bra5_8F18:
	CPY #OBJ_FUZZY
	BNE bra5_8F1E
	LDY #OBJ_CHAINPLATFORM_RED
bra5_8F1E:
	DEY
	DEY
	TYA
	STA enemyAnimFrame,X
	RTS
; 0x56
bra5_8F25:
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	JMP loc5_8F02
loc5_8F3F:
	LDY objSlot,X
	CPY #OBJ_FUZZY
	BEQ bra5_8F7E
	CPY #OBJ_CHAINPLATFORM_RED
	BNE bra5_8F4C
	LDY #OBJ_LINEPLATFORM
bra5_8F4C:
	DEY
	DEY
	TYA
	STA enemyAnimFrame,X
	LDA $058C,X
	LSR
	SEC
	SBC #$01
	TAY
	LDA tbl5_9263,Y
	CMP #$FF
	BNE bra5_8F62
	RTS
bra5_8F62:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$DA
	LDA objSlot,X
	CMP #OBJ_PARATROOPA_GREEN
	BCS bra5_8F78
	SEC
	SBC #OBJ_LINEPLATFORM
	TAY
	LDA tbl5_8FA5,Y
	TAY
bra5_8F78:
	STY $25
	JSR objCollAsPlatform
	RTS
bra5_8F7E:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$18
	TAY
	LDA tbl5_9297,Y
	CMP #$FF
	BNE bra5_8F91
	RTS
bra5_8F91:
	ASL
	TAY
	JSR jmp_54_B896
	LDY #$55
	LDA objFrameCount
	AND #$10
	BEQ bra5_8FA0
	INY
bra5_8FA0:
	TYA
	STA enemyAnimFrame,X
	RTS
tbl5_8FA5:
	.byte $CA
	.byte $CA
	.byte $D6
	.byte $CA
