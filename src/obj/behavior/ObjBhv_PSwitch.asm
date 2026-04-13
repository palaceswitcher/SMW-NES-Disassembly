.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export objPSwitch
objPSwitch:
	LDA #$02
	STA $25 ; Configure this to stay in Yoshi's mouth when eaten 
	LDX $A4 ; Get the index for the object's slot
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X ; Calculate the x distance from the player
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Calculate the x screen distance from the player
	STA $28
	BEQ bra7_854E ; Branch if the player and the object are on the same screen
	CMP #$FF ; If not, check if the object is one screen behind the player
	BEQ bra7_854E ; If so, branch
	JMP objRemoveObject ; Otherwise, jump
bra7_854E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8590
	LDA objYDistHi,X
	BPL bra7_857F
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8590
bra7_857F:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8590:
	LDA freezeFlag
	BEQ bra7_8596 ; Branch if the game isn't freezed
	RTS ; Otherwise, stop
bra7_8596:
	LDA objFlags,X
	AND #$1F ; Mask out lower 5 bits
	ASL
	TAY ; Get pointer index for status
	LDA tbl7_85AA,Y
	STA $32
	LDA tbl7_85AA+1,Y
	STA $33 ; Load pointer into memory
	JMP ($32) ; Jump to pointer
tbl7_85AA:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word ptr_AB5D
	.word ptr5_85B8
	.word ptr_AE17
	.word ptr5_8689
	.word ptr5_8695
ptr5_85B8:
	JSR positionCarriedObject
	LDA frameCount
	AND #$00
	BNE bra7_85C6
	LDA #$27
	JSR getMovementData
bra7_85C6:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_85E2
	CMP #$FF
	BEQ bra7_85E2
	JMP objRemoveObject
bra7_85E2:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc7_8624
	LDA objYDistHi,X
	BPL bra7_8613
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8624
bra7_8613:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc7_8624:
	LDA freezeFlag
	BEQ bra7_862A
	RTS
bra7_862A:
	JSR objCapeHitCheck
	JSR jmp_54_A773
	JSR setObjectCarryState
	LDA playerYSpd
	BEQ bra7_8653
	LDA playerMoveFlags
	AND #$04
	BNE bra7_8652_RTS
	LDA #$01
	STA $0633
	LDA #$1E
	STA pSwitchTimer
	LDA #$0F
	STA sndSfx
	LDA #$00
	LDX $A4
	STA objSlot,X
bra7_8652_RTS:
	RTS
bra7_8653:
	LDA playerYoshiState
	BEQ bra7_866B
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA #$04
	STA playerAction
	LDA #$03
	STA sndSfx
	RTS
bra7_866B:
	LDA playerMoveFlags
	AND #$01
	BNE bra7_867E
	LDA objXDistHi,X
	BMI loc7_8688_RTS
	LDA #$01
	STA playerXMovementLocked
	JMP loc7_8688_RTS
bra7_867E:
	LDA objXDistHi,X
	BPL loc7_8688_RTS
	LDA #$01
	STA playerXMovementLocked
loc7_8688_RTS:
	RTS
ptr5_8689:
	LDA frameCount
	AND #$00
	BNE bra7_8694_RTS
	LDA #$26
	JSR getMovementData
bra7_8694_RTS:
	RTS
