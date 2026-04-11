.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; SUPER KOOPA OBJECT CODE ($8913)
;----------------------------------------
.export obj0x1E
obj0x1E:
	LDX $A4 ; Get index for Super Koopa
	objDistCalc bra8_8979

bra8_8979:
	LDA objVar,X
	CMP #$80
	BNE @objectNotHit ; Branch if Super Koopa is either not in vertical speed mode or doesn't have vertical speed of 0? (Vertical speed is never this low so this should always branch)
	; If Super Koopa has no vertical speed but is in vertical speed mode:
		LDA objYLo,X
		SEC
		SBC #8
		STA objYLo,X
		LDA objYHi,X
		SBC #$00
		STA objYHi,X ; Position the Super Koopa 8 units higher
		JSR objFacePlayer ; Turn object to face the player
		RTS

@objectNotHit:
	LDA objState,X
	BEQ bra8_89CF ; Branch if the Super Koopa is flying forward
	CMP #$02
	BEQ @handleVertSpeed ; Branch if it was killed
; Otherwise, if it was just hit, spawn feather
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y ; Spawn in the same place as the Super Koopa
	LDA #$00
	STA objVar,Y
	STA objFlags,Y
	LDA #OBJ_FEATHER
	STA objSlot,Y ; Spawn feather
	INC objState,X ; Set Super Koopa to "killed" state
	RTS

@handleVertSpeed:
	JSR sub_54_B4FC ; Handle vertical speed when falling off-stage
	RTS

bra8_89CF:
	JSR objGenSuperKoopa
	LDX $A4
	LDA objFlags,X
	AND #%00001111
	CMP #$04
	BNE bra8_89DE ; Stop if Super Koopa was defeated
	RTS
bra8_89DE:
	LDA objSlot,X
	SEC
	SBC #16
	LSR
	CLC
	ADC #16
	STA $25 ; Subtract 7 ignoring the lowest bit to get the movement data??
	LDA frameCount
	AND #$01
	BNE bra8_89F6_RTS ; Continue every even frame
	LDA $25
	JSR jmp_54_B11D
bra8_89F6_RTS:
	RTS

;----------------------------------------
; SUBROUTINE ($89F6)
; Generic code for all Super Koopas
;----------------------------------------
.export objGenSuperKoopa
objGenSuperKoopa:
	LDA #$06
	STA $25 ; Swallow when eaten by Yoshi
	LDX $A4
	objDistCalc superKoopaGetFunction

superKoopaGetFunction:
	LDA objFlags,X
	AND #%00011111
	ASL
	TAY ; Get pointer index
	LDA funcTbl_SuperKoopa,Y
	STA $32
	LDA funcTbl_SuperKoopa+1,Y
	STA $33 ; Get function pointer
	JMP ($32)
funcTbl_SuperKoopa:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word superKoopaHitCheck
	.word objFlipKill

superKoopaHitCheck:
	JSR objCapeHitCheck ; Kill if hit by cape
	JSR objPlayerHitCheck ; Check for collision with player
	JSR objKillOnSpinJump ; Kill if spin-jumped on
	JSR objStompRebound ; Make player bounce if they stomp on it
	LDX $A4 ; Get current object index
	LDY #$01 ; If the code has reached this point, the player must have hit the Super Koopa, so update its state accordingly
	LDA objSlot,X
	CMP #OBJ_SUPERKOOPA_JUMP
	BCC @setobjFlags
		INY ; Skip feather spawning state if this Super Koopa doesn't have a feather

@setobjFlags:
	TYA
	STA objState,X ; Set object's state
	LDA #$81
	STA objVar,X ; Start using motion data as Y speed (high bit set)
	RTS

