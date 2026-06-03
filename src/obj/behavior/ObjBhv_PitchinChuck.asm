.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xCE
obj0xCE:
	LDX $A4
	LDA objVar,X
	BMI bra4_881E
	JMP loc4_8920
bra4_881E:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_883A
	CMP #$FF
	BEQ bra4_883A
	JMP objRemoveObject ; unlogged
bra4_883A:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_887C
	LDA objYDistHi,X
	BPL bra4_886B
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_887C ; unlogged
bra4_886B:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_887C:
loc4_887C:
	LDA freezeFlag
	BEQ bra4_8882
	RTS ; unlogged
bra4_8882:
	JSR objFacePlayer
	LDY #$50
	LDA objFlags,X
	AND #$40
	BNE bra4_8890
	LDY #$B0
bra4_8890:
	STY $25
	TYA
	CLC
	ADC objXLo,X
	STA objXLo,X
	LDA $25
	BMI bra4_88A6
	LDA objXHi,X
	ADC #$00
	JMP loc4_88AB
bra4_88A6:
	LDA objXHi,X
	SBC #$00
loc4_88AB:
	STA objXHi,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_88CA
	CMP #$FF
	BEQ bra4_88CA
	JMP objRemoveObject ; unlogged
bra4_88CA:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_890C
	LDA objYDistHi,X
	BPL bra4_88FB
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_890C ; unlogged
bra4_88FB:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_890C:
loc4_890C:
	LDA freezeFlag
	BEQ bra4_8912
	RTS ; unlogged
bra4_8912:
	LDA objSlot,X
	AND #$01
	TAY
	LDA #$AA
	STA $03C9,Y
	JMP loc4_8A27
loc4_8920:
	LDA #$07
	STA $25
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_8942
	CMP #$FF
	BEQ bra4_8942
	JMP objRemoveObject
bra4_8942:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_8984
	LDA objYDistHi,X
	BPL bra4_8973
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc4_8984 ; unlogged
bra4_8973:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_8984:
loc4_8984:
	LDA freezeFlag
	BEQ bra4_898A
	RTS ; unlogged
bra4_898A:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl4_899E,Y
	STA $32
	LDA tbl4_899E+1,Y
	STA $33
	JMP ($32)
tbl4_899E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_89A8
	.word objFlipKill
.export ptr9_89A8
ptr9_89A8:
	JSR sub4_89DA
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$30
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDA objSlot,X
	AND #$01
	ORA #$C4
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub4_89DA:
	LDA objFlags,X
	AND #$20
	BNE bra4_8A06
	LDA objVar,X
	BNE bra4_8A06
	LDY #$01
	LDA objYDistHi,X
	BPL bra4_89EF
	LDY #$11
bra4_89EF:
	TYA
	STA objVar,X
	LDA objXDistHi,X
	AND #$40
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
bra4_8A06:
	LDA objFrameCount
	AND #$04
	BNE bra4_8A1E
	LDA #$83
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_8A1E:
	LDA objVar,X
	AND #$0F
	CMP #$0D
	BNE bra4_8A80_RTS
loc4_8A27:
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objFlags,X
	AND #$40
	BNE bra4_8A49
	LDA objXLo,X
	CLC
	ADC #$10
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	JMP loc4_8A55
bra4_8A49:
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
loc4_8A55:
	LDA objYLo,X
	CLC
	ADC #$0C
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objFlags,X
	AND #$40
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	STA objState,Y
	LDA objSlot,X
	AND #$01
	ORA #$B0
	STA objSlot,Y
bra4_8A80_RTS:
	RTS
