.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x24
obj0x24:
	LDX objLowerSlot ; Get the index for the current object slot
	LDA objFlags,X
	CMP #$04
	BCS bra8_8BB3
	LDA objFrameCount
	AND #$07
	BNE bra8_8BB3 ; Increment the object's timer every 8th frame
	LDA objVar,X
	CMP #$1F
	BCC bra8_8BA9
	LDA #$00
	STA objVar,X ; Clear the lotus timer if it goes above #$1F
	BEQ bra8_8BB3
bra8_8BA9:
	CMP #$04
	BNE bra8_8BB0 ; Continue each time the timer is at 4. 8 frames x 32 ticks = 256 frames (~4s NTSC)
	JSR spawnLotusPollen ; Spawns 4 seeds when the timer is at 4
bra8_8BB0:
	INC objVar,X ; Increments lotus timer
bra8_8BB3:
	LDA #$06
	STA $25
	LDX objLowerSlot
	LDA objXLo,X
	SEC
	SBC playerXLoDup
	STA objXDistLo,X ; Calculate x distance from player
	LDA objXHi,X
	SBC playerXHiDup
	STA objXDistHi,X ; Calculate x screen distance from player
	STA $28
	BEQ bra8_8BD5
	CMP #$FF
	BEQ bra8_8BD5
	JMP objRemoveObject
bra8_8BD5:
	LDA objYLo,X
	SEC
	SBC playerYLoDup
	STA objYDistLo,X
	LDA objYHi,X
	SBC playerYHiDup
	STA objYDistHi,X
	LDA playerYHiDup
	CMP objYHi,X
	BEQ bra8_8C17
	LDA objYDistHi,X
	BPL bra8_8C06
	LDA objYDistLo,X ; unlogged
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYDistLo,X ; unlogged
	LDA objYDistHi,X ; unlogged
	ADC #$00 ; unlogged
	STA objYDistHi,X ; unlogged
	JMP loc8_8C17 ; unlogged
bra8_8C06:
	LDA objYDistLo,X
	SEC
	SBC #$10
	STA objYDistLo,X
	LDA objYDistHi,X
	SBC #$00
	STA objYDistHi,X
bra8_8C17:
loc8_8C17:
	LDA freezeFlag
	BEQ bra8_8C1D
	RTS ; unlogged
bra8_8C1D:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl8_8C31,Y
	STA $32
	LDA tbl8_8C31+1,Y
	STA $33
	JMP ($32)
tbl8_8C31:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr3_8C3B
	.word ptr3_8C48
ptr3_8C3B:
	JSR objCapeHitCheck
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	JSR jmp_54_BF74
	RTS
ptr3_8C48:
	LDA #$0F
	STA objSlot,X
	LDA #$00
	STA objFlags,X
	RTS
;-----
	
spawnLotusPollen:
	LDY objCount ; Load index for starting pollen slot
	INC objCount
	INC objCount
	INC objCount
	INC objCount ; Update the object count
	LDA objXLo,X
	CLC
	ADC #$0C
	STA objXLo,Y
	STA objXLo+1,Y
	STA objXLo+2,Y
	STA objXLo+3,Y ; Spawn the pollen pellets 12 x pixels from the base of the lotus
	LDA objXHi,X
	STA objXHi,Y 
	STA objXHi+1,Y
	STA objXHi+2,Y
	STA objXHi+3,Y ; Spawn them on the same screen as the lotus
	LDA objYLo,X
	STA objYLo,Y
	STA objYLo+1,Y
	STA objYLo+2,Y
	STA objYLo+3,Y ; Spawn them on the same y position as the lotus
	LDA objYHi,X
	STA objYHi,Y
	STA objYHi+1,Y
	STA objYHi+2,Y
	STA objYHi+3,Y ; Spawn them on the same y screen as the lotus
	
; This piece of code moves two object IDs up by two starting form 24, which spawns in each pollen pellet in order
	LDA objSlot,X
	CLC
	ADC #$02
	STA objSlot,Y
	CLC
	ADC #$02
	STA objSlot+1,Y
	CLC
	ADC #$02
	STA objSlot+2,Y
	CLC
	ADC #$02
	STA objSlot+3,Y
;-----
; Initialize the pellet variables
	LDA #$00
	STA objFlags,Y
	STA objFlags+1,Y
	STA objFlags+2,Y
	STA objFlags+3,Y
	STA objVar,Y
	STA $0579,Y
	STA $057A,Y
	STA $057B,Y
	STA objState,Y
	STA objState+1,Y
	STA objState+2,Y
	STA objState+3,Y
	RTS
;----- (Stops)
