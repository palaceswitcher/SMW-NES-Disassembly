.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"


.export obj0x4A
obj0x4A:
	LDX $A4
	LDA objVar,X
	BPL bra5_8786
	objDistCalc bra5_8778
	
bra5_8778:
	LDA #$00
	STA objState,X
	JSR objFacePlayer
	LDA #$47
	STA enemyAnimFrame,X
	RTS
bra5_8786:
	JSR sub5_8A0D
	LDX $A4
	LDA objState,X
	ASL
	TAY
	LDA tbl5_879D,Y
	STA $32
	LDA tbl5_879D+1,Y
	STA $33
	JMP ($32)
tbl5_879D:
	.word ptr10_87A5
	.word ptr10_8814
	.word ptr10_8889
	.word ptr10_88FA
ptr10_87A5:
	LDA enemyAnimFrame,X
	AND #$4F
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra5_87E4
	LDA #$02
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$11
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_87D0
	LDA #$01
	STA objState,X
	RTS
bra5_87D0:
	LDA #$0E
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_87E1
	LDA #$03
	STA objState,X
	RTS
bra5_87E1:
	JMP loc5_89D4
bra5_87E4:
	LDA #$0E
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$FF
	STA $36
	LDA #$14
	JSR sub3_B7A2
	BNE bra5_8800
	LDA #$03
	STA objState,X
	RTS
bra5_8800:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_8811
	LDA #$01
	STA objState,X
	RTS
bra5_8811:
	JMP loc5_89B2
ptr10_8814:
	LDA enemyAnimFrame,X
	AND #$CF
	ORA #$40
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra5_8855
	LDA #$FB
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$FB
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8841
	LDA #$02
	STA objState,X
	RTS
bra5_8841:
	LDA #$08
	STA $36
	LDA #$10
	JSR sub3_B7A2
	BEQ bra5_8852
	LDA #$00
	STA objState,X
	RTS
bra5_8852:
	JMP loc5_898B
bra5_8855:
	LDA #$FB
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$FB
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8871
	LDA #$00
	STA objState,X
	RTS
bra5_8871:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8886
	LDA #$0E
	STA sndSfx
	LDA #$02
	STA objState,X
	RTS
bra5_8886:
	JMP loc5_8969
ptr10_8889:
	LDA enemyAnimFrame,X
	AND #$CF
	ORA #$80
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra5_88CA
	LDA #$10
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$FF
	STA $36
	LDA #$F8
	JSR sub3_B7A2
	BNE bra5_88B6
	LDA #$03
	STA objState,X
	RTS
bra5_88B6:
	LDA #$00
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88C7
	LDA #$01
	STA objState,X
	RTS
bra5_88C7:
	JMP loc5_89B2
bra5_88CA:
	LDA #$00
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$0F
	STA $36
	LDA #$FB
	JSR sub3_B7A2
	BNE bra5_88E6
	LDA #$01
	STA objState,X
	RTS
bra5_88E6:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra5_88F7
	LDA #$03
	STA objState,X
	RTS
bra5_88F7:
	JMP loc5_89D4
ptr10_88FA:
	LDA enemyAnimFrame,X
	AND #$8F
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	BNE bra5_8939
	LDA #$14
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$14
	STA $36
	LDA #$FF
	JSR sub3_B7A2
	BNE bra5_8925
	LDA #$00
	STA objState,X
	RTS
bra5_8925:
	LDA #$08
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BEQ bra5_8936
	LDA #$02
	STA objState,X
	RTS
bra5_8936:
	JMP loc5_8969
bra5_8939:
	LDA #$14
	STA $36
	LDA #$01
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$14
	STA $36
	LDA #$11
	JSR sub3_B7A2
	BNE bra5_8955
	LDA #$02
	STA objState,X
	RTS
bra5_8955:
	LDA #$08
	STA $36
	LDA #$0E
	JSR sub3_B7A2
	BEQ bra5_8966
	LDA #$00
	STA objState,X
	RTS
bra5_8966:
	JMP loc5_898B
loc5_8969:
	LDA objFrameCount
	AND #$01
	BNE bra5_8981
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	LDA objYHi,X
	SBC #$00
	STA objYHi,X
bra5_8981:
	LDY #$09
	LDA enemyAnimFrame,X
	AND #$40
	JMP loc5_89AC
loc5_898B:
	LDA objFrameCount
	AND #$01
	BNE bra5_89A3
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
bra5_89A3:
	LDY #$0E
	LDA enemyAnimFrame,X
	AND #$C0
	ORA #$80
loc5_89AC:
	STA enemyAnimFrame,X
	JMP loc5_89FD
loc5_89B2:
	LDA objFrameCount
	AND #$01
	BNE bra5_89CA
	LDA objXLo,X
	SEC
	SBC #$01
	STA objXLo,X
	LDA objXHi,X
	SBC #$00
	STA objXHi,X
bra5_89CA:
	LDA enemyAnimFrame,X
	AND #$80
	ORA #$40
	JMP loc5_89F1
loc5_89D4:
	LDA objFrameCount
	AND #$01
	BNE bra5_89EC
	LDA objXLo,X
	CLC
	ADC #$01
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
bra5_89EC:
	LDA enemyAnimFrame,X
	AND #$80
loc5_89F1:
	STA enemyAnimFrame,X
	LDY #$07
	LDA objState,X
	BEQ bra5_89FD
	LDY #$0C
bra5_89FD:
loc5_89FD:
	LDA objFrameCount
	AND #$04
	BEQ bra5_8A05
	INY
bra5_8A05:
	TYA
	ORA enemyAnimFrame,X
	STA enemyAnimFrame,X
	RTS
sub5_8A0D:
	LDA #$06
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
	BEQ bra5_8A2F
	CMP #$FF
	BEQ bra5_8A2F
	JMP objRemoveObject
bra5_8A2F:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra5_8A71
	LDA objYDistHi,X
	BPL bra5_8A60
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc5_8A71
bra5_8A60:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra5_8A71:
loc5_8A71:
	LDA freezeFlag
	BEQ bra5_8A77
	RTS
bra5_8A77:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl5_8A8B,Y
	STA $32
	LDA tbl5_8A8B+1,Y
	STA $33
	JMP ($32)
tbl5_8A8B:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr10_8A95
	.word objFlipKill
ptr10_8A95:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
