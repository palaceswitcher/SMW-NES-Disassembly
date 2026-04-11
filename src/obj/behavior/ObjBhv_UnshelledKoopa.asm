.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x12
obj0x12:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_9684
	CMP #$FF
	BEQ bra8_9684
	JMP objRemoveObject
bra8_9684:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc8_96C6
	LDA objYDistHi,X
	BPL bra8_96B5
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_96C6
bra8_96B5:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc8_96C6:
	LDA freezeFlag
	BEQ bra8_96CC
	RTS
bra8_96CC:
	LDA objVar,X
	CMP #$F0
	BEQ bra8_96D6
	JMP loc8_975A
bra8_96D6:
	JSR objFacePlayer
	LDA #$00
	STA enemyAnimFrame,X
	RTS

.export obj0x6E
obj0x6E:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_96FD
	CMP #$FF
	BEQ bra8_96FD
	JMP objRemoveObject
bra8_96FD:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc8_973F
	LDA objYDistHi,X
	BPL bra8_972E
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_973F ; unlogged
bra8_972E:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc8_973F:
	LDA freezeFlag
	BEQ bra8_9745
	RTS ; unlogged
bra8_9745:
	LDA objVar,X
	CMP #$F0
	BNE loc8_975A
	LDA #$40
	STA objFlags,X
	LDA #$00
	STA enemyAnimFrame,X
	STA objVar,X
	RTS

loc8_975A:
	JSR sub8_97B6
	LDX $A4
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BCC bra8_9769
	RTS
bra8_9769:
	JSR sub8_9856

loc8_976C:
	LDA objVar,X
	BPL bra8_979C
	AND #$7F
	CMP #$20
	BCC bra8_977D
	LDA #$00
	STA objVar,X
	RTS
bra8_977D:
	LDA #$08
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BEQ bra8_978B
	INC objVar,X
bra8_978B:
	LDA frameCount
	AND #$00
	BNE bra8_9796
	LDA #$23
	JSR getMovementData
bra8_9796:
	LDA #$02
	STA enemyAnimFrame,X
	RTS
bra8_979C:
	LDA frameCount
	AND #$01
	BNE bra8_97A7
	LDA #$11
	JSR getMovementData
bra8_97A7:
	LDY #$00
	LDA objFrameCount
	AND #$08
	BEQ bra8_97B1
	INY
bra8_97B1:
	TYA
	STA enemyAnimFrame,X
	RTS
sub8_97B6:
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
	BEQ bra8_97D8
	CMP #$FF
	BEQ bra8_97D8
	JMP objRemoveObject ; unlogged
bra8_97D8:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc8_981A
	LDA objYDistHi,X
	BPL bra8_9809
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_981A
bra8_9809:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc8_981A:
	LDA freezeFlag
	BEQ bra8_9820
	RTS ; unlogged
bra8_9820:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9834,Y
	STA $32
	LDA tbl8_9834+1,Y
	STA $33
	JMP ($32)
tbl8_9834:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_983E
	.word objFlipKill
ptr3_983E:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objStompReboundNoSFX
	LDA #$04
	STA playerAction
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	RTS
sub8_9856:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra8_9871
	LDA objState,X
	BEQ bra8_9870_RTS
	LDA #$00
	STA objState,X
	LDA #$80
	STA objVar,X
bra8_9870_RTS:
	RTS
bra8_9871:
	CMP #$03
	BNE bra8_9870_RTS
	LDA frameCount
	AND #$00
	BNE bra8_9880
	LDA #$3D
	JSR parseMovementData
bra8_9880:
	LDA #$02
	STA enemyAnimFrame,X
	LDA #$01
	STA objState,X
	PLA
	PLA
	RTS

.export obj0x7A
obj0x7A:
	LDX $A4
	objDistCalc bra8_98F3

bra8_98F3:
	LDA objVar,X
	CMP #$F0
	BNE bra8_9908
	LDA #$40
	STA objFlags,X
	LDA #$00
	STA enemyAnimFrame,X
	STA objVar,X
	RTS
bra8_9908:
	JSR sub8_97B6
	LDX $A4
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BCC bra8_9917
	RTS
bra8_9917:
	LDA objState,X
	BNE bra8_9940
	LDA frameCount
	AND #$00
	BNE bra8_9927
	LDA #$3E
	JSR parseMovementData
bra8_9927:
	LDA #$02
	STA enemyAnimFrame,X
	LDA objVar,X
	AND #$7F
	CMP #$2A
	BCC bra8_993F_RTS
	LDA #$80
	STA objVar,X
	LDA #$01
	STA objState,X
bra8_993F_RTS:
	RTS
bra8_9940:
	JMP loc8_976C
