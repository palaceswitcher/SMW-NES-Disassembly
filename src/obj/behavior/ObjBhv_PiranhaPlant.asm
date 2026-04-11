.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; PIRANHA PLANT OBJECT CODE ($86CA)
;----------------------------------------
.export obj0x1A
obj0x1A:
	LDX $A4
	objDistCalc bra8_8730 ; Calculate distance between Piranha Plant and player

bra8_8730:
	LDA objVar,X
	BPL bra8_8776
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,Y
	LDA #$F3
	STA objState,Y
	RTS
bra8_8776:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra8_87E0

bra8_87E0:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_87F4,Y
	STA $32
	LDA tbl8_87F4+1,Y
	STA $33
	JMP ($32)
tbl8_87F4:
	.word ptr3_87FE
	.word ptr3_880D
	.word ptr3_881C
	.word ptr3_882B
	.word objFlipKill
ptr3_87FE:
	LDA frameCount
	AND #$03
	BNE bra8_8809
	LDA #$15
	JSR jmp_54_B11D ; Use movement data string #$15 (21 in decimal), which is used for the piranha plant
bra8_8809:
	JSR objYoshiTongueCheck ; Handle edibility
	RTS
ptr3_880D:
	LDA frameCount
	AND #$03
	BNE bra8_8818
	LDA #$15
	JSR jmp_54_B11D
bra8_8818:
	JSR ptr_AA7B
	RTS
ptr3_881C:
	LDA frameCount
	AND #$03
	BNE bra8_8827
	LDA #$15
	JSR jmp_54_B11D
bra8_8827:
	JSR objPowerupEatCheck
	RTS
ptr3_882B:
	LDA frameCount
	AND #$03
	BNE bra8_8836
	LDA #$15
	JSR jmp_54_B11D
bra8_8836:
	LDA objVar,X
	CMP #$10
	BCC bra8_884A_RTS
	CMP #$35
	BCS bra8_884A_RTS
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
bra8_884A_RTS:
	RTS