.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; Parses movement data for the Chargin' Chuck (chasing)
.export sub4_8000
sub4_8000:
	LDX $A4
	LDA objVar,X
	AND #$7F
	ASL
	TAY ; Movement vector index
	LDA objFlags,X
	AND #OBJFLAG_VERT
	BNE bra4_8013
	JMP loc4_809A

	; If going downwards/not moving vertically
	bra4_8013:
		JSR sub3_B077
		BNE bra4_8070
		
		; If standing on air and should fall
			LDA objVar,X
			AND #%01111111
			CMP #$07 ; Cap downwards vertical velocity at 7
			BCS bra4_8024
				INC objVar,X

		; Apply vertical velocity
		bra4_8024:
			PHA
			CLC
			ADC objYLo,X
			STA objYLo,X
			PLA
			BMI bra4_8036
				LDA objYHi,X
				ADC #$00
				BPL bra4_803B
		bra4_8036:
			LDA objYHi,X ; unlogged
			SBC #$00 ; unlogged
		bra4_803B:
			STA objYHi,X		
			JSR sub3_B057
			BNE bra4_806F_RTS
			LDY #$00
			LDA ($32),Y ; Get horizontal vector for charging chuck
			TAY
			LDA objFlags,X
			AND #OBJFLAG_HORIZ
			BEQ bra4_8054
			; Invert horizontal vector if at a right wall
				TYA
				EOR #$FF
				TAY
				INY
			
		; Apply adjusted vector
		bra4_8054:
			TYA
			PHA
			CLC
			ADC objXLo,X
			STA objXLo,X
			PLA
			BMI bra4_8067
			LDA objXHi,X
			ADC #$00
			BPL bra4_806C
		bra4_8067:
			LDA objXHi,X
			SBC #$00
		bra4_806C:
			STA objXHi,X
		bra4_806F_RTS:
			RTS

		; If standing on solid ground
		bra4_8070:
			LDA $AA
			AND #$0F
			STA $25
			LDX $A4
			LDA objYLo,X
			SEC
			SBC $25
			BCS bra4_8086
			DEC objYHi,X ; unlogged
			SEC ; unlogged
			SBC #$10 ; unlogged
		bra4_8086:
			STA objYLo,X
			LDA objFlags,X
			AND #$C0
			STA objFlags,X
			LDA objVar,X
			AND #$80
			STA objVar,X
			RTS

	; If moving upwards
	loc4_809A:
		INY
		LDA ($32),Y
		BMI bra4_80B8
		JSR sub3_B077
		BNE bra4_80B8 ; The Chuck probably isn't moving down if it's standing on something
		; If it should be moving down
			LDA objFlags,X
			ORA #OBJFLAG_VERT
			STA objFlags,X
			STA objFlags,X ; Chuck should be moving down
			LDA objVar,X
			AND #%10000000
			STA objVar,X ; Restart movement vectors
			RTS

		; If actually moving up
		bra4_80B8:
			DEY
			JSR sub3_B057
			BEQ bra4_80C2
				INY
				JMP loc4_80F0
		
			; Only move horizontally if not blocked by wall
			bra4_80C2:
				LDA objFlags,X
				AND #OBJFLAG_HORIZ
				BEQ bra4_80D3
				; Invert horizontal movement vector if facing left
					LDA ($32),Y
					EOR #$FF
					CLC
					ADC #$01
					JMP loc4_80D5
			bra4_80D3:
				LDA ($32),Y
			loc4_80D5:
				PHA
				CLC
				ADC objXLo,X
				STA objXLo,X
				PLA
				BMI bra4_80E7
				LDA objXHi,X
				ADC #$00
				BPL bra4_80EC
			bra4_80E7:
				LDA objXHi,X
				SBC #$00
			bra4_80EC:
				STA objXHi,X
				INY

		; Apply vertical vector
		loc4_80F0:
			LDA ($32),Y
			PHA
			CLC
			ADC objYLo,X
			STA objYLo,X
			PLA
			BMI bra4_8104
			LDA objYHi,X
			ADC #$00
			BPL bra4_8109
		bra4_8104:
			LDA objYHi,X
			SBC #$00
		bra4_8109:
			STA objYHi,X
			INY
			LDA ($32),Y
			CMP #$FF
			BNE bra4_811E
			; Turn around if next vector is negative?
				LDA objFlags,X
				EOR #OBJFLAG_HORIZ
				STA objFlags,X
				JMP loc4_813C

			; Parse movement data jump commands?
			bra4_811E:
				AND #%11110000
				BEQ loc4_813C
					LDA ($32),Y
					AND #%00111111
					BNE bra4_8131
						LDA objVar,X
						AND #%10000000
						STA objVar,X
						RTS
				
				bra4_8131:
					STA $32
					LDA objVar,X
					SEC
					SBC $32
					STA objVar,X

		loc4_813C:
			INC objVar,X
			RTS

; Parses movement data for every Chargin' Chuck object or projectile except for the chasing Chargin' Chuck
.export sub4_8140
sub4_8140:
	LDX $A4
	LDA objVar,X
	AND #%01111111
	ASL
	TAY
	LDA objFlags,X
	AND #OBJFLAG_VERT
	BNE bra4_8153
	JMP loc4_81D1

	; When Chargin' Chuck is moving downwards
	bra4_8153:
		JSR sub3_B077
		BNE bra4_81B8
			LDA objVar,X
			AND #%01111111
			CMP #$07 ; Maximum speed
			BCS bra4_8164
				INC objVar,X ; Accelerate the object's vertical speed
		bra4_8164:
			PHA
			CLC
			ADC objYLo,X
			STA objYLo,X ; Apply speed to object's position
			PLA
			; Handle signed speed values
			BMI bra4_8176
				LDA objYHi,X
				ADC #0
				BPL bra4_817B
			bra4_8176:
				LDA objYHi,X
				SBC #0
		
		bra4_817B:
			STA objYHi,X
			JSR sub3_B057
			BEQ bra4_818B
			LDA objFlags,X
			EOR #$40
			STA objFlags,X

		bra4_818B:
			LDY #$00
			LDA ($32),Y
			TAY
			LDA objFlags,X
			AND #%01000000
			BEQ bra4_819C
			TYA
			EOR #$FF
			TAY
			INY

		bra4_819C:
			TYA
			PHA
			CLC
			ADC objXLo,X
			STA objXLo,X
			PLA
			BMI bra4_81AF
			LDA objXHi,X
			ADC #$00
			BPL bra4_81B4

		bra4_81AF:
			LDA objXHi,X
			SBC #$00

		bra4_81B4:
			STA objXHi,X
			RTS

		bra4_81B8:
			LDA objYLo,X
			AND #%11111000
			STA objYLo,X
			LDA objFlags,X
			AND #%11000000
			STA objFlags,X
			LDA objVar,X
			AND #$80
			STA objVar,X
			RTS

	; When Chargin' Chuck isn't falling
	loc4_81D1:
		INY
		LDA ($32),Y ; Get vertical movement vector
		BMI bra4_81EC
		JSR sub3_B077
		BNE bra4_81EC ; Ignore downwards speed if the chuck is standing on solid ground
		; Chuck has started falling down
			LDA objFlags,X
			ORA #OBJFLAG_VERT
			STA objFlags,X ; Make the chuck move down
			LDA objVar,X
			AND #%10000000
			STA objVar,X ; Reset the chuck's movement
			RTS

		; Chuck hasn't started falling down
		bra4_81EC:
			DEY
			JSR sub3_B057
			BEQ bra4_81FA
				LDA objFlags,X
				EOR #OBJFLAG_HORIZ
				STA objFlags,X ; Turn the chuck around if it hits a wall

		; Invert vector if needed
		bra4_81FA:
			LDA objFlags,X
			AND #OBJFLAG_HORIZ
			BEQ bra4_820B
				LDA ($32),Y
				EOR #%11111111
				CLC
				ADC #1 ; Invert horizontal vector if the chuck is moving left
				JMP loc4_820D

			bra4_820B:
				LDA ($32),Y

		; Apply horizontal vector
		loc4_820D:
			PHA
			CLC
			ADC objXLo,X
			STA objXLo,X
			PLA
			BMI bra4_821F
				LDA objXHi,X
				ADC #0
				BPL bra4_8224 ; Positive carry
			bra4_821F:
				LDA objXHi,X
				SBC #0 ; Negative borrow

		; Apply vertical vector
		bra4_8224:
			STA objXHi,X
			INY
			LDA ($32),Y
			PHA
			CLC
			ADC objYLo,X
			STA objYLo,X
			PLA
			BMI bra4_823C
				LDA objYHi,X
				ADC #0
				BPL bra4_8241 ; Positive carry
			bra4_823C:
				LDA objYHi,X
				SBC #0 ; Negative borrow

		bra4_8241:
			STA objYHi,X
			INY
			LDA ($32),Y
			CMP #$FF
			BNE bra4_8256
				LDA objFlags,X
				EOR #OBJFLAG_HORIZ
				STA objFlags,X
				JMP loc4_8274

			bra4_8256:
				AND #%11110000
				BEQ loc4_8274
					LDA ($32),Y
					AND #%00111111
					BNE bra4_8269
					; Loop to the first vector if the value is 0
						LDA objVar,X
						AND #%10000000
						STA objVar,X
						RTS

					; Go back the specified amount of vectors
					bra4_8269:
						STA $32
						LDA objVar,X
						SEC
						SBC $32
						STA objVar,X

		loc4_8274:
			INC objVar,X
			RTS
