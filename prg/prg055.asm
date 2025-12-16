;----------------------------------------
; KOOPA OBJECT CODE ($8000)
;----------------------------------------
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

;----------------------------------------
; KOOPA GRAPHICAL CODE ($820E)
; Used by every Koopa variant
;----------------------------------------
ptr6_820E:
	LDX $A4 ; Get current object index
	LDA enemyAnimFrame,X
	ASL
	TAX ; Get index for current frame
	LDA sprTblKoopa,X
	STA $32
	LDA sprTblKoopa+1,X
	STA $33 ; Load mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ @continue
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

@continue:
	STY $36 ; Set bank number
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_52_A118 ; Render mapping data
	RTS

sprTblKoopa:
	.word sprBeachKoopaWalk1
	.word sprBeachKoopaWalk2
	.word sprBeachKoopaSlide
	.word sprKoopaWalk1
	.word sprKoopaWalk2
	.word sprParatroopaWalk1
	.word sprParatroopaWalk2
sprBeachKoopaWalk1:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $02
	.byte $06, $07
sprBeachKoopaWalk2:
	.byte $02
	.byte $02
	.byte $94
	.byte $01, $03
	.byte $08, $09
sprBeachKoopaSlide:
	.byte $02
	.byte $02
	.byte $94
	.byte $04, $05
	.byte $0A, $0B
sprKoopaWalk1:
	.byte $02
	.byte $04
	.byte $94
	.byte $0E, $0F
	.byte $18, $19
	.byte $27, $28
	.byte $35, $36
sprKoopaWalk2:
	.byte $02
	.byte $04
	.byte $94
	.byte $10, $11
	.byte $1A, $1B
	.byte $29, $2A
	.byte $37, $38
sprParatroopaWalk1:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $12, $13, $FF
	.byte $1C, $1D, $1E, $1F
	.byte $FF, $2C, $2D, $2E
	.byte $FF, $39, $3A, $FF
sprParatroopaWalk2:
	.byte $04
	.byte $04
	.byte $94
	.byte $FF, $16, $17, $FF
	.byte $23, $24, $25, $26
	.byte $31, $32, $33, $34
	.byte $FF, $3E, $3F, $FF

;----------------------------------------
; BOUNCING PARATROOPA OBJECT CODE ($8299)
;----------------------------------------
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

;----------------------------------------
; REX OBJECT CODE ($8488)
;----------------------------------------
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
	LDA sprTblRex,X
	STA $32
	LDA sprTblRex+1,X
	STA $33 ; Load sprite pointer
	LDY #$80 ; Use bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8681
		LDY #$C0 ; Use bank 3 if lower bit of ID is set

bra8_8681:
	STY $36
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118
	RTS

sprTblRex:
	.word sprRexWalk1
	.word sprRexWalk2
	.word sprRexFlattened ; Unused
	.word sprRexSquishedWalk1
	.word sprRexSquishedWalk2
sprRexWalk1:
	.byte $03
	.byte $04
	.byte $95
	.byte $21, $22, $FF
	.byte $25, $26, $FF
	.byte $29, $2A, $2B
	.byte $33, $34, $35
sprRexWalk2:
	.byte $03
	.byte $04
	.byte $95
	.byte $23, $24, $FF
	.byte $27, $28, $FF
	.byte $2C, $2D, $2E
	.byte $36, $37, $38
sprRexFlattened:
	.byte $02
	.byte $01
	.byte $95
	.byte $39, $3A
sprRexSquishedWalk1:
	.byte $02
	.byte $02
	.byte $95
	.byte $2F, $30
	.byte $3B, $3C
sprRexSquishedWalk2:
	.byte $02
	.byte $02
	.byte $95
	.byte $31, $32
	.byte $3D, $3E

;----------------------------------------
; PIRANHA PLANT OBJECT CODE ($86CA)
;----------------------------------------
obj0x1A:
	LDX $A4
	objDistCalc bra8_8730 ; Calculate distance between Piranha Plant and player

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
	STA objState,Y
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
	JMP objRemoveObject ; unlogged
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
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_87F4,Y
	STA $32
	LDA tbl8_87F4+1,Y
	STA $33
	JMP ($32)
tbl8_87F4:
	.word ptr3_87FE
	.word ptr3_880D
	.word ptr3_881C
	.word ptr3_882B
	.word objFlipKill
ptr3_87FE:
	LDA frameCount
	AND #$03
	BNE bra8_8809
	LDA #$15
	JSR jmp_54_B11D ; Use movement data string #$15 (21 in decimal), which is used for the piranha plant
bra8_8809:
	JSR objYoshiTongueCheck ; Handle edibility
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
	JSR objPowerupEatCheck
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
	JSR objCapeHitCheck
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
	.word sprPiranhaJump1
	.word sprPiranhaJump2
	.word sprPiranhaJump3
	.word sprPiranhaJump4
sprPiranhaJump1:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $15
	.byte $16
sprPiranhaJump2:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $17
	.byte $18
sprPiranhaJump3:
	.byte $02
	.byte $03
	.byte $97
	.byte $0D
	.byte $0E
	.byte $11
	.byte $12
	.byte $19
	.byte $1A
sprPiranhaJump4:
	.byte $02
	.byte $03
	.byte $97
	.byte $0F
	.byte $10
	.byte $13
	.byte $14
	.byte $19
	.byte $1B

;----------------------------------------
; PIRANHA PLANT MASK OBJECT CODE ($88AB)
;----------------------------------------
obj0x1C:
	LDX $A4
	objDistCalc bra8_8911_RTS

bra8_8911_RTS:
	; This object has no behavior
	RTS
ptr6_8912:
	; Unimplemented or empty function
	RTS



;----------------------------------------
; SUPER KOOPA W/ FEATHER OBJECT CODE ($8913)
;----------------------------------------
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
	LDA superkoopaAnimStartFrames,Y
	TAY ; Get animation starting frame
	LDA objSlot,X
	CMP #OBJ_SUPERKOOPA_JUMP
	BCC bra8_8AC1 ; Use flashing animation if this is the feather variant
		CMP #OBJ_SUPERKOOPA_ALT
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
	LDA sprTblSuperKoopa,X
	STA $32
	LDA sprTblSuperKoopa+1,X
	STA $33 ; Load sprite mapping pointer
	LDY #$80 ; Use CHR sprite bank 2 by default
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8AE3
		LDY #$C0 ; Use CHR sprite bank 3 if lower bit of ID is set

bra8_8AE3:
	STY $36 ; Set bank number
	LDA objFlags,X
	AND #%01000000
	STA objAttrs ; Store object's horizontal direction
	JSR jmp_54_A118 ; Render mapping data
	RTS

; Animation starting frame for each motion vector
superkoopaAnimStartFrames:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08

sprTblSuperKoopa:
	.word sprSuperKoopaWalk1		; Walking animation (Feather)
	.word sprSuperKoopaWalk2		; 
	.word sprSuperKoopaWalk1		; Walking animation (Normal)
	.word sprSuperKoopaWalk2		; 

	.word sprSuperKoopaTakeoff2		; Takeoff animation (Feather)
	.word sprSuperKoopaRedTakeoff	; 
	.word sprSuperKoopaTakeoff2		; Takeoff animation (Normal)
	.word sprSuperKoopaTakeoff1		; 

	.word sprSuperKoopaFly2			; Fly animation (Feather)
	.word sprSuperKoopaRed_Fly		; 
	.word sprSuperKoopaFly2			; Fly animation (Normal)
	.word sprSuperKoopaFly1			; 

	.word sprSuperKoopaDefeated
sprSuperKoopaWalk1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $1A, $1B
	.byte $21, $22, $23
sprSuperKoopaWalk2:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $1C, $1D, $1E
	.byte $24, $25, $23
sprSuperKoopaTakeoff1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $01, $02
	.byte $06, $07, $08
	.byte $10, $11, $FF
sprSuperKoopaTakeoff2:
	.byte $03
	.byte $03
	.byte $96
	.byte $03, $04, $05
	.byte $09, $0A, $0B
	.byte $12, $13, $FF
sprSuperKoopaFly1:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $0C, $0D
	.byte $14, $15, $16
sprSuperKoopaFly2:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $0E, $0F
	.byte $14, $17, $18
sprSuperKoopaRedTakeoff:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $01, $3A
	.byte $06, $38, $39
	.byte $10, $11, $FF
sprSuperKoopaRed_Fly:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $FF, $FF
	.byte $06, $3B, $3C
	.byte $14, $3D, $3E
sprSuperKoopaDefeated:
	.byte $03
	.byte $03
	.byte $96
	.byte $FF, $19, $FF
	.byte $1F, $20, $1E
	.byte $26, $27, $28

obj0x24:
	LDX objLowerSlot ; Get the index for the current object slot
	LDA objFlags,X
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
	JSR spawnLotusPollen ; Spawns 4 seeds when the timer is at 4
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
	JMP objRemoveObject
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
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8C31,Y
	STA $32
	LDA tbl8_8C31+1,Y
	STA $33
	JMP ($32)
tbl8_8C31:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_8C3B
	.word ptr3_8C48
ptr3_8C3B:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JSR jmp_54_BF74
	RTS
ptr3_8C48:
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	RTS
;-----
	
spawnLotusPollen:
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
	STA objFlags,Y
	STA objFlags+1,Y
	STA objFlags+2,Y
	STA objFlags+3,Y
	STA objVar,Y
	STA $0579,Y
	STA $057A,Y
	STA $057B,Y
	STA objState,Y
	STA objState+1,Y
	STA objState+2,Y
	STA objState+3,Y
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
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $01
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl8_8D2B:
	.word ofs_8D31
	.word ofs_8D3C
	.word ofs_8D47
ofs_8D31:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $05
	.byte $06
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D3C:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $03
	.byte $04
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
ofs_8D47:
	.byte $04
	.byte $02
	.byte $97
	.byte $FF
	.byte $01
	.byte $02
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
;----------------------------------------
; VOLCANO LOTUS UPPER LEFT POLLEN CODE ($8D52)
;----------------------------------------
obj0x26:
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
	JMP objRemoveObject
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
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8DD0,Y
	STA $32
	LDA tbl8_8DD0+1,Y
	STA $33
	JMP ($32)
tbl8_8DD0:
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8DDA
	.word ptr3_8E0E
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
	JSR parseMovementData
bra8_8DF1:
	LDA objYLo,X
	CMP #$E0
	BCC bra8_8E04
	LDA #$00
	STA objSlot,X
	STA objFlags,X
	STA objVar,X
	RTS
bra8_8E04:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR jmp_54_BF74
	RTS
ptr3_8E0E:
	LDA #$00
	STA objSlot,X
	STA objFlags,X
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
	LDA sprTblLotusPollen,X
	STA $32
	LDA sprTblLotusPollen+1,X
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

sprTblLotusPollen:
	.word sprLotusPollen1
	.word sprLotusPollen2
sprLotusPollen1:
	.byte $01
	.byte $01
	.byte $97
	.byte $07
sprLotusPollen2:
	.byte $01
	.byte $01
	.byte $97
	.byte $08

obj0x2E:
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
	JMP objRemoveObject ; unlogged
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
	JSR objFacePlayer
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
	JMP objRemoveObject
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
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8F67,Y
	STA $32
	LDA tbl8_8F67+1,Y
	STA $33
	JMP ($32)
tbl8_8F67:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_8F71
	.word objFlipKill
ptr3_8F71:
	LDA frameCount
	AND #$00
	BNE bra8_8F7C
	LDA #$1F
	JSR jmp_54_B11D
bra8_8F7C:
	JSR objCapeHitCheck
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
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
	LDA sprTblSwooper,X
	STA $32
	LDA sprTblSwooper+1,X
	STA $33
	LDY #$80
	LDX $A4
	LDA objSlot,X
	AND #$01
	BEQ bra8_8FC5
	LDY #$C0
bra8_8FC5:
	STY $36
	LDA objFlags,X
	AND #$40
	STA objAttrs
	JSR jmp_54_A118
	RTS

sprTblSwooper:
	.word sprSwooper1
	.word sprSwooper2
	.word sprSwooper3
sprSwooper1:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $2E
	.byte $2F
	.byte $FF
	.byte $36
	.byte $37
sprSwooper2:
	.byte $03
	.byte $02
	.byte $96
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $31
	.byte $32
sprSwooper3:
	.byte $03
	.byte $02
	.byte $96
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $33
	.byte $34
	.byte $35

obj0x30:
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
	JMP objRemoveObject ; unlogged
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
	JSR objFacePlayer
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
	JMP objRemoveObject
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
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_90E1,Y
	STA $32
	LDA tbl8_90E1+1,Y
	STA $33
	JMP ($32)
tbl8_90E1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_90EB
	.word objFlipKill
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
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JSR jmp_54_BF74
	RTS
ptr6_9118:
	LDY #$00
	LDX $A4
	LDA objFlags,X
	AND #$0F
	CMP #$04
	BNE bra8_912B
	LDY #$02
	LDA #$80
	BNE bra8_9130
bra8_912B:
	LDA objFlags,X
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
	LDA sprTblBlurp,X
	STA $32
	LDA sprTblBlurp+1,X
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

sprTblBlurp:
	.word sprBlurp1
	.word sprBlurp2
	.word sprBlurp3
	.word sprBlurp4
sprBlurp1:
	.byte $02
	.byte $02
	.byte $A6
	.byte $03
	.byte $04
	.byte $0D
	.byte $0E
sprBlurp2:
	.byte $02
	.byte $02
	.byte $A6
	.byte $05
	.byte $06
	.byte $0F
	.byte $0E
sprBlurp3:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0D
	.byte $0E
	.byte $03
	.byte $04
sprBlurp4:
	.byte $02
	.byte $02
	.byte $A6
	.byte $0F
	.byte $0E
	.byte $05
	.byte $06

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
	JMP objRemoveObject ; unlogged
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
	JSR objFacePlayer
	RTS
loc8_9202:
	LDA objState,X
	BNE bra8_920A
	JMP loc8_9287
bra8_920A:
	CMP #$10
	BCC bra8_9214
	LDA #$00
	STA objState,X
	RTS
bra8_9214:
	INC objState,X
	LDA frameCount
	AND #$01
	BNE bra8_9222
	LDA #$4B
	JSR getMovementData
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
	JMP objRemoveObject ; unlogged
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
	JMP objRemoveObject
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
	BEQ loc8_92EB
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

loc8_92EB:
	LDA freezeFlag
	BEQ bra8_92F1
	RTS
bra8_92F1:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_9305,Y
	STA $32
	LDA tbl8_9305+1,Y
	STA $33
	JMP ($32)
tbl8_9305:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_930F
	.word objFlipKill
ptr3_930F:
	LDA frameCount
	AND #$00
	BNE bra8_931A
	LDA #$13
	JSR getMovementData
bra8_931A:
	JSR objPlayerHitCheck
	JSR objKillOnSpinJump
	JSR objStompRebound
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
	LDA objFlags,X
	AND #$40
	STA objFlags,X
	RTS
tbl8_9345:
	.byte $02
	.byte $04
	.byte $06
	.byte $04
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
	LDA objFlags,X
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
	.word sprMechakoopa1
	.word sprMechakoopa2
	.word sprMechakoopa3
	.word sprMechakoopa2
sprMechakoopa1:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $02
	.byte $03
	.byte $FF
	.byte $09
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $14
	.byte $15
	.byte $16
	.byte $17
sprMechakoopa2:
	.byte $04
	.byte $03
	.byte $AE
	.byte $04
	.byte $05
	.byte $06
	.byte $FF
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $10
	.byte $18
	.byte $19
	.byte $1A
	.byte $1B
sprMechakoopa3:
	.byte $04
	.byte $03
	.byte $AE
	.byte $01
	.byte $07
	.byte $08
	.byte $FF
	.byte $09
	.byte $11
	.byte $12
	.byte $13
	.byte $14
	.byte $1C
	.byte $1D
	.byte $1E

obj0x3C:
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
	STA objFlags,X
	STA objVar,X
	STA $0641,X
	LDA #$F8
	BMI bra8_9406
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra8_93FA ; unlogged
	CMP #$F0 ; unlogged
	BCC loc8_9418_RTS ; unlogged
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
	BCS loc8_9418_RTS
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged

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
	JMP objRemoveObject
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
	BEQ loc8_9487
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

loc8_9487:
	LDA freezeFlag
	BEQ bra8_948D
	RTS ; unlogged
bra8_948D:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_94A1,Y
	STA $32
	LDA tbl8_94A1+1,Y
	STA $33
	JMP ($32)
tbl8_94A1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_94B1
	.word objFlipKill
	.word ptr3_9564
	.word ptr_AD79
	.word ptr3_959C
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
	JSR getMovementData
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
	JMP objRemoveObject ; unlogged
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
	JSR setObjectCarryState
	LDA $1E
	CMP #$05
	BEQ bra8_9541
bra8_9535:
	INC objFlags,X
	INC objFlags,X
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
	STA objFlags,X
	RTS
ptr3_9564:
	LDA objXDistHi,X
	BPL bra8_9570
	LDA objFlags,X
	ORA #$40
	BNE bra8_9575
bra8_9570:
	LDA objFlags,X
	AND #$BF
bra8_9575:
	STA objFlags,X
	LDA frameCount
	AND #$00
	BNE bra8_9583
	LDA #$23
	JSR getMovementData
bra8_9583:
	LDA objVar,X
	CMP #$07
	BCC bra8_959B_RTS
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
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
	JSR getMovementData
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
	LDA objFlags,X
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
	LDA objFlags,X
	BPL bra8_960A
	AND #$BF
	STA $34
	LDA playerMoveFlags
	AND #$40
	ORA $34
	STA objFlags,X
bra8_960A:
	AND #$40
	STA objAttrs
	JMP loc8_9374
tbl8_9612:
	.word stunmechakoopa1
	.word stunmechakoopa2
	.word stunmechakoopa3
	.word stunMechakoopa4
	.word stunMechakoopa5
	.word stunMechakoopa6
stunmechakoopa1:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $21
	.byte $24
	.byte $25
	.byte $26
stunmechakoopa2:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $23
	.byte $24
	.byte $25
	.byte $26
stunmechakoopa3:
	.byte $03
	.byte $03
	.byte $AE
	.byte $FF
	.byte $FF
	.byte $FF
	.byte $1F
	.byte $20
	.byte $31
	.byte $24
	.byte $25
	.byte $26
stunMechakoopa4:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $2B
	.byte $2D
	.byte $2E
	.byte $2F
stunMechakoopa5:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $30
	.byte $2D
	.byte $2E
	.byte $2F
stunMechakoopa6:
	.byte $03
	.byte $03
	.byte $AE
	.byte $27
	.byte $28
	.byte $FF
	.byte $29
	.byte $2A
	.byte $32
	.byte $2D
	.byte $2E
	.byte $2F
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
obj0x7A:
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
	JMP objRemoveObject ; unlogged
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
obj0x7D:
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
	JMP objRemoveObject ; unlogged
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
obj0xF0:
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
	JMP objRemoveObject ; unlogged
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
	.word tbl8_9AA3
	.word tbl8_9AAA
	.word tbl8_9AB1
	.word tbl8_9AAA
	.word tbl8_9AB8
tbl8_9AA3:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $22, $23
tbl8_9AAA:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $24, $25
tbl8_9AB1:
	.byte $02
	.byte $02
	.byte $97
	.byte $1C, $1D
	.byte $2A, $2B
tbl8_9AB8:
	.byte $02
	.byte $02
	.byte $97
	.byte $2A, $2B
	.byte $1C, $1D
.incbin prg/padding/padding055.bin
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
