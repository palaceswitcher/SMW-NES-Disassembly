.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export ptr6_8CDB
ptr6_8CDB:
	LDA worldNumber
	CMP #$02
	BNE bra6_8D12
	LDX $A4
	LDA enemyAnimFrame,X
	AND #$3F
	ASL
	TAX
	LDA tbl6_8D45,X
	STA $32
	LDA tbl6_8D45+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_8D02
	LDY #$C0
bra6_8D02:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$60
	STA $05F0
	JSR jmp_54_A118
	RTS
bra6_8D12:
	LDX $A4
	LDA enemyAnimFrame,X
	SEC
	SBC #$1D
	AND #$3F
	ASL
	TAX
	LDA tbl6_8DB7,X
	STA $32
	LDA tbl6_8DB7+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra6_8D35
	LDY #$C0
bra6_8D35:
	STY $36
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$60
	STA $05F0
	JSR jmp_54_A118
	RTS
