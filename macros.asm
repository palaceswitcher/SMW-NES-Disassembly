macro movedata x,y
	db x, y
endm

;Instrument RLE commands
macro instrle vol,len
	db len, vol
endm
macro dutyrle duty,len
	db len, duty<<6
endm
macro instjump loc,ofs
	ifndef ofs
		ofs = 0 ;Default offset
	endif
	d = loc-$ ;Distance
	db $FF
	db <d+ofs
endm

;Sound commands
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

;Channel pointers
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