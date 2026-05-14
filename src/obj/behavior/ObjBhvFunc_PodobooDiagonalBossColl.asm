.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub6_92D0
sub6_92D0:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra6_933A

bra6_933A:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_934E,Y
	STA $32
	LDA tbl6_934E+1,Y
	STA $33
	JMP ($32)
tbl6_934E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_9358
	.word objFlipKill
ptr6_9358:
	LDA lemmyWendyDefeated
	BNE bra6_9363_RTS
	JSR jmp_54_BC3E
	JSR jmp_54_BF74 ; Only collide if boss isn't defeated
bra6_9363_RTS:
	RTS
