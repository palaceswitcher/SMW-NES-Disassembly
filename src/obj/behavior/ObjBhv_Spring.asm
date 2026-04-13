.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export objSpring
objSpring:
	LDA #$03
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
	BEQ bra7_8715
	CMP #$FF
	BEQ bra7_8715
	JMP objRemoveObject
bra7_8715:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8757
	LDA objYDistHi,X
	BPL bra7_8746
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8757
bra7_8746:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8757:
loc7_8757:
	LDA freezeFlag
	BEQ bra7_875D
	RTS
bra7_875D:
	LDA objFlags,X
	AND #$1F ; Mask out the upper 3 bits, limiting it to $00 - $1F
	ASL
	TAY ; Get pointer for the object's current state
	LDA tbl7_8771,Y
	STA $32
	LDA tbl7_8771+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer location
tbl7_8771:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word ptr_AB5D
	.word ptr5_8789
	.word ptr_AE17
	.word ptr5_884C
	.word ptr5_8695 ; FIXME PUT THIS FUNCTION ELSEWHEREE
	.word ptr5_88BC
	.word ptr5_88BC
	.word ptr5_88BC
	.word ptr5_8931
	.word ptr5_89C1
ptr5_8789:
	JSR positionCarriedObject
	LDA frameCount
	AND #$00
	BNE bra7_8797
	LDA #$27
	JSR getMovementData
bra7_8797:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_87B3
	CMP #$FF
	BEQ bra7_87B3
	JMP objRemoveObject
bra7_87B3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_87F5
	LDA objYDistHi,X
	BPL bra7_87E4
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_87F5
bra7_87E4:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_87F5:
loc7_87F5:
	LDA freezeFlag
	BEQ bra7_87FB
	RTS

bra7_87FB:
	JSR objCapeHitCheck
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA playerYSpd
	BEQ bra7_881E
	LDA playerMoveFlags
	AND #$04
	BNE bra7_881D_RTS
	LDA #$00
	STA playerYSpd
	LDX $A4
	LDA objFlags,X
	CLC
	ADC #$04
	STA objFlags,X
bra7_881D_RTS:
	RTS
bra7_881E:
	LDA playerYoshiState
	BEQ bra7_882E
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	RTS
bra7_882E:
	LDA playerMoveFlags
	AND #$01
	BNE bra7_8841
	LDA objXDistHi,X
	BMI bra7_884B_RTS
	LDA #$01
	STA playerXMovementLocked
	JMP loc7_884B_RTS
bra7_8841:
	LDA objXDistHi,X
	BPL bra7_884B_RTS
	LDA #$01
	STA playerXMovementLocked
bra7_884B_RTS:
loc7_884B_RTS:
	RTS
ptr5_884C:
	LDA frameCount
	AND #$00
	BNE bra7_8857
	LDA #$26
	JSR getMovementData
bra7_8857:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8873
	CMP #$FF
	BEQ bra7_8873
	JMP objRemoveObject
bra7_8873:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_88B5
	LDA objYDistHi,X
	BPL bra7_88A4
	LDA objYDistLo,X ; logged as data
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_88B5
bra7_88A4:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_88B5:
loc7_88B5:
	LDA freezeFlag
	BEQ bra7_88BB_RTS
	RTS
bra7_88BB_RTS:
	RTS
ptr5_88BC:
	LDA frameCount
	AND #$00
	BNE bra7_88C7
	LDA #$27
	JSR getMovementData
bra7_88C7:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_88E3
	CMP #$FF
	BEQ bra7_88E3
	JMP objRemoveObject
bra7_88E3:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8925
	LDA objYDistHi,X
	BPL bra7_8914
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8925
bra7_8914:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8925:
loc7_8925:
	LDA freezeFlag
	BEQ bra7_892B
	RTS
bra7_892B:
	LDX $A4
	INC objFlags,X
	RTS
ptr5_8931:
	LDA frameCount
	AND #$00
	BNE bra7_893C
	LDA #$27
	JSR getMovementData
bra7_893C:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8958
	CMP #$FF
	BEQ bra7_8958
	JMP objRemoveObject
bra7_8958:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_899A
	LDA objYDistHi,X
	BPL bra7_8989
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_899A
bra7_8989:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_899A:
loc7_899A:
	LDA freezeFlag
	BEQ bra7_89A0
	RTS
bra7_89A0:
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player move upwards
	LDY #$50 ; Set speed to $50
	LDA btnHeld
	AND #BTN_A
	BEQ bra7_89B1 ; If A isn't held, branch and keep the speed
	LDY #$70 ; If it is held, set the speed to $70 instead
bra7_89B1:
	STY playerYSpd
	LDA #$04
	STA playerAction
	LDX $A4
	INC objFlags,X
	LDA #SFX_SWIM
	STA sndSfx ; Play bounce sound
	RTS
ptr5_89C1:
	LDA frameCount
	AND #$00
	BNE bra7_89CC
	LDA #$27
	JSR getMovementData
bra7_89CC:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_89E8
	CMP #$FF
	BEQ bra7_89E8
	JMP objRemoveObject
bra7_89E8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8A2A
	LDA objYDistHi,X
	BPL bra7_8A19
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8A2A
bra7_8A19:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8A2A:
loc7_8A2A:
	LDA freezeFlag
	BEQ bra7_8A30
	RTS
bra7_8A30:
	LDX $A4
	LDA objFlags,X
	AND #$E0
	ORA #$03
	STA objFlags,X
	RTS
