.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; KOOPA OBJECT CODE ($8000)
;----------------------------------------
.export objKoopa
objKoopa:
	LDX $A4 ; Get index of current object
	objDistCalc bra8_8066

; Animate the Koopa
bra8_8066:
	JSR objGenKoopa
	LDY #$03
	LDA objFrameCount
	AND #$08
	BEQ @continue ; Alternate between Koopa frames 3 and 4 every 8 frames
		INY

@continue:
	TYA
	STA enemyAnimFrame,X ; Set animation frame
	LDA objSlot,X
	CMP #$36
	BCC getRedKoopaMovementData ; Run different code if Koopa isn't green (walks off ledges)
	; This seems redundant as the green Koopa has it's own code
		LDA frameCount
		AND #$01
		BNE @stop ; Only continue every even frame
			LDA #$10
			JSR getMovementData ; Get movement data for Koopa
	@stop:
		RTS

getRedKoopaMovementData:
	LDA frameCount
	AND #$01
	BNE @stop ; Only continue every even frame
		LDA #$10
		JSR sub_54_B3B4 ; Load movement data for Koopa
@stop:
	RTS

;----------------------------------------
; SUBROUTINE ($8096)
; Generic code for all Koopas, used only by the red Koopa
;----------------------------------------
.export objGenKoopa
objGenKoopa:
	LDA #$04
	STA $25 ; Spit fire when eaten
	LDX $A4 ; Get index of current object
	objDistCalc koopaGetFunction ; Only continue if the game isn't frozen

koopaGetFunction:
	LDA objFlags,X
	AND #%00011111 ; Mask out upper 3 bits of object's state
	ASL
	TAY ; Get pointer index
	LDA koopaFuncTbl,Y
	STA $32
	LDA koopaFuncTbl+1,Y
	STA $33 ; Get function pointer
	JMP ($32)
koopaFuncTbl:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word koopaHitCheck
	.word koopaHitRespond

koopaHitCheck:
	JSR objCapeHitCheck ; Kill if hit by cape
	JSR objPlayerHitCheck ; Check for collision with player
	JSR objKillOnSpinJump ; Kill if spin-jumped on
	JSR objStompRebound ; Make player bounce if they stomp on it
	objVertOffset 16, loc8_8159 ; Position the Beach Koopa 16 pixels lower

loc8_8159:
	objDistCalc koopaSpawnBeachKoopa ; Calculate the distance between the Beach Koopa and player

koopaSpawnBeachKoopa:
	LDY objCount ; Set index for the newly-spawned Beach Koopa
	INC objCount ; Add to object slot
	; Copy coordinates to new object
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y
	
	LDA objFlags,X
	AND #%01000000 ; Spawn the Beach Koopa in the same direction
	ORA #%10000000 ; Set bit 7 (unsure of what this does)
	STA objFlags,Y
	LDA #$80
	STA objVar,Y ; Set speed to 128?
	STA objState,Y ; Spawn shell-less koopa sliding
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$12
	STA objSlot,Y ; Spawn the appropriate shell-less Koopa for the Koopa variant(?)
	LDA #OBJ_SHELL
	STA objSlot,X ; Spawn a shell in place of the Koopa
	LDA #$08
	STA objFlags,X ; Make shell bounce off
	RTS

; Spawn a shell in place of the Koopa when hit
koopaHitRespond:
	LDX $A4 ; Get index for previous object?
	LDA #OBJ_SHELL
	STA objSlot,X ; Spawn shell in place of Koopa
	LDA #$00
	STA objVar,X ; Clear speed?
	RTS