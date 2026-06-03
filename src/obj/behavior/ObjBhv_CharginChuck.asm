.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; CHARGIN' CHUCK OBJECT CODE ($8278)
;----------------------------------------
.export objCharginChuck
objCharginChuck:
	LDX $A4
	LDA objVar,X
	BMI bra4_8282
	JMP loc4_82F0

bra4_8282:
	CMP #$80
	BEQ bra4_8289
	JMP sub_54_B4FC

bra4_8289:
	objDistCalc bra4_82ED

bra4_82ED:
	JMP objFacePlayer

loc4_82F0:
	LDA #$07
	STA $25 ; Chucks can't be eaten
	LDX $A4
	objDistCalc bra4_835A

bra4_835A:
	LDA objFlags,X
	AND #%00011111
	ASL
	TAY
	LDA tbl4_836E,Y
	STA $32
	LDA tbl4_836E+1,Y
	STA $33
	JMP ($32)
tbl4_836E:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr9_8378
	.word objFlipKill

.export ptr9_8378
ptr9_8378:
	JSR sub4_83B3
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	LDA #$30
	STA playerYSpd
	LDA playerMoveFlags
	ORA #PMOVE_VERT
	EOR #PMOVE_HORIZ
	STA playerMoveFlags ; Move player up and backwards
	LDA #48
	STA playerXSpd

	LDA #1
	JSR rewardPoints ; Give player 200 points
	LDA #SFX_ENEMYHIT2
	STA sndSfx ; Play hit sound
	LDA objSlot,X
	CLC
	ADC #4
	CMP #OBJ_CHARGINCHUCK_CHASE_HIT2+2 ; The ID will go past this pointer if the chuck is hit more than twice
	BCC bra4_83AA
		LDA #$81
		STA objVar,X ; Defeat chuck if on third hit
		RTS

	bra4_83AA:
		STA objSlot,X
		LDA #$00
		STA objVar,X
		RTS

sub4_83B3:
	LDA objVar,X
	CMP #$08
	BCS bra4_8422
	; Looking around
		LDA objFlags,X
		AND #%00100000
		BEQ bra4_83DC
		; Chuck is moving down:
			LDA objFrameCount
			AND #$00
			BNE bra4_83D9
				LDA #$80
				ASL
				TAY
				LDA tbl4_9A83,Y
				STA $32
				LDA tbl4_9A83+1,Y
				STA $33
				JSR sub4_8140

			bra4_83D9:
				JMP loc4_83F4

		; Chuck is moving up or on level ground:
		bra4_83DC:
			LDA objFrameCount
			AND #%00001110
			BNE loc4_83F4
				LDA #$80
				ASL
				TAY
				LDA tbl4_9A83,Y
				STA $32
				LDA tbl4_9A83+1,Y
				STA $33
				JSR sub4_8140

	loc4_83F4:
		LDA objVar,X
		CMP #$04
		BCC bra4_8421_RTS
		LDA objYDistHi,X
		BPL bra4_8421_RTS
		LDA objSlot,X
		CLC
		ADC #2
		STA objSlot,X
		LDA #$11
		STA objVar,X
		LDA objXDistHi,X
		AND #$40
		EOR #$40
		STA $25
		LDA objFlags,X
		AND #$BF
		ORA $25
		STA objFlags,X
	bra4_8421_RTS:
		RTS

bra4_8422:
	LDA objFrameCount
	AND #$00
	BNE bra4_843A_RTS
	LDA #$80
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR sub4_8140
bra4_843A_RTS:
	RTS
