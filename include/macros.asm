.ifndef MACROS_
MACROS_ = 1
;----------------------------------------
; OBJECT MACROS

; Calculate the distance between the object and the player
.macro objDistCalc start
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28

	BEQ @calcVertDist ; Continue if the player is to the left of the object (within one screen)
	CMP #$FF
	BEQ @calcVertDist ; Continue if the player is to the right of the object (within one screne)
		JMP objRemoveObject ; Otherwise, remove the off-screen object

; Calculate vertical distance between the player and object
@calcVertDist:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X ; Get object's vertical distance from player
	LDA playerYHiDup
	CMP objYHi,X
	BEQ @checkIfFrozen ; Branch if the object and player are on the same vertical screen
	LDA objYDistHi,X
	BPL @offsetObjDistance ; Branch if the player is on a higher vertical screen than the object
	; Add 16 to the object's vertical distance if they're below the object
		LDA objYDistLo,X
		CLC
		ADC #16
		STA objYDistLo,X ; Increase the vertical distance value by 16
		LDA objYDistHi,X
		ADC #$00
		STA objYDistHi,X ; Increase the vertical screen distance if needed
		JMP @checkIfFrozen

	; Subtract the object's vertical distance by 16 if they're above the object
	@offsetObjDistance:
		LDA objYDistLo,X
		SEC
		SBC #16
		STA objYDistLo,X
		LDA objYDistHi,X
		SBC #$00
		STA objYDistHi,X

@checkIfFrozen:
	LDA freezeFlag
	BEQ start ; Only continue if the game isn't frozen
	RTS
.endmacro

; Vertically offsets an object
.macro objVertOffset ofs,stop
	LDA #ofs
	BMI @bra8_8147 ; Redundant branch (16 isn't negative)
		CLC
		ADC objYLo,X
		STA objYLo,X ; Position the object 16 pixels lower
		BCS @bra8_813B
			CMP #256-ofs
			BCC stop ; Branch if it spawns more than 16 pixels below the screen boundary
		; Add 16 to the object's vertical position if it crosses a vertical screen boundary and doesn't carry over
		@bra8_813B:
			CLC
			ADC #ofs
			STA objYLo,X
			INC objYHi,X ; Add 16 to vertical position (assuming carry over)
			JMP stop

	; Subtracts 16 from the object's vertical position, goes unused
	@bra8_8147:
		CLC
		ADC objYLo,X
		STA objYLo,X ; Add negative vertical offset
		BCS stop
		SEC
		SBC #ofs
		STA objYLo,X ; Subtract 16 if it crosses the vertical screen barrier
		DEC objYHi,X ; Borrow from high byte if needed
.endmacro

; Big endian word
.macro dwb w
	.byte >w, <w
.endmacro

.macro sprmap w,h,bank
	.byte w>>3, h>>3
	.ifnblank bank
		.byte bank
	.endif
.endmacro

; Player title action trigger
.macro titleact xpos,action,dur
	dwb xpos
	.byte action, dur
.endmacro
; Title screen sprite animation data
.macro titlespr xpos,ypos,frame
	dwb xpos
	.byte frame, ypos
.endmacro

; Spawn data
.macro spawndata xpos,ypos,xscreens,yscreens,xlock,ylock
	.byte >xpos, >ypos, <xpos, <ypos, xlock, xscreens, ylock, yscreens
.endmacro

; Instrument RLE commands
.macro instrle vol,len
	.byte len, vol
.endmacro
.macro dutyrle duty,len
	.byte len, duty<<6
.endmacro
.macro instjump loc,ofs
	.scope
		d = loc-* ; Distance
		.ifblank ofs
			jofs = 0
		.else
			jofs = ofs
		.endif
		.byte $FF
		.byte <(d+jofs)
	.endscope
.endmacro

; Sound commands
.macro notelen n
	.byte $80+n
.endmacro
.macro sndjump n
	.byte $F4
	.word n
.endmacro
.macro playsegment n
	.byte $F0
	.word n
.endmacro
.macro endsegment
	.byte $F1, $FF
.endmacro
.macro sndspeed n
	.byte $F5, n
.endmacro

.macro transpose n
	.byte $F6, n
.endmacro

.macro volenv n
	.byte $F8, n
.endmacro

.macro duty n
	.byte $F9, n
.endmacro

.macro pitch n
	.byte $FA, n
.endmacro

; Channel pointers
.macro mussq1 n
	.byte 0
	.word n
.endmacro
.macro mussq2 n
	.byte 1
	.word n
.endmacro
.macro mustri n
	.byte 2
	.word n
.endmacro
.macro musnoise n
	.byte 3
	.word n
.endmacro
.macro musdpcm n
	.byte 4
	.word n
.endmacro
.macro sfxsq1 n
	.byte $80
	.word n
.endmacro
.macro sfxsq2 n
	.byte $81
	.word n
.endmacro
.macro sfxtri n
	.byte $82
	.word n
.endmacro
.macro sfxnoise n
	.byte $83
	.word n
.endmacro
.macro sfxdpcm n
	.byte $84
	.word n
.endmacro

.endif
