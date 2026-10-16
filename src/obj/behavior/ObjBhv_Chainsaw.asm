.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x5A
obj0x5A:
	LDX $A4
	objDistCalc bra5_90F3

bra5_90F3:
	LDA objVar,X
	BPL bra5_913D
	LDA objSlot,X
	CMP #OBJ_CHAINSAW_UP_ALT
	BCS bra5_9117
	JSR objFacePlayer
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056 ; Animation code is shared with and found in ObjBhv_Rope.asm
	RTS
bra5_9117:
	LDA objXLo,X
	SEC
	SBC #$A0
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
	LDA objYLo,X
	SEC
	SBC #$08
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
	JSR sub5_9056
	RTS
bra5_913D:
	LDA objFrameCount
	AND #$07
	BNE bra5_9148
	LDA #SFX_CUTTER
	STA sndSfx
bra5_9148:
	JSR sub5_82EC
	LDA $058C,X
	LSR
	SEC
	SBC #$03
	TAY
	LDA tbl5_92B7,Y
	CMP #$FF
	BNE bra5_915B
	RTS
bra5_915B:
	ASL
	TAY
	JSR jmp_54_B896
	JSR sub5_9056
	RTS
