.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x4C
obj0x4C:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_9DE5
	CMP #$FF
	BEQ bra7_9DE5
	JMP objRemoveObject
bra7_9DE5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_9E27
	LDA objYDistHi,X
	BPL bra7_9E16
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_9E27
bra7_9E16:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_9E27:
loc7_9E27:
	LDA freezeFlag
	BEQ bra7_9E2D
	RTS
bra7_9E2D:
	LDA objVar,X
	BPL bra7_9E4F
	LDA #$00
	STA objVar,X
	STA objStateTimer,X
	STA objState,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	RTS
bra7_9E4F:
	INC objStateTimer,X
	LDA objStateTimer,X
	CMP #$60
	BCC bra7_9E66
	LDA #$00
	STA objStateTimer,X
	LDA objState,X
	EOR #$01
	STA objState,X
bra7_9E66:
	LDA objState,X
	BNE bra7_9E82
	LDA objYLo,X
	SEC
	SBC #$01
	STA objYLo,X
	BCS bra7_9E98
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
	JMP loc7_9E98
bra7_9E82:
	LDA objYLo,X
	CLC
	ADC #$01
	STA objYLo,X
	CMP #$F0
	BCC bra7_9E98
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
bra7_9E98:
loc7_9E98:
	LDA #$07
	STA $25
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9EB0,Y
	STA $32
	LDA tbl7_9EB0+1,Y
	STA $33
	JMP ($32)
tbl7_9EB0:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_9EB8
ptr5_9EB8:
	LDA objXDistHi,X
	BPL bra7_9EE4_RTS
	LDA #MUS_VICTORY
	STA sndMusic ; Play level complete music
	LDA #$06
	STA gameState ; Trigger goal tape event
	LDA worldNumber
	ASL
	ASL ; Multiply world number by 4
	CLC
	ADC levelNumber ; Add it to the level number to get the level index
	TAY
	LDA curPlayer
	BEQ bra7_9ED9 ; Branch ahead if player one is playing
	TYA
	CLC
	ADC #$1C
	TAY ; If player 2 is playing, use their checkpoint index instead
bra7_9ED9:
	LDA #$00
	STA checkpointFlag,Y
	STA invincibilityTimer
	STA playerPowerupBuffer ; Clear the player's checkpoint, invincibility, and any powerup buffering
bra7_9EE4_RTS:
	RTS
