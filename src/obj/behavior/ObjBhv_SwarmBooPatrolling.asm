.segment "PRG48"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xDA
obj0xDA:
	LDX $A4 ; Get object index
	LDA objVar,X
	CMP #$80
	BEQ bra4_9691 ; Branch if variable is $80? This never seems to occur in-game
	JMP loc4_9703
bra4_9691:
; Boo X position - player X position = horizontal distance between Boo and player
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28 ; Backup X screen distance?

	BEQ bra4_96AD ; Branch if the player and Boo are on the screen
	CMP #$FF
	BEQ bra4_96AD ; Branch if the Boo is within one screen behind the player
	JMP objRemoveObject ; Otherwise, unload the boo if it's ahead of the player
bra4_96AD:
; Boo Y position - player Y position = vertical distance between Boo and player
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X

	LDA playerYHiDup
	CMP objYHi,X
	BEQ loc4_96EF ; Branch if the player and boo are on the same vertical screen
	LDA objYDistHi,X
	BPL bra4_96DE ; Branch if the Boo is ahead of the player

; Otherwise, if the Boo is behind the player, subtract 16 pixels from the distance between it and the player
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	
	JMP loc4_96EF
bra4_96DE:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
loc4_96EF:
	LDA freezeFlag
	BEQ bra4_96F5 ; Only continue if the game isn't frozen
	RTS ; Stop if it is frozen
bra4_96F5:
	JSR objFacePlayer
	LDA $A4
	AND #$03 ; Mask out lower 2 bits of current object index
	ORA objFlags,X
	STA objFlags,X
	RTS

loc4_9703:
	JSR sub4_976B
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X
	STA $28
	BEQ bra4_9722
	CMP #$FF
	BEQ bra4_9722
	JMP objRemoveObject
bra4_9722:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra4_9764
	LDA objYDistHi,X
	BPL bra4_9753
	LDA objYDistLo,X
	CLC
	ADC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	ADC #$00
	STA objYDistHi,X
	JMP loc4_9764
bra4_9753:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra4_9764:
loc4_9764:
	LDA freezeFlag
	BEQ bra4_976A_RTS
	RTS ; unlogged
bra4_976A_RTS:
	RTS
sub4_976B:
	LDA objFrameCount
	AND #$04
	BNE bra4_9783 ; Branch if not on a 4th frame
	LDA #$89
	ASL
	TAY
	LDA tbl4_9A83,Y
	STA $32
	LDA tbl4_9A83+1,Y
	STA $33
	JSR getSpeedData
bra4_9783:
	LDA objFlags,X
	AND #$40
	BNE bra4_97A7 ; Branch if Boo is already facing left
	LDA objXDistHi,X
	BMI bra4_97A4 ; Branch if Boo is behind the player
	LDA objXDistLo,X
	CMP #$43
	BCC bra4_97A4 ; Branch if the Boo is within 67 ($43) pixels ahead of the player
	LDA frameCount
	AND #$1F
	BNE bra4_97A4 ; Branch if not on a 32nd frame
	LDA objFlags,X 
	EOR #$40
	STA objFlags,X ; Turn Boo around
bra4_97A4:
	JMP loc4_97C1
bra4_97A7:
	LDA objXDistHi,X
	BPL loc4_97C1
	LDA objXDistLo,X
	CMP #$C6
	BCS loc4_97C1
	LDA frameCount
	AND #$7E
	BNE loc4_97C1 ; Continue every 2 frames for every 128 frames
	LDA objFlags,X
	EOR #$40
	STA objFlags,X ; Turn Boo around
loc4_97C1:
	LDA frameCount
	AND #$7F
	BNE bra4_97E7_RTS ; Only continue every 128th frame
	LDA objXDistHi,X
	EOR objFlags,X
	AND #$40
	BEQ bra4_97E7_RTS ; Stop if player is facing left?
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,X ; Turn Boo into Boo Crew Boo
	LDA #$00
	STA objVar,X ; Clear variable
	LDA objFlags,X
	AND #%11011111
	STA objFlags,X ; Mask out bit 5 of Boo's state
bra4_97E7_RTS:
	RTS
