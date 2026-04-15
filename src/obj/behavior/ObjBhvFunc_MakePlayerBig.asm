.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub7_9EE5
sub7_9EE5:
	LDA playerPowerup
	BNE bra7_9EF6_RTS ; Only do this if the player is small
	INC playerPowerup ; Make the player big
	LDA #$07
	STA gameState ; Update the player's sprite?
	LDA #$01
	STA playerPowerupBuffer ; Update the player's sprite
bra7_9EF6_RTS:
	RTS
