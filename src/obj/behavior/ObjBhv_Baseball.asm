.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xAE
obj0xAE:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8AE9
	CMP #$FF
	BEQ bra4_8AE9
	JMP objRemoveObject
bra4_8AE9:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8B2B
	LDA objYDistHi,X
	BPL bra4_8B1A
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8B2B ; unlogged
bra4_8B1A:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8B2B:
loc4_8B2B:
	LDA freezeFlag
	BEQ bra4_8B31
	RTS ; unlogged
bra4_8B31:
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BCC bra4_8B45
bra4_8B3A:
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	RTS
bra4_8B45:
	LDA #$08
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra4_8B3A
	LDA objFrameCount
	AND #$00
	BNE bra4_8B68
	LDA #$84
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_8B68:
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	JMP jmp_54_BF74
