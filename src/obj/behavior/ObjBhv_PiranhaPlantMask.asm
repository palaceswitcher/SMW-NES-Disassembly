.segment "PRG55"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

;----------------------------------------
; PIRANHA PLANT MASK OBJECT CODE ($88AB)
;----------------------------------------
.export obj0x1C
obj0x1C:
	LDX $A4
	objDistCalc bra8_8911_RTS

bra8_8911_RTS:
	; This object has no behavior
	RTS
.export ptr6_8912
ptr6_8912:
	; Unimplemented or empty function
	RTS
