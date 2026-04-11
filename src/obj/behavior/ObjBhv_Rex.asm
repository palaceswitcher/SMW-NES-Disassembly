.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; REX OBJECT CODE ($8488)
;----------------------------------------
.export obj0x16
obj0x16:
	LDX $A4 ; Get index for current object
	LDA objVar,X
	BPL rex_Init
		objDistCalc rex_TurnAround
	rex_TurnAround:
		JSR objFacePlayer ; Turn in the direction of the player if upper bit of variable is set? Seems to be unused
		RTS

rex_Init:
	LDA #$06
	STA $25 ; Swallow when eaten
	LDX $A4 ; Get index for object
	objDistCalc rex_GetFunction
rex_GetFunction:
	LDA objFlags,X
	AND #%00011111 ; Mask out upper 3 bits for function number
	ASL
	TAY ; Get function index
	LDA tbl8_8575,Y
	STA $32
	LDA tbl8_8575+1,Y
	STA $33 ; Load function pointer
	JMP ($32)
tbl8_8575:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_857F
	.word objFlipKill

ptr3_857F:
	LDY #$13 ; Use normal Rex movement by default
	LDA objSlot,X
	CMP #OBJ_REX_STOMPED
	BCC bra8_8589 ; Branch if Rex isn't already squished
		INY ; Move faster if Rex is squished

bra8_8589:
	STY $25 ; Store movement data ID
	LDA frameCount
	AND #%00000000
	BNE bra8_8596 ; Get the movement data every frame? (Possibly a bug)
	LDA $25
	JSR getMovementData ; Get movement data for Rex

bra8_8596:
	JSR objCapeHitCheck ; Kill if hit by cape
	JSR objPlayerHitCheck ; Check for collision with player
	JSR objKillOnSpinJump ; Kill if spin-jumped on
	LDA objSlot,X
	LSR ; Ignore lower bit of Rex ID
	CMP #OBJ_REX_STOMPED/2
	BCC bra8_85B5 ; Branch if Rex isn't already squished
	; If Rex was already squished:
		LDA #OBJ_POP
		STA objSlot,X ; Make Rex pop
		LDA #$00
		STA objFlags,X ; Start at default function
		JSR objStompReboundNoSFX ; Make player bounce off the Rex without playing a sound
		RTS

bra8_85B5:
	objVertOffset 16,loc8_85E4 ; Position the squished Rex 16 pixels lower

; Calculate horizontal distance between the squished Rex and player
loc8_85E4:
	objDistCalc bra8_8648

bra8_8648:
	INC objSlot,X
	INC objSlot,X ; Make Rex squished
	LDA #$00
	STA objFlags,X ; Clear object's state
	JSR objStompRebound ; Make player bounce off the Rex
	RTS