.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x72
obj0x72:
	LDX $A4
	JSR sub6_9BEA
	LDA objSlot,X
	CMP #$72
	BNE bra6_93C8
	LDA objVar,X
	BMI bra6_93CB
bra6_93C8:
	JMP loc6_9488
bra6_93CB:
	LDA objVar,X
	AND #$7F
	STA objVar,X
bra6_93D3:
	JSR updateRng
	AND #$07
	ASL
	CMP $0668
	BEQ bra6_93D3
	STA $0668
	TAY
	LDA tbl6_95CD,Y
	STA enemyAnimFrame,X
bra6_93E8:
	JSR updateRng
	AND #$07
	STA $32
	ASL
	CLC
	ADC $32
	CMP $0667
	BEQ bra6_93E8
	STA $0667
	TAY
	LDX tbl6_95DD,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA objXLo,X
	LDX tbl6_95DD,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA objYLo,X
	LDX tbl6_95DD+1,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA objXLo+1,X
	LDA #$0D
	STA objXHi+1,X
	LDX tbl6_95DD+1,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA objYLo+1,X
	LDA #$01
	STA objYHi+1,X
	LDA #$73
	STA objSlot+1,X
	LDA #$2C
	STA enemyAnimFrame+1,X
	LDX tbl6_95DD+2,Y
	LDA tbl6_95F5,X
	LDX $A4
	STA objXLo+2,X
	LDA #$0D
	STA objXHi+2,X
	LDX tbl6_95DD+2,Y
	LDA tbl6_95FC,X
	LDX $A4
	STA objYLo+2,X
	LDA #$01
	STA objYHi+2,X
	LDA #$75
	STA objSlot+2,X
	LDA #$2C
	STA enemyAnimFrame+2,X
	LDA #$00
	STA objFlags,X
	STA objFlags+1,X
	STA objFlags+2,X
	STA objState,X
	STA objState+1,X
	STA objState+2,X
	STA objStateTimer,X
	STA $0642,X
	STA $0643,X
	INC objCount
	INC objCount
	RTS
loc6_9488:
	JSR sub6_9670
	LDA objState,X
	ASL
	TAY
	LDA tbl6_949D,Y
	STA $32
	LDA tbl6_949D+1,Y
	STA $33
	JMP ($32)
tbl6_949D:
	.word ptr6_94AB
	.word ptr6_94E9
	.word ptr6_9529
	.word ptr6_955B
	.word ptr6_958A
	.word ptr6_9603
	.word ptr6_9632
.export ptr6_94AB
ptr6_94AB:
	LDA objFrameCount
	AND #$03
	BNE bra6_94C1_RTS
	LDA objStateTimer,X
	CMP #$18
	BCC bra6_94C2
	LDA #$00
	STA objStateTimer,X
	INC objState,X
bra6_94C1_RTS:
	RTS
bra6_94C2:
	INC objStateTimer,X
	LDA objSlot,X
	CMP #$72
	BEQ bra6_94E5
	SEC
	SBC #$72
	LSR
	CLC
	ADC $0667
	TAY
	INY
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	SEC
	SBC #$10
	CMP objYLo,X
	BCS bra6_94C1_RTS
bra6_94E5:
	DEC objYLo,X
	RTS
.export ptr6_94E9
ptr6_94E9:
	LDA objFrameCount
	AND #$03
	BNE bra6_94FF_RTS
	LDA objStateTimer,X
	CMP #$18
	BCC bra6_9500
	LDA #$00
	STA objStateTimer,X
	INC objState,X
bra6_94FF_RTS:
	RTS
bra6_9500:
	INC objStateTimer,X
	LDA objSlot,X
	CMP #$72
	BEQ bra6_950E
	LDA #$2C
	BNE bra6_9525
bra6_950E:
	LDY $0668
	CPY #$06
	BCS bra6_951A
	LDA tbl6_95CE,Y
	BNE bra6_9525
bra6_951A:
	LDA objFrameCount
	AND #$08
	BNE bra6_9522
	INY
bra6_9522:
	LDA tbl6_95CD,Y
bra6_9525:
	STA enemyAnimFrame,X
	RTS
.export ptr6_9529
ptr6_9529:
	LDA objFrameCount
	AND #$03
	BNE bra6_953F_RTS
	LDA objStateTimer,X
	CMP #$1C
	BCC bra6_9540
	LDA #$00
	STA objStateTimer,X
	INC objState,X
bra6_953F_RTS:
	RTS
bra6_9540:
	INC objStateTimer,X
	INC objYLo,X
	LDA objSlot,X
	CMP #$72
	BEQ bra6_9551
	LDA #$2C
	BNE bra6_9557
bra6_9551:
	LDY $0668
	LDA tbl6_95CD,Y
bra6_9557:
	STA enemyAnimFrame,X
	RTS
.export ptr6_955B
ptr6_955B:
	LDA objFrameCount
	AND #$03
	BNE bra6_9585_RTS
	LDA objStateTimer,X
	CMP #$18
	BCC bra6_9586
	LDA #$00
	STA objStateTimer,X
	STA objState,X
	LDA objVar,X
	ORA #$80
	STA objVar,X
	LDA objSlot,X
	CMP #$72
	BEQ bra6_9585_RTS
	LDA #$00
	STA objSlot,X
bra6_9585_RTS:
	RTS
bra6_9586:
	INC objStateTimer,X
	RTS
.export ptr6_958A
ptr6_958A:
	LDA objStateTimer,X
	CMP #$30
	BCC bra6_95A6
	LDA #$00
	STA objStateTimer,X
	LDY #$02
	LDA objSlot,X
	CMP #$72
	BNE bra6_95A1
	LDY #$06
bra6_95A1:
	TYA
	STA objState,X
	RTS
bra6_95A6:
	INC objStateTimer,X
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	TAY
	LDA objSlot,X
	CMP #$72
	BNE bra6_95BE
	LDA tbl6_95C5,Y
	BNE bra6_95C1
bra6_95BE:
	LDA tbl6_95C9,Y
bra6_95C1:
	STA enemyAnimFrame,X
	RTS
tbl6_95C5:
	.byte $25
	.byte $26
	.byte $27
	.byte $26
tbl6_95C9:
	.byte $2A
	.byte $2B
	.byte $2A
	.byte $2B
tbl6_95CD:
	.byte $20
tbl6_95CE:
	.byte $21
	.byte $20
	.byte $1F
	.byte $20
	.byte $1F
	.byte $1D
	.byte $1E
	.byte $22
	.byte $23
	.byte $22
	.byte $24
	.byte $27
	.byte $2D
	.byte $32
	.byte $33
tbl6_95DD:
	.byte $02
	.byte $04
	.byte $06
	.byte $01
	.byte $03
	.byte $04
	.byte $06
	.byte $01
	.byte $03
	.byte $00
	.byte $02
	.byte $04
	.byte $05
	.byte $00
	.byte $02
	.byte $04
	.byte $01
	.byte $06
	.byte $06
	.byte $01
	.byte $03
	.byte $02
	.byte $04
	.byte $06
tbl6_95F5:
	.byte $10
	.byte $30
	.byte $50
	.byte $70
	.byte $90
	.byte $B0
	.byte $D0
tbl6_95FC:
	.byte $68
	.byte $78
	.byte $78
	.byte $68
	.byte $58
	.byte $68
	.byte $78
.export ptr6_9603
ptr6_9603:
	LDA objYLo,X
	CMP #$E0
	BCS bra6_9611
	LDA objStateTimer,X
	CMP #$50
	BCC bra6_961A
bra6_9611:
	LDA #$23
	STA sndMusic
	LDA #$09
	STA gameState
	RTS
bra6_961A:
	LDY #$28
	LDA objFrameCount
	AND #$04
	BNE bra6_9624
	INY
bra6_9624:
	TYA
	STA enemyAnimFrame,X
	INC objStateTimer,X
	INC objYLo,X
	INC objYLo,X
	RTS
.export ptr6_9632
ptr6_9632:
	LDA objFrameCount
	AND #$03
	BNE bra6_964A_RTS
	LDA objStateTimer,X
	CMP #$1C
	BCC bra6_964B
	LDA #$00
	STA objStateTimer,X
	LDA #$03
	STA objState,X
bra6_964A_RTS:
	RTS
bra6_964B:
	INC objStateTimer,X
	LDY $0667
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	CLC
	ADC #$04
	CMP objYLo,X
	BCC bra6_9666
	INC objYLo,X
	INC objYLo,X
bra6_9666:
	LDY $0668
	LDA tbl6_95CD,Y
	STA enemyAnimFrame,X
	RTS
sub6_9670:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra6_96DA

bra6_96DA:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_96EE,Y
	STA $32
	LDA tbl6_96EE+1,Y
	STA $33
	JMP ($32)
tbl6_96EE:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_96F8
	.word objFlipKill
.export ptr6_96F8
ptr6_96F8:
	LDA objState,X
	CMP #$02
	BCC bra6_9700
bra6_96FF_RTS:
	RTS
bra6_9700:
	LDA playerXLoDup
	CMP #$28
	BCC bra6_9732
	CMP #$38
	BCC bra6_96FF_RTS
	CMP #$48
	BCC bra6_9732
	CMP #$58
	BCC bra6_96FF_RTS
	CMP #$68
	BCC bra6_9732
	CMP #$78
	BCC bra6_96FF_RTS
	CMP #$88
	BCC bra6_9732
	CMP #$98
	BCC bra6_96FF_RTS
	CMP #$A8
	BCC bra6_9732
	CMP #$B8
	BCC bra6_96FF_RTS
	CMP #$C8
	BCC bra6_9732
	CMP #$D8
	BCC bra6_96FF_RTS
bra6_9732:
	LDA objSlot,X
	SEC
	SBC #$72
	BNE bra6_9740
	LDY $0667
	JMP loc6_9747
bra6_9740:
	LSR
	CLC
	ADC $0667
	TAY
	INY
loc6_9747:
	LDA tbl6_95DD,Y
	TAY
	LDA tbl6_95FC,Y
	SEC
	SBC #$0C
	CMP objYLo,X
	BCC bra6_97A3_RTS
	JSR objCollStompOrHurt
	LDA playerMoveFlags
	AND #$04
	BNE bra6_9763
	LDA playerYSpd
	BNE bra6_9767
bra6_9763:
	JSR jmp_54_BF74
	RTS
bra6_9767:
	LDA invincibilityTimer
	CMP #$F7
	BCS bra6_97A3_RTS ; If the invincibility timer is above this, stop
	LDA #$30
	STA playerYSpd ; Give player vertical height when hitting them
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags ; Make player move upwards
	LDA #$04
	STA playerAction ; Make player jump off
	LDA #SFX_FEATHER
	STA sndSfx ; Play feather/hit sound
	LDY #$04 ; Load "hit" action into Y register
	LDA objSlot,X
	CMP #$72
	BNE bra6_979A
	INC objVar,X ; Add to hit count
	LDA objVar,X
	AND #%01111111 ; Mask out bit 7
	CMP #$03
	BCC bra6_979A ; If Lemmy/Wendy hasn't been hit 3 times, branch
	LDY #$05 ; If they have, load "defeat" action into Y register
	STY reznorsDefeated ; Also store here (why??)
bra6_979A:
	TYA
	STA objState,X ; Trigger loaded action
	LDA #$00
	STA objStateTimer,X ; Clear action timer
bra6_97A3_RTS:
	RTS
