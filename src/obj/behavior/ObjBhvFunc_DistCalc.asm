.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; Encapsulates the distance calculation micro in a subroutine to ignore the freeze flag
.export sub7_8F50
sub7_8F50:
	objDistCalc bra7_8FB4_RTS

bra7_8FB4_RTS:
	RTS
