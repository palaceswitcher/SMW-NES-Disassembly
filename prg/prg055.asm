;----------------------------------------
; KOOPA OBJECT CODE ($8000)
;----------------------------------------
Obj_Koopa:
	LDX $A4 ; Get index of current object
	Obj_DistCalc bra8_8066

; Animate the Koopa
bra8_8066:
	JSR GenObj_Koopa
	LDY #$03
	LDA objFrameCount
	AND #$08
	BEQ @Continue ; Alternate between Koopa frames 3 and 4 every 8 frames
		INY

@Continue:
	TYA
	STA enemyAnimFrame,X ; Set animation frame
	LDA objSlot,X
	CMP #$36
	BCC GetRedKoopaMovementData ; Run different code if Koopa isn't green (walks off ledges)
	; This seems redundant as the green Koopa has it's own code
		LDA frameCount
		AND #$01
		BNE @Stop ; Only continue every even frame
			LDA #$10
			JSR GetMovementData ; Get movement data for Koopa
	@Stop:
		RTS

GetRedKoopaMovementData:
	LDA frameCount
	AND #$01
	BNE @Stop ; Only continue every even frame
		LDA #$10
		JSR sub_54_B3B4 ; Load movement data for Koopa
@Stop:
	RTS

;----------------------------------------
; SUBROUTINE ($8096)
; Generic code for all Koopas, used only by the red Koopa
;----------------------------------------
GenObj_Koopa:
	LDA #$04
	STA $25 ; Spit fire when eaten
	LDX $A4 ; Get index of current object
	Obj_DistCalc Koopa_GetFunction ; Only continue if the game isn't frozen

Koopa_GetFunction:
	LDA objState,X
	AND #%00011111 ; Mask out upper 3 bits of object's state
	ASL
	TAY ; Get pointer index
	LDA FuncTbl_Koopa,Y
	STA $32
	LDA FuncTbl_Koopa+1,Y
	STA $33 ; Get function pointer
	JMP ($32)
FuncTbl_Koopa:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw Koopa_HitCheck
	dw Koopa_HitRespond

Koopa_HitCheck:
	JSR Obj_CapeHitCheck ; Kill if hit by cape
	JSR Obj_PlayerHitCheck ; Check for collision with player
	JSR Obj_KillOnSpinJump ; Kill if spin-jumped on
	JSR Obj_StompRebound ; Make player bounce if they stomp on it
	Obj_VertOffset 16, loc8_8159 ; Position the Beach Koopa 16 pixels lower

loc8_8159:
	Obj_DistCalc Koopa_SpawnBeachKoopa ; Calculate the distance between the Beach Koopa and player

Koopa_SpawnBeachKoopa:
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
	
	LDA objState,X
	AND #%01000000 ; Spawn the Beach Koopa in the same direction
	ORA #%10000000 ; Set bit 7 (unsure of what this does)
	STA objState,Y
	LDA #$80
	STA objVar,Y ; Set speed to 128?
	STA objAction,Y ; Spawn shell-less koopa sliding
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$12
	STA objSlot,Y ; Spawn the appropriate shell-less Koopa for the Koopa variant(?)
	LDA #objID_Shell
	STA objSlot,X ; Spawn a shell in place of the Koopa
	LDA #$08
	STA objState,X ; Make shell bounce off
	RTS

; Spawn a shell in place of the Koopa when hit
Koopa_HitRespond:
	LDX $A4 ; Get index for previous object?
	LDA #objID_Shell
	STA objSlot,X ; Spawn shell in place of Koopa
	LDA #$00
	STA objVar,X ; Clear speed?
	RTS

;----------------------------------------
; KOOPA GRAPHICAL CODE ($820E)
; Used by every Koopa variant
;----------------------------------------
ptr6_820E:
	LDX $A4 ; Get current object index
	LDA enemyAnimFrame,X
	ASL
	TAX ; Get index for current frame
	LDA SprMapTbl_Koopa,X
	STA $32
	LDA SprMapTbl_Koopa+1,X
	STA $33 ; Load mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ @Continue
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

@Continue:
	STY $36 ; Set bank number
	LDA objState,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_52_A118 ; Render mapping data
	RTS

SprMapTbl_Koopa:
	dw SprMap_BeachKoopaWalk1
	dw SprMap_BeachKoopaWalk2
	dw SprMap_BeachKoopaSlide
	dw SprMap_KoopaWalk1
	dw SprMap_KoopaWalk2
	dw SprMap_ParatroopaWalk1
	dw SprMap_ParatroopaWalk2
SprMap_BeachKoopaWalk1:
	db $02
	db $02
	db $94
	db $01, $02
	db $06, $07
SprMap_BeachKoopaWalk2:
	db $02
	db $02
	db $94
	db $01, $03
	db $08, $09
SprMap_BeachKoopaSlide:
	db $02
	db $02
	db $94
	db $04, $05
	db $0A, $0B
SprMap_KoopaWalk1:
	db $02
	db $04
	db $94
	db $0E, $0F
	db $18, $19
	db $27, $28
	db $35, $36
SprMap_KoopaWalk2:
	db $02
	db $04
	db $94
	db $10, $11
	db $1A, $1B
	db $29, $2A
	db $37, $38
SprMap_ParatroopaWalk1:
	db $04
	db $04
	db $94
	db $FF, $12, $13, $FF
	db $1C, $1D, $1E, $1F
	db $FF, $2C, $2D, $2E
	db $FF, $39, $3A, $FF
SprMap_ParatroopaWalk2:
	db $04
	db $04
	db $94
	db $FF, $16, $17, $FF
	db $23, $24, $25, $26
	db $31, $32, $33, $34
	db $FF, $3E, $3F, $FF

;----------------------------------------
; BOUNCING PARATROOPA OBJECT CODE ($8299)
;----------------------------------------
Obj_h14:
	LDX $A4 ; Get index of current object
	Obj_DistCalc bra8_82FF

bra8_82FF:
	LDA objVar,X
	BPL bra8_8308
	JSR Obj_FacePlayer
	RTS

bra8_8308:
	JSR GenObj_Paratroopa
	LDA frameCount
	AND #$01
	BNE bra8_8316
	LDA #$12
	JSR GetMovementData ; Get jump arc

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
Obj_h58:
	LDX $A4 ; Get index of current object
	Obj_DistCalc bra8_838B

bra8_838B:
	LDA objVar,X
	BPL bra8_8394
	JSR Obj_FacePlayer
	RTS
bra8_8394:
	JSR GenObj_Paratroopa
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
GenObj_Paratroopa:
	LDA #$04
	STA $25
	LDX $A4 ; Get index of current object
	Obj_DistCalc Paratroopa_GetFunction

Paratroopa_GetFunction:
	LDA objState,X
	AND #%00011111 ; Mask out upper 3 bits
	ASL
	TAY ; Get index for object's state
	LDA FuncTbl_Paratroopa,Y
	STA $32
	LDA FuncTbl_Paratroopa+1,Y
	STA $33 ; Load function pointer
	JMP ($32)
FuncTbl_Paratroopa:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw Paratroopa_HitCheck
	dw Paratroopa_HitRespond

Paratroopa_HitCheck:
	JSR Obj_PlayerHitCheck ; Check for collision with player
	JSR Obj_KillOnSpinJump ; Kill if spin jumped on
	LDA invincibilityTimer
	CMP #$F7
	BCS @Stop ; Only continue if the player's invincibility is about to end
		JSR Obj_StompReboundAlt ; The player must be stomping on it if the code reached this point, so knock them back
		LDX $A4 ; Get current object's slot
		LDA objSlot,X
		AND #$01 ; Get paratroopa's CHR slot
		CLC
		ADC #objID_GreenKoopa
		STA objSlot,X ; Turn into green Koopa with same CHR slot
		LDA #$00
		STA objState,X ; Clear state
@Stop:
	RTS

; This is only used when the Paratroopa is killed completely
Paratroopa_HitRespond:
	LDX $A4 ; Get current object's slot
	LDA #objID_Shell
	STA objSlot,X ; Replace current object with shell
	LDA #$00
	STA objVar,X ; Clear object's variables
	RTS

;----------------------------------------
; REX OBJECT CODE ($8488)
;----------------------------------------
Obj_h16:
	LDX $A4 ; Get index for current object
	LDA objVar,X
	BPL Rex_Init
		Obj_DistCalc Rex_TurnAround
	Rex_TurnAround:
		JSR Obj_FacePlayer ; Turn in the direction of the player if upper bit of variable is set? Seems to be unused
		RTS

Rex_Init:
	LDA #$06
	STA $25 ; Swallow when eaten
	LDX $A4 ; Get index for object
	Obj_DistCalc Rex_GetFunction
Rex_GetFunction:
	LDA objState,X
	AND #%00011111 ; Mask out upper 3 bits for function number
	ASL
	TAY ; Get function index
	LDA tbl8_8575,Y
	STA $32
	LDA tbl8_8575+1,Y
	STA $33 ; Load function pointer
	JMP ($32)
tbl8_8575:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_857F
	dw Obj_FlipKill

ptr3_857F:
	LDY #$13 ; Use normal Rex movement by default
	LDA objSlot,X
	CMP #objID_RexSquashed
	BCC bra8_8589 ; Branch if Rex isn't already squished
		INY ; Move faster if Rex is squished

bra8_8589:
	STY $25 ; Store movement data ID
	LDA frameCount
	AND #%00000000
	BNE bra8_8596 ; Get the movement data every frame? (Possibly a bug)
	LDA $25
	JSR GetMovementData ; Get movement data for Rex

bra8_8596:
	JSR Obj_CapeHitCheck ; Kill if hit by cape
	JSR Obj_PlayerHitCheck ; Check for collision with player
	JSR Obj_KillOnSpinJump ; Kill if spin-jumped on
	LDA objSlot,X
	LSR ; Ignore lower bit of Rex ID
	CMP #objID_RexSquashed/2
	BCC bra8_85B5 ; Branch if Rex isn't already squished
	; If Rex was already squished:
		LDA #objID_Pop
		STA objSlot,X ; Make Rex pop
		LDA #$00
		STA objState,X ; Start at default function
		JSR Obj_StompReboundNoSFX ; Make player bounce off the Rex without playing a sound
		RTS

bra8_85B5:
	Obj_VertOffset 16,loc8_85E4 ; Position the squished Rex 16 pixels lower

; Calculate horizontal distance between the squished Rex and player
loc8_85E4:
	Obj_DistCalc bra8_8648

bra8_8648:
	INC objSlot,X
	INC objSlot,X ; Make Rex squished
	LDA #$00
	STA objState,X ; Clear object's state
	JSR Obj_StompRebound ; Make player bounce off the Rex
	RTS

;----------------------------------------
; REX & SQUISHED REX GRAPHICAL CODE ($8657, $865B)
; Sprite loading code used by both variants of the Rex
;----------------------------------------
ptr6_8657:
	LDY #$00
	BEQ bra8_865F ; Start from frame 0 for normal Rex

ptr6_865B:
	LDX $A4
	LDY #$03 ; Use squished frames for squished Rex

bra8_865F:
	LDA objFrameCount
	AND #$08
	BEQ bra8_8667 ; Alternate between walking sprites every 8 frames
	INY

bra8_8667:
	TYA
	ASL
	TAX ; Get pointer index for current sprite
	LDA SprMapTbl_Rex,X
	STA $32
	LDA SprMapTbl_Rex+1,X
	STA $33 ; Load sprite pointer
	LDY #$80 ; Use bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8681
		LDY #$C0 ; Use bank 3 if lower bit of ID is set

bra8_8681:
	STY $36
	LDA objState,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118
	RTS

SprMapTbl_Rex:
	dw SprMap_Rex_Walk1
	dw SprMap_Rex_Walk2
	dw SprMap_Rex_Flattened ; Unused
	dw SprMap_RexSquished_Walk1
	dw SprMap_RexSquished_Walk2
SprMap_Rex_Walk1:
	db $03
	db $04
	db $95
	db $21, $22, $FF
	db $25, $26, $FF
	db $29, $2A, $2B
	db $33, $34, $35
SprMap_Rex_Walk2:
	db $03
	db $04
	db $95
	db $23, $24, $FF
	db $27, $28, $FF
	db $2C, $2D, $2E
	db $36, $37, $38
SprMap_Rex_Flattened:
	db $02
	db $01
	db $95
	db $39, $3A
SprMap_RexSquished_Walk1:
	db $02
	db $02
	db $95
	db $2F, $30
	db $3B, $3C
SprMap_RexSquished_Walk2:
	db $02
	db $02
	db $95
	db $31, $32
	db $3D, $3E

;----------------------------------------
; PIRANHA PLANT OBJECT CODE ($86CA)
;----------------------------------------
Obj_h1A:
	LDX $A4
	Obj_DistCalc bra8_8730 ; Calculate distance between Piranha Plant and player

bra8_8730:
	LDA objVar,X
	BPL bra8_8776
	LDA #$00
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
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
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,Y
	LDA #$F3
	STA objAction,Y
	RTS
bra8_8776:
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
	BEQ bra8_8798
	CMP #$FF
	BEQ bra8_8798
	JMP Obj_RemoveObject ; unlogged
bra8_8798:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_87DA
	LDA objYDistHi,X
	BPL bra8_87C9
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP bra8_87DA ; unlogged
bra8_87C9:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_87DA:
	LDA freezeFlag
	BEQ bra8_87E0
	RTS
bra8_87E0:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_87F4,Y
	STA $32
	LDA tbl8_87F4+1,Y
	STA $33
	JMP ($32)
tbl8_87F4:
	dw ptr3_87FE
	dw ptr3_880D
	dw ptr3_881C
	dw ptr3_882B
	dw Obj_FlipKill
ptr3_87FE:
	LDA frameCount
	AND #$03
	BNE bra8_8809
	LDA #$15
	JSR jmp_54_B11D ; Use movement data string #$15 (21 in decimal), which is used for the piranha plant
bra8_8809:
	JSR Obj_YoshiTongueCheck ; Handle edibility
	RTS
ptr3_880D:
	LDA frameCount
	AND #$03
	BNE bra8_8818
	LDA #$15
	JSR jmp_54_B11D
bra8_8818:
	JSR ptr_AA7B
	RTS
ptr3_881C:
	LDA frameCount
	AND #$03
	BNE bra8_8827
	LDA #$15
	JSR jmp_54_B11D
bra8_8827:
	JSR Obj_PowerupEatCheck
	RTS
ptr3_882B:
	LDA frameCount
	AND #$03
	BNE bra8_8836
	LDA #$15
	JSR jmp_54_B11D
bra8_8836:
	LDA objVar,X
	CMP #$10
	BCC bra8_884A_RTS
	CMP #$35
	BCS bra8_884A_RTS
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
bra8_884A_RTS:
	RTS
ptr6_884B:
	LDX $A4
	LDA objVar,X
	BPL bra8_8853
	RTS
bra8_8853:
	LDA objFrameCount
	AND #$18
	LSR
	LSR
	LSR
	ASL
	TAX
	LDA tbl8_887F,X
	STA $32
	LDA tbl8_887F+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8874
	LDY #$C0
bra8_8874:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_887F:
	dw JumpPiranha1
	dw JumpPiranha2
	dw JumpPiranha3
	dw JumpPiranha4
JumpPiranha1:
	db $02
	db $03
	db $97
	db $0D
	db $0E
	db $11
	db $12
	db $15
	db $16
JumpPiranha2:
	db $02
	db $03
	db $97
	db $0F
	db $10
	db $13
	db $14
	db $17
	db $18
JumpPiranha3:
	db $02
	db $03
	db $97
	db $0D
	db $0E
	db $11
	db $12
	db $19
	db $1A
JumpPiranha4:
	db $02
	db $03
	db $97
	db $0F
	db $10
	db $13
	db $14
	db $19
	db $1B

;----------------------------------------
; PIRANHA PLANT MASK OBJECT CODE ($88AB)
;----------------------------------------
Obj_h1C:
	LDX $A4
	Obj_DistCalc bra8_8911_RTS

bra8_8911_RTS:
	; This object has no behavior
	RTS
ptr6_8912:
	; Unimplemented or empty function
	RTS



;----------------------------------------
; SUPER KOOPA W/ FEATHER OBJECT CODE ($8913)
;----------------------------------------
Obj_h1E:
	LDX $A4 ; Get index for Super Koopa
	Obj_DistCalc bra8_8979

bra8_8979:
	LDA objVar,X
	CMP #$80
	BNE @ObjectNotHit ; Branch if Super Koopa is either not in vertical speed mode or doesn't have vertical speed of 0? (Vertical speed is never this low so this should always branch)
	; If Super Koopa has no vertical speed but is in vertical speed mode:
		LDA objYLo,X
		SEC
		SBC #8
		STA objYLo,X
		LDA objYHi,X
		SBC #$00
		STA objYHi,X ; Position the Super Koopa 8 units higher
		JSR Obj_FacePlayer ; Turn object to face the player
		RTS

@ObjectNotHit:
	LDA objAction,X
	BEQ bra8_89CF ; Branch if the Super Koopa is flying forward
	CMP #$02
	BEQ @HandleVertSpeed ; Branch if it was killed
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
	STA objState,Y
	LDA #objID_Feather
	STA objSlot,Y ; Spawn feather
	INC objAction,X ; Set Super Koopa to "killed" state
	RTS

@HandleVertSpeed:
	JSR sub_54_B4FC ; Handle vertical speed when falling off-stage
	RTS

bra8_89CF:
	JSR GenObj_SuperKoopa
	LDX $A4
	LDA objState,X
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
GenObj_SuperKoopa:
	LDA #$06
	STA $25 ; Swallow when eaten by Yoshi
	LDX $A4
	Obj_DistCalc SuperKoopa_GetFunction

SuperKoopa_GetFunction:
	LDA objState,X
	AND #%00011111
	ASL
	TAY ; Get pointer index
	LDA FuncTbl_SuperKoopa,Y
	STA $32
	LDA FuncTbl_SuperKoopa+1,Y
	STA $33 ; Get function pointer
	JMP ($32)
FuncTbl_SuperKoopa:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw SuperKoopa_HitCheck
	dw Obj_FlipKill

SuperKoopa_HitCheck:
	JSR Obj_CapeHitCheck ; Kill if hit by cape
	JSR Obj_PlayerHitCheck ; Check for collision with player
	JSR Obj_KillOnSpinJump ; Kill if spin-jumped on
	JSR Obj_StompRebound ; Make player bounce if they stomp on it
	LDX $A4 ; Get current object index
	LDY #$01 ; If the code has reached this point, the player must have hit the Super Koopa, so update its state accordingly
	LDA objSlot,X
	CMP #objID_SuperKoopaJump
	BCC @SetobjState
		INY ; Skip feather spawning state if this Super Koopa doesn't have a feather

@SetobjState:
	TYA
	STA objAction,X ; Set object's state
	LDA #$81
	STA objVar,X ; Start using motion data as Y speed (high bit set)
	RTS

;----------------------------------------
; SUPER KOOPA GRAPHICAL CODE ($8AA0)
; Used by every Super Koopa variant
;----------------------------------------
ptr6_8AA0:
	LDX $A4 ; Get index for current object
	LDA objVar,X
	BPL bra8_8AAB ; Branch if object isn't using it's variable for speed (during defeat)
	LDY #$0C ; Use defeated frame
	BNE bra8_8AC9 ; Render sprite
bra8_8AAB:
	AND #%01111111 ; Ignore high byte of variable
	TAY ; Get index for current animation
	LDA SuperKoopa_AnimStartFrames,Y
	TAY ; Get animation starting frame
	LDA objSlot,X
	CMP #objID_SuperKoopaJump
	BCC bra8_8AC1 ; Use flashing animation if this is the feather variant
		CMP #objID_SuperKoopaAlt
		BCC bra8_8ABF ; Branch if Super Koopa is a non-feather variant
			LDY #$08 ; Set takeoff starting frame for feather variants
	bra8_8ABF:
		INY
		INY ; Use starting frame for non-feather variants

bra8_8AC1:
	LDA objFrameCount
	AND #$04
	BNE bra8_8AC9
		INY ; Alternate between frames every 4 frames

bra8_8AC9:
	TYA
	ASL
	TAX ; Get pointer index for frame
	LDA SprMapTbl_SuperKoopa,X
	STA $32
	LDA SprMapTbl_SuperKoopa+1,X
	STA $33 ; Load sprite mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8AE3
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

bra8_8AE3:
	STY $36 ; Set bank number
	LDA objState,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118 ; Render mapping data
	RTS

; Animation starting frame for each motion vector
SuperKoopa_AnimStartFrames:
	db $00
	db $00
	db $00
	db $00
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $04
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08
	db $08

SprMapTbl_SuperKoopa:
	dw SprMap_SuperKoopa_Walk1		; Walking animation (Feather)
	dw SprMap_SuperKoopa_Walk2		; 
	dw SprMap_SuperKoopa_Walk1		; Walking animation (Normal)
	dw SprMap_SuperKoopa_Walk2		; 

	dw SprMap_SuperKoopa_Takeoff2	; Takeoff animation (Feather)
	dw SprMap_SuperKoopaRed_Takeoff	; 
	dw SprMap_SuperKoopa_Takeoff2	; Takeoff animation (Normal)
	dw SprMap_SuperKoopa_Takeoff1	; 

	dw SprMap_SuperKoopa_Fly2		; Fly animation (Feather)
	dw SprMap_SuperKoopaRed_Fly		; 
	dw SprMap_SuperKoopa_Fly2		; Fly animation (Normal)
	dw SprMap_SuperKoopa_Fly1		; 

	dw SprMap_SuperKoopa_Defeated
SprMap_SuperKoopa_Walk1:
	db $03
	db $03
	db $96
	db $FF, $FF, $FF
	db $06, $1A, $1B
	db $21, $22, $23
SprMap_SuperKoopa_Walk2:
	db $03
	db $03
	db $96
	db $FF, $FF, $FF
	db $1C, $1D, $1E
	db $24, $25, $23
SprMap_SuperKoopa_Takeoff1:
	db $03
	db $03
	db $96
	db $FF, $01, $02
	db $06, $07, $08
	db $10, $11, $FF
SprMap_SuperKoopa_Takeoff2:
	db $03
	db $03
	db $96
	db $03, $04, $05
	db $09, $0A, $0B
	db $12, $13, $FF
SprMap_SuperKoopa_Fly1:
	db $03
	db $03
	db $96
	db $FF, $FF, $FF
	db $06, $0C, $0D
	db $14, $15, $16
SprMap_SuperKoopa_Fly2:
	db $03
	db $03
	db $96
	db $FF, $FF, $FF
	db $06, $0E, $0F
	db $14, $17, $18
SprMap_SuperKoopaRed_Takeoff:
	db $03
	db $03
	db $96
	db $FF, $01, $3A
	db $06, $38, $39
	db $10, $11, $FF
SprMap_SuperKoopaRed_Fly:
	db $03
	db $03
	db $96
	db $FF, $FF, $FF
	db $06, $3B, $3C
	db $14, $3D, $3E
SprMap_SuperKoopa_Defeated:
	db $03
	db $03
	db $96
	db $FF, $19, $FF
	db $1F, $20, $1E
	db $26, $27, $28

Obj_h24:
	LDX objLowerSlot ; Get the index for the current object slot
	LDA objState,X
	CMP #$04
	BCS bra8_8BB3
	LDA objFrameCount
	AND #$07
	BNE bra8_8BB3 ; Increment the object's timer every 8th frame
	LDA objVar,X
	CMP #$1F
	BCC bra8_8BA9
	LDA #$00
	STA objVar,X ; Clear the lotus timer if it goes above #$1F
	BEQ bra8_8BB3
bra8_8BA9:
	CMP #$04
	BNE bra8_8BB0 ; Continue each time the timer is at 4. 8 frames x 32 ticks = 256 frames (~4s NTSC)
	JSR SpawnLotusPollen ; Spawns 4 seeds when the timer is at 4
bra8_8BB0:
	INC objVar,X ; Increments lotus timer
bra8_8BB3:
	LDA #$06
	STA $25
	LDX objLowerSlot
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X ; Calculate x distance from player
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Calculate x screen distance from player
	STA $28
	BEQ bra8_8BD5
	CMP #$FF
	BEQ bra8_8BD5
	JMP Obj_RemoveObject
bra8_8BD5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_8C17
	LDA objYDistHi,X
	BPL bra8_8C06
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_8C17 ; unlogged
bra8_8C06:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_8C17:
loc8_8C17:
	LDA freezeFlag
	BEQ bra8_8C1D
	RTS ; unlogged
bra8_8C1D:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8C31,Y
	STA $32
	LDA tbl8_8C31+1,Y
	STA $33
	JMP ($32)
tbl8_8C31:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_8C3B
	dw ptr3_8C48
ptr3_8C3B:
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR Obj_KillOnSpinJump
	JSR jmp_54_BF74
	RTS
ptr3_8C48:
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objState,X
	RTS
;-----
	
SpawnLotusPollen:
	LDY objCount ; Load index for starting pollen slot
	INC objCount
	INC objCount
	INC objCount
	INC objCount ; Update the object count
	LDA objXLo,X
	CLC
	ADC #$0C
	STA objXLo,Y
	STA objXLo+1,Y
	STA objXLo+2,Y
	STA objXLo+3,Y ; Spawn the pollen pellets 12 x pixels from the base of the lotus
	LDA objXHi,X
	STA objXHi,Y 
	STA objXHi+1,Y
	STA objXHi+2,Y
	STA objXHi+3,Y ; Spawn them on the same screen as the lotus
	LDA objYLo,X
	STA objYLo,Y
	STA objYLo+1,Y
	STA objYLo+2,Y
	STA objYLo+3,Y ; Spawn them on the same y position as the lotus
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	STA objYHi+2,Y
	STA objYHi+3,Y ; Spawn them on the same y screen as the lotus
	
; This piece of code moves two object IDs up by two starting form 24, which spawns in each pollen pellet in order
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,Y
	CLC
	ADC #$02
	STA objSlot+1,Y
	CLC
	ADC #$02
	STA objSlot+2,Y
	CLC
	ADC #$02
	STA objSlot+3,Y
;-----
; Initialize the pellet variables
	LDA #$00
	STA objState,Y
	STA objState+1,Y
	STA objState+2,Y
	STA objState+3,Y
	STA objVar,Y
	STA $0579,Y
	STA $057A,Y
	STA $057B,Y
	STA objAction,Y
	STA objAction+1,Y
	STA objAction+2,Y
	STA objAction+3,Y
	RTS
;----- (Stops)

ptr6_8CDE:
	LDX $A4
	LDA objVar,X
	TAY
	LDA tbl8_8D0B,Y
	ASL
	TAX
	LDA tbl8_8D2B,X
	STA $32
	LDA tbl8_8D2B+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8D00
	LDY #$C0
bra8_8D00:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_8D0B:
	db $00
	db $00
	db $00
	db $00
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $02
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $01
	db $00
	db $00
	db $00
	db $00
tbl8_8D2B:
	dw ofs_8D31
	dw ofs_8D3C
	dw ofs_8D47
ofs_8D31:
	db $04
	db $02
	db $97
	db $FF
	db $05
	db $06
	db $FF
	db $09
	db $0A
	db $0B
	db $0C
ofs_8D3C:
	db $04
	db $02
	db $97
	db $FF
	db $03
	db $04
	db $FF
	db $09
	db $0A
	db $0B
	db $0C
ofs_8D47:
	db $04
	db $02
	db $97
	db $FF
	db $01
	db $02
	db $FF
	db $09
	db $0A
	db $0B
	db $0C
;----------------------------------------
; VOLCANO LOTUS UPPER LEFT POLLEN CODE ($8D52)
;----------------------------------------
Obj_h26:
	LDA #$07
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
	BEQ bra8_8D74
	CMP #$FF
	BEQ bra8_8D74
	JMP Obj_RemoveObject
bra8_8D74:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_8DB6
	LDA objYDistHi,X
	BPL bra8_8DA5
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_8DB6 ; unlogged
bra8_8DA5:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_8DB6:
loc8_8DB6:
	LDA freezeFlag
	BEQ bra8_8DBC
	RTS ; unlogged
bra8_8DBC:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8DD0,Y
	STA $32
	LDA tbl8_8DD0+1,Y
	STA $33
	JMP ($32)
tbl8_8DD0:
	dw ptr3_8DDA
	dw ptr3_8DDA
	dw ptr3_8DDA
	dw ptr3_8DDA
	dw ptr3_8E0E
ptr3_8DDA:
	LDA objSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA frameCount
	AND #$03
	BNE bra8_8DF1
	LDA $25
	JSR jmp_54_B470
bra8_8DF1:
	LDA objYLo,X
	CMP #$E0
	BCC bra8_8E04
	LDA #$00
	STA objSlot,X
	STA objState,X
	STA objVar,X
	RTS
bra8_8E04:
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
ptr3_8E0E:
	LDA #$00
	STA objSlot,X
	STA objState,X
	RTS
ptr6_8E17:
	LDY #$00
	LDA objFrameCount
	AND #$04
	BEQ bra8_8E21
	INY
bra8_8E21:
	TYA
	ASL
	TAX
	LDA tbl8_8E46,X
	STA $32
	LDA tbl8_8E46+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8E3B
	LDY #$C0
bra8_8E3B:
	STY $36
	LDA #$00
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_8E46:
	dw LotusPollen1
	dw LotusPollen2
LotusPollen1:
	db $01
	db $01
	db $97
	db $07
LotusPollen2:
	db $01
	db $01
	db $97
	db $08
Obj_h2E:
	LDX $A4
	LDA objVar,X
	BMI bra8_8E5C
	JMP loc8_8EE9
bra8_8E5C:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_8E78
	CMP #$FF
	BEQ bra8_8E78
	JMP Obj_RemoveObject ; unlogged
bra8_8E78:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_8EBA
	LDA objYDistHi,X ; unlogged
	BPL bra8_8EA9 ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_8EBA ; unlogged
bra8_8EA9:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra8_8EBA:
loc8_8EBA:
	LDA freezeFlag
	BEQ bra8_8EC0
	RTS ; unlogged
bra8_8EC0:
	LDA objVar,X
	CMP #$80
	BNE bra8_8ED9
	LDA objXDistLo,X
	BPL bra8_8ED1
	EOR #$FF
	CLC
	ADC #$01
bra8_8ED1:
	CMP #$40
	BCS bra8_8ED8_RTS
	INC objVar,X
bra8_8ED8_RTS:
	RTS
bra8_8ED9:
	CMP #$81
	BNE bra8_8EE5
	LDA #$10
	STA sndSfx
	JSR Obj_FacePlayer
	RTS
bra8_8EE5:
	JSR sub_54_B4FC
	RTS
loc8_8EE9:
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
	BEQ bra8_8F0B
	CMP #$FF
	BEQ bra8_8F0B
	JMP Obj_RemoveObject
bra8_8F0B:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_8F4D
	LDA objYDistHi,X ; unlogged
	BPL bra8_8F3C ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_8F4D ; unlogged
bra8_8F3C:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra8_8F4D:
loc8_8F4D:
	LDA freezeFlag
	BEQ bra8_8F53
	RTS ; unlogged
bra8_8F53:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8F67,Y
	STA $32
	LDA tbl8_8F67+1,Y
	STA $33
	JMP ($32)
tbl8_8F67:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_8F71
	dw Obj_FlipKill
ptr3_8F71:
	LDA frameCount
	AND #$00
	BNE bra8_8F7C
	LDA #$1F
	JSR jmp_54_B11D
bra8_8F7C:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	JSR Obj_StompRebound
	LDX $A4
	LDA #$82
	STA objVar,X
	RTS
ptr6_8F90:
	LDX $A4
	LDA objVar,X
	BPL bra8_8FA1
	LDY #$00
	CMP #$82
	BCC bra8_8FAB
	LDY #$02
	BNE bra8_8FAB
bra8_8FA1:
	LDY #$01
	LDA objFrameCount
	AND #$04
	BEQ bra8_8FAB
	INY
bra8_8FAB:
	TYA
	ASL
	TAX
	LDA tbl8_8FD3,X
	STA $32
	LDA tbl8_8FD3+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8FC5
	LDY #$C0
bra8_8FC5:
	STY $36
	LDA objState,X
	AND #$40
	STA objAttrs
	JSR jmp_54_A118
	RTS
tbl8_8FD3:
	dw Swooper1
	dw Swooper2
	dw Swooper3
Swooper1:
	db $03
	db $02
	db $96
	db $FF
	db $2E
	db $2F
	db $FF
	db $36
	db $37
Swooper2:
	db $03
	db $02
	db $96
	db $FF
	db $29
	db $2A
	db $30
	db $31
	db $32
Swooper3:
	db $03
	db $02
	db $96
	db $2B
	db $2C
	db $2D
	db $33
	db $34
	db $35
Obj_h30:
	LDX $A4
	LDA objVar,X
	BPL bra8_9063
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_9017
	CMP #$FF
	BEQ bra8_9017
	JMP Obj_RemoveObject ; unlogged
bra8_9017:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9059
	LDA objYDistHi,X
	BPL bra8_9048
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_9059
bra8_9048:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_9059:
loc8_9059:
	LDA freezeFlag
	BEQ bra8_905F
	RTS ; unlogged
bra8_905F:
	JSR Obj_FacePlayer
	RTS
bra8_9063:
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
	BEQ bra8_9085
	CMP #$FF
	BEQ bra8_9085
	JMP Obj_RemoveObject
bra8_9085:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_90C7
	LDA objYDistHi,X
	BPL bra8_90B6
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_90C7
bra8_90B6:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_90C7:
loc8_90C7:
	LDA freezeFlag
	BEQ bra8_90CD
	RTS
bra8_90CD:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_90E1,Y
	STA $32
	LDA tbl8_90E1+1,Y
	STA $33
	JMP ($32)
tbl8_90E1:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_90EB
	dw Obj_FlipKill
ptr3_90EB:
	LDA objSlot,X
	AND #$FE
	CMP #$52
	BEQ bra8_910B
	LDA objSlot,X
	SEC
	SBC #$10
	LSR
	CLC
	ADC #$10
	STA $25
	LDA frameCount
	AND #$00
	BNE bra8_910B
	LDA $25
	JSR jmp_54_B11D
bra8_910B:
	JSR Obj_CapeHitCheck
	JSR jmp_54_BC3E
	JSR Obj_KillOnSpinJump
	JSR jmp_54_BF74
	RTS
ptr6_9118:
	LDY #$00
	LDX $A4
	LDA objState,X
	AND #$0F
	CMP #$04
	BNE bra8_912B
	LDY #$02
	LDA #$80
	BNE bra8_9130
bra8_912B:
	LDA objState,X
	AND #$40
bra8_9130:
	STA objAttrs
	LDA objFrameCount
	AND #$04
	BEQ bra8_913B
	INY
bra8_913B:
	TYA
	ASL
	TAX
	LDA tbl8_915B,X
	STA $32
	LDA tbl8_915B+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_9155
	LDY #$C0
bra8_9155:
	STY $36
	JSR jmp_54_A118
	RTS
tbl8_915B:
	dw Blurp1
	dw Blurp2
	dw Blurp3
	dw Blurp4
Blurp1:
	db $02
	db $02
	db $A6
	db $03
	db $04
	db $0D
	db $0E
Blurp2:
	db $02
	db $02
	db $A6
	db $05
	db $06
	db $0F
	db $0E
Blurp3:
	db $02
	db $02
	db $A6
	db $0D
	db $0E
	db $03
	db $04
Blurp4:
	db $02
	db $02
	db $A6
	db $0F
	db $0E
	db $05
	db $06
	LDX $A4
	LDA objVar,X
	BMI bra8_9189
	JMP loc8_9202
bra8_9189:
	LDA objYLo,X
	CLC
	ADC #$08
	STA objYLo,X
	LDA objYHi,X
	ADC #$00
	STA objYHi,X
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_91B6
	CMP #$FF
	BEQ bra8_91B6
	JMP Obj_RemoveObject ; unlogged
bra8_91B6:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_91F8
	LDA objYDistHi,X
	BPL bra8_91E7
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_91F8
bra8_91E7:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_91F8:
loc8_91F8:
	LDA freezeFlag
	BEQ bra8_91FE
	RTS ; unlogged
bra8_91FE:
	JSR Obj_FacePlayer
	RTS
loc8_9202:
	LDA objAction,X
	BNE bra8_920A
	JMP loc8_9287
bra8_920A:
	CMP #$10
	BCC bra8_9214
	LDA #$00
	STA objAction,X
	RTS
bra8_9214:
	INC objAction,X
	LDA frameCount
	AND #$01
	BNE bra8_9222
	LDA #$4B
	JSR GetMovementData
bra8_9222:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_923E
	CMP #$FF
	BEQ bra8_923E
	JMP Obj_RemoveObject ; unlogged
bra8_923E:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9280
	LDA objYDistHi,X ; unlogged
	BPL bra8_926F ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_9280 ; unlogged
bra8_926F:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra8_9280:
loc8_9280:
	LDA freezeFlag
	BEQ bra8_9286_RTS
	RTS ; unlogged
bra8_9286_RTS:
	RTS
loc8_9287:
	LDA #$07
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
	BEQ bra8_92A9
	CMP #$FF
	BEQ bra8_92A9
	JMP Obj_RemoveObject
bra8_92A9:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_92EB
	LDA objYDistHi,X
	BPL bra8_92DA
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_92EB
bra8_92DA:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_92EB:
loc8_92EB:
	LDA freezeFlag
	BEQ bra8_92F1
	RTS
bra8_92F1:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9305,Y
	STA $32
	LDA tbl8_9305+1,Y
	STA $33
	JMP ($32)
tbl8_9305:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_930F
	dw Obj_FlipKill
ptr3_930F:
	LDA frameCount
	AND #$00
	BNE bra8_931A
	LDA #$13
	JSR GetMovementData
bra8_931A:
	JSR Obj_PlayerHitCheck
	JSR Obj_KillOnSpinJump
	JSR Obj_StompRebound
	LDA objVar,X
	AND #$06
	LSR
	TAY
	LDA tbl8_9345,Y
	CLC
	ADC objSlot,X
	STA objSlot,X
	LDA #$00
	STA $0641,X
	STA objVar,X
	LDA objState,X
	AND #$40
	STA objState,X
	RTS
tbl8_9345:
	db $02
	db $04
	db $06
	db $04
ptr6_9349:
	LDX $A4
	LDA objVar,X
	AND #$06
	LSR
	ASL
	TAX
	LDA tbl8_9395,X
	STA $32
	LDA tbl8_9395+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_936A
	LDY #$C0
bra8_936A:
	STY $36
	LDA objState,X
	AND #$40
	STA objAttrs
loc8_9374:
	LDA $06E1
	PHA
	LDA prgDataBank2
	CMP #$26
	BNE bra8_938D
	LDY #$00
	LDA objYLo,X
	CMP #$A0
	BCC bra8_938A
	LDY #$20
bra8_938A:
	STY $06E1
bra8_938D:
	JSR jmp_54_A118
	PLA
	STA $06E1
	RTS
tbl8_9395:
	dw Mechakoopa1
	dw Mechakoopa2
	dw Mechakoopa3
	dw Mechakoopa2
Mechakoopa1:
	db $04
	db $03
	db $AE
	db $01
	db $02
	db $03
	db $FF
	db $09
	db $0A
	db $0B
	db $0C
	db $14
	db $15
	db $16
	db $17
Mechakoopa2:
	db $04
	db $03
	db $AE
	db $04
	db $05
	db $06
	db $FF
	db $0D
	db $0E
	db $0F
	db $10
	db $18
	db $19
	db $1A
	db $1B
Mechakoopa3:
	db $04
	db $03
	db $AE
	db $01
	db $07
	db $08
	db $FF
	db $09
	db $11
	db $12
	db $13
	db $14
	db $1C
	db $1D
	db $1E
Obj_h3C:
	LDX $A4
	LDA $0641,X
	CMP #$F0
	BCC bra8_9419
	LDA objSlot,X
	AND #$01
	CLC
	ADC #$3A
	STA objSlot,X
	LDA #$00
	STA objState,X
	STA objVar,X
	STA $0641,X
	LDA #$F8
	BMI bra8_9406
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra8_93FA ; unlogged
	CMP #$F0 ; unlogged
	BCC bra8_9418_RTS ; unlogged
bra8_93FA:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc8_9418_RTS ; unlogged
bra8_9406:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra8_9418_RTS
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged
bra8_9418_RTS:
loc8_9418_RTS:
	RTS
bra8_9419:
	LDA objFrameCount
	AND #$03
	BNE bra8_9423
	INC $0641,X
bra8_9423:
	LDA #$07
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
	BEQ bra8_9445
	CMP #$FF
	BEQ bra8_9445
	JMP Obj_RemoveObject
bra8_9445:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9487
	LDA objYDistHi,X
	BPL bra8_9476
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_9487
bra8_9476:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_9487:
loc8_9487:
	LDA freezeFlag
	BEQ bra8_948D
	RTS ; unlogged
bra8_948D:
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_94A1,Y
	STA $32
	LDA tbl8_94A1+1,Y
	STA $33
	JMP ($32)
tbl8_94A1:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_94B1
	dw Obj_FlipKill
	dw ptr3_9564
	dw ptr_AD79
	dw ptr3_959C
ptr3_94B1:
	JSR jmp_54_ACC3
	LDA $0636
	BEQ bra8_94BA
	RTS
bra8_94BA:
	LDA frameCount
	AND #$00
	BNE bra8_94C5
	LDA #$27
	JSR GetMovementData
bra8_94C5:
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_94E1
	CMP #$FF
	BEQ bra8_94E1
	JMP Obj_RemoveObject ; unlogged
bra8_94E1:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9523
	LDA objYDistHi,X
	BPL bra8_9512
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_9523
bra8_9512:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_9523:
loc8_9523:
	LDA freezeFlag
	BEQ bra8_9529
	RTS
bra8_9529:
	JSR jmp_54_A773
	JSR SetObjectCarryState
	LDA $1E
	CMP #$05
	BEQ bra8_9541
bra8_9535:
	INC objState,X
	INC objState,X
	LDA #$00
	STA objVar,X
	RTS
bra8_9541:
	LDA playerYSpd
	BEQ bra8_9535
	LDA #$20
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	STA playerMoveFlags
	LDA #$04
	STA playerAction
	LDA #$0F
	STA sndSfx
	LDX $A4
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objState,X
	RTS
ptr3_9564:
	LDA objXDistHi,X
	BPL bra8_9570
	LDA objState,X
	ORA #$40
	BNE bra8_9575
bra8_9570:
	LDA objState,X
	AND #$BF
bra8_9575:
	STA objState,X
	LDA frameCount
	AND #$00
	BNE bra8_9583
	LDA #$23
	JSR GetMovementData
bra8_9583:
	LDA objVar,X
	CMP #$07
	BCC bra8_959B_RTS
	LDA objState,X
	AND #$E0
	STA objState,X
	AND #$20
	BNE bra8_959B_RTS
	LDA #$00
	STA objVar,X
bra8_959B_RTS:
	RTS
ptr3_959C:
	LDA frameCount
	AND #$00
	BNE bra8_95A7
	LDA #$45
	JSR GetMovementData
bra8_95A7:
	LDA #$20
	JSR sub3_AEA8
tbl8_95AC:
	JSR jmp_54_AD54
	LDA #$01
	STA $06E4
	RTS
ptr6_95B5:
	LDX $A4
	LDA $0641,X
	CMP #$D0
	BCC bra8_95C6
	LDA objFrameCount
	AND #$04
	BNE bra8_95C6
	RTS
bra8_95C6:
	LDA objSlot,X
	LSR
	SEC
	SBC #$1E
	TAY
	LDA objState,X
	AND #$1F
	CMP #$05
	BNE bra8_95DC
	TYA
	CLC
	ADC #$03
	TAY
bra8_95DC:
	TYA
	ASL
	TAX
	LDA tbl8_9612,X
	STA $32
	LDA tbl8_9612+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_95F6
	LDY #$C0
bra8_95F6:
	STY $36
	LDA objState,X
	BPL bra8_960A
	AND #$BF
	STA $34
	LDA playerMoveFlags
	AND #$40
	ORA $34
	STA objState,X
bra8_960A:
	AND #$40
	STA objAttrs
	JMP loc8_9374
tbl8_9612:
	dw StunMechakoopa1
	dw StunMechakoopa2
	dw StunMechakoopa3
	dw StunMechakoopa4
	dw StunMechakoopa5
	dw StunMechakoopa6
StunMechakoopa1:
	db $03
	db $03
	db $AE
	db $FF
	db $FF
	db $FF
	db $1F
	db $20
	db $21
	db $24
	db $25
	db $26
StunMechakoopa2:
	db $03
	db $03
	db $AE
	db $FF
	db $FF
	db $FF
	db $1F
	db $20
	db $23
	db $24
	db $25
	db $26
StunMechakoopa3:
	db $03
	db $03
	db $AE
	db $FF
	db $FF
	db $FF
	db $1F
	db $20
	db $31
	db $24
	db $25
	db $26
StunMechakoopa4:
	db $03
	db $03
	db $AE
	db $27
	db $28
	db $FF
	db $29
	db $2A
	db $2B
	db $2D
	db $2E
	db $2F
StunMechakoopa5:
	db $03
	db $03
	db $AE
	db $27
	db $28
	db $FF
	db $29
	db $2A
	db $30
	db $2D
	db $2E
	db $2F
StunMechakoopa6:
	db $03
	db $03
	db $AE
	db $27
	db $28
	db $FF
	db $29
	db $2A
	db $32
	db $2D
	db $2E
	db $2F
Obj_h12:
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
	JMP Obj_RemoveObject
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
	JSR Obj_FacePlayer
	LDA #$00
	STA enemyAnimFrame,X
	RTS
Obj_h6E:
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
	JMP Obj_RemoveObject
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
	STA objState,X
	LDA #$00
	STA enemyAnimFrame,X
	STA objVar,X
	RTS
loc8_975A:
	JSR sub8_97B6
	LDX $A4
	LDA objState,X
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
	JSR GetMovementData
bra8_9796:
	LDA #$02
	STA enemyAnimFrame,X
	RTS
bra8_979C:
	LDA frameCount
	AND #$01
	BNE bra8_97A7
	LDA #$11
	JSR GetMovementData
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
	JMP Obj_RemoveObject ; unlogged
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
	LDA objState,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9834,Y
	STA $32
	LDA tbl8_9834+1,Y
	STA $33
	JMP ($32)
tbl8_9834:
	dw Obj_YoshiTongueCheck
	dw ptr_AA7B
	dw Obj_PowerupEatCheck
	dw ptr3_983E
	dw Obj_FlipKill
ptr3_983E:
	JSR Obj_CapeHitCheck
	JSR Obj_PlayerHitCheck
	JSR Obj_StompReboundNoSFX
	LDA #$04
	STA playerAction
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objState,X
	RTS
sub8_9856:
	LDA #$0F
	STA $36
	LDA #$08
	JSR sub3_B7A2
	BNE bra8_9871
	LDA objAction,X
	BEQ bra8_9870_RTS
	LDA #$00
	STA objAction,X
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
	JSR jmp_54_B470
bra8_9880:
	LDA #$02
	STA enemyAnimFrame,X
	LDA #$01
	STA objAction,X
	PLA
	PLA
	RTS
Obj_h7A:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_98AB
	CMP #$FF
	BEQ bra8_98AB
	JMP Obj_RemoveObject ; unlogged
bra8_98AB:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_98ED
	LDA objYDistHi,X ; unlogged
	BPL bra8_98DC ; unlogged
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_98ED ; unlogged
bra8_98DC:
	LDA objYDistLo,X ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	SBC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
bra8_98ED:
loc8_98ED:
	LDA freezeFlag
	BEQ bra8_98F3
	RTS ; unlogged
bra8_98F3:
	LDA objVar,X
	CMP #$F0
	BNE bra8_9908
	LDA #$40
	STA objState,X
	LDA #$00
	STA enemyAnimFrame,X
	STA objVar,X
	RTS
bra8_9908:
	JSR sub8_97B6
	LDX $A4
	LDA objState,X
	AND #$0F
	CMP #$04
	BCC bra8_9917
	RTS
bra8_9917:
	LDA objAction,X
	BNE bra8_9940
	LDA frameCount
	AND #$00
	BNE bra8_9927
	LDA #$3E
	JSR jmp_54_B470
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
	STA objAction,X
bra8_993F_RTS:
	RTS
bra8_9940:
	JMP loc8_976C
Obj_h7D:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_9961
	CMP #$FF
	BEQ bra8_9961
	JMP Obj_RemoveObject ; unlogged
bra8_9961:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_99A3
	LDA objYDistHi,X
	BPL bra8_9992
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_99A3 ; unlogged
bra8_9992:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_99A3:
loc8_99A3:
	LDA freezeFlag
	BEQ bra8_99A9
	RTS ; unlogged
bra8_99A9:
	LDY #$00
	LDA objXDistHi,X
	BMI bra8_99B2
	LDY #$20
bra8_99B2:
	STY $06E0
	RTS
Obj_hF0:
	LDX $A4
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra8_99D4
	CMP #$FF
	BEQ bra8_99D4
	JMP Obj_RemoveObject ; unlogged
bra8_99D4:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_9A16
	LDA objYDistHi,X
	BPL bra8_9A05
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc8_9A16
bra8_9A05:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_9A16:
loc8_9A16:
	LDA freezeFlag
	BEQ bra8_9A1C
	RTS ; unlogged
bra8_9A1C:
	LDA objYHi,X
	CMP playerYHiDup
	BNE bra8_9A77_RTS
	LDY #$00
	LDA objSlot,X
	CMP #$F2
	BNE bra8_9A6D
	LDA objVar,X
	BPL bra8_9A66
	LDA #$00
	STA objVar,X
	LDA #$03
	BMI bra8_9A53
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra8_9A47
	CMP #$F0
	BCC bra8_9A66_RTS
bra8_9A47:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP loc8_9A66_RTS ; unlogged
bra8_9A53:
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra8_9A66_RTS ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged
bra8_9A66_RTS:
loc8_9A66_RTS:
	RTS
bra8_9A66:
	LDA objYDistHi,X
	BPL bra8_9A72
	BMI bra8_9A74
bra8_9A6D:
	LDA objYDistHi,X
	BPL bra8_9A74
bra8_9A72:
	LDY #$20
bra8_9A74:
	STY $06E0
bra8_9A77_RTS:
	RTS

	BEQ bra8_9A7F ; unlogged
	ASL ; unlogged
	TAX ; unlogged
	LDA tbl8_9A99,X ; unlogged
bra8_9A7F:
	STA $32 ; unlogged
	LDA tbl8_9A99+1,X ; unlogged
	STA $33 ; unlogged
	LDY #$80 ; unlogged
	LDX $A4 ; unlogged
	LDA objSlot,X ; unlogged
	AND #$01 ; unlogged
	BEQ bra8_9A93 ; unlogged
	LDY #$C0 ; unlogged
bra8_9A93:
	STY $36 ; unlogged
	JSR jmp_54_A118 ; unlogged
	RTS ; unlogged
tbl8_9A99:
	dw tbl8_9AA3
	dw tbl8_9AAA
	dw tbl8_9AB1
	dw tbl8_9AAA
	dw tbl8_9AB8
tbl8_9AA3:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $22, $23
tbl8_9AAA:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $24, $25
tbl8_9AB1:
	db $02
	db $02
	db $97
	db $1C, $1D
	db $2A, $2B
tbl8_9AB8:
	db $02
	db $02
	db $97
	db $2A, $2B
	db $1C, $1D
incbin prg/padding/padding055.bin
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $23
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
