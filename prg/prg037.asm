subr000:
LDA $0C
BNE $0005
RTS
LDX $A4
LDA $0655,X
AND #$3F
ASL A
TAX
LDA $8038,X
STA $32
LDA $8039,X
STA $33
LDY #$80
LDX $A4
LDA $0500,X
AND #$01
BEQ $0025
LDY #$C0
STY $36
LDA #$20
STA $05F0
STA $06E1
JSR $A118
LDA #$00
STA $06E1
RTS
.db $3C, $80, $4F, $80, $02, $08, $CF, $CC, $CD, $CE, $CF, $C4, $C5, $C6, $C7, $C4
.db $C5, $C6, $C7, $C4, $C5, $C6, $C7, $02, $08, $CF, $C4, $C5, $C6, $C7, $C4, $C5
.db $C6, $C7, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB
subr001: