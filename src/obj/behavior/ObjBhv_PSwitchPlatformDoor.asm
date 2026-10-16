.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; P-SWITCH OBJECTS CODE ($9164)
;----------------------------------------
.export obj0x66
obj0x66:
	LDX $A4 ; Get object index
	objDistCalc bra5_91CA

bra5_91CA:
	LDA pSwitchTimer
	BNE bra5_91D5 ; Branch if timer is still running
		LDA #0
		STA enemyAnimFrame,X ; Make platform invisible if the P-Switch timer runs out
		RTS

bra5_91D5:
	INC $067C ; Unused timer
	LDA objSlot,X
	CMP #OBJ_PDOOR
	BCS bra5_91F2 ; Branch if object is a P-Door
		LDA #OBJ_PSWITCHPLATFORM+3
		STA enemyAnimFrame,X ; Use turn block platform sprite if this object isn't a P-Door
		LDA #0
		STA $28
		STA $2B ; Don't offset player's position
		LDA #255-53 ; Platform width (53)
		STA $25
		JSR objCollAsPlatform ; Check if player can stand on P-Switch platform
		RTS

;--------------------
; P-DOOR CODE ($91F2)
;--------------------
bra5_91F2:
	LDA #OBJ_PDOOR+2
	STA enemyAnimFrame,X ; Use P-door sprite
	LDA objXDistHi,X
	BPL bra5_9209
	; If player is to the right of the object
		LDA #0
		CLC
		ADC #16 ; Account for width of the object's hitbox
		CLC
		ADC objXDistLo,X
		BCS bra5_9210 ; If player is within the object's hitbox
		BCC bra5_9230 ; Stop if player is outside the object's hitbox

	; If the player is to the left of the object
	bra5_9209:
		LDA objXDistLo,X
		CMP #0
		BCS bra5_9230 ; Stop if the player is outside the object's hitbox

bra5_9210:
	LDA objYDistHi,X
	BEQ bra5_9226
	CMP #-1
	BNE bra5_9230
	; If player is below object's hitbox
		LDA #20
		CLC
		ADC #32
		CLC
		ADC objYDistLo,X
		BCS bra5_922D
		BCC bra5_9230

	; If player is above object's hitbox
	bra5_9226:
		LDA objYDistLo,X
		CMP #0
		BCS bra5_9230

bra5_922D:
	CLC
	BCC bra5_9231 ; Clear carry and allow code below to continue

bra5_9230:
	SEC ; Set carry and skip the below code

bra5_9231:
	BCS bra5_9262_RTS
	LDA playerPrevAction
	CMP #8
	BNE bra5_9262_RTS
	LDA prgDataBank2
	CMP #35
	BEQ bra5_9262_RTS
	LDA playerPrevAction
	CMP #8
	BNE bra5_9262_RTS
	LDA worldNumber
	ASL
	ASL
	CLC
	ADC levelNumber
	ASL
	STA warpLvlNumber
	LDA #3
	STA gameState
	LDA #$7E
	SEC
	SBC #$78
	ASL
	ASL
	ASL
	STA warpNumber

bra5_9262_RTS:
	RTS
