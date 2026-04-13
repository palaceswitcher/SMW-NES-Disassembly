.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export objBhvItemBoxYoshi
objBhvItemBoxYoshi:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_83AC
	CMP #$FF
	BEQ bra7_83AC
	JMP objRemoveObject
bra7_83AC:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_83EE
	LDA objYDistHi,X
	BPL bra7_83DD
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_83EE
bra7_83DD:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_83EE:
loc7_83EE:
	JSR jmp_54_BD3D
	LDA playerYoshiState
	BNE bra7_83FB
	LDA yoshiUnmountedState
	BEQ bra7_840B
bra7_83FB:
	LDA #$05
	STA objSlot,X
	LDA #$00
	STA objVar,X
	LDA #$04
	STA objFlags,X
	RTS
bra7_840B:
	LDA frameCount
	AND #$03
	BNE bra7_8416
	LDA #$01
	JSR jmp_54_B11D
bra7_8416:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra7_8432
	CMP #$FF
	BEQ bra7_8432
	JMP objRemoveObject
bra7_8432:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra7_8474
	LDA objYDistHi,X
	BPL bra7_8463
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc7_8474
bra7_8463:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra7_8474:
loc7_8474:
	LDA #$01
	STA freezeFlag
	LDA objVar,X
	AND #$7F
	CMP #playerAnimFrame
	BCC bra7_84C2_RTS
	LDA #$00
	STA objSlot,X
	STA $05F7
	STA $05F6
	STA yoshiIdleMovement
	STA yoshiAnim
	LDA #$01
	STA yoshiUnmountedState
	LDA objXLo,X
	STA yoshiXLo
	LDA objXHi,X
	STA yoshiXHi
	SEC
	LDA objYLo,X
	CMP #$10
	BCS bra7_84B1
	SBC #$20
	JMP loc7_84B3
bra7_84B1:
	SBC #$10
loc7_84B3:
	STA yoshiYLo
	LDA objYHi,X
	SBC #$00
	STA yoshiYHi
	LDA #SFX_YOSHIMOUNT
	STA sndSfx
bra7_84C2_RTS:
	RTS
