.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; BONUS QUESTION BLOCK CODE ($9A4B)
;----------------------------------------
.export obj0xE8
obj0xE8:
	LDX $A4
	objDistCalc bra5_9AB1

bra5_9AB1:
	LDA objState,X
	ASL
	TAY ; Get pointer for current action
	LDA tbl5_9AC3,Y
	STA $32 ; Load lower byte
	LDA tbl5_9AC3+1,Y
	STA $33 ; Load upper byte
	JMP ($32) ; Jump to loaded pointer
tbl5_9AC3:
	.word bonusBlockDefault
	.word bonusBlockHit
	.word bonusBlockSuccessCheck
	.word bonusBlockFail
	.word ptr10_9B8B ; Unused
	.word bonusBlockSuccess
	.word bonusBlockSuccessDone

bonusBlockDefault:
	LDA #$40
	STA enemyAnimFrame,X
	LDY #34 ; Default hitbox size
	LDA playerPowerup
	BNE @horizHitboxCheck ; Branch ahead if the player has no powerup
	LDA playerYoshiState
	BNE @horizHitboxCheck ; Branch ahead if the player is riding Yoshi
		LDY #24 ; Use smaller hitbox if player is small and not riding Yoshi

@horizHitboxCheck:
	STY $25
	LDA objXDistHi,X
	BPL @horizHitboxCheckLeft
		LDA #6 ; Extend 6 pixels to the right
		CLC
		ADC #16
		CLC
		ADC objXDistLo,X
		BCS @vertHitboxCheck ; Move to the vertical check if player is within 5 pixels of the object's hitbox horizontally
		BCC @noColl ; Otherwise, stop

	@horizHitboxCheckLeft:
		LDA objXDistLo,X
		CMP #6 ; Extend hitbox 6 pixels to the left
		BCS @noColl

@vertHitboxCheck:
	LDA objYDistHi,X
	BEQ @vertHitboxCheckAbove ; Separate check if the player is above the object
	CMP #$FF
	BNE @noColl ; Stop if the object is off-screen
		LDA $25
		CLC
		ADC #16
		CLC
		ADC objYDistLo,X
		BCS @collOccurred ; If hitboxes overlap
		BCC @noColl ; If hitboxes don't overlap

	@vertHitboxCheckAbove:
		LDA objYDistLo,X
		CMP #0
		BCS @noColl ; Stop if the player is above the object

@collOccurred:
	CLC
	BCC bra5_9B20

@noColl:
	SEC

bra5_9B20:
	BCS @stop
	LDA playerYSpd
	BEQ @stop
	LDA playerMoveFlags
	AND #PMOVE_VERT
	BEQ @stop
		INC objState,X ; Only register a hit if the player is moving up

@stop:
	RTS

bonusBlockHit:
	LDA frameCount
	AND #0
	BNE bra5_9B3B
		LDA #$48
		JSR parseMovementData ; Advance through object movement vectors every other frame
	
bra5_9B3B:
	LDA objVar,X
	AND #%00001111
	CMP #$09
	BNE bra5_9B47_RTS ; Continue until the last movement vector is reached
		INC objState,X

bra5_9B47_RTS:
	RTS

bonusBlockSuccessCheck:
	LDA bonusBlockHitCounts
	BMI bra5_9B68 ; Automatically fail if there is a negative amount of hits
	LDA objSlot,X
	SEC
	SBC #OBJ_BONUSBLOCK ; Get correct block index based on the ID
	TAY
	LDA bonusBlockHitCounts,Y
	CMP #2
	BEQ bra5_9B62
		JSR updateRng
		AND #$01
		BNE bra5_9B68 ; Fail if the random number is even

	bra5_9B62:
		INC objState,X
		INC objState,X ; Hit was correct

bra5_9B68:
	INC objState,X ; Hit was incorrect
	RTS

bonusBlockFail:
	LDA objSlot,X
	STA $25
	LDY #$FF ; This wraps around for zero so the loop can increment at the start

; Despawn other blocks in the row that haven't been hit
bra5_9B73:
	INY ; Go to next slot
	LDA objSlot,Y
	CMP $25
	BNE @skipDespawn ; Don't despawn if this block has an ID and is therefore in a different row
	LDA objState,Y
	CMP #5
	BCS @skipDespawn ; Don't despawn block if it was already hit
		LDA #0
		STA objSlot,Y ; Despawn object
	@skipDespawn:
		CPY objCount
		BCC bra5_9B73 ; Loop until all unhit blocks are removed as needed

ptr10_9B8B:
	RTS

bonusBlockSuccess:
	LDA objSlot,X
	SEC
	SBC #OBJ_BONUSBLOCK
	TAY
	LDA bonusBlockHitCounts,Y
	CLC
	ADC #1
	STA bonusBlockHitCounts,Y
	STA $25 ; Increase total correct hits for this row
	LDA #1
	STA enemyAnimFrame,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	STA objXLo,Y
	LDA objXHi,X
	STA objXHi,Y
	LDA objYLo,X
	STA objYLo,Y
	LDA objYHi,X
	STA objYHi,Y ; Spawn a coin in the same position as the bonus block
	LDA #0
	STA objState,Y
	STA objFlags,Y ; Default spawn state
	LDA #$80
	STA objVar,Y

	LDA $25
	CMP #$03
	BNE @spawnCoin
	; If all three blocks hit:
		LDA #SFX_BLOCKRELEASE
		STA sndSfx ; Play block release sound
		LDA #$E8
		BNE bra5_9BE5 ; Spawn 1UP

	@spawnCoin:
		LDA #0
		JSR rewardPoints ; Give the player 100 points
		LDA #SFX_COIN
		STA sndSfx ; Play coin sound
		LDA #OBJ_BONUSBLOCKCOIN ; Spawn coin sprite

bra5_9BE5:
	STA objSlot,Y ; Store sprite in memory
	INC objState,X
	RTS

bonusBlockSuccessDone:
	RTS
