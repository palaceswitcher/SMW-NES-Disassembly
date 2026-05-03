.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xDF
obj0xDF:
	LDX $A4
	JSR sub_8E78
	objDistCalc bra_914D

bra_914D:
	JSR sub_9159
	LDA objFlags,X
	AND #OBJFLAG_HORIZ
	STA objFlags,X
	RTS

sub_9159:
	LDX $A4
	LDA bowserState
	ASL
	TAY
	LDA tbl_916D,Y
	STA $32
	LDA tbl_916D+1,Y
	STA $33
	JMP ($32)
.export tbl_916D
tbl_916D:
	.word ptr7_91DA ; 00 (Move down)
	.word ptr7_91F7
	.word ptr7_9238
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_9336
	.word ptr7_9372
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_94F6
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_955F
	.word ptr7_9271
	.word ptr7_93B9
	.word ptr7_93C9
	.word ptr7_93D9
	.word ptr7_91DA
	.word ptr7_93FD
	.word ptr7_94C7
	.word ptr7_956A
	.word ptr7_9271
	.word ptr7_92B0
	.word ptr7_94C7
	.word ptr7_95D8
	.word ptr7_95E3
	.word ptr7_95E3
	.word ptr7_970C
	.word ptr7_93B9
	.word ptr7_9763
sub_91B5:
	LDA objFlags,X
	AND #$1F
	CMP #$04
	BNE bra_91D9_RTS
	LDA #$06
	STA bowserState
	LDA #$00
	STA bowserStateTimer
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	LDA objXLo,X
	SEC
	SBC #$04
	STA objXLo,X
bra_91D9_RTS:
	RTS

;--------------------
; BOWSER STATE ($91DA)
;--------------------
.export ptr7_91DA
ptr7_91DA:
	LDA #01
	STA $06E3
	LDA #$04
	STA enemyAnimFrame,X
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #112
	BCC bra_91F6_RTS ; Go down for 112 frames
		LDA #$00
		STA bowserStateTimer
		INC bowserState
	bra_91F6_RTS:
		RTS

;--------------------
; BOWSER STATE ($91F7)
;--------------------
.export ptr7_91F7
ptr7_91F7:
	LDA objFrameCount
	AND #$07
	BNE bra_921C_RTS ; Animate every 8 frames
		INC bowserStateTimer
		LDA bowserStateTimer
		TAY
		LDA tbl_9230,Y ; Get sprite for current animation timer
		CMP #$FF
		BEQ bra_921D ; Start moving when Bowser finishes rising from the Clown Car
			STA enemyAnimFrame,X
			LDA objXDistHi,X
			BMI bra_921C_RTS
				LDA enemyAnimFrame,X
				ORA #$40
				STA enemyAnimFrame,X
		bra_921C_RTS:
			RTS
		
		; Start moving
		bra_921D:
			LDA #$00
			STA bowserStateTimer
			INC bowserState
			LDA #$37
			STA $05F2
			LDA #$38
			STA $05F3
			RTS
.export tbl_9230
tbl_9230:
	.byte $04
	.byte $0A
	.byte $09
	.byte $08
	.byte $07
	.byte $06
	.byte $05
	.byte $FF
.export ptr7_9238
ptr7_9238:
	JSR sub_91B5
	LDA $05F2
	ASL
	TAY
	JSR jmp_54_B896
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9260_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9260_RTS:
	RTS
.export tbl_9261
tbl_9261:
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $07
	.byte $06
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
.export ptr7_9271
ptr7_9271:
	LDA objFrameCount
	AND #$07
	BNE bra_9296_RTS
	INC bowserStateTimer
	LDA bowserStateTimer
	TAY
	LDA tbl_92A8,Y
	CMP #$FF
	BEQ bra_9297
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_9296_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_9296_RTS:
	RTS
bra_9297:
	LDA #$00
	STA bowserStateTimer
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	INC bowserState
	RTS
.export tbl_92A8
tbl_92A8:
	.byte $05
	.byte $06
	.byte $07
	.byte $08
	.byte $09
	.byte $0A
	.byte $04
	.byte $FF
.export ptr7_92B0
ptr7_92B0:
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #$01
	BNE bra_9329
	LDY #$FF
bra_92BC:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_92C8
	CMP #$42
	BCC bra_92F8
bra_92C8:
	CPY objCount
	BCC bra_92BC
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	LDA #$00
	STA objFlags,Y
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
bra_92F8:
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
	LDA #$40
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	LDA #$01
	STA objState,Y
	LDA #$3A
	STA objSlot,Y
	RTS
bra_9329:
	CMP #$30
	BCC bra_9335_RTS
	LDA #$00
	STA bowserStateTimer
	INC bowserState
bra_9335_RTS:
	RTS
.export ptr7_9336
ptr7_9336:
	LDA objFrameCount
	AND #$07
	BNE bra_935B_RTS
	INC bowserStateTimer
	LDA bowserStateTimer
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_935C
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_935B_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_935B_RTS:
	RTS
bra_935C:
	LDA #$00
	STA bowserStateTimer
	LDA #$02
	STA bowserState
	LDA $05F3
	EOR #$01
	STA $05F3
	STA $05F2
	RTS
.export ptr7_9372
ptr7_9372:
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #$70
	BNE bra_939B
	LDA #$00
	STA bowserStateTimer
	INC bowserHitCount
	LDY bowserHitCount
	LDA tbl_93AF,Y
	STA bowserState
	CMP #$1F
	BEQ bra_939A_RTS
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
bra_939A_RTS:
	RTS
bra_939B:
	LDY #$0B
	LDA objFrameCount
	AND #$10
	BNE bra_93A5
	INY
bra_93A5:
	TYA
	STA enemyAnimFrame,X
	LDA #$02
	STA clownCarFace
	RTS
.export tbl_93AF
tbl_93AF:
	.byte $00 ; phase if no hits
	.byte $02 ; phase after 1 or 2 hits
	.byte $02
	.byte $07 ; phase after 3 hits
	.byte $0E ; phase after 4 or 5 hits 
	.byte $0E
	.byte $13 ; phase after 6 hits
	.byte $1A ; phase after 7 or 8 hits
	.byte $1A
	.byte $1F
.export ptr7_93B9
ptr7_93B9:
	LDA #$FF
	STA $06E3
	LDA objYLo,X
	CMP #$90
	BNE bra_93C8_RTS
	INC bowserState
bra_93C8_RTS:
	RTS
.export ptr7_93C9
ptr7_93C9:
	LDA #$01
	STA $06E2
	LDA objXLo,X
	CMP #$C0
	BNE bra_93D8_RTS
	INC bowserState
bra_93D8_RTS:
	RTS
.export ptr7_93D9
ptr7_93D9:
	INC bowserState
	LDA #$00
	STA bowserStateTimer

; Explosion smoke
.export obj0xB8
obj0xB8:
	STA objState,X
	STA objStateTimer,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,X
	RTS
.export ptr7_93FD
ptr7_93FD:
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #$08
	BCS bra_9410
	DEC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_9410:
	CMP #$10
	BCS bra_941D
	DEC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_941D:
	CMP #$18
	BCS bra_942A
	DEC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_942A:
	CMP #$70
	BNE bra_9464
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$18
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$BF
	STA objSlot,Y
	LDA #$00
	STA objState,Y
	LDA #$80
	STA objVar,Y
	LDA #$40
	STA objFlags,Y
	RTS
bra_9464:
	CMP #$D0
	BCS bra_9477
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	CLC
	ADC #$51
	STA enemyAnimFrame,X
	RTS
bra_9477:
	CMP #$D8
	BCS bra_9484
	INC objYLo,X
	LDA #$55
	STA enemyAnimFrame,X
	RTS
bra_9484:
	CMP #$E0
	BCS bra_9491
	INC objYLo,X
	LDA #$56
	STA enemyAnimFrame,X
	RTS
bra_9491:
	CMP #$E8
	BCS bra_949E
	INC objYLo,X
	LDA #$57
	STA enemyAnimFrame,X
	RTS
bra_949E:
	INC bowserState
	LDA #$04
	STA enemyAnimFrame,X
	LDA #$00
	STA bowserStateTimer
	STA objState,X
	STA objStateTimer,X
	STA objVar,X
	STA objFlags,X
	STA $06E2
	STA $06E3
	LDA objYLo,X
	SEC
	SBC #$19
	STA objYLo,X
	RTS
.export ptr7_94C7
ptr7_94C7:
	LDA objFrameCount
	AND #$07
	BNE bra_94EC_RTS
	INC bowserStateTimer
	LDA bowserStateTimer
	TAY
	LDA tbl_9230,Y
	CMP #$FF
	BEQ bra_94ED
	STA enemyAnimFrame,X
	LDA objXDistHi,X
	BMI bra_94EC_RTS
	LDA enemyAnimFrame,X
	ORA #$40
	STA enemyAnimFrame,X
bra_94EC_RTS:
	RTS
bra_94ED:
	LDA #$00
	STA bowserStateTimer
	INC bowserState
	RTS
.export ptr7_94F6
ptr7_94F6:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_9506
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_9506:
	LDA frameCount
	AND #$01
	BNE bra_9511
	LDA #$4D
	JSR jmp_54_B11D
bra_9511:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA objXLo,X
	CMP #$40
	BCC bra_955E_RTS
	CMP #$50
	BCC bra_9545
	CMP #$A0
	BCC bra_955E_RTS
	CMP #$B0
	BCS bra_955E_RTS
bra_9545:
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #$50
	BCC bra_955E_RTS
	JSR updateRng
	AND #$03
	BNE bra_955E_RTS
	INC bowserState
	LDA #$00
	STA bowserStateTimer
bra_955E_RTS:
	RTS
.export ptr7_955F
ptr7_955F:
	LDA #$0E
	STA bowserState
	LDA #$00
	STA bowserStateTimer
	RTS
.export ptr7_956A
ptr7_956A:
	JSR sub_91B5
	JSR sub3_B057
	BEQ bra_957A
	LDA objFlags,X
	EOR #$40
	STA objFlags,X
bra_957A:
	LDA frameCount
	AND #$01
	BNE bra_9585
	LDA #$4E
	JSR jmp_54_B11D
bra_9585:
	LDA objFrameCount
	AND #$F0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA tbl_9261,Y
	STA enemyAnimFrame,X
	LDA objFlags,X
	AND #$40
	STA $25
	LDA enemyAnimFrame,X
	AND #$BF
	ORA $25
	STA enemyAnimFrame,X
	LDA #$03
	STA clownCarFace
	LDA objXLo,X
	CMP #$40
	BCC bra_95D7_RTS
	CMP #$50
	BCC bra_95BE
	CMP #$A0
	BCC bra_95D7_RTS
	CMP #$B0
	BCS bra_95D7_RTS
bra_95BE:
	INC bowserStateTimer
	LDA bowserStateTimer
	CMP #$50
	BCC bra_95D7_RTS
	JSR updateRng
	AND #$03
	BNE bra_95D7_RTS
	INC bowserState
	LDA #$00
	STA bowserStateTimer
bra_95D7_RTS:
	RTS
.export ptr7_95D8
ptr7_95D8:
	LDA #$1A
	STA bowserState
	LDA #$00
	STA bowserStateTimer
	RTS
.export ptr7_95E3
ptr7_95E3:
	LDA #$02
	STA clownCarFace
	LDA bowserStateTimer
	BNE bra_9612
	INC bowserStateTimer
	LDA #$18
	STA enemyAnimFrame,X
	LDY #$FF
bra_95F7:
	INY
	LDA objSlot,Y
	CMP #$3A
	BCC bra_960D
	CMP #$42
	BCS bra_960D
	LDA #playerXLoDup
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
bra_960D:
	CPY objCount
	BCC bra_95F7
	RTS
bra_9612:
	CMP #$01
	BEQ bra_9619
	JMP loc_970B_RTS
bra_9619:
	LDA #$10
	STA sndSfx
	INC bowserStateTimer
	LDY objCount
	INC objCount
	INC objCount
	INC objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$00
	STA objVar,Y
	LDA #$BC
	STA objSlot,Y
	LDA #$C4
	STA enemyAnimFrame,Y
	LDA #$00
	STA objState,Y
	STA objFlags,Y
	LDA objXLo,X
	STA objXLo+1,Y
	LDA objXHi,X
	STA objXHi+1,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+1,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+1,Y
	LDA #$00
	STA objVar+1,Y
	LDA #$BC
	STA objSlot+1,Y
	LDA #$40
	STA enemyAnimFrame+1,Y
	LDA #$01
	STA objState+1,Y
	LDA #$00
	STA objFlags+1,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+2,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+2,Y
	LDA objYLo,X
	CLC
	ADC #$30
	STA objYLo+2,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+2,Y
	LDA #$00
	STA $057A,Y
	LDA #$BC
	STA objSlot+2,Y
	LDA #$84
	STA enemyAnimFrame+2,Y
	LDA #$02
	STA objState+2,Y
	LDA #$00
	STA objFlags+2,Y
	LDA objXLo,X
	CLC
	ADC #$20
	STA objXLo+3,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi+3,Y
	LDA objYLo,X
	CLC
	ADC #$48
	STA objYLo+3,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi+3,Y
	LDA #$00
	STA objVar+3,Y
	LDA #$BC
	STA objSlot+3,Y
	LDA #$00
	STA enemyAnimFrame+3,Y
	LDA #$03
	STA objState+3,Y
	LDA #$00
	STA objFlags+3,Y
	RTS
loc_970B_RTS:
	RTS
.export ptr7_970C
ptr7_970C:
	LDA bowserStateTimer
	BNE bra_9762_RTS
	INC bowserStateTimer
	LDY objCount
	INC objCount
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$28
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA #$B8
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
	STA objVar,Y
	STA objState,Y
	STA enemyAnimFrame,Y
	LDA #$01
	STA $06E6
	LDY #$41
	LDA objXDistHi,X
	BMI bra_975B
	LDY #$00
bra_975B:
	STY playerMoveFlags
	LDA #MUS_ENDING
	STA sndMusic
	RTS
bra_9762_RTS:
	RTS
.export ptr7_9763
ptr7_9763:
	RTS
