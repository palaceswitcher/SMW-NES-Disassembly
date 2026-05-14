.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x64
obj0x64:
	LDX $A4
	LDA objVar,X
	BMI bra6_97AE
	JMP loc6_9831
bra6_97AE:
	objDistCalc bra6_9812 ; Branch if the game currently isn't frozen

bra6_9812:
	LDA objSlot,X
	CMP #OBJ_PODOBOO_DIAG_BOSS
	BNE bra6_981E
		LDA #167
		STA chrSpriteBank2 ; Occupy the 2nd CHR slot if in a Lemmy or Wendy boss room
bra6_981E:
	LDA #$00
	STA objVar,X ; Clear any variables for the object
	LDY #$80 ; Load down-right direction
	LDA objXDistHi,X
	BMI bra6_982C ; Branch if the player is a screen or more ahead of it
	LDY #$C0 ; If the player isn't, load down-left direction
bra6_982C:
	TYA
	STA objState,X ; Store loaded direction
	RTS
loc6_9831:
	JSR sub6_92D0
	JSR sub6_9981
	BEQ bra6_9845
	CMP #$02
	BEQ bra6_9845
	LDA objState,X
	EOR #$40
	STA objState,X ; Horizontally flip the podoboo
bra6_9845:
	JSR sub6_9997
	BEQ bra6_9856
	CMP #$02
	BEQ bra6_9856
	LDA objState,X
	EOR #$80
	STA objState,X ; Vertically flip the podoboo
bra6_9856:
	LDA objState,X
	AND #$40 ; Get the horizontal direction of the podoboo
	BEQ bra6_9860 ; If it's facing right, branch
	JMP loc6_98EB ; If it's facing left, jump
bra6_9860:
	LDA #$01 ; Load speed value of 1
	PHA ; Store the value in the stack
	CLC
	ADC objXLo,X
	STA objXLo,X ; Add that speed value to the object's X position	
	PLA ; Load the previously stored speed value
	BMI bra6_9874 ; Branch if it's over 80h/negative
	LDA objXHi,X
	ADC #$00 ; Add (nothing?) to it's X screen value
	BPL bra6_9879 ; Branch if it's less than 80h/positive
bra6_9874:
	LDA objXHi,X
	SBC #$00 ; Subtract (nothing?) from it's X screen value
bra6_9879:
	STA objXHi,X
	LDA objState,X
	AND #$80 ; Get the vertical diagonal of the podoboo
	BNE bra6_98B7 ; If facing up, branch
	LDA #$FF
	BMI bra6_98A0 ; If facing down, load speed value of -1 and branch
	CLC ; unused
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9894
	CMP #$F0
	BCC bra6_98B2
bra6_9894: ; unused
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP bra6_98B2
bra6_98A0:
	CLC
	ADC objYLo,X
	STA objYLo,X ; Add loaded speed value to it's Y position
	BCS bra6_98B2
	SEC
	SBC #$10
	STA objYLo,X ; Move the podoboo down 16 units
	DEC objYHi,X ; Move it to the lower horizontal screen
bra6_98B2:
	LDY #$34 ; Load animation frame 34h
	JMP loc6_9972 ; Jump
bra6_98B7:
	LDA #$01
	BMI bra6_98D4
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_98C8
	CMP #$F0
	BCC bra6_98E6
bra6_98C8:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc6_98E6
bra6_98D4:
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra6_98E6 ; unlogged
	SEC ; unlogged
	SBC #$10 ; unlogged
	STA objYLo,X ; unlogged
	DEC objYHi,X ; unlogged
bra6_98E6:
loc6_98E6:
	LDY #$B6
	JMP loc6_9972
loc6_98EB:
	LDA #$FF
	PHA
	CLC
	ADC objXLo,X
	STA objXLo,X
	PLA
	BMI bra6_98FF
	LDA objXHi,X ; unlogged
	ADC #$00 ; unlogged
	BPL bra6_9904 ; unlogged
bra6_98FF:
	LDA objXHi,X
	SBC #$00
bra6_9904:
	STA objXHi,X
	LDA objState,X
	AND #$80
	BNE bra6_9941
	LDA #$FF
	BMI bra6_992B
	CLC ; unlogged
	ADC objYLo,X ; unlogged
	STA objYLo,X ; unlogged
	BCS bra6_991F ; unlogged
	CMP #$F0 ; unlogged
	BCC bra6_993D ; unlogged
bra6_991F:
	CLC ; unlogged
	ADC #$10 ; unlogged
	STA objYLo,X ; unlogged
	INC objYHi,X ; unlogged
	JMP bra6_993D ; unlogged
bra6_992B:
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_993D
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra6_993D:
	LDY #$74
	BNE bra6_9972
bra6_9941:
	LDA #$01
	BMI bra6_995E
	CLC
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9952
	CMP #$F0
	BCC bra6_9970
bra6_9952:
	CLC
	ADC #$10
	STA objYLo,X
	INC objYHi,X
	JMP loc6_9970
bra6_995E:
	CLC ; unlogged routine
	ADC objYLo,X
	STA objYLo,X
	BCS bra6_9970
	SEC
	SBC #$10
	STA objYLo,X
	DEC objYHi,X
bra6_9970:
loc6_9970:
	LDY #$F6
bra6_9972:
loc6_9972:
	LDA objFrameCount
	AND #$04 ; Set frequency to 4 frames using a bitmask
	BEQ bra6_997A ; If the bits are masked out, use the 1st sprite and branch
	INY ; Otherwise, continue and go to the 2nd podoboo sprite
bra6_997A:
	TYA
	STA enemyAnimFrame,X ; Store loaded podoboo sprite
	JMP sub6_9BEA ; Jump
sub6_9981:
	STY $2B
	LDA objState,X
	AND #$40
	BEQ bra6_998E
	LDA #$00
	BEQ bra6_9990
bra6_998E:
	LDA #$10
bra6_9990:
	STA $36
	LDA #$08
	JMP loc3_B08D
sub6_9997:
	STY $2B
	LDA #$08
	STA $36
	LDA objState,X
	AND #$80
	BEQ bra6_99A6
	LDA #$10
bra6_99A6:
	JMP loc3_B08D
