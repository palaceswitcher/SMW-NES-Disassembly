; 0x048010-0x04A00F
lda_36_C000: 
	.word PlayerAnimTablesTbl  ; 00 No Yoshi
	.word YoshiAnimTablesTbl_1 ; 01 If Yoshi present (all entries on this table point to the same thing)
	.word YoshiAnimTablesTbl_2 ; 02
	.word YoshiAnimTablesTbl_2 ; 03 Because Yoshi Status is doubled for use as an index this table is long
	.word YoshiAnimTablesTbl_2 ; 04
	.word YoshiAnimTablesTbl_2 ; 05
	.word YoshiAnimTablesTbl_3 ; 06 Used when Mario has a powerup (?)
	.word YoshiAnimTablesTbl_3 ; 07
	.word YoshiAnimTablesTbl_3 ; 08
	.word YoshiAnimTablesTbl_3 ; 09 As far as I can tell these are all identical unique copies, but this hasn't been fully investigated
PlayerAnimTablesTbl:
	.word AnimTbl_PSmall
	.word AnimTbl_PBig
	.word AnimTbl_PFire
	.word AnimTbl_PCapeStatic
	.word AnimTbl_PCapeMove
	.word AnimTbl_PSmall_Hold
	.word AnimTbl_PBig_Hold
	.word AnimTbl_PFire_Hold
	.word AnimTbl_PCapeStatic_Hold
	.word AnimTbl_PCapeMove_Hold
AnimTbl_PSmall:	; Player Action (associated with animation)
	.word Anim_PSmall_Stand	; Nothing 	00
	.word Anim_PSmall_Walk		; Walking 	01
	.word Anim_PSmall_Run		; Running 	02
	.word Anim_PSmall_Walk		; Unused  	03
	.word Anim_PSmall_Jump		; Jumping 	04
	.word Anim_PSmall_Spin		; Spin    	05
	.word Anim_PSmall_Turn		; Skid    	06
	.word Anim_PSmall_Duck		; Duck    	07
	.word Anim_PSmall_Up		; Look up 	08
	.word Anim_PSmall_RunJump	; Run jump   09
	.word Anim_PSmall_Fall		; Falling 	0A note that this is specifically for falling from a ledge, not a jump
	.word Anim_PSmall_Sink		; Sink    	0B
	.word Anim_PSmall_Swim		; Swim    	0C
	.word Anim_PSmall_ClimbIdle; Climb   	0D
	.word Anim_PSmall_Climb	; Climb move	0E
	.word Anim_PSmall_RunJump		; Flying		0F
	.word Anim_PSmall_Win		; Victory	10
	.word Anim_PSmall_Die		; Dead		11
AnimTbl_PSmall_Hold:
	.word Anim_PSmall_Hold
	.word Anim_PSmall_HoldWalk
	.word Anim_PSmall_HoldRun
	.word Anim_PSmall_HoldWalk
	.word Anim_PSmall_HoldJump
	.word Anim_PSmall_Spin
	.word Anim_PSmall_Turn
	.word Anim_PSmall_HoldDuck
	.word Anim_PSmall_Up
	.word Anim_PSmall_HoldJump
	.word Anim_PSmall_HoldFall
	.word Anim_PSmall_HoldSink
	.word Anim_PSmall_HoldSwim
	.word Anim_PSmall_ClimbIdle
	.word Anim_PSmall_Climb
	.word Anim_PSmall_HoldJump
	.word Anim_PSmall_Win
	.word Anim_PSmall_Die
Anim_PSmall_Stand:
	.word SprMap_PSmall_Stand
	.byte $0A
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $80
	.byte $00
Anim_PSmall_Walk:
	.word SprMap_PSmall_Stand
	.byte $04
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $04
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $80
	.byte $00
Anim_PSmall_Run:
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $02
	.byte $00
	.word SprMap_PSmall_Walk1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Run1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Run2
	.byte $02
	.byte $00
	.word SprMap_PSmall_Run1
	.byte $02
	.byte $00
	.word SprMap_PSmall_Run2
	.byte $02
	.byte $00
	.word SprMap_PSmall_Run1
	.byte $90
	.byte $00
Anim_PSmall_Jump:
	.word SprMap_PSmall_Jump
	.byte $23
	.byte $00
	.word SprMap_PSmall_Fall
	.byte $02
	.byte $00
	.word SprMap_PSmall_Fall
	.byte $81
	.byte $00
Anim_PSmall_RunJump:
	.word SprMap_PSmall_RunJump
	.byte $0A
	.byte $00
	.word SprMap_PSmall_RunJump
	.byte $80
	.byte $00
Anim_PSmall_Spin:
	.word SprMap_PSmall_Stand
	.byte $01
	.byte $00
	.word SprMap_PSmall_Back
	.byte $01
	.byte $00
	.word SprMap_PSmall_Flipped
	.byte $01
	.byte $00
	.word SprMap_PSmall_Front
	.byte $01
	.byte $00
	.word SprMap_PSmall_Stand
	.byte $80
	.byte $00
Anim_PSmall_Turn:
	.word SprMap_PSmall_Turn
	.byte $0A
	.byte $00
	.word SprMap_PSmall_Turn
	.byte $80
	.byte $00
Anim_PSmall_Duck:
	.word SprMap_PSmall_Duck
	.byte $08
	.byte $00
	.word SprMap_PSmall_Duck
	.byte $80
	.byte $00
Anim_PSmall_Up:
	.word SprMap_PSmall_LookUp
	.byte $02
	.byte $00
	.word SprMap_PSmall_LookUp
	.byte $80
	.byte $00
Anim_PSmall_Fall:
	.word SprMap_PSmall_Fall
	.byte $02
	.byte $00
	.word SprMap_PSmall_Fall
	.byte $80
	.byte $00
Anim_PSmall_Sink:
	.word SprMap_PSmall_Swim1
	.byte $01
	.byte $00
	.word SprMap_PSmall_Swim1
	.byte $80
	.byte $00
Anim_PSmall_Swim:
	.word SprMap_PSmall_RunJump
	.byte $03
	.byte $00
	.word SprMap_PSmall_Swim1
	.byte $03
	.byte $00
	.word SprMap_PSmall_RunJump
	.byte $80
	.byte $00
Anim_PSmall_ClimbIdle:
	.word SprMap_PSmall_Climb1
	.byte $08
	.byte $00
	.word SprMap_PSmall_Climb1
	.byte $80
	.byte $00
Anim_PSmall_Climb:
	.word SprMap_PSmall_Climb1
	.byte $08
	.byte $00
	.word SprMap_PSmall_Climb2
	.byte $08
	.byte $00
	.word SprMap_PSmall_Climb1
	.byte $80
	.byte $00
Anim_PSmall_Win:
	.word SprMap_PSmall_Victory
	.byte $0A
	.byte $00
	.word SprMap_PSmall_Victory
	.byte $80
	.byte $00
Anim_PSmall_Die:
	.word SprMap_PSmall_Death1
	.byte $28
	.byte $00
	.word SprMap_PSmall_Death1
	.byte $08
	.byte $00
	.word SprMap_PSmall_Death2
	.byte $08
	.byte $00
	.word SprMap_PSmall_Death1
	.byte $81
	.byte $00
Anim_PSmall_Hold:
	.word SprMap_PSmall_Hold
	.byte $0A
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $80
	.byte $00
Anim_PSmall_HoldWalk:
	.word SprMap_PSmall_Hold
	.byte $04
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $04
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $80
	.byte $00
Anim_PSmall_HoldRun:
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $90
	.byte $00
Anim_PSmall_HoldJump:
	.word SprMap_PSmall_HoldWalk
	.byte $23
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $81
	.byte $00
Anim_PSmall_HoldDuck:
	.word SprMap_PSmall_DuckHold
	.byte $08
	.byte $00
	.word SprMap_PSmall_DuckHold
	.byte $80
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $02
	.byte $00
	.word SprMap_PSmall_Hold
	.byte $80
	.byte $00
Anim_PSmall_HoldFall:
	.word SprMap_PSmall_HoldWalk
	.byte $02
	.byte $00
	.word SprMap_PSmall_HoldWalk
	.byte $80
	.byte $00
Anim_PSmall_HoldSink:
	.word pnt3_C2D8
	.byte $01
	.byte $00
	.word pnt3_C2D8
	.byte $80
	.byte $00
Anim_PSmall_HoldSwim:
	.word pnt3_C2D8
	.byte $03
	.byte $00
	.word pnt3_C2D8
	.byte $03
	.byte $00
	.word pnt3_C2D8
	.byte $80
	.byte $00
SprMap_PSmall_Stand:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $60, $61
SprMap_PSmall_Walk1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $6A, $6B
SprMap_PSmall_Run1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $60, $6C
SprMap_PSmall_Run2:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $6A, $6D
SprMap_PSmall_RunJump:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $68, $69
SprMap_PSmall_Jump:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $74, $75
	.byte $76, $77
	.byte $78, $79
SprMap_PSmall_Fall:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $7A, $7B
	.byte $7C, $7D
	.byte $57, $5C
SprMap_PSmall_Back:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $48, $49
	.byte $4A, $4B
	.byte $4C, $4D
SprMap_PSmall_Flipped:
	.byte $42
	.byte $03
	.byte $99
	.byte $08
	.byte $65, $64
	.byte $7F, $66
	.byte $61, $60
SprMap_PSmall_Front:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $4E, $4F
	.byte $56, $58
	.byte $59, $5A
SprMap_PSmall_Turn:
	.byte $02
	.byte $03
	.byte $9A
	.byte $08
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
SprMap_PSmall_Duck:
	.byte $02
	.byte $02
	.byte $99
	.byte $08
	.byte $50, $51
	.byte $52, $53
SprMap_PSmall_LookUp:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $5B, $5D
	.byte $5E, $5F
	.byte $60, $61
SprMap_PSmall_Swim1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $62, $63
SprMap_PSmall_Climb1:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $48, $49
	.byte $4A, $4B
	.byte $72, $73
SprMap_PSmall_Climb2:
	.byte $42
	.byte $03
	.byte $99
	.byte $08
	.byte $49, $48
	.byte $4B, $4A
	.byte $73, $72
SprMap_PSmall_Victory:
	.byte $02
	.byte $03
	.byte $98
	.byte $08
	.byte $0E, $0D
	.byte $10, $0F
	.byte $12, $11
SprMap_PSmall_Death1:
	.byte $02
	.byte $03
	.byte $98
	.byte $08
	.byte $18, $19
	.byte $1A, $1B
	.byte $1C, $1D
SprMap_PSmall_Death2:
	.byte $42
	.byte $03
	.byte $98
	.byte $08
	.byte $19, $18
	.byte $1B, $1A
	.byte $1D, $1C
SprMap_PSmall_Hold:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $40, $41
SprMap_PSmall_HoldWalk:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $6E, $6F
	.byte $70, $71
	.byte $42, $43
SprMap_PSmall_DuckHold:
	.byte $02
	.byte $02
	.byte $99
	.byte $08
	.byte $44, $45
	.byte $46, $47
pnt3_C2D8:
	.byte $02
	.byte $03
	.byte $99
	.byte $08
	.byte $64, $65
	.byte $66, $7F
	.byte $62, $63
AnimTbl_PBig:
	.word Anim_PBig_Stand
	.word Anim_PBig_Walk
	.word Anim_PBig_Run
	.word Anim_PBig_Walk
	.word Anim_PBig_Jump
	.word Anim_PBig_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_Duck
	.word Anim_PBig_LookUp
	.word Anim_PBig_RunJump
	.word Anim_PBig_Fall
	.word Anim_PBig_Sink
	.word Anim_PBig_Swim
	.word Anim_PBig_Climb
	.word Anim_PBig_ClimbMove
	.word Anim_PBig_RunJump
	.word Anim_PBig_Win
AnimTbl_PBig_Hold:
	.word Anim_PBig_Hold
	.word Anim_PBig_HoldWalk
	.word Anim_PBig_HoldRun
	.word Anim_PBig_HoldWalk
	.word Anim_PBig_HoldJump
	.word Anim_PBig_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_HoldDuck
	.word Anim_PBig_LookUp
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldFall
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldSwim
	.word Anim_PBig_Climb
	.word Anim_PBig_ClimbMove
	.word Anim_PBig_Sink
	.word Anim_PBig_Win
Anim_PBig_Stand:
	.word SprMap_PBig_Stand
	.byte $0A
	.byte $00
	.word SprMap_PBig_Stand
	.byte $80
	.byte $00
Anim_PBig_Walk:
	.word SprMap_PBig_Walk1
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Stand
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Stand
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $80
	.byte $00
Anim_PBig_Run:
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run1
	.byte $02
	.byte $00
	.word SprMap_PBig_Run2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run3
	.byte $02
	.byte $00
	.word SprMap_PBig_Run2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run1
	.byte $90
	.byte $00
Anim_PBig_Jump:
	.word SprMap_PBig_Jump
	.byte $23
	.byte $00
	.word SprMap_PBig_Fall
	.byte $02
	.byte $00
	.word SprMap_PBig_Fall
	.byte $81
	.byte $00
Anim_PBig_RunJump:
	.word SprMap_PBig_RunJump
	.byte $0A
	.byte $00
	.word SprMap_PBig_RunJump
	.byte $80
	.byte $00
Anim_PBig_Spin:
	.word SprMap_PBig_Front
	.byte $01
	.byte $00
	.word SprMap_PBig_Back
	.byte $01
	.byte $00
	.word SprMap_PBig_Side1
	.byte $01
	.byte $00
	.word SprMap_PBig_Side2
	.byte $01
	.byte $00
	.word SprMap_PBig_Front
	.byte $80
	.byte $00
Anim_PBig_Turn:
	.word SprMap_PBig_Turn
	.byte $0A
	.byte $00
	.word SprMap_PBig_Turn
	.byte $80
	.byte $00
Anim_PBig_Duck:
	.word SprMap_PBig_Duck
	.byte $08
	.byte $00
	.word SprMap_PBig_Duck
	.byte $80
	.byte $00
Anim_PBig_LookUp:
	.word SprMap_PBig_LookUp
	.byte $02
	.byte $00
	.word SprMap_PBig_LookUp
	.byte $80
	.byte $00
Anim_PBig_Fall:
	.word SprMap_PBig_Fall
	.byte $02
	.byte $00
	.word SprMap_PBig_Fall
	.byte $80
	.byte $00
Anim_PBig_Sink:
	.word SprMap_PBig_Swim1
	.byte $01
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $80
	.byte $00
Anim_PBig_Swim:
	.word SprMap_PBig_RunJump
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim2
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim2
	.byte $03
	.byte $00
	.word SprMap_PBig_Fall
	.byte $80
	.byte $00
Anim_PBig_Climb:
	.word SprMap_PBig_Climb1
	.byte $08
	.byte $00
	.word SprMap_PBig_Climb1
	.byte $80
	.byte $00
Anim_PBig_ClimbMove:
	.word SprMap_PBig_Climb1
	.byte $08
	.byte $00
	.word SprMap_PBig_Climb2
	.byte $08
	.byte $00
	.word SprMap_PBig_Climb1
	.byte $80
	.byte $00
Anim_PBig_Win:
	.word SprMap_PBig_Victory
	.byte $0A
	.byte $00
	.word SprMap_PBig_Victory
	.byte $80
	.byte $00
Anim_PBig_Hold:
	.word SprMap_PBig_Hold
	.byte $0A
	.byte $00
	.word SprMap_PBig_Hold
	.byte $80
	.byte $00
Anim_PBig_HoldWalk:
	.word SprMap_PBig_HoldWalk1
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Hold
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Hold
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $80
	.byte $00
Anim_PBig_HoldRun:
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Hold
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Hold
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Hold
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Hold
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Hold
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $90
	.byte $00
Anim_PBig_HoldJump:
	.word SprMap_PBig_HoldWalk1
	.byte $23
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk1
	.byte $81
	.byte $00
Anim_PBig_HoldDuck:
	.word SprMap_PBig_DuckHold
	.byte $08
	.byte $00
	.word SprMap_PBig_DuckHold
	.byte $80
	.byte $00
	.word SprMap_PBig_LookUp
	.byte $02
	.byte $00
	.word SprMap_PBig_LookUp
	.byte $80
	.byte $00
Anim_PBig_HoldFall:
	.word SprMap_PBig_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PBig_HoldWalk2
	.byte $80
	.byte $00
Anim_PBig_HoldSwim:
	.word SprMap_PBig_Swim1
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $03
	.byte $00
	.word SprMap_PBig_Swim1
	.byte $80
	.byte $00
SprMap_PBig_Stand:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $38
SprMap_PBig_Walk1:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $31, $23
	.byte $2A, $2C
	.byte $2D, $2F
	.byte $2E, $30
SprMap_PBig_Walk2:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $21, $23
	.byte $22, $24
	.byte $25, $27
	.byte $26, $28
SprMap_PBig_Run1:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $64, $65, $68
	.byte $66, $67, $FF
SprMap_PBig_Run3:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $6D, $6E, $68
	.byte $6F, $70, $FF
SprMap_PBig_Run2:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $69, $6A, $68
	.byte $6B, $6C, $FF
SprMap_PBig_RunJump:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $71, $72, $68
	.byte $73, $74, $76
SprMap_PBig_Jump:
	.byte $02
	.byte $04
	.byte $89
	.byte $08
	.byte $61, $62
	.byte $63, $64
	.byte $65, $6E
	.byte $67, $70
SprMap_PBig_Fall:
	.byte $02
	.byte $04
	.byte $89
	.byte $08
	.byte $69, $6A
	.byte $6B, $6C
	.byte $6D, $6E
	.byte $6F, $70
SprMap_PBig_Front:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $21, $22
	.byte $23, $24
	.byte $25, $26
	.byte $27, $28
SprMap_PBig_Back:
	.byte $42
	.byte $04
	.byte $89
	.byte $08
	.byte $74, $7B
	.byte $76, $7C
	.byte $78, $77
	.byte $7A, $79
SprMap_PBig_Side1:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $38
SprMap_PBig_Side2:
	.byte $42
	.byte $04
	.byte $84
	.byte $08
	.byte $33, $29
	.byte $34, $32
	.byte $37, $35
	.byte $38, $36
SprMap_PBig_Turn:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $A8, $AA
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
SprMap_PBig_Duck:
	.byte $02
	.byte $03
	.byte $84
	.byte $08
	.byte $39, $3A
	.byte $3B, $3D
	.byte $3C, $2B
SprMap_PBig_LookUp:
	.byte $02
	.byte $04
	.byte $87
	.byte $08
	.byte $F3, $F4
	.byte $F5, $F6
	.byte $F7, $F8
	.byte $F9, $FA
SprMap_PBig_Swim1:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $7C, $7D, $FF
	.byte $73, $7B, $75
SprMap_PBig_Swim2:
	.byte $03
	.byte $04
	.byte $85
	.byte $08
	.byte $7F, $61, $FF
	.byte $62, $63, $FF
	.byte $77, $78, $FF
	.byte $73, $7A, $76
SprMap_PBig_Climb1:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $29, $2A
	.byte $2B, $2C
	.byte $2D, $2E
	.byte $2F, $30
SprMap_PBig_Climb2:
	.byte $42
	.byte $04
	.byte $88
	.byte $08
	.byte $2A, $29
	.byte $2C, $2B
	.byte $2E, $2D
	.byte $30, $2F
SprMap_PBig_Victory:
	.byte $02
	.byte $04
	.byte $8B
	.byte $08
	.byte $E9, $EA
	.byte $EB, $EC
	.byte $ED, $EE
	.byte $EF, $F0
SprMap_PBig_Hold:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $B0, $B2
	.byte $B1, $B3
SprMap_PBig_HoldWalk1:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $A4, $A6
	.byte $A5, $A7
SprMap_PBig_HoldWalk2:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $AA, $AC
	.byte $AB, $AD
SprMap_PBig_DuckHold:
	.byte $02
	.byte $03
	.byte $86
	.byte $08
	.byte $B4, $B5
	.byte $B6, $B7
	.byte $B8, $B9
AnimTbl_PFire:
	.word Anim_PFire_Stand
	.word Anim_PFire_Walk
	.word Anim_PFire_Run
	.word Anim_PFire_Walk
	.word Anim_PFire_Jump
	.word Anim_PFire_Spin
	.word Anim_PFire_Turn
	.word Anim_PFire_Duck
	.word Anim_PFire_Lookup
	.word Anim_PFire_RunJump
	.word Anim_PFire_Fall
	.word Anim_PFire_Sink
	.word Anim_PFire_Swim
	.word Anim_PFire_Climb
	.word Anim_PFire_ClimbMove
	.word Anim_PFire_RunJump ; unused
	.word Anim_PFire_Win
	.word Anim_PFire_ShootAir
	.word Anim_PFire_ShootSwim
	.word Anim_PFire_Shoot
AnimTbl_PFire_Hold:
	.word Anim_PFire_Hold
	.word Anim_PFire_HoldWalk
	.word Anim_PFire_HoldRun
	.word Anim_PFire_HoldWalk
	.word Anim_PFire_HoldJump
	.word Anim_PFire_Spin
	.word Anim_PFire_Turn
	.word Anim_PFire_HoldDuck
	.word Anim_PFire_Lookup
	.word Anim_PFire_Sink
	.word Anim_PFire_HoldSwim ; unused but fully implemented
	.word Anim_PFire_Sink
	.word Anim_PFire_Swim
	.word Anim_PFire_Climb
	.word Anim_PFire_ClimbMove
	.word Anim_PFire_Sink
	.word Anim_PFire_Win
	.word Anim_PFire_ShootAir
	.word Anim_PFire_ShootSwim
	.word Anim_PFire_Shoot
Anim_PFire_Stand:
	.word SprMap_PFire_Stand
	.byte $0A
	.byte $00
	.word SprMap_PFire_Stand
	.byte $80
	.byte $00
Anim_PFire_Walk:
	.word SprMap_PFire_Walk1
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Stand
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk1
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Stand
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Walk1
	.byte $80
	.byte $00
Anim_PFire_Run:
	.word SprMap_PFire_Walk1
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Stand
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk1
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Stand
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk1
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Stand
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk1
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Stand
	.byte $02
	.byte $00
	.word SprMap_PFire_Walk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Run1
	.byte $02
	.byte $00
	.word SprMap_PFire_Run2
	.byte $02
	.byte $00
	.word SprMap_PFire_Run3
	.byte $02
	.byte $00
	.word SprMap_PFire_Run2
	.byte $02
	.byte $00
	.word SprMap_PFire_Run1
	.byte $90
	.byte $00
Anim_PFire_Jump:
	.word SprMap_PFire_Jump
	.byte $23
	.byte $00
	.word SprMap_PFire_Fall
	.byte $02
	.byte $00
	.word SprMap_PFire_Fall
	.byte $81
	.byte $00
Anim_PFire_RunJump:
	.word SprMap_PFire_RunJump
	.byte $0A
	.byte $00
	.word SprMap_PFire_RunJump
	.byte $80
	.byte $00
Anim_PFire_Spin:
	.word SprMap_PFire_Front
	.byte $01
	.byte $00
	.word SprMap_PFire_Back
	.byte $01
	.byte $00
	.word SprMap_PFire_Stand
	.byte $01
	.byte $00
	.word SprMap_PFire_Flipped
	.byte $01
	.byte $00
	.word SprMap_PFire_Front
	.byte $80
	.byte $00
Anim_PFire_Turn:
	.word SprMap_PFire_Turn
	.byte $0A
	.byte $00
	.word SprMap_PFire_Turn
	.byte $80
	.byte $00
Anim_PFire_Duck:
	.word SprMap_PFire_Duck
	.byte $08
	.byte $00
	.word SprMap_PFire_Duck
	.byte $80
	.byte $00
Anim_PFire_Lookup:
	.word SprMap_PFire_LookUp
	.byte $02
	.byte $00
	.word SprMap_PFire_LookUp
	.byte $80
	.byte $00
Anim_PFire_Fall:
	.word SprMap_PFire_Fall
	.byte $02
	.byte $00
	.word SprMap_PFire_Fall
	.byte $80
	.byte $00
Anim_PFire_Sink:
	.word SprMap_PFire_Swim1
	.byte $01
	.byte $00
	.word SprMap_PFire_Swim1
	.byte $80
	.byte $00
Anim_PFire_Swim:
	.word SprMap_PFire_RunJump
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim2
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim1
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim2
	.byte $03
	.byte $00
	.word SprMap_PFire_Fall
	.byte $80
	.byte $00
Anim_PFire_Climb:
	.word SprMap_PFire_Climb1
	.byte $08
	.byte $00
	.word SprMap_PFire_Climb1
	.byte $80
	.byte $00
Anim_PFire_ClimbMove:
	.word SprMap_PFire_Climb1
	.byte $08
	.byte $00
	.word SprMap_PFire_Climb2
	.byte $08
	.byte $00
	.word SprMap_PFire_Climb1
	.byte $80
	.byte $00
Anim_PFire_Win:
	.word SprMap_PFire_Victory
	.byte $0A
	.byte $00
	.word SprMap_PFire_Victory
	.byte $80
	.byte $00
Anim_PFire_ShootAir:
	.word SprMap_PFire_Swim1
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim1
	.byte $80
	.byte $00
Anim_PFire_ShootSwim:
	.word SprMap_PFire_Swim2
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim1
	.byte $03
	.byte $00
	.word SprMap_PFire_Swim1
	.byte $80
	.byte $00
Anim_PFire_Shoot:
	.word SprMap_PFire_Shoot
	.byte $03
	.byte $00
	.word SprMap_PFire_Shoot
	.byte $80
	.byte $00
Anim_PFire_Hold:
	.word SprMap_PFire_Hold
	.byte $0A
	.byte $00
	.word SprMap_PFire_Hold
	.byte $80
	.byte $00
Anim_PFire_HoldWalk:
	.word SprMap_PFire_HoldWalk1
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Hold
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PFire_Hold
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $04
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $80
	.byte $00
Anim_PFire_HoldRun:
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Hold
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Hold
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Hold
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Hold
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_Hold
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $90
	.byte $00
Anim_PFire_HoldJump:
	.word SprMap_PFire_HoldWalk1
	.byte $23
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk1
	.byte $81
	.byte $00
Anim_PFire_HoldDuck:
	.word SprMap_PFire_DuckHold
	.byte $08
	.byte $00
	.word SprMap_PFire_DuckHold
	.byte $80
	.byte $00
Anim_PFire_HoldSwim:
	.word SprMap_PFire_HoldWalk2
	.byte $02
	.byte $00
	.word SprMap_PFire_HoldWalk2
	.byte $80
	.byte $00
SprMap_PFire_Stand:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $2C, $2E
	.byte $2D, $2F
	.byte $18, $1A
	.byte $19, $1B
SprMap_PFire_Walk1:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $00, $02
	.byte $01, $03
	.byte $04, $06
	.byte $05, $07
SprMap_PFire_Walk2:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $0A, $0C
	.byte $0B, $0D
	.byte $0E, $28
	.byte $0F, $29
SprMap_PFire_Run1:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F0, $F2, $FC
	.byte $F1, $F3, $FF
SprMap_PFire_Run3:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F8, $FA, $FC
	.byte $F9, $FB, $FF
SprMap_PFire_Run2:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $F4, $F6, $FC
	.byte $F5, $F7, $FF
SprMap_PFire_RunJump:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $C0, $C2, $C6
	.byte $C1, $C3, $C7
SprMap_PFire_Jump:
	.byte $02
	.byte $04
	.byte $83
	.byte $08
	.byte $D8, $DA
	.byte $D9, $DB
	.byte $DC, $E0
	.byte $DD, $E1
SprMap_PFire_Fall:
	.byte $02
	.byte $04
	.byte $83
	.byte $08
	.byte $E9, $EA
	.byte $EB, $EC
	.byte $E6, $E0
	.byte $E8, $E1
SprMap_PFire_Front:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $24, $16
	.byte $25, $2A
	.byte $26, $2B
	.byte $27, $30
SprMap_PFire_Back:
	.byte $42
	.byte $04
	.byte $80
	.byte $08
	.byte $32, $20
	.byte $39, $21
	.byte $3A, $22
	.byte $3B, $23
SprMap_PFire_Flipped:
	.byte $42
	.byte $04
	.byte $80
	.byte $08
	.byte $2E, $2C
	.byte $2F, $2D
	.byte $1A, $18
	.byte $1B, $19
SprMap_PFire_Turn:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $A8, $AA
	.byte $A9, $AB
	.byte $AC, $AE
	.byte $AD, $AF
SprMap_PFire_Duck:
	.byte $02
	.byte $03
	.byte $80
	.byte $08
	.byte $31, $33
	.byte $34, $36
	.byte $35, $37
SprMap_PFire_LookUp:
	.byte $02
	.byte $04
	.byte $81
	.byte $08
	.byte $40, $41
	.byte $42, $43
	.byte $44, $45
	.byte $46, $47
SprMap_PFire_Swim1:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $CC, $CE, $FF
	.byte $CD, $CF, $E7
SprMap_PFire_Swim2:
	.byte $03
	.byte $04
	.byte $83
	.byte $08
	.byte $D6, $E3, $FF
	.byte $E2, $E4, $FF
	.byte $C8, $CA, $FF
	.byte $C9, $CB, $C7
SprMap_PFire_Climb1:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $B0, $B2
	.byte $B1, $B3
	.byte $B4, $B6
	.byte $B5, $B7
SprMap_PFire_Climb2:
	.byte $42
	.byte $04
	.byte $82
	.byte $08
	.byte $B2, $B0
	.byte $B3, $B1
	.byte $B6, $B4
	.byte $B7, $B5
SprMap_PFire_Victory:
	.byte $02
	.byte $04
	.byte $81
	.byte $08
	.byte $68, $69
	.byte $6A, $6B
	.byte $6C, $6D
	.byte $6E, $6F
SprMap_PFire_Shoot:
	.byte $02
	.byte $04
	.byte $80
	.byte $08
	.byte $08, $0C
	.byte $09, $0D
	.byte $1C, $1E
	.byte $1D, $1F
SprMap_PFire_Hold:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $A1, $A3
SprMap_PFire_DuckHold:
	.byte $02
	.byte $03
	.byte $81
	.byte $08
	.byte $78, $79
	.byte $7A, $7B
	.byte $7C, $7D
SprMap_PFire_HoldWalk1:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $85, $87
SprMap_PFire_HoldWalk2:
	.byte $02
	.byte $04
	.byte $82
	.byte $08
	.byte $80, $82
	.byte $81, $83
	.byte $A0, $A2
	.byte $8B, $8D
AnimTbl_PCapeStatic: ; player animations for when the cape isn't animating
	.word Anim_PCape_Stand ; unique from normal sprite 
	.word Anim_PCape_Walk  ; larger mapping but otherwise identical
	.word Anim_PCape_Run	  ; this suggests that the cape may have originally been part of the player sprite
	.word Anim_PBig_Walk	  ; in game the cape is mostly a separate sprite bar a few frames
	.word Anim_PBig_Jump
	.word Anim_PCape_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_Duck
	.word Anim_PCape_LookUp
	.word Anim_PBig_RunJump
	.word Anim_PBig_Fall
	.word Anim_PBig_Sink
	.word Anim_PBig_Swim
	.word Anim_PCape_Climb
	.word Anim_PCape_ClimbMove
	.word Anim_PBig_RunJump
	.word Anim_PBig_Win  
AnimTbl_PCapeStatic_Hold: 
	.word Anim_PCape_HoldStand
	.word Anim_PBig_HoldWalk
	.word Anim_PCape_Run
	.word Anim_PBig_HoldWalk
	.word Anim_PBig_HoldJump
	.word Anim_PCape_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_HoldDuck
	.word Anim_PCape_LookUp
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldFall
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldSwim
	.word Anim_PCape_Climb
	.word Anim_PCape_ClimbMove
	.word Anim_PBig_Sink
	.word Anim_PBig_Win
Anim_PCape_Stand:
	.word SprMap_PCape_Stand
	.byte $0A
	.byte $00
	.word SprMap_PCape_Stand
	.byte $80
	.byte $00
Anim_PCape_Walk:
	.word SprMap_PBig_Walk1
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PCape_Stand
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PCape_Stand
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $04
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $80
	.byte $00
Anim_PCape_Run:
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PCape_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PCape_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PCape_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk1
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PCape_Stand
	.byte $02
	.byte $00
	.word SprMap_PBig_Walk2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run1
	.byte $02
	.byte $00
	.word SprMap_PBig_Run2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run3
	.byte $02
	.byte $00
	.word SprMap_PBig_Run2
	.byte $02
	.byte $00
	.word SprMap_PBig_Run1
	.byte $90
	.byte $00
Anim_PCape_Spin:
	.word SprMap_PBig_Front
	.byte $01
	.byte $00
	.word SprMap_PCape_Back
	.byte $01
	.byte $00
	.word SprMap_PBig_Side1
	.byte $01
	.byte $00
	.word SprMap_PBig_Side2
	.byte $01
	.byte $00
	.word SprMap_PBig_Front
	.byte $80
	.byte $00
Anim_PCape_LookUp:
	.word SprMap_PCape_LookUp
	.byte $02
	.byte $00
	.word SprMap_PCape_LookUp
	.byte $80
	.byte $00
Anim_PCape_Climb:
	.word SprMap_PCape_Climb1
	.byte $08
	.byte $00
	.word SprMap_PCape_Climb1
	.byte $80
	.byte $00
Anim_PCape_ClimbMove:
	.word SprMap_PCape_Climb1
	.byte $08
	.byte $00
	.word SprMap_PCape_Climb2
	.byte $08
	.byte $00
	.word SprMap_PCape_Climb1
	.byte $80
	.byte $00
Anim_PCape_HoldStand:
	.word SprMap_PCape_Hold
	.byte $0A
	.byte $00
	.word SprMap_PCape_Hold
	.byte $80
	.byte $00
SprMap_PCape_Stand:
	.byte $02
	.byte $04
	.byte $84
	.byte $08
	.byte $29, $33
	.byte $32, $34
	.byte $35, $37
	.byte $36, $3F
SprMap_PCape_LookUp:
	.byte $02
	.byte $04
	.byte $87
	.byte $08
	.byte $F3, $F4
	.byte $F5, $F6
	.byte $F7, $F8
	.byte $F9, $FB
SprMap_PCape_Back:
	.byte $03
	.byte $04
	.byte $89
	.byte $10
	.byte $71, $73, $74
	.byte $72, $75, $76
	.byte $FF, $77, $78
	.byte $FF, $79, $7A
SprMap_PCape_Climb1:
	.byte $02
	.byte $04
	.byte $88
	.byte $08
	.byte $29, $2A
	.byte $2B, $2C
	.byte $31, $32
	.byte $33, $34
SprMap_PCape_Climb2:
	.byte $42
	.byte $04
	.byte $88
	.byte $08
	.byte $2A, $29
	.byte $2C, $2B
	.byte $32, $31
	.byte $34, $33
SprMap_PCape_Hold:
	.byte $02
	.byte $04
	.byte $86
	.byte $08
	.byte $BA, $A2
	.byte $A1, $A3
	.byte $B0, $B2
	.byte $B1, $BB
AnimTbl_PCapeMove:
	.word Anim_PBig_Stand
	.word Anim_PBig_Walk
	.word Anim_PBig_Run
	.word Anim_PBig_Walk
	.word Anim_PBig_HoldJump
	.word Anim_PBig_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_Duck
	.word Anim_PBig_LookUp
	.word Anim_PBig_RunJump
	.word Anim_PBig_Fall
	.word Anim_PBig_Sink
	.word Anim_PBig_Swim
	.word Anim_PCape_Climb
	.word Anim_PCape_ClimbMove
	.word Anim_PBig_RunJump
	.word Anim_PBig_Win
AnimTbl_PCapeMove_Hold:
	.word Anim_PBig_Hold
	.word Anim_PBig_HoldWalk
	.word Anim_PBig_HoldRun
	.word Anim_PBig_HoldWalk
	.word Anim_PBig_HoldJump
	.word Anim_PBig_Spin
	.word Anim_PBig_Turn
	.word Anim_PBig_HoldDuck
	.word Anim_PBig_LookUp
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldFall
	.word Anim_PBig_Sink
	.word Anim_PBig_HoldSwim
	.word Anim_PCape_Climb
	.word Anim_PCape_ClimbMove
	.word Anim_PBig_Sink
	.word Anim_PBig_Win
YoshiAnimTablesTbl_1:
	.word AnimTbl_Yoshi
	.word AnimTbl_Yoshi
	.word AnimTbl_Yoshi
	.word AnimTbl_Yoshi
	.word AnimTbl_Yoshi
AnimTbl_Yoshi:
	.word Anim_Yoshi_Stand ; Standing
	.word Anim_Yoshi_Walk ; Walking
	.word Anim_Yoshi_Run ; Running
	.word Anim_Yoshi_Walk ; The forbidden action
	.word Anim_Yoshi_Jump ; Jumping
	.word Anim_Yoshi_Jump ; Spinning. Unseen for obvious reasons
	.word Anim_Yoshi_TongueDuck ; Tongue out (Ducking)
	.word Anim_Yoshi_Ducking ; Ducking
	.word Anim_Yoshi_Stand ; Looking up
	.word Anim_Yoshi_Jump ; Running jump
	.word Anim_Yoshi_Fall ; Falling
	.word Anim_Yoshi_Fall ; Sinking
	.word Anim_Yoshi_Swim ; Swimming
	.word Anim_Yoshi_Tongue ; Tongue out (Idle)
	.word Anim_Yoshi_TongueWalk ; Tongue out (While moving)
	.word Anim_Yoshi_Jump ; Flying. Technically used, although rarely seen due to a control bug
	.word Anim_Yoshi_Stand ; Victory pose.
Anim_Yoshi_Stand:
	.word SprMap_Yoshi_Stand
	.byte $0A
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $80
	.byte $00
Anim_Yoshi_Walk:
	.word SprMap_Yoshi_Walk1
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $80
	.byte $00
Anim_Yoshi_Run:
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $80
	.byte $00
Anim_Yoshi_Jump:
	.word SprMap_Yoshi_Jump
	.byte $23
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Jump
	.byte $81
	.byte $00
Anim_Yoshi_Swim:
	.word SprMap_Yoshi_Jump
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Jump
	.byte $80
	.byte $00
Anim_Yoshi_Ducking:
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $80
	.byte $00
Anim_Yoshi_Fall:
	.word SprMap_Yoshi_Walk1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Walk1
	.byte $80
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $0A
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $80
	.byte $00
Anim_Yoshi_Tongue:
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue4
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $80
	.byte $00
Anim_Yoshi_TongueDuck:
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Duck
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue4
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $80
	.byte $00
Anim_Yoshi_TongueWalk:
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch2
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch2
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Flinch2
	.byte $01
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue4
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Tongue3
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue2
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Tongue1
	.byte $02
	.byte $00
	.word SprMap_Yoshi_Flinch1
	.byte $80
	.byte $00
SprMap_Yoshi_Stand:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $FF, $76, $77, $FF
	.byte $78, $79, $7A, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
SprMap_Yoshi_Walk1:
	.byte $04
	.byte $04
	.byte $93
	.byte $18
	.byte $FF, $F8, $F9, $FF
	.byte $FA, $FB, $EB, $FF
	.byte $FF, $EC, $ED, $EE
	.byte $FF, $FF, $EF, $F0
SprMap_Yoshi_Jump:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $71, $72, $73, $FF
	.byte $FF, $74, $75, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $7B, $7C
SprMap_Yoshi_Flinch1:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $71, $72, $73, $FF
	.byte $FF, $74, $75, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
SprMap_Yoshi_Tongue1:
	.byte $04
	.byte $03
	.byte $9A
	.byte $18
	.byte $AB, $AC, $FF, $FF
	.byte $B8, $AF, $AE, $AD
	.byte $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue2:
	.byte $05
	.byte $03
	.byte $9A
	.byte $20
	.byte $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B0, $AF, $AE, $AD
	.byte $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue3:
	.byte $06
	.byte $03
	.byte $9A
	.byte $28
	.byte $FF, $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B1, $B0, $AF, $AE, $AD
	.byte $FF, $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue4:
	.byte $07
	.byte $03
	.byte $9A
	.byte $30
	.byte $FF, $FF, $FF, $AB, $AC, $FF, $FF
	.byte $B2, $B1, $B1, $B0, $AF, $AE, $AD
	.byte $FF, $FF, $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Flinch2:
	.byte $04
	.byte $04
	.byte $93
	.byte $18
	.byte $F1, $F2, $F3, $FF
	.byte $F4, $F5, $F6, $FF
	.byte $FF, $FF, $F7, $EE
	.byte $FF, $FF, $EF, $F0
SprMap_Yoshi_Duck:
	.byte $04
	.byte $04
	.byte $92
	.byte $18
	.byte $FF, $B8, $B9, $FF
	.byte $BA, $BB, $AB, $FF
	.byte $FF, $AC, $AD, $AE
	.byte $FF, $FF, $AF, $B0
YoshiAnimTablesTbl_2:
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
	.word pnt3_CD36
pnt3_CD36:
	.word pnt3_CD58
	.word pnt3_CD60
	.word pnt3_CD6C
	.word pnt3_CD60
	.word pnt3_CD78
	.word pnt3_CD78
	.word pnt3_CDA4
	.word pnt3_CD8C
	.word pnt3_CD58
	.word pnt3_CD78
	.word pnt3_CD94
	.word pnt3_CD94
	.word pnt3_CD84
	.word pnt3_CDB0
	.word pnt3_CDC4
	.word pnt3_CD78
	.word pnt3_CD58
pnt3_CD58:
	.word SprMap_YoshiEat_Stand
	.byte $0A
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD60:
	.word SprMap_YoshiEat_Walk2
	.byte $04
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $04
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD6C:
	.word SprMap_YoshiEat_Stand
	.byte $01
	.byte $00
	.word SprMap_YoshiEat_Walk2
	.byte $01
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CD78:
	.word SprMap_YoshiEat_Jump
	.byte $23
	.byte $00
	.word SprMap_YoshiEat_Walk2
	.byte $02
	.byte $00
	.word SprMap_YoshiEat_Jump
	.byte $81
	.byte $00
pnt3_CD84:
	.word SprMap_YoshiEat_Jump
	.byte $01
	.byte $00
	.word SprMap_YoshiEat_Jump
	.byte $80
	.byte $00
pnt3_CD8C:
	.word SprMap_YoshiEat_Duck
	.byte $01
	.byte $00
	.word SprMap_YoshiEat_Duck
	.byte $80
	.byte $00
pnt3_CD94:
	.word SprMap_YoshiEat_Walk2
	.byte $01
	.byte $00
	.word SprMap_YoshiEat_Walk2
	.byte $80
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $0A
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CDA4:
	.word SprMap_YoshiSpit_Duck
	.byte $04
	.byte $00
	.word SprMap_YoshiSpit_Duck
	.byte $04
	.byte $00
	.word SprMap_YoshiSpit_Duck
	.byte $80
	.byte $00
pnt3_CDB0:
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $80
	.byte $00
pnt3_CDC4:
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $02
	.byte $00
	.word SprMap_YoshiSpit_Stand
	.byte $80
	.byte $00
SprMap_YoshiEat_Stand:
	.byte $04
	.byte $05
	.byte $9B
	.byte $18
	.byte $FF, $FF, $F6, $FF
	.byte $F7, $F8, $F9, $FF
	.byte $FA, $FB, $FC, $FF
	.byte $FF, $FF, $FD, $F2
	.byte $FF, $FF, $EB, $F5
SprMap_YoshiEat_Walk2:
	.byte $03
	.byte $04
	.byte $A3
	.byte $10
	.byte $FA, $F9, $FF
	.byte $FB, $FC, $FF
	.byte $FD, $F0, $EB
	.byte $FF, $F4, $F3
SprMap_YoshiEat_Jump:
	.byte $04
	.byte $04
	.byte $9B
	.byte $18
	.byte $F7, $EC, $ED, $FF
	.byte $EE, $EF, $F0, $FF
	.byte $FF, $FF, $F1, $F2
	.byte $FF, $FF, $F3, $F4
SprMap_YoshiEat_Duck:
	.byte $04
	.byte $04
	.byte $A0
	.byte $18
	.byte $FF, $36, $37, $FF
	.byte $38, $39, $3A, $FF
	.byte $FF, $3B, $3C, $3D
	.byte $FF, $FF, $3F, $35
SprMap_YoshiSpit_Stand:
	.byte $04
	.byte $04
	.byte $91
	.byte $18
	.byte $FF, $7D, $7F, $FF
	.byte $FF, $6B, $6C, $FF
	.byte $FF, $FF, $6D, $6E
	.byte $FF, $FF, $6F, $70
SprMap_YoshiSpit_Duck:
	.byte $04
	.byte $04
	.byte $A0
	.byte $18
	.byte $FF, $2B, $2C, $FF
	.byte $2D, $2E, $2F, $FF
	.byte $FF, $30, $31, $32
	.byte $FF, $FF, $33, $34
YoshiAnimTablesTbl_3:
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
	.word pnt3_CE5E
pnt3_CE5E:
	.word pnt3_CE80
	.word pnt3_CE8C
	.word pnt3_CE98
	.word pnt3_CE8C
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CEA0
	.word pnt3_CE98
	.word pnt3_CE80
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CE98
	.word pnt3_CEA0
	.word pnt3_CEB4
	.word pnt3_CE98
	.word pnt3_CE80
pnt3_CE80:
	.word SprMap_YoshiEat_Stand
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $04
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CE8C:
	.word SprMap_YoshiEat_Walk2
	.byte $04
	.byte $00
	.word SprMap_Yoshi_Stand
	.byte $04
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CE98:
	.word SprMap_YoshiEat_Stand
	.byte $0A
	.byte $00
	.word SprMap_YoshiEat_Stand
	.byte $80
	.byte $00
pnt3_CEA0:
	.word pnt3_CED8
	.byte $04
	.byte $00
	.word pnt3_CED8
	.byte $04
	.byte $00
	.word pnt3_CEF0
	.byte $04
	.byte $00
	.word pnt3_CEF0
	.byte $04
	.byte $00
	.word pnt3_CED8
	.byte $80
	.byte $00
pnt3_CEB4:
	.word pnt3_CED8
	.byte $02
	.byte $00
	.word pnt3_CED8
	.byte $02
	.byte $00
	.word pnt3_CF04
	.byte $02
	.byte $00
	.word pnt3_CF04
	.byte $02
	.byte $00
	.word pnt3_CEF0
	.byte $02
	.byte $00
	.word pnt3_CEF0
	.byte $02
	.byte $00
	.word pnt3_CF14
	.byte $02
	.byte $00
	.word pnt3_CF14
	.byte $02
	.byte $00
	.word pnt3_CED8
	.byte $80
	.byte $00
pnt3_CED8:
	.byte $04
	.byte $05
	.byte $A1
	.byte $18
	.byte $FF, $75, $76, $FF
	.byte $77, $78, $79, $FF
	.byte $7A, $7B, $7C, $FF
	.byte $FF, $7F, $7D, $72
	.byte $FF, $FF, $73, $74
pnt3_CEF0:
	.byte $04
	.byte $04
	.byte $A1
	.byte $18
	.byte $FF, $6B, $6C, $FF
	.byte $6D, $6E, $6F, $FF
	.byte $FF, $70, $71, $72
	.byte $FF, $FF, $73, $74
pnt3_CF04:
	.byte $03
	.byte $04
	.byte $A2
	.byte $10
	.byte $AB, $AC, $FF
	.byte $AD, $AE, $FF
	.byte $AF, $B0, $B1
	.byte $FF, $B2, $B3
pnt3_CF14:
	.byte $04
	.byte $04
	.byte $A2
	.byte $18
	.byte $FF, $B4, $B5, $FF
	.byte $B6, $B7, $B8, $FF
	.byte $FF, $B9, $BA, $B1
	.byte $FF, $FF, $B2, $B3
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
; SPECIAL WARP DATA
; This is used for special warps such as the bonus room and cannon pipes.
SpecialWarpSettings:
	.word pnt3_D07C
	.word pnt3_D080
	.word pnt3_D084
	.word pnt3_D088
	.word pnt3_D08C
	.word pnt3_D090
	.word pnt3_D094
	.word pnt3_D098
	.word pnt3_D09C
	.word pnt3_D0A0
	.word pnt3_D0A4
	.word pnt3_D0A8
	.word pnt3_D0AC
	.word pnt3_D0B0
	.word pnt3_D0B4
	.word pnt3_D0B8
	.word pnt3_D0BC
	.word pnt3_D0C0
	.word pnt3_D0C4
	.word pnt3_D0C8
	.word pnt3_D0CC
	.word pnt3_D0D0
	.word pnt3_D0D4
	.word pnt3_D0D8
	.word pnt3_D0DC
	.word pnt3_D0E0
	.word pnt3_D0E4
	.word pnt3_D0E8
	.word SPWarp_BonusRoomSettings
	.word SPWarp_6_3_CannonSettings
	.word pnt3_D1D0
SpecialWarpCoords:
	.word pnt3_D0EC
	.word pnt3_D0F4
	.word pnt3_D0FC
	.word pnt3_D104
	.word pnt3_D10C
	.word pnt3_D114
	.word pnt3_D11C
	.word pnt3_D124
	.word pnt3_D12C
	.word pnt3_D134
	.word pnt3_D13C
	.word pnt3_D144
	.word pnt3_D14C
	.word pnt3_D154
	.word pnt3_D15C
	.word pnt3_D164
	.word pnt3_D16C
	.word pnt3_D174
	.word pnt3_D17C
	.word pnt3_D184
	.word pnt3_D18C
	.word pnt3_D194
	.word pnt3_D19C
	.word pnt3_D1A4
	.word pnt3_D1AC
	.word pnt3_D1B4
	.word pnt3_D1BC
	.word pnt3_D1C4
	.word SPWarp_BonusRoomPos
	.word SPWarp_6_3_CannonPos
	.word pnt3_D1DC
; Warp Level Settings Format
; Byte 1: Level flags and ID(?)
; Format: UUPLLLLL
; >UU: Underwater bits. Which one is set is irrelevant.
; >P: BG Priority bit. Player priority seems to be overriden by the level being warped to.
; >LLLLL: Destination level ID
; Byte 2: Tileset
; Byte 3: Second PRG Bank
; Byte 4: Palette ID
pnt3_D07C:
	.byte $00
	.byte $00
	.byte $1C
	.byte $00
pnt3_D080:
	.byte $01
	.byte $01
	.byte $1C
	.byte $01
pnt3_D084:
	.byte $02
	.byte $02
	.byte $1C
	.byte $02
pnt3_D088:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D08C:
	.byte $04
	.byte $04
	.byte $1D
	.byte $04
pnt3_D090:
	.byte $05
	.byte $05
	.byte $1D
	.byte $05
pnt3_D094:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D098:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D09C:
	.byte $08
	.byte $08
	.byte $1E
	.byte $08
pnt3_D0A0:
	.byte $49
	.byte $09
	.byte $1E
	.byte $09
pnt3_D0A4:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0A8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0AC:
	.byte $0C
	.byte $0C
	.byte $1F
	.byte $0C
pnt3_D0B0:
	.byte $0D
	.byte $0D
	.byte $1F
	.byte $0D
pnt3_D0B4:
	.byte $0E
	.byte $0E
	.byte $1F
	.byte $0E
pnt3_D0B8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0BC:
	.byte $10
	.byte $10
	.byte $20
	.byte $10
pnt3_D0C0:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0C4:
	.byte $52
	.byte $12
	.byte $20
	.byte $12
pnt3_D0C8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0CC:
	.byte $14
	.byte $14
	.byte $21
	.byte $14
pnt3_D0D0:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0D4:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
pnt3_D0D8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0DC:
	.byte $18
	.byte $18
	.byte $22
	.byte $18
pnt3_D0E0:
	.byte $19
	.byte $19
	.byte $22
	.byte $19
pnt3_D0E4:
	.byte $03
	.byte $27
	.byte $23
	.byte $1C
pnt3_D0E8:
	.byte $03
	.byte $23
	.byte $23
	.byte $1D
pnt3_D0EC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D0F4:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D0FC:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D104:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D10C:
	.byte $0A
	.byte $01
	.byte $80
	.byte $A8
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D114:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D11C:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D124:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D12C:
	.byte $06
	.byte $00
	.byte $90
	.byte $58
	.byte $FF
	.byte $11
	.byte $FF
	.byte $00
pnt3_D134:
	.byte $03
	.byte $00
	.byte $70
	.byte $48
	.byte $FF
	.byte $0C
	.byte $FF
	.byte $00
pnt3_D13C:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D144:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D14C:
	.byte $0B
	.byte $01
	.byte $80
	.byte $C8
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D154:
	.byte $0B
	.byte $01
	.byte $70
	.byte $A8
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D15C:
	.byte $06
	.byte $01
	.byte $70
	.byte $38
	.byte $FF
	.byte $11
	.byte $FF
	.byte $01
pnt3_D164:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D16C:
	.byte $0B
	.byte $01
	.byte $80
	.byte $98
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D174:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D17C:
	.byte $00
	.byte $01
	.byte $40
	.byte $B0
	.byte $FF
	.byte $0E
	.byte $FF
	.byte $01
pnt3_D184:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D18C:
	.byte $00
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D194:
	.byte $00
	.byte $01
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $00
	.byte $01
pnt3_D19C:
	.byte $0F
	.byte $01
	.byte $80
	.byte $98
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1A4:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D1AC:
	.byte $00
	.byte $01
	.byte $80
	.byte $B0
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1B4:
	.byte $08
	.byte $01
	.byte $60
	.byte $18
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1BC:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
pnt3_D1C4:
	.byte $00
	.byte $00
	.byte $40
	.byte $C0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $00
SPWarp_6_3_CannonSettings:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
pnt3_D1D0:
	.byte $16
	.byte $15
	.byte $21
	.byte $16
SPWarp_6_3_CannonPos:
	.byte $06
	.byte $01
	.byte $90
	.byte $5C
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
pnt3_D1DC:
	.byte $10
	.byte $01
	.byte $80
	.byte $5C
	.byte $FF
	.byte $11
	.byte $00
	.byte $01
SPWarp_BonusRoomSettings:
	.byte $23
	.byte $22
	.byte $2B
	.byte $25
SPWarp_BonusRoomPos:
	.byte $00
	.byte $01
	.byte $10
	.byte $B0
	.byte $FF
	.byte $00
	.byte $FF
	.byte $01
; End of special warp data
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
	.byte $C0
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
	.byte $80 ; Why the hell is this here? Seriously, why? All this does is prevent me from padding the rest of this bank.
