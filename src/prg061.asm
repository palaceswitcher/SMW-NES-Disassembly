.segment "PRG61"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

; Quick lookup table for (A >> 2) & 0b00000111
addrToAttrIndexLo:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F

addrToAttrIndexHi:
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $00
	.byte $10
	.byte $20
	.byte $30
	.byte $40
	.byte $50
	.byte $60
	.byte $70
	.byte $40
	.byte $50
	.byte $60
	.byte $70

tbl6_A200:
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $03
	.byte $03
	.byte $0C
	.byte $0C
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0
	.byte $30
	.byte $30
	.byte $C0
	.byte $C0

	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $10
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $11
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $12
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $13
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $14
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $15
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $16
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $17
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $18
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $19
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1A
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1B
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1C
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1D
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1E
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $1F
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $40
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $60
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $A0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $C0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $E0
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $20
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $21
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $22
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23
	.byte $23

;----------------------------------------
; SUBROUTINE ($A600)
;----------------------------------------
.proc sub6_A600
metatileIndex = $2B ; The metatile index relative to the screen
pScreenPtr = $32

	LDY metatileIndex
	LDA (pScreenPtr),Y
	BNE bra6_A607
		RTS

	bra6_A607:
		STA $3E
		TYA
		CLC
		ADC #$10
		STA $2C
		TAY
		LDA (pScreenPtr),Y
		CMP #$FF
		BEQ bra6_A683
		STA $3F
		LDX objCount
		LDA $3E
		ASL
		STA $058C,X
		TAY
		LDX tbl6_AA3A,Y
		LDA $03CE,X
		AND tbl6_AABA,Y
		BNE bra6_A683
		LDX objCount
		LDA $058C,X
		TAY
		LDX tbl6_AA3A,Y
		LDA $03CE,X
		ORA tbl6_AABA,Y
		STA $03CE,X
		LDA $3F
		AND #$0F
		TAY
		LDX objCount
		LDA (tilesetDataPtrs+12),Y
		STA objSlot,X
		TAY
		LDA tbl6_A728,Y
		STA objVar,X
		LDA #$00
		STA objYHi,X
		LDY $2C
		LDA (pScreenPtr),Y
		AND #$F0
		STA objYLo,X
		BEQ bra6_A664
		DEC objYLo,X
	bra6_A664:
		LDA pTilePosXLo
		AND #$F0
		STA objXLo,X
		LDA pTilePosXHi
		STA objXHi,X
		LDA #$00
		STA objFlags,X
		STA objStateTimer,X
		STA enemyAnimFrame,X
		STA objState,X
		JSR sub6_A705
		INC objCount
	bra6_A683:
		LDA metatileIndex
		CLC
		ADC #$20
		TAY
		STY $2C
		LDA (pScreenPtr),Y
		CMP #$FF
		BEQ bra6_A704_RTS
		STA $3F
		LDX objCount
		LDA $3E
		ASL
		STA $058C,X
		INC $058C,X
		LDA $058C,X
		TAY
		LDX tbl6_AA3A,Y
		LDA $03CE,X
		AND tbl6_AABA,Y
		BNE bra6_A704_RTS
		LDX objCount
		LDA $058C,X
		TAY
		LDX tbl6_AA3A,Y
		LDA $03CE,X
		ORA tbl6_AABA,Y
		STA $03CE,X
		LDA $3F
		AND #$0F
		TAY
		LDX objCount
		LDA (tilesetDataPtrs+12),Y
		STA objSlot,X
		TAY
		LDA tbl6_A728,Y
		STA objVar,X
		LDA #$01
		STA objYHi,X
		LDY $2C
		LDA (pScreenPtr),Y
		AND #$F0
		STA objYLo,X
		BEQ bra6_A6E5
		DEC objYLo,X
	bra6_A6E5:
		LDA pTilePosXLo
		AND #$F0
		STA objXLo,X
		LDA pTilePosXHi
		STA objXHi,X
		LDA #$00
		STA objFlags,X
		STA objStateTimer,X
		STA enemyAnimFrame,X
		STA objState,X
		JSR sub6_A705
		INC objCount
	bra6_A704_RTS:
		RTS
	sub6_A705:
		LDA objXLo,X
		SEC
		SBC playerXLoDup
		STA objXDistLo,X
		LDA objXHi,X
		SBC playerXHiDup
		STA objXDistHi,X
		LDA objYLo,X
		SEC
		SBC playerYLoDup
		STA objYDistLo,X
		LDA objYHi,X
		SBC playerYHiDup
		STA objYDistHi,X
		RTS
.endproc

tbl6_A728:
	.byte $00
	.byte $80
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $00
	.byte $00
	.byte $00
	.byte $F0
	.byte $F0
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $F0
	.byte $F0
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $F0
	.byte $F0
	.byte $80
	.byte $00
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80
	.byte $80

.export getEntitySetPtr
getEntitySetPtr:
	LDA worldNumber
	ASL
	TAX ; Get pointer index for current world
	LDA EntitySetPtrs,X
	STA lvlObjSetPtr
	LDA EntitySetPtrs+1,X
	STA lvlObjSetPtr+1 ; Get the entity set pointer for the current world
	LDA levelNumber
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC lvlObjSetPtr ; Offset it based on the current level
	STA lvlObjSetPtr
	BCC bra6_A847_RTS ; Check if the low byte overflows
	INC lvlObjSetPtr+1 ; If so, increment the high byte (16 bit addition)
bra6_A847_RTS:
	RTS
EntitySetPtrs:
	.word EntitySet_World1
	.word EntitySet_World2
	.word EntitySet_World3
	.word EntitySet_World4
	.word EntitySet_World5
	.word EntitySet_World6
	.word EntitySet_World7
	.word EntitySet_World8

.export BonusEntitySet
BonusEntitySet:
	.word BonusLevel_EntitySet ; (Also used for Yoshi's house)
EntitySet_World1:
	.byte OBJ_CHECKPOINT, 0, OBJ_UNSHELLEDKOOPA, OBJ_REX+1, OBJ_CHARGINCHUCK_CHASE, OBJ_PIRANHAPLANT, OBJ_MUSHROOM, OBJ_SHELL, OBJ_1UP_ALT, OBJ_FIREFLOWER, OBJ_PODOBOO_HORIZONTAL, OBJ_MUSHROOM_HIDDEN, OBJ_UNSHELLEDKOOPA_SLIDING, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_CHECKPOINT, OBJ_VINE+1, OBJ_SHELL, OBJ_MUSHROOM, OBJ_PIRANHAPLANT+1, OBJ_ITEMBOX_YOSHI, OBJ_KOOPA, OBJ_CHARGINCHUCK_CHASE+1, OBJ_PSWITCH_BOXED, OBJ_PARATROOPA_BOUNCING, OBJ_PARAGOOMBA, OBJ_PARACHUTEGOOMBA, OBJ_PSWITCHPLATFORM, OBJ_STAR, 0, OBJ_GOALTAPE+1
	.byte OBJ_CHECKPOINT, OBJ_SHORTPLATFORM+1, OBJ_SHORTPLATFORM, OBJ_KOOPA+1, OBJ_PARATROOPA_GREEN+1, OBJ_ITEMBOX_YOSHI, OBJ_FIREFLOWER, OBJ_MUSHROOM, 0, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_CHECKPOINT, OBJ_CLIMBINGKOOPA_HORIZONTAL, OBJ_CLIMBINGKOOPA_VERTICAL, OBJ_PODOBOO_VERTICAL+1, OBJ_THWOMP, OBJ_PODOBOO_DIAG+1, OBJ_MUSHROOM, 0, 0, 0, 0, 0, 0, 0, 0, OBJ_REZNOR

EntitySet_World2:
	.byte OBJ_CHECKPOINT, OBJ_SUPERKOOPA_CAPE, OBJ_SUPERKOOPA_JUMP, OBJ_SUPERKOOPA_ALT, OBJ_VOLCANOLOTUS+1, OBJ_PARATROOPA_BOUNCING, OBJ_PIRANHAPLANT, OBJ_ITEMBOX_YOSHI, OBJ_VINE, OBJ_BASEBALLCHUCK+1, OBJ_MUSHROOM_HIDDEN, OBJ_STAR, OBJ_PIPEEXIT, 0, 0, OBJ_GOALTAPE
	.byte OBJ_CHECKPOINT, OBJ_LINEPLATFORM, OBJ_LINEPLATFORM+1, OBJ_SHORTPLATFORM, OBJ_KOOPA+1, OBJ_PARATROOPA_GREEN+1, OBJ_FEATHER, OBJ_PARATROOPA_BOUNCING+1, OBJ_FUZZY, OBJ_ONOFFBLOCK, OBJ_VINE, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte 0, OBJ_BOOBUDDIESCENTER, OBJ_BOO, OBJ_BOOCREWBOO, OBJ_PSWITCH_BOXED, OBJ_PODOBOO_VERTICAL+1, OBJ_PODOBOO_DIAG, OBJ_1UP_ALT, OBJ_FIREFLOWER, OBJ_PSWITCHPLATFORM+2, OBJ_VINE+1, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_MORTONROY, OBJ_THWOMP, OBJ_NINJI, OBJ_PODOBOO_VERTICAL+1, OBJ_DRYBONES, OBJ_SPIKEBALL+1, OBJ_MUSHROOM, OBJ_FEATHER, OBJ_FIREFLOWER, OBJ_1UP_ALT, OBJ_PODOBOO_DIAG+1, OBJ_DRYBONES+1, OBJ_MUSHROOM_HIDDEN, OBJ_MUSHROOM_IDLE, 0, OBJ_GOALTAPE+1

EntitySet_World3:
	.byte OBJ_CHECKPOINT, OBJ_SPIKETOP, OBJ_SWOOPER+1, OBJ_BUZZYBEETLE, OBJ_SHELL, OBJ_MUSHROOM, OBJ_PARATROOPA_BOUNCING+1, OBJ_PIRANHAPLANT, OBJ_FOOTBALLCHUCK+1, OBJ_FIREFLOWER, OBJ_1UP_ALT, OBJ_MUSHROOM_HIDDEN, OBJ_BONUSBLOCK+5, 0, 0, OBJ_GOALTAPE
	.byte 0, OBJ_BLURP_VERTICAL, OBJ_BLURP_HORIZONTAL, OBJ_BLURP_ALT, OBJ_BLURPSTILL, OBJ_FIREFLOWER, OBJ_URCHIN_VERTICAL+1, OBJ_URCHIN_HORIZONTAL+1, OBJ_BONUSBLOCK+5, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte 0, OBJ_BOOBUDDIESCENTER, OBJ_BOO, OBJ_BOOCREWBOO, OBJ_EERIE, OBJ_PSWITCHPLATFORM+1, OBJ_PSWITCH, OBJ_1UP_ALT, OBJ_FIREFLOWER, OBJ_PSWITCHPLATFORM+2, OBJ_VINE+1, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_PODOBOO_DIAG_BOSS, OBJ_LEMMYWENDY, OBJ_SPIKETOP+1, OBJ_MUSHROOM, OBJ_PSWITCH, OBJ_PODOBOO_VERTICAL, OBJ_PODOBOO_DIAG, OBJ_DRYBONES+1, OBJ_MUSHROOM_IDLE, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1

EntitySet_World4:
	.byte OBJ_CHECKPOINT, OBJ_SUPERKOOPA_ALT, OBJ_SUPERKOOPA_STRAIGHT, OBJ_UNSHELLEDKOOPA+1, OBJ_SHELL, OBJ_FEATHER, OBJ_ITEMBOX_YOSHI, OBJ_PIPEEXIT, 0, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_CHECKPOINT, OBJ_SHORTPLATFORM+1, OBJ_ROPE+1, OBJ_ROPE_LONG, OBJ_CHAINSAW_DOWN+1, OBJ_CHAINSAW_UP_ALT+1, OBJ_CHAINSAW_UP+1, OBJ_FEATHER, OBJ_PIPEEXIT, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE
	.byte OBJ_CHECKPOINT, OBJ_UNSHELLEDKOOPA, OBJ_KOOPA, OBJ_CHARGINCHUCK_CHASE+1, OBJ_SHELL, OBJ_PIRANHAPLANT, OBJ_PIPEEXIT, OBJ_ITEMBOX_YOSHI, OBJ_FEATHER, OBJ_1UP_ALT, OBJ_MUSHROOM_HIDDEN, OBJ_PARATROOPA_BOUNCING+1, OBJ_VINE, OBJ_UNSHELLEDKOOPA_SLIDING, OBJ_UNSHELLEDKOOPA_SLIDING_ALT, OBJ_GOALTAPE
	.byte OBJ_CHECKPOINT, OBJ_BONYBEETLE+1, OBJ_FIREFLOWER, OBJ_SPIKEBALL, OBJ_CLIMBINGKOOPA_HORIZONTAL, OBJ_CLIMBINGKOOPA_VERTICAL, 0, OBJ_PODOBOO_DIAG+1, OBJ_MUSHROOM_IDLE, 0, 0, 0, 0, 0, 0, OBJ_REZNOR

EntitySet_World5:
	.byte OBJ_FIREFLOWER, OBJ_STAR, OBJ_KOOPA, OBJ_ITEMBOX_YOSHI, OBJ_GOOMBA+1, OBJ_CHARGINCHUCK_CHASE+1, OBJ_SPRING, OBJ_UNSHELLEDKOOPA, OBJ_CHARGINCHUCK_CHASE, OBJ_PARATROOPA_BOUNCING, OBJ_FOOTBALLCHUCK+1, OBJ_PIPEEXIT, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_BOO, OBJ_PSWITCHPLATFORM+2, OBJ_PSWITCH, OBJ_1UP_ALT, OBJ_FEATHER, OBJ_FIREFLOWER, OBJ_EERIE, OBJ_BOOCREWBOO, 0, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1
	.byte OBJ_BLURP_ALT, OBJ_BLURP_VERTICAL, OBJ_BLURP_HORIZONTAL, OBJ_URCHIN_HORIZONTAL+1, OBJ_FEATHER, OBJ_FIREFLOWER, OBJ_MUSHROOM, OBJ_BLURPSTILL, OBJ_URCHIN_VERTICAL+1, OBJ_CHARGINCHUCK_CHASE+1, OBJ_URCHIN+1, 0, 0, 0, 0, OBJ_GOALTAPE
	.byte OBJ_MORTONROY, OBJ_FUZZY, OBJ_MUSHROOM_IDLE, OBJ_FIREFLOWER, OBJ_FEATHER, OBJ_1UP_ALT, OBJ_PODOBOO_VERTICAL+1, OBJ_DRYBONES, OBJ_BONYBEETLE+1, OBJ_LINEPLATFORM, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1

EntitySet_World6:
	.byte OBJ_PARATROOPA_BOUNCING+1, OBJ_PSWITCH, OBJ_CHARGINCHUCK_CHASE+1, OBJ_PIRANHAPLANT, OBJ_SHELL, OBJ_KOOPA+1, OBJ_MUSHROOM, OBJ_FIREFLOWER, OBJ_PARATROOPA_GREEN+1, OBJ_SPIKETOP, OBJ_VOLCANOLOTUS, 0, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE
	.byte OBJ_EERIE, OBJ_BOO, OBJ_FEATHER, OBJ_FIREFLOWER, OBJ_1UP_ALT, OBJ_PSWITCH, OBJ_PSWITCHPLATFORM, 0, 0, 0, 0, 0, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1
	.byte OBJ_PARATROOPA_VERTICAL, OBJ_PIRANHAPLANT, OBJ_PSWITCH, OBJ_CHARGINCHUCK_CHASE+1, OBJ_ITEMBOX_YOSHI, OBJ_MUSHROOM_HIDDEN, OBJ_MUSHROOM, OBJ_SPRING, OBJ_PSWITCHPLATFORM3, OBJ_PSWITCHPLATFORM3+1, OBJ_DINOTORCH+1, OBJ_DINORHINO+1, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1
	.byte OBJ_PODOBOO_DIAG_BOSS, OBJ_LEMMYWENDY, OBJ_NINJI, OBJ_FEATHER, OBJ_DRYBONES, OBJ_THWOMP+1, OBJ_SPIKE_UP+1, OBJ_SPIKE_DOWN+1, OBJ_SPIKE_UP_ALT+1, 0, 0, 0, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1

EntitySet_World7:
	.byte OBJ_KOOPA+1, OBJ_FEATHER, OBJ_PARATROOPA_VERTICAL+1, OBJ_SHORTPLATFORM, OBJ_FUZZY, OBJ_STAR, 0, 0, 0, 0, 0, 0, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1
	.byte OBJ_COUNTDOWNPLATFORM_1S, OBJ_COUNTDOWNPLATFORM_4S, OBJ_SPRING, OBJ_FEATHER, OBJ_FIREFLOWER, OBJ_MUSHROOM_IDLE, OBJ_PARATROOPA_BOUNCING+1, OBJ_PODOBOO_HORIZONTAL, OBJ_PARATROOPA_VERTICAL+1, OBJ_PARATROOPA_GREEN+1, OBJ_KOOPA+1, OBJ_PIPEEXIT, OBJ_BONUSBLOCK+5, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1
	.byte OBJ_MUSHROOM, OBJ_PSWITCH, OBJ_BOO, OBJ_EERIE, OBJ_PSWITCHPLATFORM, 0, 0, 0, 0, 0, 0, 0, 0, 0, OBJ_CHECKPOINT, OBJ_GOALTAPE+1
	.byte 0, OBJ_BGPRIORITY_LEFT, OBJ_MECHAKOOPA, OBJ_PROPELLER, OBJ_CLIMBINGKOOPA_HORIZONTAL, OBJ_PODOBOO_HORIZONTAL, OBJ_MUSHROOM_IDLE, OBJ_NINJI+1, OBJ_PODOBOO_VERTICAL, OBJ_DRYBONES_THROWING+1, OBJ_BOWSER, 0, 0, 0, 0, OBJ_GOALTAPE+1

EntitySet_World8:
	.byte OBJ_LEVELEXIT, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, OBJ_GOALTAPE+1
BonusLevel_EntitySet:
	.byte OBJ_BGPRIORITY_ABOVE, OBJ_BGPRIORITY_ABOVE+1, OBJ_PIPEEXIT+1, OBJ_BONUSBLOCK, OBJ_BONUSBLOCK+1, OBJ_BONUSBLOCK+2, OBJ_BONUSBLOCK+3, OBJ_BONUSBLOCK+4, 0, 0, 0, 0, 0, 0, 0, 0
tbl6_AA3A:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $02
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $03
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $04
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $05
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $06
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $07
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $08
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $09
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0A
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0B
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0C
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0D
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0E
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
	.byte $0F
tbl6_AABA:
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $01
	.byte $02
	.byte $04
	.byte $08
	.byte $10
	.byte $20
	.byte $40
	.byte $80
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $FE
	.byte $FD
	.byte $FB
	.byte $F7
	.byte $EF
	.byte $DF
	.byte $BF
	.byte $7F
	.byte $20
	.byte $00
	.byte $2F
	.byte $00
	.byte $81
	.byte $01
	.byte $18
	.byte $00
	.byte $81
	.byte $02
	.byte $06
	.byte $00
	.byte $81
	.byte $01
	.byte $18
	.byte $00
	.byte $82
	.byte $03
	.byte $04
	.byte $05
	.byte $00
	.byte $81
	.byte $01
	.byte $06
	.byte $00
	.byte $81
	.byte $05
	.byte $12
	.byte $00
	.byte $81
	.byte $06
	.byte $05
	.byte $00
	.byte $81
	.byte $01
	.byte $05
	.byte $00
	.byte $82
	.byte $07
	.byte $08
	.byte $12
	.byte $00
	.byte $82
	.byte $03
	.byte $04
	.byte $04
	.byte $00
	.byte $81
	.byte $01
	.byte $05
	.byte $00
	.byte $81
	.byte $05
	.byte $14
	.byte $00
	.byte $81
	.byte $06
	.byte $04
	.byte $00
	.byte $81
	.byte $01
	.byte $04
	.byte $00
	.byte $82
	.byte $07
	.byte $08
	.byte $14
	.byte $00
	.byte $82
	.byte $03
	.byte $04
	.byte $03
	.byte $00
	.byte $81
	.byte $01
	.byte $04
	.byte $00
	.byte $81
	.byte $05
	.byte $0E
	.byte $00
	.byte $81
	.byte $09
	.byte $07
	.byte $00
	.byte $8A
	.byte $06
	.byte $00
	.byte $0A
	.byte $0B
	.byte $0C
	.byte $0D
	.byte $0E
	.byte $0F
	.byte $07
	.byte $08
	.byte $0E
	.byte $00
	.byte $83
	.byte $10
	.byte $11
	.byte $09
	.byte $05
	.byte $00
	.byte $84
	.byte $12
	.byte $13
	.byte $14
	.byte $15
	.byte $02
	.byte $16
	.byte $84
	.byte $17
	.byte $18
	.byte $19
	.byte $1A
	.byte $06
	.byte $00
	.byte $82
	.byte $1B
	.byte $1C
	.byte $08
	.byte $00
	.byte $83
	.byte $10
	.byte $11
	.byte $09
	.byte $02
	.byte $00
	.byte $8C
	.byte $1D
	.byte $1E
	.byte $1F
	.byte $20
	.byte $21
	.byte $22
	.byte $23
	.byte $21
	.byte $24
	.byte $25
	.byte $26
	.byte $8A
	.byte $03
	.byte $00
	.byte $83
	.byte $1B
	.byte $1C
	.byte $27
	.byte $0B
	.byte $00
	.byte $8C
	.byte $10
	.byte $11
	.byte $28
	.byte $1E
	.byte $29
	.byte $8F
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $30
	.byte $02
	.byte $29
	.byte $85
	.byte $8C
	.byte $8B
	.byte $1B
	.byte $1C
	.byte $27
	.byte $0F
	.byte $00
	.byte $86
	.byte $32
	.byte $33
	.byte $34
	.byte $35
	.byte $36
	.byte $37
	.byte $02
	.byte $38
	.byte $87
	.byte $39
	.byte $29
	.byte $3A
	.byte $90
	.byte $3B
	.byte $3C
	.byte $27
	.byte $11
	.byte $00
	.byte $84
	.byte $3D
	.byte $3E
	.byte $21
	.byte $3F
	.byte $05
	.byte $29
	.byte $85
	.byte $40
	.byte $20
	.byte $21
	.byte $41
	.byte $42
	.byte $11
	.byte $00
	.byte $82
	.byte $43
	.byte $44
	.byte $02
	.byte $21
	.byte $82
	.byte $45
	.byte $46
	.byte $04
	.byte $29
	.byte $81
	.byte $47
	.byte $03
	.byte $21
	.byte $82
	.byte $48
	.byte $8D
	.byte $09
	.byte $00
	.byte $07
	.byte $49
	.byte $86
	.byte $4A
	.byte $4B
	.byte $4C
	.byte $4D
	.byte $21
	.byte $4E
	.byte $04
	.byte $29
	.byte $86
	.byte $4B
	.byte $21
	.byte $4F
	.byte $21
	.byte $4E
	.byte $50
	.byte $07
	.byte $49
	.byte $02
	.byte $00
	.byte $07
	.byte $51
	.byte $86
	.byte $52
	.byte $4B
	.byte $53
	.byte $54
	.byte $21
	.byte $4E
	.byte $04
	.byte $29
	.byte $86
	.byte $55
	.byte $21
	.byte $56
	.byte $21
	.byte $57
	.byte $58
	.byte $07
	.byte $51
	.byte $09
	.byte $00
	.byte $82
	.byte $59
	.byte $5A
	.byte $02
	.byte $21
	.byte $82
	.byte $5B
	.byte $5C
	.byte $04
	.byte $29
	.byte $81
	.byte $5D
	.byte $03
	.byte $21
	.byte $82
	.byte $5E
	.byte $5F
	.byte $10
	.byte $00
	.byte $88
	.byte $60
	.byte $61
	.byte $62
	.byte $21
	.byte $63
	.byte $29
	.byte $86
	.byte $87
	.byte $02
	.byte $29
	.byte $85
	.byte $64
	.byte $62
	.byte $21
	.byte $63
	.byte $65
	.byte $12
	.byte $00
	.byte $87
	.byte $66
	.byte $2A
	.byte $38
	.byte $31
	.byte $29
	.byte $88
	.byte $89
	.byte $03
	.byte $29
	.byte $84
	.byte $2A
	.byte $38
	.byte $8E
	.byte $67
	.byte $10
	.byte $00
	.byte $84
	.byte $68
	.byte $69
	.byte $6A
	.byte $35
	.byte $0A
	.byte $29
	.byte $84
	.byte $6B
	.byte $6C
	.byte $11
	.byte $09
	.byte $0C
	.byte $00
	.byte $83
	.byte $68
	.byte $69
	.byte $6D
	.byte $02
	.byte $00
	.byte $82
	.byte $6E
	.byte $35
	.byte $08
	.byte $29
	.byte $82
	.byte $6F
	.byte $70
	.byte $02
	.byte $00
	.byte $83
	.byte $10
	.byte $11
	.byte $09
	.byte $08
	.byte $00
	.byte $83
	.byte $68
	.byte $69
	.byte $6D
	.byte $04
	.byte $00
	.byte $83
	.byte $92
	.byte $91
	.byte $72
	.byte $06
	.byte $29
	.byte $82
	.byte $73
	.byte $70
	.byte $05
	.byte $00
	.byte $83
	.byte $10
	.byte $11
	.byte $09
	.byte $06
	.byte $00
	.byte $81
	.byte $74
	.byte $07
	.byte $00
	.byte $84
	.byte $75
	.byte $76
	.byte $77
	.byte $78
	.byte $02
	.byte $79
	.byte $84
	.byte $7A
	.byte $7B
	.byte $7C
	.byte $7D
	.byte $07
	.byte $00
	.byte $81
	.byte $10
	.byte $0D
	.byte $00
	.byte $82
	.byte $7E
	.byte $7F
	.byte $02
	.byte $00
	.byte $84
	.byte $80
	.byte $81
	.byte $82
	.byte $83
	.byte $02
	.byte $00
	.byte $81
	.byte $84
	.byte $15
	.byte $00
	.byte $81
	.byte $75
	.byte $04
	.byte $00
	.byte $81
	.byte $01
	.byte $04
	.byte $00
	.byte $82
	.byte $85
	.byte $7D
	.byte $13
	.byte $00
	.byte $82
	.byte $7E
	.byte $7F
	.byte $04
	.byte $00
	.byte $81
	.byte $01
	.byte $05
	.byte $00
	.byte $81
	.byte $84
	.byte $13
	.byte $00
	.byte $81
	.byte $75
	.byte $05
	.byte $00
	.byte $81
	.byte $01
	.byte $05
	.byte $00
	.byte $82
	.byte $85
	.byte $7D
	.byte $18
	.byte $00
	.byte $81
	.byte $01
	.byte $30
	.byte $00
	.byte $13
	.byte $FF
	.byte $02
	.byte $AA
	.byte $06
	.byte $FF
	.byte $83
	.byte $FB
	.byte $32
	.byte $00
	.byte $05
	.byte $FF
	.byte $83
	.byte $77
	.byte $33
	.byte $00
	.byte $1A
	.byte $FF
	.byte $81
	.byte $00
	.byte $FF
	.byte $FF
	.byte $FF
sub6_ADA2:
	LDA PPUSTATUS
	LDA ppuCtrlMirror
	ORA #%00000100
	STA PPUCTRL ; Set PPU to load tiles row-by-row
	LDA PPUSTATUS
	LDA ppuTileAddr
	STA PPUADDR
	LDA ppuTileAddr+1
	STA PPUADDR
	LDX #0

; Draw column on upper nametable
bra6_ADBD:
		LDA tileColumnMem,X
		STA PPUDATA
		INX
		CPX #30 ; Upper screen is 30 rows tall
		BCC bra6_ADBD
	LDA PPUSTATUS
	LDA ppuTileAddr
	ORA #$08 ; Move to the nametable below the current one
	STA PPUADDR
	LDA ppuTileAddr+1
	STA PPUADDR

; Draw column on lower nametable
bra6_ADD9:
		LDA tileColumnMem,X
		STA PPUDATA
		INX
		CPX #56 ; 56 rows should be rendered total (2 * 30 tile nametables - 4 tiles for the HUD)
		BCC bra6_ADD9
	LDA PPUSTATUS
	LDA ppuCtrlMirror
	AND #%11111011 ; Set PPU to load tiles column-by-column
	STA PPUCTRL
	RTS

	LDA ppuWriteTasks
	BEQ bra6_AE17_RTS
	LDX #0

bra6_ADF6:
	LDA PPUSTATUS
	LDA ppuWriteTasks,X
	STA PPUADDR
	LDA ppuWriteTasks+1,X
	STA PPUADDR
	LDA ppuWriteTasks+2,X
	STA PPUDATA
	INX
	INX
	INX
	CPX #48
	BCC bra6_ADF6
	LDA #$00
	STA ppuWriteTasks

bra6_AE17_RTS:
	RTS

	LDA btnPressed
	AND #$80
	BEQ bra6_AE2D
	INC scrollVecX
	LDA #$08
	CMP scrollVecX
	BCS bra6_AE2C_RTS
	STA scrollVecX
bra6_AE2C_RTS:
	RTS
bra6_AE2D:
	LDA btnPressed
	AND #$40
	BEQ bra6_AE42
	INC scrollVecY
	LDA #$08
	CMP scrollVecY
	BCS bra6_AE41_RTS
	STA scrollVecY
bra6_AE41_RTS:
	RTS
bra6_AE42:
	LDA scrollVecX
	AND #$07
	STA scrollVecX
	LDA scrollVecY
	AND #$07
	STA scrollVecY
	LDA btnHeld
	AND #$01
	BEQ bra6_AE61
	LDA scrollVecX
	AND #$7F
	STA scrollVecX
bra6_AE61:
	LDA btnHeld
	AND #$02
	BEQ bra6_AE70
	LDA scrollVecX
	ORA #$80
	STA scrollVecX
bra6_AE70:
	LDA btnHeld
	AND #$04
	BEQ bra6_AE7F
	LDA scrollVecY
	AND #$7F
	STA scrollVecY
bra6_AE7F:
	LDA btnHeld
	AND #$08
	BEQ bra6_AE8E_RTS
	LDA scrollVecY
	ORA #$80
	STA scrollVecY
bra6_AE8E_RTS:
	RTS

.export jmp_61_AE8F
jmp_61_AE8F:
	JSR updateCameraPos
	JSR sub6_BA4A
	JSR sub6_B9CF
	JSR sub6_BAD1
	JSR sub6_BA21
	LDA playerXHiDup
	STA playerXHi
	LDA playerXLoDup
	STA playerXLo
	LDA playerYHiDup
	STA playerYHi
	LDA playerYLoDup
	STA playerYLo
	LDA cameraXHiDup
	STA cameraXHi
	LDA cameraXLoDup
	STA cameraXLo
	RTS
	RTS ; Possible remnant of empty function

sub6_AEB8:
	LDA levelNumber
	ASL
	ASL
	ASL
	ASL
	TAY ; Multiply the level number by 16 to get the index based off the level number
	LDX #$00 ; Clear X index
bra6_AEC2:
	LDA tbl6_AED1,Y ; Load the screen data buffer??(Unsure of what $D0-$DB is for) for the current level number
	STA $D0,X ; Store in RAM
	INY ; Move to the next byte in the byte
	INX ; Move to the next byte in the table
	CPX #$0C
	BCC bra6_AEC2 ; Loop until 12 bytes from the table have been copied to RAM
	JSR getEntitySetPtr
	RTS
tbl6_AED1:
	.byte $00
	.byte $80
	.byte $00
	.byte $81
	.byte $00
	.byte $82
	.byte $00
	.byte $83
	.byte $00
	.byte $84
	.byte $00
	.byte $85
	.byte $00
	.byte $86
	.byte $00
	.byte $00

	.byte $00
	.byte $88
	.byte $00
	.byte $89
	.byte $00
	.byte $8A
	.byte $00
	.byte $8B
	.byte $00
	.byte $8C
	.byte $00
	.byte $8D
	.byte $40
	.byte $86
	.byte $00
	.byte $00
	
	.byte $00
	.byte $90
	.byte $00
	.byte $91
	.byte $00
	.byte $92
	.byte $00
	.byte $93
	.byte $00
	.byte $94
	.byte $00
	.byte $95
	.byte $80
	.byte $86
	.byte $00
	.byte $00
	
	.byte $00
	.byte $98
	.byte $00
	.byte $99
	.byte $00
	.byte $9A
	.byte $00
	.byte $9B
	.byte $00
	.byte $9C
	.byte $00
	.byte $9D
	.byte $C0
	.byte $86
	.byte $00
	.byte $00

;----------------------------------------
; SUBROUTINE ($AF11)
; Buffers the next column of tiles and tile attributes to prepare them to be uploaded to the PPU.
; Parameters:
; > $64 - $65: Tile X Pos
; > $66 - $67: Tile Y Pos
;----------------------------------------
; TODO: Potentially find a better name for this to better distinguish it from bufferMetatileCol
.proc bufferPpuTileCol
metatileBufIndex = $28
isOddSubtile = $9B
tileColumnIndex = $9C
attrIndexLo = $25
attrIndex = $5C
isRightTile = $2A
isBottomTile = $2D
metatileAddrLo = $59 ; Starts at the top left corner of a metatile
metatileAddrHi = $5A
metatileAttr = $6A
curMetatile = $5F
upperSubtile = $60
lowerSubtile = $61

	LDA #$00
	STA tileColumnIndex
	LDA scrollX
	LSR
	LSR
	LSR
	STA metatileAddrLo
	STA ppuTileAddr+1
	LDA #$20
	STA metatileAddrHi
	STA ppuTileAddr
	LDA metatileAddrLo
	AND #%00000001
	EOR #%00000001
	STA isOddSubtile ; 1 if odd tile
	LDX #0
	LDA pTilePosXLo
	AND #%00001000
	BEQ bra6_AF37
		INX
bra6_AF37:
	STX isRightTile ; 0 if 1st column of metatile, 1 if 2nd column of metatile
	LDX #0
	LDA pTilePosYLo
	AND #%00001000
	BEQ bra6_AF42
		INX
bra6_AF42:
	STX isBottomTile
	JSR bufferMetatileCol
	LDA prgDataBank2
	STA M90_PRG0
	LDX #0
	STX metatileBufIndex

loadNextMetatile:
	LDX metatileBufIndex
	LDA metatileBuf,X
	STA curMetatile ; Load metatile
	LDY curMetatile
	LDA isRightTile
	BNE bra6_AF68
	; Load left side of metatile into buffer
		LDA (tilesetDataPtrs),Y
		STA upperSubtile
		LDA (tilesetDataPtrs+4),Y
		STA lowerSubtile
		JMP loc6_AF70
	; Load right side of metatile into buffer
	bra6_AF68:
		LDA (tilesetDataPtrs+2),Y
		STA upperSubtile
		LDA (tilesetDataPtrs+6),Y
		STA lowerSubtile

loc6_AF70:
	LDY isBottomTile

loc6_AF72:
	LDA a:upperSubtile,Y
	LDX tileColumnIndex
	STA tileColumnMem,X
	LDA isOddSubtile
	BEQ bra6_AFB4 ; Only update attributes every full metatile
		LDY curMetatile
		LDA (tilesetDataPtrs+8),Y
		STA metatileAttr
		LDY metatileAddrLo
		LDA addrToAttrIndexLo,Y
		STA attrIndexLo
		LDA metatileAddrHi
		AND #%00001111
		TAX
		LDA addrToAttrIndexHi,X
		ORA attrIndexLo
		STA attrIndex
		TYA ; Low byte of metatile PPU address
		AND #%01111111
		TAX
		LDA tbl6_A200,X
		TAX
		AND metatileAttr
		STA $37 ; Get bitmask for metatile's attributes
		TXA
		EOR #%11111111 ; Invert bitmask to ensure only this metatile's attrobute is changed?
		STA $25
		LDY attrIndex
		LDA bgTileAttrs,Y
		AND $25
		ORA $37
		STA bgTileAttrs,Y ; Buffer attributes for current metatile

bra6_AFB4:
	INC tileColumnIndex ; Go to next column
	LDA tileColumnIndex
	CMP #56 ; A full column is 56 tiles
	BCS createAttrWriteTasks
		LDA metatileAddrLo
		CLC
		ADC #$20
		STA metatileAddrLo
		BCC bra6_AFC7
		INC metatileAddrHi
	bra6_AFC7:
		LDA metatileAddrHi
		AND #$03
		CMP #$03
		BNE bra6_AFE4
		LDA metatileAddrLo
		CMP #$C0
		BCC bra6_AFE4
			AND #$1F
			STA metatileAddrLo
			STA $0484
			LDA metatileAddrHi
			AND #$F8
			EOR #$08
			STA metatileAddrHi
	bra6_AFE4:
		INC isBottomTile
		LDY isBottomTile
		CPY #$02 ; Gof rom the top and bottom halfs of the metatile
		BCS bra6_AFEF
			JMP loc6_AF72 ; If not switching back to a top tile, buffer as normal
	bra6_AFEF:
		LDA #$00
		STA isBottomTile
		INC metatileBufIndex
		JMP loadNextMetatile ; If done with the metatile, load the vertical half of the next metatile

	; After uploading tiles and attributes to buffers, create the write tasks for the column of attributes that were just buffered
	createAttrWriteTasks:
		LDA scrollX
		ROR
		ROR
		ROR
		ROR
		ROR
		AND #%00000111
		STA attrIndex ; Repurpose to represent the starting attribute index
		LDX #$00
	bra6_B005:
		LDY attrIndex
		LDA bgTileAttrs,Y
		STA ppuWriteTasks+2,X
		TYA
		AND #~($C0)
		ORA #$C0 ; Attribute data always starts at $xxC0
		STA ppuWriteTasks+1,X ; PPU address low byte
		TYA
		LDY #$23 ; Upper screen attribute address high byte
		AND #$40
		BEQ bra6_B01E
			LDY #$2B ; Lower screen attribute address low byte
	bra6_B01E:
		TYA
		STA ppuWriteTasks,X ; PPU address high byet
		LDA attrIndex
		CLC
		ADC #8 ; Go down a row
		AND #%01111111
		STA attrIndex
		INX
		INX
		INX
		CPX #(16*3) ; 16 attributes
		BCC bra6_B005
		RTS
.endproc

		LDA scrollX
		LSR
		LSR
		LSR
		STA $25
		LDA $03
		ASL
		ASL
		AND #$E0
		ORA $25
		STA $59
		LDA $03
		ROL
		ROL
		ROL
		AND #$03
		ORA #$20
		LDY $5B
		BEQ bra6_B053
		ORA #$08
	bra6_B053:
		STA $5A
		RTS

;----------------------------------------
; SUBROUTINE ($B056)
; Buffers the next column of metatiles
; Parameters:
; > $64 - $65: Column Start X Pos
; > $66 - $67: Column Start Y Pos
;----------------------------------------
.proc bufferMetatileCol
metatileCol = $25 ; The actual metatile index
metatileIndex = $2B ; The metatile index relative to the screen
dynamicTileBitmask = $28
screenPtr = $32

	LDA pTilePosYHi
	PHA
	LDA pTilePosYLo
	PHA
	LDX #$00
loc6_B05E:
	CLC
	LDA #$00
	LDY pTilePosYHi
	BEQ bra6_B06A ; No mulitplication needed if level is only one screen tall

; Tile Screen Index = Level Width Screen * Tile Y Screen + Tile X Screen
	bra6_B065:
		ADC $6D
		DEY
		BNE bra6_B065

bra6_B06A:
	CLC
	ADC pTilePosXHi

	TAY ; Screen index of the tile
	LDA prgDataBank2
	STA M90_PRG0
	LDA (levelScreenOrderPtr),Y
	TAY ; Screen number
	AND #%00011111 ; Maximum of 32 screens?
	ORA #%10000000 ; This turns the screen number into the high byte of the screen address
	STA screenPtr+1
	LDA #$00
	STA screenPtr
	TYA
	AND #%00100000 ; Seemingly unused feature where screen numbers with bit 5 set (aka higher than 32) will load screen data from another bank. Possibly suggests that levels with more than 32 screens were supported at one point and not fully removed
	BNE bra6_B08F
		LDA prgDataBank1
		STA M90_PRG0
		JMP loc6_B095
	bra6_B08F:
		LDA $04F4
		STA M90_PRG0

; Calculate metatile index
loc6_B095:
	LDA pTilePosXLo
	LSR
	LSR
	LSR
	LSR
	STA metatileCol
	LDA pTilePosYLo
	AND #%11110000
	ORA metatileCol
	TAY ; Metatile index
	STA metatileIndex

bra6_B0A6:
	LDA (screenPtr),Y
	BPL bra6_B0DF ; Metatiles 0-127 are never dynamic
		STY metatileIndex
		STA $25
		CMP #$A0
		BNE drawDynamicTile
		LDY $06DE
		BEQ bra6_B0DF
		LDA #$E0
		BMI bra6_B0DF
		drawDynamicTile:
			AND #%00001111
			TAY ; Dynamic tile number
			LDA tbl6_BE75,Y
			STA dynamicTileBitmask
			LDA pTilePosXHi
			ASL
			CLC
			ADC tbl6_BE65,Y
			TAY ; Index of dynamic tile memory
			LDA dynamicTileStates,Y
			AND dynamicTileBitmask
			BNE bra6_B0DD
			; Draw modified dynamic tile style
				LDY #$90
				LDA $25
				AND #%00001000
				BEQ bra6_B0DB
					INY ; Draw as metatile 0x91 if this is dynamic tile 0x88-0x8F
			bra6_B0DB:
				STY $25

			; Draw unmodified dynamic tile
			bra6_B0DD:
				LDA $25

bra6_B0DF:
	STA metatileBuf,X
	INX
	CPX #28 ; Buffer 28 metatiles
	BCS bra6_B0FC
		LDA metatileIndex
		CLC
		ADC #16
		STA metatileIndex ; Move down a row
		LDY metatileIndex
		CMP #$F0
		BCC bra6_B0A6 ; Less recalulation needed if not moving to another screen
			INC pTilePosYHi
			LDA #$00
			STA pTilePosYLo ; Carry as needed
			JMP loc6_B05E ; Carry requires the whole index to be recalculated
	
; End of loop
;--------------------

bra6_B0FC:
	LDA metatileIndex
	CLC
	ADC #16
	STA metatileIndex
	STX $28
	LDA $2A
	BEQ bra6_B10C
		JSR sub6_A600
bra6_B10C:
	LDX $28
	PLA
	STA pTilePosYLo
	PLA
	STA pTilePosYHi ; Restore original parameter values
	RTS
.endproc

	.byte $00
	.byte $F0
	.byte $00
	.byte $00
	.byte $00
	.byte $F1
	.byte $00
	.byte $00
	.byte $00
	.byte $F2
	.byte $00
	.byte $00
	.byte $00
	.byte $F3
	.byte $00
	.byte $00
	.byte $00
sub6_B126:
	LDA $59
	TAY
	LDA addrToAttrIndexLo,Y
	STA $25
	LDA $5A
	AND #$0F
	TAX
	LDA addrToAttrIndexHi,X
	ORA $25
	STA $5C
	TYA
	AND #$7F
	TAX
	LDA tbl6_A200,X
	TAX
	AND $6A
	STA $37
	TXA
	EOR #$FF
	STA $25
	LDY $5C
	LDA bgTileAttrs,Y
	AND $25
	ORA $37
	STA bgTileAttrs,Y
	RTS
	LDA $59
	TAY
	LDA addrToAttrIndexLo,Y
	STA $25
	LDA $5A
	AND #$0F
	TAX
	LDA addrToAttrIndexHi,X
	ORA $25
	STA $5C
	RTS
	LDA $59
	CLC
	ADC #$20
	STA $59
	BCC bra6_B178
	INC $5A
bra6_B178:
	LDA $5A
	AND #$03
	CMP #$03
	BNE bra6_B19D_RTS
	LDA $59
	CMP #$C0
	BCC bra6_B19D_RTS
	AND #$1F
	STA $59
	STA $0484
	LDA $5A
	AND #$F8
	EOR #$08
	STA $5A
	STA $0483
	LDA $9C
	STA $0482
bra6_B19D_RTS:
	RTS

.export jmp_61_B19E
jmp_61_B19E:
	JSR sub6_AEB8
	LDA worldNumber
	ASL
	ASL ; Multiply the world number by 4
	STA $34 ; Store it at $34 in scratch RAM
	ASL
	ASL ; Multiply it by 4 again, effectively moving the low nybble to the high nybble
	STA $32 ; Store it at $32 in scratch RAM
	LDA levelNumber
	ASL
	ASL ; Multiply the level number by 4
	CLC
	ADC $32 ; Add the shifted Y value to it
	TAX ; Set it as the X index
	LDA $34
	CLC
	ADC levelNumber ; Add the level number to the previously multiplied world value, getting the ordered level number
	TAY ; Back it up in the Y register
	LDA curPlayer
	BEQ bra6_B1C6 ; Branch if player 1 is playing
	TYA
	CLC
	ADC #$1C
	TAY ; Otherwise, move the index 28 spots for player 2
bra6_B1C6:
	LDA checkpointFlag,Y
	BEQ bra6_B1FD ; Check if the checkpoint has been set for the current level
	; If it has, continue and load the checkpoint spawn data
	LDA tbl6_B5E8+2,X
	STA prgDataBank2 ; Get tilemap PRG bank
	LDA tbl6_B5E8+3,X
	STA bgCurPalette ; Get BG palette
	LDA tbl6_B5E8,X
	AND #%11000000
	STA levelWaterFlag ; Get underwater flag from upper 2 bits
	LDA #$E8
	STA bubbleY
	LDA tbl6_B5E8,X
	AND #%00100000
	STA $06E0
	STA $06E1 ; Get sprite priority
	LDA tbl6_B5E8,X
	AND #%00111111
	STA prgDataBank1 ; Get level data PRG bank from lower 6 bits
	LDA tbl6_B5E8+1,X
	JMP loc6_B22C
; Otherwise, load the default level positions
bra6_B1FD:
	LDA tbl6_B56C+2,X
	STA prgDataBank2 ; Get tilemap PRG bank
	LDA tbl6_B56C+3,X
	STA bgCurPalette ; Get BG palette
	LDA tbl6_B56C,X
	AND #%11000000
	STA levelWaterFlag ; Get underwater flag from upper 2 bits
	LDA #$E8
	STA bubbleY
	LDA tbl6_B56C,X
	AND #%00100000
	STA $06E0
	STA $06E1 ; Get sprite priority
	LDA tbl6_B56C,X
	AND #%00111111
	STA prgDataBank1 ; Get level data PRG bank from lower 6 bits
	LDA tbl6_B56C+1,X
loc6_B22C:
	JSR sub6_B34A
	LDA #$12 ; Player bottom screen offset (see below)
	STA $6D
	LDY #$00 ; Player top screen offset (see below)
	STY levelVerticalScreenOffs ; Preset the offset for determining the player's screen ID on the top screen
	STA lvlBottomScreenOffs ; Preset offset for determining the player's screen ID on the bottom screen
	LDY levelNumber ; Use level number as index
	LDA LvlScreenOrderPtrLo,Y
	STA levelScreenOrderPtr ; Get the low byte of the screen order pointer based off the level number
	LDA LvlScreenOrderPtrHi,Y
	STA levelScreenOrderPtr+1 ; Get the high byte of the screen order pointer based off the level number
	LDA worldNumber
	ASL
	TAY ; Get Y pointer index from world number
	ASL ; (Multiply by 4)
	CLC
	ADC levelNumber ; Add the product to the level number to get the ordered level number
	TAX ; Set as the checkpoint index
	LDA curPlayer
	BEQ bra6_B25D ; Branch if player 1 is playing
	TXA
	CLC
	ADC #$1C
	TAX ; Otherwise, move the index 28 bytes ahead for player 2
bra6_B25D:
	LDA checkpointFlag,X
	BEQ bra6_B26D ; Branch if the checkpoint isn't set
	LDA tbl6_B76E,Y
	STA $32
	LDA tbl6_B76E+1,Y ; If the checkpoint is set, load the checkpoint spawn coordinates
	JMP loc6_B275 ; Jump ahead
bra6_B26D:
	LDA tbl6_B676,Y
	STA $32
	LDA tbl6_B676+1,Y ; If the checkpoint isn't set, load the normal level spawn coordinates
loc6_B275:
	STA $33 ; Store high byte of spawn pointer
	LDA levelNumber
	ASL
	ASL
	ASL
	TAY ; Get index for current level
	LDA ($32),Y
	STA cameraXHi
	STA pTilePosXHi
	LDA #$00
	STA cameraXLo
	STA pTilePosXLo
	INY
	LDA ($32),Y
	STA cameraYHi
	ASL
	STA $5B
	LDA #$00
	STA pTilePosYHi
	STA cameraYLo
	STA pTilePosYLo
	LDA cameraXHi
	STA playerXHi
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA playerXLo
	STA playerSprX ; Load the player's X spawn coordinate
	LDA cameraYHi
	STA playerYHi
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA playerYLo
	STA playerSprY ; Load the player's Y spawn coordinate
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA scrollBoundLeft ; Set horizontal scroll lock (If present. Very broken)
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA scrollBoundRight ; Get horizontal screen count
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA scrollBoundTop ; Set the vertical scroll lock (If it's set)
	INY ; (Move one byte ahead)
	LDA ($32),Y
	STA scrollBoundBottom ; Get vertical screen count
	LDA #$01
	STA interruptMode ; Set the horizontal split/interrupt for levels
	LDX #$00
	LDA #$FF
bra6_B2D1:
	STA dynamicTileStates,X
	INX
	CPX #$24
	BCC bra6_B2D1
	LDX #$00
bra6_B2DB:
	STA $03F6,X
	INX
	CPX #$08
	BCC bra6_B2DB
	LDA #$00
	STA playerDragonCoins
	STA playerDragonCoins+1
	STA pSwitchTimer
	STA $06DC
	STA $06DD
	STA playerPowerupBuffer
	STA booBuddiesFlag
	STA $06DE
	STA $06DF
	STA freezeFlag
	STA $4A
	STA $4B
	STA $06EA
	STA $06EB
	STA $06EC
	STA $06ED
	STA $06EE
	LDX #$00
bra6_B317:
	STA objState,X
	INX
	CPX #$14
	BCC bra6_B317
	LDA curPlayer
	BNE bra6_B337
	LDA playerStoredPowerup
	STA playerPowerup
	LDA playerStoredYoshi
	STA playerYoshiState
	STA yoshiExitStatus
	STA yoshiIdleStorage
	RTS
bra6_B337:
	LDA $06DB
	STA playerPowerup
	LDA $0394
	STA playerYoshiState
	STA yoshiExitStatus
	STA yoshiIdleStorage
	RTS

.export sub6_B34A
sub6_B34A:
	CMP #$32
	BEQ bra6_B352
	CMP #$3D
	BNE bra6_B365
bra6_B352:
	ASL
	ASL
	TAX
	STX chrBgBank1
	INX
	STX chrBgBank2
	INX
	STX chrBgBank3
	INX
	STX chrBgBank4
	RTS
bra6_B365:
	ASL
	ASL
	STA chrBgBankAnimation ; Set bank 4 mode?
	TAX
	LDA #$27
	STA M90_PRG3 ; Swap bank 39 into the 4th PRG slot ($E000-$FFFF)
	LDA levelChrBgBanks,X
	STA chrBgBank1 ; Set BG bank 1
	LDA levelChrBgBanks+1,X
	STA chrBgBank2 ; Set BG bank 2
	LDA levelChrBgBanks+2,X
	STA chrBgBank3 ; Set BG bank 3
	LDA levelChrBgBanks+3,X
	STA chrBgBank4 ; Set BG bank 4 (redundant)
	LDA #$3F
	STA M90_PRG3 ; Swap bank 63 back in
	RTS

.export jmp_61_B38E
jmp_61_B38E:
	LDA PPUSTATUS
	LDA ppuCtrlMirror
	AND #$7F
	STA PPUCTRL
	LDA #$36
	STA $F9
	LDA #$00
	STA fireballSlot
	STA fireballSlot2
	STA objCount
	STA scrollX
	STA $03
	STA $59
	STA $30
	LDA #$20
	STA $5A
	LDA #$20
	STA $26
loc6_B3B6:
	JSR bufferMetatileCol
	LDA prgDataBank2
	STA M90_PRG0
	LDA #$00
	STA $2A
loc6_B3C3:
	LDA #$00
	STA $27
	STA $2D
	LDX $27
bra6_B3CB:
	LDA metatileBuf,X
	STA $5F
	JSR sub6_B658
	LDX $2D
	LDA $60
	STA tileColumnMem,X
	INX
	LDA $61
	STA tileColumnMem,X
	INX
	STX $2D
	INC $27
	LDX $27
	CPX #$1C
	BCC bra6_B3CB
	LDA $5A
	STA ppuTileAddr
	STA $31
	LDA $59
	STA ppuTileAddr+1
	STA $30
	JSR sub6_ADA2
	LDA $2A
	BNE bra6_B438
	LDX #$00
	STX $36
	LDX $36
bra6_B405:
	LDA metatileBuf,X
	TAY
	LDA (tilesetDataPtrs+8),Y
	STA $6A
	JSR sub6_B126
	LDA $59
	CLC
	ADC #$40
	STA $59
	BCC bra6_B41A
	INC $5A
bra6_B41A:
	LDA $59
	CMP #$C0
	BCC bra6_B430
	LDA $5A
	CMP #$23
	BNE bra6_B430
	LDA $59
	AND #$1F
	STA $59
	LDA #$28
	STA $5A
bra6_B430:
	INC $36
	LDX $36
	CPX #$1C
	BCC bra6_B405
bra6_B438:
	INC $30
	LDA $30
	STA $59
	LDA $31
	STA $5A
	DEC $26
	INC $2A
	LDA $2A
	CMP #$02
	BCS bra6_B44F
	JMP loc6_B3C3
bra6_B44F:
	LDA $26
	BEQ bra6_B461
	LDA pTilePosXLo
	CLC
	ADC #$10
	STA pTilePosXLo
	BCC bra6_B45E
	INC $64
bra6_B45E:
	JMP loc6_B3B6
bra6_B461:
	LDA PPUSTATUS
	LDA #$23
	STA PPUADDR
	LDA #$C0
	STA PPUADDR
	LDX #$00
bra6_B470:
	LDA bgTileAttrs,X
	STA PPUDATA
	INX
	CPX #$40
	BCC bra6_B470
	LDA PPUSTATUS
	LDA #$2B
	STA PPUADDR
	LDA #$C0
	STA PPUADDR
bra6_B488:
	JSR sub6_B4B1
	LDA bgTileAttrs,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra6_B488
	JSR sub6_BCA9
	JSR sub6_B49D
	RTS
sub6_B49D:
	LDA interruptMode
	CMP #$04
	BNE bra6_B4B0_RTS
	LDA #$A8
	STA scrollX
	LDA #$CF
	STA $03
	LDA #$02
	STA $5B
bra6_B4B0_RTS:
	RTS
sub6_B4B1:
	LDA bgCurPalette
	ASL
	TAY
	LDA tbl6_B51C,Y
	STA $36
	AND #$F0
	STA $37
	LDA tbl6_B51C+1,Y
	STA $38
	AND #$F0
	STA $39
	LDY #$00
	LDA $38
bra6_B4CC:
	STA $0478,Y
	INY
	CPY #$08
	BCC bra6_B4CC
	LDA $36
	STA $047B
	STA $047C
	LDY #$00
bra6_B4DE:
	LDA $0470,Y
	AND #$0F
	ORA $37
	STA $0470,Y
	INY
	CPY #$06
	BCC bra6_B4DE
	LDA $0472
	AND #$0F
	ORA $39
	STA $0472
	LDA $0473
	AND #$CF
	STA $36
	LDA $38
	AND #$30
	ORA $36
	STA $0473
	LDA $0476
	AND #$0F
	ORA $39
	STA $0476
	LDA $0477
	AND #$0F
	ORA $39
	STA $0477
	RTS
tbl6_B51C:
	.byte $FF
	.byte $AA
	.byte $00
	.byte $AA
	.byte $00
	.byte $55
	.byte $00
	.byte $55
	.byte $00
	.byte $AA
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $AA
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $55
	.byte $00
	.byte $AA
	.byte $00
	.byte $AA
	.byte $00
	.byte $AA
	.byte $00
	.byte $55
	.byte $00
	.byte $55
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $55
	.byte $00
	.byte $55
	.byte $00
	.byte $FF
	.byte $FF
	.byte $AA
	.byte $00
	.byte $55
	.byte $00
	.byte $AA
	.byte $00
	.byte $55
	.byte $00
	.byte $FF
	.byte $00
	.byte $55
	.byte $55
	.byte $AA
	.byte $00
	.byte $AA
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $FF
	.byte $AA
	.byte $00
	.byte $00
	.byte $00
	.byte $FF
	.byte $00
	.byte $FF
	.byte $FF
	.byte $AA
	.byte $00
	.byte $00
tbl6_B56C:
; 1-1
	.byte $00
	.byte $00
	.byte $1C
	.byte $00
; 1-2
	.byte $01
	.byte $01
	.byte $1C
	.byte $01
; 1-3
	.byte $02
	.byte $02
	.byte $1C
	.byte $02
; 1-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 2-1
	.byte $04
	.byte $04
	.byte $1D
	.byte $04
; 2-2
	.byte $05
	.byte $05
	.byte $1D
	.byte $05
; 2-3
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
; 2-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 3-1
	.byte $08
	.byte $08
	.byte $1E
	.byte $08
; 3-2
	.byte $49
	.byte $09
	.byte $1E
	.byte $09
; 3-3
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
; 3-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 4-1
	.byte $0C
	.byte $0C
	.byte $1F
	.byte $0C
; 4-2
	.byte $0D
	.byte $0D
	.byte $1F
	.byte $0D
; 4-3
	.byte $0E
	.byte $0E
	.byte $1F
	.byte $0E
; 4-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 5-1
	.byte $10
	.byte $10
	.byte $20
	.byte $10
; 5-2
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
; 5-3
	.byte $52
	.byte $12
	.byte $20
	.byte $12
; 5-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 6-1
	.byte $14
	.byte $14
	.byte $21
	.byte $14
; 6-2
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
; 6-3
	.byte $16
	.byte $15
	.byte $21
	.byte $16
; 6-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; 7-1
	.byte $18
	.byte $18
	.byte $22
	.byte $18
; 7-2
	.byte $19
	.byte $19
	.byte $22
	.byte $19
; 7-3
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
; 7-4
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
; Yoshi's House (8-1)
	.byte $03
	.byte $3D
	.byte $23
	.byte $22
; $8600
; $8640
; $8680
; $86C0
LvlScreenOrderPtrLo:
	.byte $00
	.byte $40
	.byte $80
	.byte $C0
LvlScreenOrderPtrHi:
	.byte $86
	.byte $86
	.byte $86
	.byte $86
tbl6_B5E8:
	.byte $00
	.byte $00
	.byte $1C
	.byte $00
	
	.byte $01
	.byte $01
	.byte $1C
	.byte $01
	
	.byte $02
	.byte $02
	.byte $1C
	.byte $02
	
	.byte $03
	.byte $03
	.byte $1C
	.byte $03
	
	.byte $04
	.byte $04
	.byte $1D
	.byte $04
	
	.byte $05
	.byte $05
	.byte $1D
	.byte $05
	
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	
	.byte $07
	.byte $07
	.byte $1D
	.byte $1E
	
	.byte $08
	.byte $08
	.byte $1E
	.byte $08
	
	.byte $49
	.byte $09
	.byte $1E
	.byte $09
	
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
	
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
	
	.byte $0C
	.byte $0C
	.byte $1F
	.byte $0C
	
	.byte $0D
	.byte $0D
	.byte $1F
	.byte $0D
	
	.byte $0E
	.byte $0E
	.byte $1F
	.byte $0E
	
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
	
	.byte $10
	.byte $10
	.byte $20
	.byte $10
	
	.byte $11
	.byte $11
	.byte $20
	.byte $11
	
	.byte $52
	.byte $12
	.byte $20
	.byte $12
	
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
	
	.byte $14
	.byte $14
	.byte $21
	.byte $14
	
	.byte $15
	.byte $15
	.byte $21
	.byte $15
	
	.byte $16
	.byte $15
	.byte $21
	.byte $16
	
	.byte $17
	.byte $17
	.byte $21
	.byte $17
	
	.byte $18
	.byte $18
	.byte $22
	.byte $18
	
	.byte $19
	.byte $19
	.byte $22
	.byte $19
	
	.byte $1A
	.byte $1A
	.byte $22
	.byte $1A
	
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
sub6_B658:
	LDA prgDataBank2
	STA M90_PRG0
	LDY $5F
	LDA $2A
	BNE bra6_B66D
	LDA (tilesetDataPtrs),Y
	STA $60
	LDA (tilesetDataPtrs+4),Y
	STA $61
	RTS
bra6_B66D:
	LDA (tilesetDataPtrs+2),Y
	STA $60
	LDA (tilesetDataPtrs+6),Y
	STA $61
	RTS

tbl6_B676:
	.include "SpawnData.asm"

tbl6_B76E:
	.include "CheckpointSpawnData.asm"

;----------------------------------------
; SUBROUTINE ($B85C)
; Checks if the camera needs to be updated and does so accordingly
;----------------------------------------
updateCameraPos:
	LDA playerXLoDup
	SEC
	SBC cameraXLo
	STA $28
	LDA playerXHiDup
	SBC cameraXHi
	BPL bra6_B872 ; Don't allow camera to be a screen ahead of the player
		LDA $28
		EOR #$FF
		SEC
		ADC #0
		STA $28 ; Seemingly redundant check, as the camera is never ahead of the player
bra6_B872:
	LDA $28
	CMP #$40
	BCS bra6_B8C1
		LDA #$40
		STA playerSprX ; Don't move the player sprite past the left scroll point
		LDA playerXLoDup
		SEC
		SBC playerSprX
		STA cameraXLoDup
		LDA playerXHiDup
		SBC #0
		STA cameraXHiDup
		BPL bra6_B894
			LDA cameraXLoDup
			EOR #$FF
			SEC
			ADC #0
			STA cameraXLoDup
	bra6_B894:
		LDA scrollBoundLeft
		CMP cameraXHiDup
		BNE bra6_B8BE
		; If past the left scroll point
			LDA #$00
			STA cameraXLoDup
			LDY scrollBoundLeft
			INY
			STY cameraXHiDup ; Don't scroll any further left
			LDA playerXLoDup
			SEC
			SBC cameraXLoDup
			STA playerSprX ; Position the player sprite accordingly
			CMP #16
			BCS bra6_B8BE
			; Clamp position to 16 units before the left scroll boundary
				LDA #16
				STA playerXLoDup
				STA playerSprX
				LDA cameraXHiDup
				STA playerXHiDup
				LDA #$00
				STA playerXSpd
	bra6_B8BE:
		JMP loc6_B90C

	; If player is to the right of the left scroll point
	bra6_B8C1:
		LDA $28
		CMP #$90
		BCC bra6_B902
			; If the player is past the right scroll point
			LDA #$90
			STA playerSprX ; Don't move the player sprite past the right scroll point
			LDA playerXLoDup
			SEC
			SBC playerSprX
			STA cameraXLoDup
			LDA playerXHiDup
			SBC #0
			STA cameraXHiDup
			BPL bra6_B8E3
				LDA cameraXLoDup
				EOR #$FF
				SEC
				ADC #$00
				STA cameraXLoDup
		bra6_B8E3:
			LDA scrollBoundRight
			CMP cameraXHiDup
			BNE bra6_B8FF
			; If at the right scroll boundary
				STA cameraXHiDup
				LDA #$00
				STA cameraXLoDup ; Don't scroll right any further
				LDA playerXLoDup
				SEC
				SBC cameraXLoDup
				STA playerSprX
				LDA playerXHiDup
				SBC cameraXHiDup
				BPL bra6_B8FF
					STA playerSprX ; Seemingly useless, possibly unfinished check?

			bra6_B8FF:
				JMP loc6_B90C

		; If between the left and right scroll points
		bra6_B902:
			STA playerSprX
			LDA cameraXHi
			STA cameraXHiDup
			LDA cameraXLo
			STA cameraXLoDup ; Camera did not change so the previous camera X position should match the current position?

; Handle vertical scrolling
loc6_B90C:
	LDA playerYLoDup
	SEC
	SBC cameraYLo
	STA $2B
	LDA playerYHiDup
	SBC cameraYHi
	BPL bra6_B922
		LDA $2B
		EOR #$FF
		SEC
		ADC #$00
		STA $2B
bra6_B922:
	LDA playerYHiDup
	CMP cameraYHi
	BEQ bra6_B92F
		LDA $2B
		SEC
		SBC #16
		STA $2B
bra6_B92F:
	LDA $2B
	CMP #$40
	BCS bra6_B96E
		LDA #$40
		STA playerSprY ; Don't move the player sprite past the top scroll point
		LDA playerYLoDup
		SEC
		SBC playerSprY
		STA cameraYLoDup
		LDA playerYHiDup
		SBC #$00
		STA cameraYHiDup
		BPL bra6_B951
			LDA cameraYLoDup
			EOR #$FF
			SEC
			ADC #$00
			STA cameraYLoDup
	bra6_B951:
		LDA scrollBoundTop
		CMP cameraYHiDup
		BNE bra6_B96B
		; If past the top scroll point
			LDA #$00
			STA cameraYHiDup
			STA cameraYLoDup
			LDA playerYLoDup
			SEC
			SBC cameraYLoDup
			STA playerSprY
			LDA playerYHiDup
			SBC cameraYHiDup
			BPL bra6_B96B
		bra6_B96B:
			JMP loc6_B9C1
	
	; If player is below the top scroll point
	bra6_B96E:
		LDA $2B
		CMP #$B0
		BCC bra6_B9B6
			; If the player is past the bottom scroll point
			LDA #$B0
			STA playerSprY ; Don't move the player sprite past the bottom scroll point
			LDA playerYLoDup
			SEC
			SBC playerSprY
			STA cameraYLoDup
			LDA playerYHiDup
			SBC #$00
			STA cameraYHiDup
			BPL bra6_B999
				LDA cameraYLoDup
				EOR #$FF
				SEC
				ADC #$00
				STA cameraYLoDup
				LDA cameraYHiDup
				EOR #$FF
				SEC
				ADC #$00
				STA cameraYHiDup
		bra6_B999:
			LDA scrollBoundBottom
			CMP cameraYHiDup
			BNE bra6_B9B3
			; If at the bottom scroll boundary
				STA cameraYHiDup
				LDA #$00
				STA cameraYLoDup ; Don't scroll down any further
				LDA playerYLoDup
				SEC
				SBC cameraYLoDup
				STA playerSprY
				LDA playerYHiDup
				SBC cameraYHiDup
				BPL bra6_B9B3
		bra6_B9B3:
			JMP loc6_B9C1
	
	; If between the top and bottom scroll points
	bra6_B9B6:
		STA playerSprY
		LDA cameraYHi
		STA cameraYHiDup
		LDA cameraYLo
		STA cameraYLoDup
		RTS

loc6_B9C1:
	LDA cameraYHiDup
	CMP playerYHiDup
	BEQ bra6_B9CE_RTS
		LDA cameraYLoDup
		SEC
		SBC #16
		STA cameraYLoDup
bra6_B9CE_RTS:
	RTS

sub6_B9CF:
	SEC
	LDA cameraXLoDup
	SBC cameraXLo
	STA scrollVecX ; Scroll as much as the camera moved
	LDA cameraXHiDup
	SBC cameraXHi
	BPL bra6_B9EA
		LDA scrollVecX
		EOR #$FF
		SEC
		ADC #$00
		ORA #%10000000 ; Negate number in sign-magnitude format
		STA scrollVecX
bra6_B9EA:
	LDA scrollVecX
	BEQ bra6_BA20_RTS
		LDA cameraXLo
		EOR cameraXLoDup
		AND #%11111000
		BEQ bra6_BA20_RTS
			LDA cameraXHi
			STA pTilePosXHi
			LDA cameraXLo
			STA pTilePosXLo
			LDA #$00
			STA pTilePosYHi
			LDA #$00
			STA pTilePosYLo ; Pass the tile position for the top left edge of the camera
			LDA scrollVecX
			BMI bra6_BA18
				INC pTilePosXHi ; Pass the tile to the top right edge of the camera instead if scrolling left
				JSR bufferPpuTileCol
				LDX cameraXHi
				INX
				STX $04F2
				RTS
			bra6_BA18:
				JSR bufferPpuTileCol
				LDA cameraXHi
				STA $04F2
bra6_BA20_RTS:
	RTS

sub6_BA21:
	LDA scrollVecX
	BMI bra6_BA34
	CLC
	ADC scrollX
	STA scrollX
	LDA cameraXLoDup
	STA cameraXLo
	LDA cameraXHiDup
	STA cameraXHi
	RTS
bra6_BA34:
	AND #$7F
	STA scrollVecX
	LDA scrollX
	SEC
	SBC scrollVecX
	STA scrollX
	LDA cameraXLoDup
	STA cameraXLo
	LDA cameraXHiDup
	STA cameraXHi
	RTS

;----------------------------------------
; SUBROUTINE ($BA4A)
;----------------------------------------
sub6_BA4A:
	SEC
	LDA cameraYLoDup
	SBC cameraYLo
	STA scrollVecY ; Scroll as much as the camera moved
	LDA cameraYHiDup
	SBC cameraYHi
	BPL bra6_BA65
		LDA scrollVecY
		EOR #$FF
		SEC
		ADC #$00
		ORA #%10000000 ; Negate number in sign-magnitude format
		STA scrollVecY
bra6_BA65:
	LDA cameraYHiDup
	CMP cameraYHi
	BEQ bra6_BA73_RTS
		LDA scrollVecY
		AND #%10001111 ;Cap vertical scroll vector to 15
		STA scrollVecY
bra6_BA73_RTS:
	RTS

	LDA scrollVecY
	BEQ bra6_BA81_RTS
		LDA cameraYLo
		EOR cameraYLoDup
		AND #%11111000
		BNE bra6_BA82
bra6_BA81_RTS:
	RTS

; Unused snippet
bra6_BA82:
	LDA cameraXHi
	STA pTilePosXHi
	LDA cameraXLo
	STA pTilePosXLo
	LDA cameraYHi
	STA pTilePosYHi
	LDA cameraYLo
	STA pTilePosYLo
	LDA scrollVecY
	BMI bra6_BA9A
	INC pTilePosYHi
	RTS
bra6_BA9A:
	LDA pTilePosYLo
	SEC
	SBC #$08
	BCS bra6_BAAA
	DEC pTilePosYHi
	CMP #$F0
	BCC bra6_BAAA
	SEC
	SBC #$10
bra6_BAAA:
	STA pTilePosYLo
	LDA $5B
	STA $28
	LDA $03
	STA $2B
	SEC
	SBC #$08
	STA $03
	CMP #$F0
	BCC bra6_BAC8
	SEC
	SBC #$10
	STA $03
	LDA $5B
	EOR #$02
	STA $5B
bra6_BAC8:
	LDA $2B
	STA $03
	LDA $28
	STA $5B
	RTS

sub6_BAD1:
	LDA scrollVecY
	BMI bra6_BAF3
	CLC
	ADC $03
	STA $03
	CMP #$F0
	BCC bra6_BAEA
	CLC
	ADC #$10
	STA $03
	LDA $5B
	EOR #$02
	STA $5B
bra6_BAEA:
	LDA cameraYLoDup
	STA cameraYLo
	LDA cameraYHiDup
	STA cameraYHi
	RTS
bra6_BAF3:
	AND #$07
	STA $25
	LDA $03
	SEC
	SBC $25
	STA $03
	CMP #$F0
	BCC bra6_BB0D
	SEC
	SBC #$10
	STA $03
	LDA $5B
	EOR #$02
	STA $5B
bra6_BB0D:
	LDA cameraYLoDup
	STA cameraYLo
	LDA cameraYHiDup
	STA cameraYHi
	RTS
	LDA interruptMode
	CMP #$04
	BEQ bra6_BB34_RTS
	LDA ppuUpdatePtr
	BNE bra6_BB34_RTS
	LDA hudUpdateState
	ASL
	TAY
	LDA tbl6_BB35,Y
	STA $32
	LDA tbl6_BB35+1,Y
	STA $33
	JMP ($32)
bra6_BB34_RTS:
	RTS
tbl6_BB35:
	.word off_BB3F
	.word off_BB6D
	.word off_BB9A
	.word off_BBC0
	.word off_BBEF
off_BB3F:
	JSR sub6_BC1F
	INC hudUpdateState
	LDX #$00
	LDA curPlayer
	BEQ bra6_BB4E
	LDX #$01
bra6_BB4E:
	LDA $036A,X
	STA $34
	LDA #$00
	STA $35
	LDA #$0B
	STA $26
	JSR sub6_BC52
	LDY #$00
	LDX #$01
bra6_BB62:
	LDA $0378,Y
	STA ppuDataBuf,X
	INY
	DEX
	BPL bra6_BB62
	RTS
off_BB6D:
	JSR sub6_BC1F
	INC hudUpdateState
	LDX #$04
	LDA #$00
bra6_BB77:
	STA ppuDataBuf,X
	DEX
	BPL bra6_BB77
	LDX #$00
	LDA curPlayer
	BEQ bra6_BB86
	LDX #$01
bra6_BB86:
	LDA $036C,X
	STA $25
	BEQ bra6_BB99_RTS
	LDY #$00
	LDA #$06
bra6_BB91:
	STA ppuDataBuf,Y
	INY
	CPY $25
	BCC bra6_BB91
bra6_BB99_RTS:
	RTS
off_BB9A:
	JSR sub6_BC1F
	INC hudUpdateState
	LDA levelTimer
	STA $34
	LDA levelTimer+1
	STA $35
	LDA #$0B
	STA $26
	JSR sub6_BC52
	LDY #$00
	LDX #$02
bra6_BBB5:
	LDA $0378,Y
	STA ppuDataBuf,X
	INY
	DEX
	BPL bra6_BBB5
	RTS
off_BBC0:
	JSR sub6_BC1F
	INC hudUpdateState
	LDX #$00
	LDA curPlayer
	BEQ bra6_BBCF
	LDX #$02
bra6_BBCF:
	LDA #$0B
	STA $26
	LDA playerScores,X
	STA $34
	LDA playerScores+1,X
	STA $35
	JSR sub6_BC52
	LDY #$00
	LDX #$04
bra6_BBE4:
	LDA $0378,Y
	STA ppuDataBuf,X
	INY
	DEX
	BPL bra6_BBE4
	RTS
off_BBEF:
	JSR sub6_BC1F
	LDA #$00
	STA hudUpdateState
	LDX #$00
	LDA curPlayer
	BEQ bra6_BC00
	LDX #$01
bra6_BC00:
	LDA $0376,X
	STA $34
	LDA #$00
	STA $35
	LDA #$0B
	STA $26
	JSR sub6_BC52
	LDY #$00
	LDX #$01
bra6_BC14:
	LDA $0378,Y
	STA ppuDataBuf,X
	INY
	DEX
	BPL bra6_BC14
	RTS
sub6_BC1F:
	LDA hudUpdateState
	ASL
	ASL
	TAX
	LDA tbl6_BC3E,X
	STA ppuUpdatePtr
	LDA tbl6_BC3E+1,X
	STA ppuUpdatePtr+1
	LDA tbl6_BC3E+2,X
	STA $03A3
	LDA tbl6_BC3E+3,X
	STA ppuBufSize
	RTS
tbl6_BC3E:
	.byte $2B
	.byte $84
	.byte $01
	.byte $02
	.byte $2B
	.byte $68
	.byte $01
	.byte $05
	.byte $2B
	.byte $94
	.byte $01
	.byte $03
	.byte $2B
	.byte $98
	.byte $01
	.byte $05
	.byte $2B
	.byte $7C
	.byte $01
	.byte $02
sub6_BC52:
	LDA #$00
	STA $39
	STA $25
	LDA #$0A
	STA $38
bra6_BC5C:
	JSR sub6_BC83
	LDA $32
	CLC
	ADC $26
	LDY $25
	STA $0378,Y
	INC $25
	LDA $25
	CMP #$05
	BCC bra6_BC5C
	LDY #$04
bra6_BC73:
	LDA $0378,Y
	CMP $26
	BNE bra6_BC82_RTS
	LDA #$00
	STA $0378,Y
	DEY
	BNE bra6_BC73
bra6_BC82_RTS:
	RTS
sub6_BC83:
	LDA #$00
	STA $32
	STA $33
	LDX #$10
bra6_BC8B:
	ASL $34
	ROL $35
	ROL $32
	ROL $33
	LDA $32
	SEC
	SBC $38
	TAY
	LDA $33
	SBC $39
	BCC bra6_BCA5
	INC $34
	STA $33
	STY $32
bra6_BCA5:
	DEX
	BNE bra6_BC8B
	RTS
sub6_BCA9:
	LDA #$2B
	STA PPUADDR
	LDA #$40
	STA PPUADDR
	LDX #$00
	LDA interruptMode
	CMP #$04
	BEQ bra6_BCD9
	LDA curPlayer
	BNE bra6_BCCD
bra6_BCC1:
	LDA tbl6_BCE5,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra6_BCC1
	RTS
bra6_BCCD:
	LDA tbl6_BD65,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra6_BCCD
	RTS
bra6_BCD9:
	LDA tbl6_BDE5,X
	STA PPUDATA
	INX
	CPX #$80
	BCC bra6_BCD9
	RTS
tbl6_BCE5:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $9F
	.byte $A0
	.byte $A1
	.byte $A2
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $02
	.byte $03
	.byte $04
	.byte $05
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A3
	.byte $00
	.byte $00
	.byte $AA
	.byte $00
	.byte $00
	.byte $07
	.byte $08
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A4
	.byte $00
	.byte $00
	.byte $A9
	.byte $00
	.byte $00
	.byte $0E
	.byte $0B
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A5
	.byte $A6
	.byte $A7
	.byte $A8
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl6_BD65:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $9F
	.byte $A0
	.byte $A1
	.byte $A2
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $2B
	.byte $2C
	.byte $2D
	.byte $2E
	.byte $2F
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A3
	.byte $00
	.byte $00
	.byte $AA
	.byte $00
	.byte $00
	.byte $07
	.byte $08
	.byte $09
	.byte $00
	.byte $00
	.byte $00
	.byte $06
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0A
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A4
	.byte $00
	.byte $00
	.byte $A9
	.byte $00
	.byte $00
	.byte $0E
	.byte $0B
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $0B
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $A5
	.byte $A6
	.byte $A7
	.byte $A8
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
tbl6_BDE5:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00

tbl6_BE65:
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $00
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01
	.byte $01

tbl6_BE75:
	.byte %00000001
	.byte %00000010
	.byte %00000100
	.byte %00001000
	.byte %00010000
	.byte %00100000
	.byte %01000000
	.byte %10000000
	.byte %00000001
	.byte %00000010
	.byte %00000100
	.byte %00001000
	.byte %00010000
	.byte %00100000
	.byte %01000000
	.byte %10000000

.export jmp_61_BE85
jmp_61_BE85:
	LDA #$00
	STA sndMusic
	STA scrollX
	STA $03
	STA $5B
	STA interruptMode
	LDX #$C0
	STX chrBgBank1
	INX
	STX chrBgBank2
	INX
	STX chrBgBank3
	INX
	STX chrBgBank4
	JSR sub6_BEE7
	JSR sub6_BF09
	JSR sub6_BEBE
	JSR sub3_F176
	LDA #$18
	STA ppuMaskMirror
	LDA #$88
	STA PPUCTRL
	STA $00
	LDA PPUSTATUS
	RTS
sub6_BEBE:
	LDA #$3F
	STA PPUADDR
	LDA #$00
	STA PPUADDR
	LDX #$00
bra6_BECA:
	LDA tbl6_BED6,X
	STA PPUDATA
	INX
	CPX #$11
	BCC bra6_BECA
	RTS
tbl6_BED6:
	.byte $0E
	.byte $3B
	.byte $16
	.byte $12
	.byte $0E
	.byte $36
	.byte $16
	.byte $26
	.byte $0E
	.byte $3B
	.byte $16
	.byte $38
	.byte $0E
	.byte $3B
	.byte $16
	.byte $30
	.byte $0E
sub6_BEE7:
	LDX #$00
	LDA tbl6_BF60,X
	STA $32
	LDA tbl6_BF60+1,X
	STA $33
	LDA $32
	CLC
	ADC #$02
	STA $32
	LDA $33
	ADC #$00
	STA $33
	RTS
tbl6_BF01:
	.word $2000
	.word $2400
	.word $2800
	.word $2C00
sub6_BF09:
	LDA #$00
	STA PPUCTRL
	STA PPUMASK
	LDA $25
	ASL
	TAX
	LDY #$00
	LDA PPUSTATUS
	LDA tbl6_BF01+1,X
	STA PPUADDR
	LDA tbl6_BF01,X
	STA PPUADDR
loc6_BF26:
	LDA ($32),Y
	BPL bra6_BF44
	CMP #$FF
	BEQ bra6_BF58_RTS
	AND #$7F
	STA $2B
bra6_BF32:
	JSR sub6_BF59
	LDA ($32),Y
	STA PPUDATA
	DEC $2B
	BNE bra6_BF32
	JSR sub6_BF59
	JMP loc6_BF26
bra6_BF44:
	STA $2B
	JSR sub6_BF59
	LDA ($32),Y
bra6_BF4B:
	STA PPUDATA
	DEC $2B
	BNE bra6_BF4B
	JSR sub6_BF59
	JMP loc6_BF26
bra6_BF58_RTS:
	RTS
sub6_BF59:
	INC $32
	BNE bra6_BF5F_RTS
	INC $33
bra6_BF5F_RTS:
	RTS
tbl6_BF60:
	.byte $BA
	.byte $AB
	.byte $04
	STA objFlags,X
	LDA #$00
	STA objVar,X
	PLA
	PLA
	RTS
	JSR sub6_BF7A
	PLA
	PLA
	RTS
	LDA invincibilityTimer
	BEQ bra6_BF7A
	RTS
bra6_BF7A:
sub6_BF7A:
	LDX $A4
	LDA objSlot,X
	CMP #$48
	BCC bra6_BF87
	CMP #$4C
	BCC bra6_BF9B
bra6_BF87:
	LDA objXDistHi,X
	BMI bra6_BF93
	LDA objFlags,X
	ORA #$40
	BNE bra6_BF98
bra6_BF93:
	LDA objFlags,X
	AND #$BF
bra6_BF98:
	STA objFlags,X
bra6_BF9B:
	LDA #$00
	STA playerHoldFlag
	LDA playerYoshiState
	BEQ bra6_BFAD
	LDA #$01
	STA playerHurtFlag
	JMP loc6_BFC0
bra6_BFAD:
	LDA playerPowerup
	BEQ bra6_BFD2
	LDA #$00
	STA playerPowerup
	LDA #$01
	STA playerPowerupBuffer
	LDA #$07
	STA gameState
loc6_BFC0:
	LDA #$D0
	STA invincibilityTimer
	LDA #$0C
	STA sndSfx
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	RTS
bra6_BFD2:
	LDA #$04
	STA gameState
	LDA #$00
	STA gameSubstate
	STA playerState
	STA $06DC
	STA $06DD
	RTS
