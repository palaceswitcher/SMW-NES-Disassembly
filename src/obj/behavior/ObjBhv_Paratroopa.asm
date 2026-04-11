.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; BOUNCING PARATROOPA OBJECT CODE ($8299)
;----------------------------------------
.export obj0x14
obj0x14:
	LDX $A4 ; Get index of current object
	objDistCalc bra8_82FF

bra8_82FF:
	LDA objVar,X
	BPL bra8_8308
	JSR objFacePlayer
	RTS

bra8_8308:
	JSR objGenParatroopa
	LDA frameCount
	AND #$01
	BNE bra8_8316
	LDA #$12
	JSR getMovementData ; Get jump arc

bra8_8316:
	LDY #$05
	LDA objFrameCount
	AND #$08
	BEQ bra8_8320 ; Alternate between Koopa frames 5 and 6 every 8 frames
	INY

bra8_8320:
	TYA
	STA enemyAnimFrame,X ; Set animation frame
	RTS

;----------------------------------------
; HORIZONTAL PARATROOPA OBJECT CODE ($8325)
;----------------------------------------
.export obj0x58
obj0x58:
	LDX $A4 ; Get index of current object
	objDistCalc bra8_838B

bra8_838B:
	LDA objVar,X
	BPL bra8_8394
	JSR objFacePlayer
	RTS
bra8_8394:
	JSR objGenParatroopa
	LDA objSlot,X
	BMI bra8_83B6 ; Branch if paratroopa is vertical
	LDA frameCount
	AND #$03
	BNE bra8_83A7
	LDA #$3A
	JSR jmp_54_B11D ; Use oscillating movement pattern
bra8_83A7:
	LDY #$05
	LDA objFrameCount
	AND #$08
	BEQ bra8_83B1
	INY
bra8_83B1:
	TYA
	STA enemyAnimFrame,X
	RTS
bra8_83B6:
	LDA frameCount
	AND #$03
	BNE bra8_83C1
	LDA #$21
	JSR jmp_54_B11D
bra8_83C1:
	LDY #$05
	LDA objFrameCount
	AND #$08
	BEQ bra8_83CB
	INY
bra8_83CB:
	TYA
	STA enemyAnimFrame,X
	RTS

;----------------------------------------
; SUBROUTINE ($83D0)
; Generic code for all paratroopas
;----------------------------------------
.export objGenParatroopa
objGenParatroopa:
	LDA #$04
	STA $25
	LDX $A4 ; Get index of current object
	objDistCalc paratroopa_GetFunction

paratroopa_GetFunction:
	LDA objFlags,X
	AND #%00011111 ; Mask out upper 3 bits
	ASL
	TAY ; Get index for object's state
	LDA funcTbl_Paratroopa,Y
	STA $32
	LDA funcTbl_Paratroopa+1,Y
	STA $33 ; Load function pointer
	JMP ($32)
funcTbl_Paratroopa:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word paratroopa_HitCheck
	.word paratroopa_HitRespond

paratroopa_HitCheck:
	JSR objPlayerHitCheck ; Check for collision with player
	JSR objKillOnSpinJump ; Kill if spin jumped on
	LDA invincibilityTimer
	CMP #$F7
	BCS @stop ; Only continue if the player's invincibility is about to end
		JSR objStompReboundAlt ; The player must be stomping on it if the code reached this point, so knock them back
		LDX $A4 ; Get current object's slot
		LDA objSlot,X
		AND #$01 ; Get paratroopa's CHR slot
		CLC
		ADC #OBJ_GREENKOOPA
		STA objSlot,X ; Turn into green Koopa with same CHR slot
		LDA #$00
		STA objFlags,X ; Clear state
@stop:
	RTS

; This is only used when the Paratroopa is killed completely
paratroopa_HitRespond:
	LDX $A4 ; Get current object's slot
	LDA #OBJ_SHELL
	STA objSlot,X ; Replace current object with shell
	LDA #$00
	STA objVar,X ; Clear object's variables
	RTS
