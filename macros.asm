;----------------------------------------
; OBJECT MACROS

; Calculate the distance between the object and the player
macro objDistCalc start
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
endm

; Vertically offsets an object
macro objVertOffset ofs,stop
	LDA #ofs
	BMI bra8_8147 ; Redundant branch (16 isn't negative)
		CLC
		ADC objYLo,X
		STA objYLo,X ; Position the object 16 pixels lower
		BCS bra8_813B
			CMP #256-ofs
			BCC stop ; Branch if it spawns more than 16 pixels below the screen boundary
		; Add 16 to the object's vertical position if it crosses a vertical screen boundary and doesn't carry over
		bra8_813B:
			CLC
			ADC #ofs
			STA objYLo,X
			INC objYHi,X ; Add 16 to vertical position (assuming carry over)
			JMP stop

	; Subtracts 16 from the object's vertical position, goes unused
	bra8_8147:
		CLC
		ADC objYLo,X
		STA objYLo,X ; Add negative vertical offset
		BCS stop
		SEC
		SBC #ofs
		STA objYLo,X ; Subtract 16 if it crosses the vertical screen barrier
		DEC objYHi,X ; Borrow from high byte if needed
endm

; Big endian word
macro dwb x
	.byte >x, <x
endm

macro sprmap w,h,bank
	.byte w>>3, h>>3
	ifdef bank
		.byte bank
	endif
endm

; Player title action trigger
macro titleact x,action,dur
	dwb x
	.byte action, dur
endm
; Title screen sprite animation data
macro titlespr x,y,frame
	dwb x
	.byte frame, y
endm

; Movement data
macro movedata x,y
	.byte x, y
endm

; Spawn data
macro spawndata x,y,xscreens,yscreens,xlock,ylock
	.byte >x, >y, <x, <y, xlock, xscreens, ylock, yscreens
endm

; Instrument RLE commands
macro instrle vol,len
	.byte len, vol
endm
macro dutyrle duty,len
	.byte len, duty<<6
endm
macro instjump loc,ofs
	ifndef ofs
		ofs = 0 ; Default offset
	endif
	d = loc-$ ; Distance
	.byte $FF
	.byte <d+ofs
endm

; Sound commands
macro notelen x
	.byte $80+x
endm
macro sndjump x
	.byte $F4
	.word x
endm
macro playsegment x
	.byte $F0
	.word x
endm
macro endsegment
	.byte $F1, $FF
endm
macro sndspeed x
	.byte $F5, x
endm

macro transpose x
	.byte $F6, x
endm

macro volenv x
	.byte $F8, x
endm

macro duty x
	.byte $F9, x
endm

macro pitch x
	.byte $FA, x
endm

; Channel pointers
macro mussq1 x
	.byte 0
	.word x
endm
macro mussq2 x
	.byte 1
	.word x
endm
macro mustri x
	.byte 2
	.word x
endm
macro musnoise x
	.byte 3
	.word x
endm
macro musdpcm x
	.byte 4
	.word x
endm
macro sfxsq1 x
	.byte $80
	.word x
endm
macro sfxsq2 x
	.byte $81
	.word x
endm
macro sfxtri x
	.byte $82
	.word x
endm
macro sfxnoise x
	.byte $83
	.word x
endm
macro sfxdpcm x
	.byte $84
	.word x
endm
