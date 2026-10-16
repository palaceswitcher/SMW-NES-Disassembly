.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; SUBROUTINE ($93A8)
; Checks if player can stand on a platform object of a specified width and makes them stand on it. Can optionally offset the player as well.
; Parameters:
; > $25: Platform Width
; > $28: Player X Offset
; > $2B: Player Y Offset
;----------------------------------------
.export objCollAsPlatform
objCollAsPlatform:
	LDX $A4
	LDA objFlags,X
	BMI @isStandingOnPlatform
	JMP loc5_94B2 ; Jump if the player isn't already standing on the platform

; Horizontally offset player
@isStandingOnPlatform:
	LDA playerXLoDup
	CLC
	ADC $28
	STA playerXLoDup
	LDA $28
	BMI bra5_93C4
	; If X offset is positive
		LDA playerXHiDup
		ADC #$00
		JMP loc5_93C8
	; If X offset is negative 
	bra5_93C4:
		LDA playerXHiDup
		SBC #$00

loc5_93C8:
	STA playerXHiDup

; Vertically offset player
	LDA $2B
	BMI bra5_93E3 ; Branch if offset is negative

	; If Y offset is positive
		CLC
		ADC playerYLoDup
		STA playerYLoDup
		BCS bra5_93D9
		CMP #256-16
		BCC loc5_93FF ; Branch if adding 16 wouldn't require carry
	bra5_93D9:
		CLC
		ADC #16
		STA playerYLoDup
		INC playerYHiDup ; Add 16 and carry
		JMP loc5_93FF
	; If Y offset is negative
	bra5_93E3:
		CLC
		ADC playerYLoDup
		STA playerYLoDup
		BCS loc5_93FF ; Branch if borrow not needed
			SEC
			SBC #16
			STA playerYLoDup
			DEC playerYHiDup ; Subtract 16 and borrow if needed
			LDY scrollBoundTop
			CPY playerYHiDup
			BNE loc5_93FF
			; If player goes above level boundaries
				INY
				STY playerYHiDup
				LDA #$00
				STA playerYLoDup ; Cap player to top of level

loc5_93FF:
	objDistCalc bra5_9463

bra5_9463:
	LDA #$00
	STA objFlags,X
	LDA objXDistHi,X
	BEQ @continue
		CMP #-1
		BNE @stop
			; If the player is to the right of the object
			LDA objXDistLo,X
			CMP $25
			BCC @stop
			BCS bra5_9482 ; Continue if the player is within the width of the object
	; If the player is to the lft of the object
	@continue:
		LDA objXDistLo,X
		CMP #5
		BCC bra5_9482 ; Only extend the object's hitbox 5 units to the left

@stop:
	RTS

; Check if player is moving down and is within the bounds of the object
bra5_9482:
	LDA playerMoveFlags
	AND #%00000100
	BNE @stop
	; If player is moving up
		LDA objYDistHi,X
		BNE @continue
		; If player is within a vertical screen of the object
			LDA objYDistLo,X
			CMP #8
			BCC @standOnObj ; Make player stand on object if they're 8 pixels above the object's origin
			BCS @stop
	@continue:
		CMP #-1
		BNE @stop
		; If player is within a vertical screen of the object
			LDA objYDistLo,X
			CMP #-6
			BCS @standOnObj ; Make player stand on object if they're at least 6 pixels below the object origin

@stop:
	RTS

; Respond to being stood on
@standOnObj:
	LDA #$00
	STA playerYSpd ; Reset the player's vertical speed
	STA objYDistLo,X
	STA objYDistHi,X
	LDA #%10000000
	STA objFlags,X ; Set state to being stood on
	RTS

loc5_94B2:
	LDA objXDistHi,X
	BEQ @continue
		CMP #-1
		BNE @stop
			; If the player is to the right of the object
			LDA objXDistLo,X
			CMP $25
			BCC @stop
			BCS bra5_94CC ; Continue if the player is within the width of the object

@continue:
	LDA objXDistLo,X
	CMP #5
	BCC bra5_94CC

@stop:
	RTS

bra5_94CC:
	LDA playerMoveFlags
	AND #%00000100
	BNE @stop
	; If player is moving down
		LDA objYDistHi,X
		BNE @continue
			LDA objYDistLo,X
			CMP #8
			BCC bra5_94EC ; If player is 8 or fewer above the object's origin
			BCS @stop
	@continue:
		CMP #-1
		BNE @stop
			LDA objYDistLo,X
			CMP #-6
			BCS bra5_94EC ; If they're at least 6 pixels below the object origin

@stop:
	RTS

bra5_94EC:
	LDA #$00
	STA playerYSpd
	STA objYDistLo,X
	STA objYDistHi,X ; Stop player's vertical movement
	LDA objYLo,X
	STA playerYLoDup
	LDA objYHi,X
	STA playerYHiDup ; Vertically align player with object
	LDY scrollBoundTop
	CPY playerYHiDup
	BNE bra5_950E
	; Stop player at upper boundary of level
		INY
		STY playerYHiDup
		LDA #0
		STA playerYLoDup

bra5_950E:
	LDA #0
	STA objYDistLo,X
	STA objYDistHi,X
	LDA #%10000000
	STA objFlags,X ; Set object to "stood on"
	LDA #PACT_WALK
	STA playerAction ; Make player enter walk action? Seems to have no effect
	STA playerYSpd ; Make player dip down 1 pixel when standing on it
	RTS
