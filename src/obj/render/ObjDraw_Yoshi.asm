.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; SUBROUTINE ($827C)
;----------------------------------------
.export sub_53_827C
sub_53_827C:
	LDA yoshiXDistHi
	BEQ bra7_8286 ; Continue if the player is to the left of Yoshi (within one screen)
	CMP #$FF
	BEQ bra7_8286 ; Continue if the player is to the right of Yoshi (within one screen)
	RTS

bra7_8286:
	LDA yoshiUnmountedState
	BNE bra7_828C ; Continue if Yoshi isn't mounted
	RTS

bra7_828C:
	LDA yoshiAnim
	ASL
	TAX ; Get index for Yoshi's animation
	LDA tbl7_82A2,X
	STA $32
	LDA tbl7_82A2+1,X
	STA $33
	LDA #$40
	STA $36 ; Use bank 2
	JMP jmp_52_A463
tbl7_82A2:
	.word ofs_82BA ; Baby
	.word ofs_82C5 ; Baby (Growing)
	.word ofs_82D0 ; Ducking
	.word ofs_82E3 ; Standing
	.word ofs_82F6 ; Mouth Open
	.word ofs_8309 ; Running
	.word ofs_831C
	.word ofs_832F ; Running (Flinching)
	.word ofs_8342
	.word ofs_8355 ; Idle w/ item
	.word ofs_8368 ; Running w/ item
	.word ofs_837B
ofs_82BA:
	.byte $02
	.byte $04
	.byte $90
	.byte $FF, $FF
	.byte $FF, $FF
	.byte $37, $38
	.byte $39, $3A
ofs_82C5:
	.byte $02
	.byte $04
	.byte $90
	.byte $FF, $FF
	.byte $FF, $FF
	.byte $2B, $2C
	.byte $2D, $2E
ofs_82D0:
	.byte $04
	.byte $04
	.byte $92
	.byte $FF, $FF, $FF, $FF
	.byte $FF, $B1, $B2, $FF
	.byte $B3, $B4, $B5, $B6
	.byte $FF, $B7, $AF, $B0
ofs_82E3:
	.byte $04
	.byte $04
	.byte $92
	.byte $FF, $B8, $B9, $FF
	.byte $BA, $BB, $AB, $FF
	.byte $FF, $AC, $AD, $AE
	.byte $FF, $FF, $AF, $B0
ofs_82F6:
	.byte $04
	.byte $04
	.byte $A0
	.byte $FF, $2B, $2C, $FF
	.byte $2D, $2E, $2F, $FF
	.byte $FF, $30, $31, $32
	.byte $FF, $FF, $33, $34
ofs_8309:
	.byte $04
	.byte $04
	.byte $91
	.byte $FF, $76, $77, $FF
	.byte $78, $79, $7A, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
ofs_831C:
	.byte $04
	.byte $04
	.byte $93
	.byte $FF, $F8, $F9, $FF
	.byte $FA, $FB, $EB, $FF
	.byte $FF, $EC, $ED, $EE
	.byte $FF, $FF, $EF, $F0
ofs_832F:
	.byte $04
	.byte $04
	.byte $91
	.byte $71, $72, $73, $FF
	.byte $FF, $74, $75, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
ofs_8342:
	.byte $04
	.byte $04
	.byte $93
	.byte $F1, $F2, $F3, $FF
	.byte $F4, $F5, $F6, $FF
	.byte $FF, $FF, $F7, $EE
	.byte $FF, $FF, $EF, $F0
ofs_8355:
	.byte $04
	.byte $04
	.byte $A0
	.byte $FF, $36, $37, $FF
	.byte $38, $39, $3A, $FF
	.byte $FF, $3B, $3C, $3D
	.byte $FF, $FF, $3F, $35
ofs_8368:
	.byte $04
	.byte $04
	.byte $A3
	.byte $FF, $FA, $F9, $FF
	.byte $FF, $FB, $FC, $FF
	.byte $FF, $FD, $FE, $EB
	.byte $FF, $FF, $F4, $F3
ofs_837B:
	.byte $04
	.byte $04
	.byte $9B
	.byte $F7, $F8, $F9, $FF
	.byte $FA, $FB, $FC, $FF
	.byte $FF, $FF, $FD, $F2
	.byte $FF, $FF, $EB, $F5
