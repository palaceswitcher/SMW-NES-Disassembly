;----------------------------------------
; OBJECT MACROS

; Calculate the distance between the object and the player
macro Obj_DistCalc start
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28

	BEQ @CalcVertDist ; Continue if the player is to the left of the object (within one screen)
	CMP #$FF
	BEQ @CalcVertDist ; Continue if the player is to the right of the object (within one screne)
		JMP Obj_RemoveObject ; Otherwise, remove the off-screen object

; Calculate vertical distance between the player and object
@CalcVertDist:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X ; Get object's vertical distance from player
	LDA playerYHiDup
	CMP objYHi,X
	BEQ @CheckIfFrozen ; Branch if the object and player are on the same vertical screen
	LDA objYDistHi,X
	BPL @OffsetObjDistance ; Branch if the player is on a higher vertical screen than the object
	; Add 16 to the object's vertical distance if they're below the object
		LDA objYDistLo,X
		CLC
		ADC #16
		STA objYDistLo,X ; Increase the vertical distance value by 16
		LDA objYDistHi,X
		ADC #$00
		STA objYDistHi,X ; Increase the vertical screen distance if needed
		JMP @CheckIfFrozen

	; Subtract the object's vertical distance by 16 if they're above the object
	@OffsetObjDistance:
		LDA objYDistLo,X
		SEC
		SBC #16
		STA objYDistLo,X
		LDA objYDistHi,X
		SBC #$00
		STA objYDistHi,X

@CheckIfFrozen:
	LDA freezeFlag
	BEQ start ; Only continue if the game isn't frozen
	RTS
endm

; Vertically offsets an object
macro Obj_VertOffset ofs,stop
	LDA #ofs
	BMI bra8_8147 ; Redundant branch (16 isn't negative)
	CLC
	ADC objYLo,X
	STA objYLo,X ; Position the object 16 pixels lower
	BCS bra8_813B ; Add 16 if the vertical screen is crossed
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
	db >x, <x
endm

macro sprmap w,h,bank
	db w>>3, h>>3
	ifdef bank
		db bank
	endif
endm

; Player title action trigger
macro titleact x,action,dur
	dwb x
	db action, dur
endm
; Title screen sprite animation data
macro titlespr x,y,frame
	dwb x
	db frame, y
endm

; Movement data
macro movedata x,y
	db x, y
endm

; Instrument RLE commands
macro instrle vol,len
	db len, vol
endm
macro dutyrle duty,len
	db len, duty<<6
endm
macro instjump loc,ofs
	ifndef ofs
		ofs = 0 ; Default offset
	endif
	d = loc-$ ; Distance
	db $FF
	db <d+ofs
endm

; Sound commands
macro notelen x
	db $80+x
endm
macro sndjump x
	db $F4
	dw x
endm
macro playsegment x
	db $F0
	dw x
endm
macro endsegment
	db $F1, $FF
endm
macro sndspeed x
	db $F5, x
endm

macro transpose x
	db $F6, x
endm

macro volenv x
	db $F8, x
endm

macro duty x
	db $F9, x
endm

macro pitch x
	db $FA, x
endm

; Channel pointers
macro mussq1 x
	db 0
	dw x
endm
macro mussq2 x
	db 1
	dw x
endm
macro mustri x
	db 2
	dw x
endm
macro musnoise x
	db 3
	dw x
endm
macro musdpcm x
	db 4
	dw x
endm
macro sfxsq1 x
	db $80
	dw x
endm
macro sfxsq2 x
	db $81
	dw x
endm
macro sfxtri x
	db $82
	dw x
endm
macro sfxnoise x
	db $83
	dw x
endm
macro sfxdpcm x
	db $84
	dw x
endm
