.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xBD
obj0xBD:
	LDX $A4
	LDA objVar,X
	BPL bra_83F3
	AND #$7F
	CMP #$10
	BCC bra_8380
	LDA #$00
	STA objVar,X
	RTS
bra_8380:
	INC objVar,X
	LDA frameCount
	AND #$01
	BNE bra_838E
	LDA #$4C
	JSR getMovementData
bra_838E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_83AA
	CMP #$FF
	BEQ bra_83AA
	JMP objRemoveObject
bra_83AA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra_83EC
	LDA objYDistHi,X
	BPL bra_83DB
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_83EC
bra_83DB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra_83EC:
loc_83EC:
	LDA freezeFlag
	BEQ bra_83F2_RTS
	RTS
bra_83F2_RTS:
	RTS
bra_83F3:
	LDA frameCount
	AND #$00
	BNE bra_83FE
	LDA #$0B
	JSR getMovementData
bra_83FE:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra_841A
	CMP #$FF
	BEQ bra_841A
	JMP objRemoveObject
bra_841A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc_845C
	LDA objYDistHi,X
	BPL bra_844B
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc_845C
bra_844B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X

loc_845C:
	LDA freezeFlag
	BEQ bra_8462
	RTS
bra_8462:
	LDX $A4
	JSR sub_82EA
	JSR jmp_54_AE3D
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
