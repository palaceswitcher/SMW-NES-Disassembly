; 0x048010-0x04A00F
lda_36_C000: 
	dw PlayerAnimTablesTbl   ;00 No Yoshi
	dw YoshiAnimTablesTbl_1 ;01 If Yoshi present (all entries on this table point to the same thing)
	dw YoshiAnimTablesTbl_2 ;02
	dw YoshiAnimTablesTbl_2 ;03 Because Yoshi Status is doubled for use as an index this table is long
	dw YoshiAnimTablesTbl_2 ;04
	dw YoshiAnimTablesTbl_2 ;05
	dw YoshiAnimTablesTbl_3 ;06 Used when Mario has a powerup (?)
	dw YoshiAnimTablesTbl_3 ;07
	dw YoshiAnimTablesTbl_3 ;08
	dw YoshiAnimTablesTbl_3 ;09 As far as I can tell these are all identical unique copies, but this hasn't been fully investigated
PlayerAnimTablesTbl:
	dw AnimTbl_PSmall
	dw AnimTbl_PBig
	dw AnimTbl_PFire
	dw AnimTbl_PCapeStatic
	dw AnimTbl_PCapeMove
	dw AnimTbl_PSmall_Hold
	dw AnimTbl_PBig_Hold
	dw AnimTbl_PFire_Hold
	dw AnimTbl_PCapeStatic_Hold
	dw AnimTbl_PCapeMove_Hold
AnimTbl_PSmall:	;Player Action (associated with animation)
	dw Anim_PSmall_Stand	;Nothing 	00
	dw Anim_PSmall_Walk		;Walking 	01
	dw Anim_PSmall_Run		;Running 	02
	dw Anim_PSmall_Walk		;Unused  	03
	dw Anim_PSmall_Jump		;Jumping 	04
	dw Anim_PSmall_Spin		;Spin    	05
	dw Anim_PSmall_Turn		;Skid    	06
	dw Anim_PSmall_Duck		;Duck    	07
	dw Anim_PSmall_Up		;Look up 	08
	dw Anim_PSmall_RunJump	;Run jump   09
	dw Anim_PSmall_Fall		;Falling 	0A note that this is specifically for falling from a ledge, not a jump
	dw Anim_PSmall_Sink		;Sink    	0B
	dw Anim_PSmall_Swim		;Swim    	0C
	dw Anim_PSmall_ClimbIdle;Climb   	0D
	dw Anim_PSmall_Climb	;Climb move	0E
	dw Anim_PSmall_RunJump		;Flying		0F
	dw Anim_PSmall_Win		;Victory	10
	dw Anim_PSmall_Die		;Dead		11
AnimTbl_PSmall_Hold:
	dw Anim_PSmall_Hold
	dw Anim_PSmall_HoldWalk
	dw Anim_PSmall_HoldRun
	dw Anim_PSmall_HoldWalk
	dw Anim_PSmall_HoldJump
	dw Anim_PSmall_Spin
	dw Anim_PSmall_Turn
	dw Anim_PSmall_HoldDuck
	dw Anim_PSmall_Up
	dw Anim_PSmall_HoldJump
	dw Anim_PSmall_HoldFall
	dw Anim_PSmall_HoldSink
	dw Anim_PSmall_HoldSwim
	dw Anim_PSmall_ClimbIdle
	dw Anim_PSmall_Climb
	dw Anim_PSmall_HoldJump
	dw Anim_PSmall_Win
	dw Anim_PSmall_Die
Anim_PSmall_Stand:
	dw SprMap_PSmall_Stand
	db $0A
	db $00
	dw SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Walk:
	dw SprMap_PSmall_Stand
	db $04
	db $00
	dw SprMap_PSmall_Walk1
	db $04
	db $00
	dw SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Run:
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Stand
	db $02
	db $00
	dw SprMap_PSmall_Walk1
	db $02
	db $00
	dw SprMap_PSmall_Run1
	db $02
	db $00
	dw SprMap_PSmall_Run2
	db $02
	db $00
	dw SprMap_PSmall_Run1
	db $02
	db $00
	dw SprMap_PSmall_Run2
	db $02
	db $00
	dw SprMap_PSmall_Run1
	db $90
	db $00
Anim_PSmall_Jump:
	dw SprMap_PSmall_Jump
	db $23
	db $00
	dw SprMap_PSmall_Fall
	db $02
	db $00
	dw SprMap_PSmall_Fall
	db $81
	db $00
Anim_PSmall_RunJump:
	dw SprMap_PSmall_RunJump
	db $0A
	db $00
	dw SprMap_PSmall_RunJump
	db $80
	db $00
Anim_PSmall_Spin:
	dw SprMap_PSmall_Stand
	db $01
	db $00
	dw SprMap_PSmall_Back
	db $01
	db $00
	dw SprMap_PSmall_Flipped
	db $01
	db $00
	dw SprMap_PSmall_Front
	db $01
	db $00
	dw SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Turn:
	dw SprMap_PSmall_Turn
	db $0A
	db $00
	dw SprMap_PSmall_Turn
	db $80
	db $00
Anim_PSmall_Duck:
	dw SprMap_PSmall_Duck
	db $08
	db $00
	dw SprMap_PSmall_Duck
	db $80
	db $00
Anim_PSmall_Up:
	dw SprMap_PSmall_LookUp
	db $02
	db $00
	dw SprMap_PSmall_LookUp
	db $80
	db $00
Anim_PSmall_Fall:
	dw SprMap_PSmall_Fall
	db $02
	db $00
	dw SprMap_PSmall_Fall
	db $80
	db $00
Anim_PSmall_Sink:
	dw SprMap_PSmall_Swim1
	db $01
	db $00
	dw SprMap_PSmall_Swim1
	db $80
	db $00
Anim_PSmall_Swim:
	dw SprMap_PSmall_RunJump
	db $03
	db $00
	dw SprMap_PSmall_Swim1
	db $03
	db $00
	dw SprMap_PSmall_RunJump
	db $80
	db $00
Anim_PSmall_ClimbIdle:
	dw SprMap_PSmall_Climb1
	db $08
	db $00
	dw SprMap_PSmall_Climb1
	db $80
	db $00
Anim_PSmall_Climb:
	dw SprMap_PSmall_Climb1
	db $08
	db $00
	dw SprMap_PSmall_Climb2
	db $08
	db $00
	dw SprMap_PSmall_Climb1
	db $80
	db $00
Anim_PSmall_Win:
	dw SprMap_PSmall_Victory
	db $0A
	db $00
	dw SprMap_PSmall_Victory
	db $80
	db $00
Anim_PSmall_Die:
	dw SprMap_PSmall_Death1
	db $28
	db $00
	dw SprMap_PSmall_Death1
	db $08
	db $00
	dw SprMap_PSmall_Death2
	db $08
	db $00
	dw SprMap_PSmall_Death1
	db $81
	db $00
Anim_PSmall_Hold:
	dw SprMap_PSmall_Hold
	db $0A
	db $00
	dw SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldWalk:
	dw SprMap_PSmall_Hold
	db $04
	db $00
	dw SprMap_PSmall_HoldWalk
	db $04
	db $00
	dw SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldRun:
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $90
	db $00
Anim_PSmall_HoldJump:
	dw SprMap_PSmall_HoldWalk
	db $23
	db $00
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $81
	db $00
Anim_PSmall_HoldDuck:
	dw SprMap_PSmall_DuckHold
	db $08
	db $00
	dw SprMap_PSmall_DuckHold
	db $80
	db $00
	dw SprMap_PSmall_Hold
	db $02
	db $00
	dw SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldFall:
	dw SprMap_PSmall_HoldWalk
	db $02
	db $00
	dw SprMap_PSmall_HoldWalk
	db $80
	db $00
Anim_PSmall_HoldSink:
	dw pnt3_C2D8
	db $01
	db $00
	dw pnt3_C2D8
	db $80
	db $00
Anim_PSmall_HoldSwim:
	dw pnt3_C2D8
	db $03
	db $00
	dw pnt3_C2D8
	db $03
	db $00
	dw pnt3_C2D8
	db $80
	db $00
SprMap_PSmall_Stand:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $60, $61
SprMap_PSmall_Walk1:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $6A, $6B
SprMap_PSmall_Run1:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $60, $6C
SprMap_PSmall_Run2:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $6A, $6D
SprMap_PSmall_RunJump:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $68, $69
SprMap_PSmall_Jump:
	db $02
	db $03
	db $99
	db $08
	db $74, $75
	db $76, $77
	db $78, $79
SprMap_PSmall_Fall:
	db $02
	db $03
	db $99
	db $08
	db $7A, $7B
	db $7C, $7D
	db $57, $5C
SprMap_PSmall_Back:
	db $02
	db $03
	db $99
	db $08
	db $48, $49
	db $4A, $4B
	db $4C, $4D
SprMap_PSmall_Flipped:
	db $42
	db $03
	db $99
	db $08
	db $65, $64
	db $7F, $66
	db $61, $60
SprMap_PSmall_Front:
	db $02
	db $03
	db $99
	db $08
	db $4E, $4F
	db $56, $58
	db $59, $5A
SprMap_PSmall_Turn:
	db $02
	db $03
	db $9A
	db $08
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
SprMap_PSmall_Duck:
	db $02
	db $02
	db $99
	db $08
	db $50, $51
	db $52, $53
SprMap_PSmall_LookUp:
	db $02
	db $03
	db $99
	db $08
	db $5B, $5D
	db $5E, $5F
	db $60, $61
SprMap_PSmall_Swim1:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $62, $63
SprMap_PSmall_Climb1:
	db $02
	db $03
	db $99
	db $08
	db $48, $49
	db $4A, $4B
	db $72, $73
SprMap_PSmall_Climb2:
	db $42
	db $03
	db $99
	db $08
	db $49, $48
	db $4B, $4A
	db $73, $72
SprMap_PSmall_Victory:
	db $02
	db $03
	db $98
	db $08
	db $0E, $0D
	db $10, $0F
	db $12, $11
SprMap_PSmall_Death1:
	db $02
	db $03
	db $98
	db $08
	db $18, $19
	db $1A, $1B
	db $1C, $1D
SprMap_PSmall_Death2:
	db $42
	db $03
	db $98
	db $08
	db $19, $18
	db $1B, $1A
	db $1D, $1C
SprMap_PSmall_Hold:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $40, $41
SprMap_PSmall_HoldWalk:
	db $02
	db $03
	db $99
	db $08
	db $6E, $6F
	db $70, $71
	db $42, $43
SprMap_PSmall_DuckHold:
	db $02
	db $02
	db $99
	db $08
	db $44, $45
	db $46, $47
pnt3_C2D8:
	db $02
	db $03
	db $99
	db $08
	db $64, $65
	db $66, $7F
	db $62, $63
AnimTbl_PBig:
	dw Anim_PBig_Stand
	dw Anim_PBig_Walk
	dw Anim_PBig_Run
	dw Anim_PBig_Walk
	dw Anim_PBig_Jump
	dw Anim_PBig_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_Duck
	dw Anim_PBig_LookUp
	dw Anim_PBig_RunJump
	dw Anim_PBig_Fall
	dw Anim_PBig_Sink
	dw Anim_PBig_Swim
	dw Anim_PBig_Climb
	dw Anim_PBig_ClimbMove
	dw Anim_PBig_RunJump
	dw Anim_PBig_Win
AnimTbl_PBig_Hold:
	dw Anim_PBig_Hold
	dw Anim_PBig_HoldWalk
	dw Anim_PBig_HoldRun
	dw Anim_PBig_HoldWalk
	dw Anim_PBig_HoldJump
	dw Anim_PBig_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_HoldDuck
	dw Anim_PBig_LookUp
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldFall
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldSwim
	dw Anim_PBig_Climb
	dw Anim_PBig_ClimbMove
	dw Anim_PBig_Sink
	dw Anim_PBig_Win
Anim_PBig_Stand:
	dw SprMap_PBig_Stand
	db $0A
	db $00
	dw SprMap_PBig_Stand
	db $80
	db $00
Anim_PBig_Walk:
	dw SprMap_PBig_Walk1
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Stand
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Walk1
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Stand
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Walk1
	db $80
	db $00
Anim_PBig_Run:
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Run1
	db $02
	db $00
	dw SprMap_PBig_Run2
	db $02
	db $00
	dw SprMap_PBig_Run3
	db $02
	db $00
	dw SprMap_PBig_Run2
	db $02
	db $00
	dw SprMap_PBig_Run1
	db $90
	db $00
Anim_PBig_Jump:
	dw SprMap_PBig_Jump
	db $23
	db $00
	dw SprMap_PBig_Fall
	db $02
	db $00
	dw SprMap_PBig_Fall
	db $81
	db $00
Anim_PBig_RunJump:
	dw SprMap_PBig_RunJump
	db $0A
	db $00
	dw SprMap_PBig_RunJump
	db $80
	db $00
Anim_PBig_Spin:
	dw SprMap_PBig_Front
	db $01
	db $00
	dw SprMap_PBig_Back
	db $01
	db $00
	dw SprMap_PBig_Side1
	db $01
	db $00
	dw SprMap_PBig_Side2
	db $01
	db $00
	dw SprMap_PBig_Front
	db $80
	db $00
Anim_PBig_Turn:
	dw SprMap_PBig_Turn
	db $0A
	db $00
	dw SprMap_PBig_Turn
	db $80
	db $00
Anim_PBig_Duck:
	dw SprMap_PBig_Duck
	db $08
	db $00
	dw SprMap_PBig_Duck
	db $80
	db $00
Anim_PBig_LookUp:
	dw SprMap_PBig_LookUp
	db $02
	db $00
	dw SprMap_PBig_LookUp
	db $80
	db $00
Anim_PBig_Fall:
	dw SprMap_PBig_Fall
	db $02
	db $00
	dw SprMap_PBig_Fall
	db $80
	db $00
Anim_PBig_Sink:
	dw SprMap_PBig_Swim1
	db $01
	db $00
	dw SprMap_PBig_Swim1
	db $80
	db $00
Anim_PBig_Swim:
	dw SprMap_PBig_RunJump
	db $03
	db $00
	dw SprMap_PBig_Swim2
	db $03
	db $00
	dw SprMap_PBig_Swim1
	db $03
	db $00
	dw SprMap_PBig_Swim2
	db $03
	db $00
	dw SprMap_PBig_Fall
	db $80
	db $00
Anim_PBig_Climb:
	dw SprMap_PBig_Climb1
	db $08
	db $00
	dw SprMap_PBig_Climb1
	db $80
	db $00
Anim_PBig_ClimbMove:
	dw SprMap_PBig_Climb1
	db $08
	db $00
	dw SprMap_PBig_Climb2
	db $08
	db $00
	dw SprMap_PBig_Climb1
	db $80
	db $00
Anim_PBig_Win:
	dw SprMap_PBig_Victory
	db $0A
	db $00
	dw SprMap_PBig_Victory
	db $80
	db $00
Anim_PBig_Hold:
	dw SprMap_PBig_Hold
	db $0A
	db $00
	dw SprMap_PBig_Hold
	db $80
	db $00
Anim_PBig_HoldWalk:
	dw SprMap_PBig_HoldWalk1
	db $04
	db $00
	dw SprMap_PBig_HoldWalk2
	db $04
	db $00
	dw SprMap_PBig_Hold
	db $04
	db $00
	dw SprMap_PBig_HoldWalk2
	db $04
	db $00
	dw SprMap_PBig_HoldWalk1
	db $04
	db $00
	dw SprMap_PBig_HoldWalk2
	db $04
	db $00
	dw SprMap_PBig_Hold
	db $04
	db $00
	dw SprMap_PBig_HoldWalk2
	db $04
	db $00
	dw SprMap_PBig_HoldWalk1
	db $80
	db $00
Anim_PBig_HoldRun:
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_Hold
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_Hold
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_Hold
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_Hold
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_Hold
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $90
	db $00
Anim_PBig_HoldJump:
	dw SprMap_PBig_HoldWalk1
	db $23
	db $00
	dw SprMap_PBig_HoldWalk1
	db $02
	db $00
	dw SprMap_PBig_HoldWalk1
	db $81
	db $00
Anim_PBig_HoldDuck:
	dw SprMap_PBig_DuckHold
	db $08
	db $00
	dw SprMap_PBig_DuckHold
	db $80
	db $00
	dw SprMap_PBig_LookUp
	db $02
	db $00
	dw SprMap_PBig_LookUp
	db $80
	db $00
Anim_PBig_HoldFall:
	dw SprMap_PBig_HoldWalk2
	db $02
	db $00
	dw SprMap_PBig_HoldWalk2
	db $80
	db $00
Anim_PBig_HoldSwim:
	dw SprMap_PBig_Swim1
	db $03
	db $00
	dw SprMap_PBig_Swim1
	db $03
	db $00
	dw SprMap_PBig_Swim1
	db $03
	db $00
	dw SprMap_PBig_Swim1
	db $03
	db $00
	dw SprMap_PBig_Swim1
	db $80
	db $00
SprMap_PBig_Stand:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $38
SprMap_PBig_Walk1:
	db $02
	db $04
	db $84
	db $08
	db $31, $23
	db $2A, $2C
	db $2D, $2F
	db $2E, $30
SprMap_PBig_Walk2:
	db $02
	db $04
	db $84
	db $08
	db $21, $23
	db $22, $24
	db $25, $27
	db $26, $28
SprMap_PBig_Run1:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $64, $65, $68
	db $66, $67, $FF
SprMap_PBig_Run3:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $6D, $6E, $68
	db $6F, $70, $FF
SprMap_PBig_Run2:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $69, $6A, $68
	db $6B, $6C, $FF
SprMap_PBig_RunJump:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $71, $72, $68
	db $73, $74, $76
SprMap_PBig_Jump:
	db $02
	db $04
	db $89
	db $08
	db $61, $62
	db $63, $64
	db $65, $6E
	db $67, $70
SprMap_PBig_Fall:
	db $02
	db $04
	db $89
	db $08
	db $69, $6A
	db $6B, $6C
	db $6D, $6E
	db $6F, $70
SprMap_PBig_Front:
	db $02
	db $04
	db $88
	db $08
	db $21, $22
	db $23, $24
	db $25, $26
	db $27, $28
SprMap_PBig_Back:
	db $42
	db $04
	db $89
	db $08
	db $74, $7B
	db $76, $7C
	db $78, $77
	db $7A, $79
SprMap_PBig_Side1:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $38
SprMap_PBig_Side2:
	db $42
	db $04
	db $84
	db $08
	db $33, $29
	db $34, $32
	db $37, $35
	db $38, $36
SprMap_PBig_Turn:
	db $02
	db $04
	db $86
	db $08
	db $A8, $AA
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
SprMap_PBig_Duck:
	db $02
	db $03
	db $84
	db $08
	db $39, $3A
	db $3B, $3D
	db $3C, $2B
SprMap_PBig_LookUp:
	db $02
	db $04
	db $87
	db $08
	db $F3, $F4
	db $F5, $F6
	db $F7, $F8
	db $F9, $FA
SprMap_PBig_Swim1:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $7C, $7D, $FF
	db $73, $7B, $75
SprMap_PBig_Swim2:
	db $03
	db $04
	db $85
	db $08
	db $7F, $61, $FF
	db $62, $63, $FF
	db $77, $78, $FF
	db $73, $7A, $76
SprMap_PBig_Climb1:
	db $02
	db $04
	db $88
	db $08
	db $29, $2A
	db $2B, $2C
	db $2D, $2E
	db $2F, $30
SprMap_PBig_Climb2:
	db $42
	db $04
	db $88
	db $08
	db $2A, $29
	db $2C, $2B
	db $2E, $2D
	db $30, $2F
SprMap_PBig_Victory:
	db $02
	db $04
	db $8B
	db $08
	db $E9, $EA
	db $EB, $EC
	db $ED, $EE
	db $EF, $F0
SprMap_PBig_Hold:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $B0, $B2
	db $B1, $B3
SprMap_PBig_HoldWalk1:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $A4, $A6
	db $A5, $A7
SprMap_PBig_HoldWalk2:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $AA, $AC
	db $AB, $AD
SprMap_PBig_DuckHold:
	db $02
	db $03
	db $86
	db $08
	db $B4, $B5
	db $B6, $B7
	db $B8, $B9
AnimTbl_PFire:
	dw Anim_PFire_Stand
	dw Anim_PFire_Walk
	dw Anim_PFire_Run
	dw Anim_PFire_Walk
	dw Anim_PFire_Jump
	dw Anim_PFire_Spin
	dw Anim_PFire_Turn
	dw Anim_PFire_Duck
	dw Anim_PFire_Lookup
	dw Anim_PFire_RunJump
	dw Anim_PFire_Fall
	dw Anim_PFire_Sink
	dw Anim_PFire_Swim
	dw Anim_PFire_Climb
	dw Anim_PFire_ClimbMove
	dw Anim_PFire_RunJump ;unused
	dw Anim_PFire_Win
	dw Anim_PFire_ShootAir
	dw Anim_PFire_ShootSwim
	dw Anim_PFire_Shoot
AnimTbl_PFire_Hold:
	dw Anim_PFire_Hold
	dw Anim_PFire_HoldWalk
	dw Anim_PFire_HoldRun
	dw Anim_PFire_HoldWalk
	dw Anim_PFire_HoldJump
	dw Anim_PFire_Spin
	dw Anim_PFire_Turn
	dw Anim_PFire_HoldDuck
	dw Anim_PFire_Lookup
	dw Anim_PFire_Sink
	dw Anim_PFire_HoldSwim ;unused but fully implemented
	dw Anim_PFire_Sink
	dw Anim_PFire_Swim
	dw Anim_PFire_Climb
	dw Anim_PFire_ClimbMove
	dw Anim_PFire_Sink
	dw Anim_PFire_Win
	dw Anim_PFire_ShootAir
	dw Anim_PFire_ShootSwim
	dw Anim_PFire_Shoot
Anim_PFire_Stand:
	dw SprMap_PFire_Stand
	db $0A
	db $00
	dw SprMap_PFire_Stand
	db $80
	db $00
Anim_PFire_Walk:
	dw SprMap_PFire_Walk1
	db $04
	db $00
	dw SprMap_PFire_Walk2
	db $04
	db $00
	dw SprMap_PFire_Stand
	db $04
	db $00
	dw SprMap_PFire_Walk2
	db $04
	db $00
	dw SprMap_PFire_Walk1
	db $04
	db $00
	dw SprMap_PFire_Walk2
	db $04
	db $00
	dw SprMap_PFire_Stand
	db $04
	db $00
	dw SprMap_PFire_Walk2
	db $04
	db $00
	dw SprMap_PFire_Walk1
	db $80
	db $00
Anim_PFire_Run:
	dw SprMap_PFire_Walk1
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Stand
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Walk1
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Stand
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Walk1
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Stand
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Walk1
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Stand
	db $02
	db $00
	dw SprMap_PFire_Walk2
	db $02
	db $00
	dw SprMap_PFire_Run1
	db $02
	db $00
	dw SprMap_PFire_Run2
	db $02
	db $00
	dw SprMap_PFire_Run3
	db $02
	db $00
	dw SprMap_PFire_Run2
	db $02
	db $00
	dw SprMap_PFire_Run1
	db $90
	db $00
Anim_PFire_Jump:
	dw SprMap_PFire_Jump
	db $23
	db $00
	dw SprMap_PFire_Fall
	db $02
	db $00
	dw SprMap_PFire_Fall
	db $81
	db $00
Anim_PFire_RunJump:
	dw SprMap_PFire_RunJump
	db $0A
	db $00
	dw SprMap_PFire_RunJump
	db $80
	db $00
Anim_PFire_Spin:
	dw SprMap_PFire_Front
	db $01
	db $00
	dw SprMap_PFire_Back
	db $01
	db $00
	dw SprMap_PFire_Stand
	db $01
	db $00
	dw SprMap_PFire_Flipped
	db $01
	db $00
	dw SprMap_PFire_Front
	db $80
	db $00
Anim_PFire_Turn:
	dw SprMap_PFire_Turn
	db $0A
	db $00
	dw SprMap_PFire_Turn
	db $80
	db $00
Anim_PFire_Duck:
	dw SprMap_PFire_Duck
	db $08
	db $00
	dw SprMap_PFire_Duck
	db $80
	db $00
Anim_PFire_Lookup:
	dw SprMap_PFire_LookUp
	db $02
	db $00
	dw SprMap_PFire_LookUp
	db $80
	db $00
Anim_PFire_Fall:
	dw SprMap_PFire_Fall
	db $02
	db $00
	dw SprMap_PFire_Fall
	db $80
	db $00
Anim_PFire_Sink:
	dw SprMap_PFire_Swim1
	db $01
	db $00
	dw SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_Swim:
	dw SprMap_PFire_RunJump
	db $03
	db $00
	dw SprMap_PFire_Swim2
	db $03
	db $00
	dw SprMap_PFire_Swim1
	db $03
	db $00
	dw SprMap_PFire_Swim2
	db $03
	db $00
	dw SprMap_PFire_Fall
	db $80
	db $00
Anim_PFire_Climb:
	dw SprMap_PFire_Climb1
	db $08
	db $00
	dw SprMap_PFire_Climb1
	db $80
	db $00
Anim_PFire_ClimbMove:
	dw SprMap_PFire_Climb1
	db $08
	db $00
	dw SprMap_PFire_Climb2
	db $08
	db $00
	dw SprMap_PFire_Climb1
	db $80
	db $00
Anim_PFire_Win:
	dw SprMap_PFire_Victory
	db $0A
	db $00
	dw SprMap_PFire_Victory
	db $80
	db $00
Anim_PFire_ShootAir:
	dw SprMap_PFire_Swim1
	db $03
	db $00
	dw SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_ShootSwim:
	dw SprMap_PFire_Swim2
	db $03
	db $00
	dw SprMap_PFire_Swim1
	db $03
	db $00
	dw SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_Shoot:
	dw SprMap_PFire_Shoot
	db $03
	db $00
	dw SprMap_PFire_Shoot
	db $80
	db $00
Anim_PFire_Hold:
	dw SprMap_PFire_Hold
	db $0A
	db $00
	dw SprMap_PFire_Hold
	db $80
	db $00
Anim_PFire_HoldWalk:
	dw SprMap_PFire_HoldWalk1
	db $04
	db $00
	dw SprMap_PFire_HoldWalk2
	db $04
	db $00
	dw SprMap_PFire_Hold
	db $04
	db $00
	dw SprMap_PFire_HoldWalk2
	db $04
	db $00
	dw SprMap_PFire_HoldWalk1
	db $04
	db $00
	dw SprMap_PFire_HoldWalk2
	db $04
	db $00
	dw SprMap_PFire_Hold
	db $04
	db $00
	dw SprMap_PFire_HoldWalk2
	db $04
	db $00
	dw SprMap_PFire_HoldWalk1
	db $80
	db $00
Anim_PFire_HoldRun:
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_Hold
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_Hold
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_Hold
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_Hold
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_Hold
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $90
	db $00
Anim_PFire_HoldJump:
	dw SprMap_PFire_HoldWalk1
	db $23
	db $00
	dw SprMap_PFire_HoldWalk1
	db $02
	db $00
	dw SprMap_PFire_HoldWalk1
	db $81
	db $00
Anim_PFire_HoldDuck:
	dw SprMap_PFire_DuckHold
	db $08
	db $00
	dw SprMap_PFire_DuckHold
	db $80
	db $00
Anim_PFire_HoldSwim:
	dw SprMap_PFire_HoldWalk2
	db $02
	db $00
	dw SprMap_PFire_HoldWalk2
	db $80
	db $00
SprMap_PFire_Stand:
	db $02
	db $04
	db $80
	db $08
	db $2C, $2E
	db $2D, $2F
	db $18, $1A
	db $19, $1B
SprMap_PFire_Walk1:
	db $02
	db $04
	db $80
	db $08
	db $00, $02
	db $01, $03
	db $04, $06
	db $05, $07
SprMap_PFire_Walk2:
	db $02
	db $04
	db $80
	db $08
	db $0A, $0C
	db $0B, $0D
	db $0E, $28
	db $0F, $29
SprMap_PFire_Run1:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F0, $F2, $FC
	db $F1, $F3, $FF
SprMap_PFire_Run3:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F8, $FA, $FC
	db $F9, $FB, $FF
SprMap_PFire_Run2:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $F4, $F6, $FC
	db $F5, $F7, $FF
SprMap_PFire_RunJump:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $C0, $C2, $C6
	db $C1, $C3, $C7
SprMap_PFire_Jump:
	db $02
	db $04
	db $83
	db $08
	db $D8, $DA
	db $D9, $DB
	db $DC, $E0
	db $DD, $E1
SprMap_PFire_Fall:
	db $02
	db $04
	db $83
	db $08
	db $E9, $EA
	db $EB, $EC
	db $E6, $E0
	db $E8, $E1
SprMap_PFire_Front:
	db $02
	db $04
	db $80
	db $08
	db $24, $16
	db $25, $2A
	db $26, $2B
	db $27, $30
SprMap_PFire_Back:
	db $42
	db $04
	db $80
	db $08
	db $32, $20
	db $39, $21
	db $3A, $22
	db $3B, $23
SprMap_PFire_Flipped:
	db $42
	db $04
	db $80
	db $08
	db $2E, $2C
	db $2F, $2D
	db $1A, $18
	db $1B, $19
SprMap_PFire_Turn:
	db $02
	db $04
	db $82
	db $08
	db $A8, $AA
	db $A9, $AB
	db $AC, $AE
	db $AD, $AF
SprMap_PFire_Duck:
	db $02
	db $03
	db $80
	db $08
	db $31, $33
	db $34, $36
	db $35, $37
SprMap_PFire_LookUp:
	db $02
	db $04
	db $81
	db $08
	db $40, $41
	db $42, $43
	db $44, $45
	db $46, $47
SprMap_PFire_Swim1:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $CC, $CE, $FF
	db $CD, $CF, $E7
SprMap_PFire_Swim2:
	db $03
	db $04
	db $83
	db $08
	db $D6, $E3, $FF
	db $E2, $E4, $FF
	db $C8, $CA, $FF
	db $C9, $CB, $C7
SprMap_PFire_Climb1:
	db $02
	db $04
	db $82
	db $08
	db $B0, $B2
	db $B1, $B3
	db $B4, $B6
	db $B5, $B7
SprMap_PFire_Climb2:
	db $42
	db $04
	db $82
	db $08
	db $B2, $B0
	db $B3, $B1
	db $B6, $B4
	db $B7, $B5
SprMap_PFire_Victory:
	db $02
	db $04
	db $81
	db $08
	db $68, $69
	db $6A, $6B
	db $6C, $6D
	db $6E, $6F
SprMap_PFire_Shoot:
	db $02
	db $04
	db $80
	db $08
	db $08, $0C
	db $09, $0D
	db $1C, $1E
	db $1D, $1F
SprMap_PFire_Hold:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $A1, $A3
SprMap_PFire_DuckHold:
	db $02
	db $03
	db $81
	db $08
	db $78, $79
	db $7A, $7B
	db $7C, $7D
SprMap_PFire_HoldWalk1:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $85, $87
SprMap_PFire_HoldWalk2:
	db $02
	db $04
	db $82
	db $08
	db $80, $82
	db $81, $83
	db $A0, $A2
	db $8B, $8D
AnimTbl_PCapeStatic: ;player animations for when the cape isn't animating
	dw Anim_PCape_Stand ;unique from normal sprite 
	dw Anim_PCape_Walk  ;larger mapping but otherwise identical
	dw Anim_PCape_Run	  ;this suggests that the cape may have originally been part of the player sprite
	dw Anim_PBig_Walk	  ;in game the cape is mostly a separate sprite bar a few frames
	dw Anim_PBig_Jump
	dw Anim_PCape_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_Duck
	dw Anim_PCape_LookUp
	dw Anim_PBig_RunJump
	dw Anim_PBig_Fall
	dw Anim_PBig_Sink
	dw Anim_PBig_Swim
	dw Anim_PCape_Climb
	dw Anim_PCape_ClimbMove
	dw Anim_PBig_RunJump
	dw Anim_PBig_Win  
AnimTbl_PCapeStatic_Hold: 
	dw Anim_PCape_HoldStand
	dw Anim_PBig_HoldWalk
	dw Anim_PCape_Run
	dw Anim_PBig_HoldWalk
	dw Anim_PBig_HoldJump
	dw Anim_PCape_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_HoldDuck
	dw Anim_PCape_LookUp
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldFall
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldSwim
	dw Anim_PCape_Climb
	dw Anim_PCape_ClimbMove
	dw Anim_PBig_Sink
	dw Anim_PBig_Win
Anim_PCape_Stand:
	dw SprMap_PCape_Stand
	db $0A
	db $00
	dw SprMap_PCape_Stand
	db $80
	db $00
Anim_PCape_Walk:
	dw SprMap_PBig_Walk1
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PCape_Stand
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Walk1
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PCape_Stand
	db $04
	db $00
	dw SprMap_PBig_Walk2
	db $04
	db $00
	dw SprMap_PBig_Walk1
	db $80
	db $00
Anim_PCape_Run:
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PCape_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PCape_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PCape_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Walk1
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PCape_Stand
	db $02
	db $00
	dw SprMap_PBig_Walk2
	db $02
	db $00
	dw SprMap_PBig_Run1
	db $02
	db $00
	dw SprMap_PBig_Run2
	db $02
	db $00
	dw SprMap_PBig_Run3
	db $02
	db $00
	dw SprMap_PBig_Run2
	db $02
	db $00
	dw SprMap_PBig_Run1
	db $90
	db $00
Anim_PCape_Spin:
	dw SprMap_PBig_Front
	db $01
	db $00
	dw SprMap_PCape_Back
	db $01
	db $00
	dw SprMap_PBig_Side1
	db $01
	db $00
	dw SprMap_PBig_Side2
	db $01
	db $00
	dw SprMap_PBig_Front
	db $80
	db $00
Anim_PCape_LookUp:
	dw SprMap_PCape_LookUp
	db $02
	db $00
	dw SprMap_PCape_LookUp
	db $80
	db $00
Anim_PCape_Climb:
	dw SprMap_PCape_Climb1
	db $08
	db $00
	dw SprMap_PCape_Climb1
	db $80
	db $00
Anim_PCape_ClimbMove:
	dw SprMap_PCape_Climb1
	db $08
	db $00
	dw SprMap_PCape_Climb2
	db $08
	db $00
	dw SprMap_PCape_Climb1
	db $80
	db $00
Anim_PCape_HoldStand:
	dw SprMap_PCape_Hold
	db $0A
	db $00
	dw SprMap_PCape_Hold
	db $80
	db $00
SprMap_PCape_Stand:
	db $02
	db $04
	db $84
	db $08
	db $29, $33
	db $32, $34
	db $35, $37
	db $36, $3F
SprMap_PCape_LookUp:
	db $02
	db $04
	db $87
	db $08
	db $F3, $F4
	db $F5, $F6
	db $F7, $F8
	db $F9, $FB
SprMap_PCape_Back:
	db $03
	db $04
	db $89
	db $10
	db $71, $73, $74
	db $72, $75, $76
	db $FF, $77, $78
	db $FF, $79, $7A
SprMap_PCape_Climb1:
	db $02
	db $04
	db $88
	db $08
	db $29, $2A
	db $2B, $2C
	db $31, $32
	db $33, $34
SprMap_PCape_Climb2:
	db $42
	db $04
	db $88
	db $08
	db $2A, $29
	db $2C, $2B
	db $32, $31
	db $34, $33
SprMap_PCape_Hold:
	db $02
	db $04
	db $86
	db $08
	db $BA, $A2
	db $A1, $A3
	db $B0, $B2
	db $B1, $BB
AnimTbl_PCapeMove:
	dw Anim_PBig_Stand
	dw Anim_PBig_Walk
	dw Anim_PBig_Run
	dw Anim_PBig_Walk
	dw Anim_PBig_HoldJump
	dw Anim_PBig_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_Duck
	dw Anim_PBig_LookUp
	dw Anim_PBig_RunJump
	dw Anim_PBig_Fall
	dw Anim_PBig_Sink
	dw Anim_PBig_Swim
	dw Anim_PCape_Climb
	dw Anim_PCape_ClimbMove
	dw Anim_PBig_RunJump
	dw Anim_PBig_Win
AnimTbl_PCapeMove_Hold:
	dw Anim_PBig_Hold
	dw Anim_PBig_HoldWalk
	dw Anim_PBig_HoldRun
	dw Anim_PBig_HoldWalk
	dw Anim_PBig_HoldJump
	dw Anim_PBig_Spin
	dw Anim_PBig_Turn
	dw Anim_PBig_HoldDuck
	dw Anim_PBig_LookUp
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldFall
	dw Anim_PBig_Sink
	dw Anim_PBig_HoldSwim
	dw Anim_PCape_Climb
	dw Anim_PCape_ClimbMove
	dw Anim_PBig_Sink
	dw Anim_PBig_Win
YoshiAnimTablesTbl_1:
	dw AnimTbl_Yoshi
	dw AnimTbl_Yoshi
	dw AnimTbl_Yoshi
	dw AnimTbl_Yoshi
	dw AnimTbl_Yoshi
AnimTbl_Yoshi:
	dw Anim_Yoshi_Stand ;Standing
	dw Anim_Yoshi_Walk ;Walking
	dw Anim_Yoshi_Run ;Running
	dw Anim_Yoshi_Walk ;The forbidden action
	dw Anim_Yoshi_Jump ;Jumping
	dw Anim_Yoshi_Jump ;Spinning. Unseen for obvious reasons
	dw Anim_Yoshi_TongueDuck ;Tongue out (Ducking)
	dw Anim_Yoshi_Ducking ;Ducking
	dw Anim_Yoshi_Stand ;Looking up
	dw Anim_Yoshi_Jump ;Running jump
	dw Anim_Yoshi_Fall ;Falling
	dw Anim_Yoshi_Fall ;Sinking
	dw Anim_Yoshi_Swim ;Swimming
	dw Anim_Yoshi_Tongue ;Tongue out (Idle)
	dw Anim_Yoshi_TongueWalk ;Tongue out (While moving)
	dw Anim_Yoshi_Jump ;Flying. Technically used, although rarely seen due to a control bug
	dw Anim_Yoshi_Stand ;Victory pose.
Anim_Yoshi_Stand:
	dw SprMap_Yoshi_Stand
	db $0A
	db $00
	dw SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Walk:
	dw SprMap_Yoshi_Walk1
	db $04
	db $00
	dw SprMap_Yoshi_Stand
	db $04
	db $00
	dw SprMap_Yoshi_Walk1
	db $04
	db $00
	dw SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Run:
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Jump:
	dw SprMap_Yoshi_Jump
	db $23
	db $00
	dw SprMap_Yoshi_Walk1
	db $02
	db $00
	dw SprMap_Yoshi_Jump
	db $81
	db $00
Anim_Yoshi_Swim:
	dw SprMap_Yoshi_Jump
	db $01
	db $00
	dw SprMap_Yoshi_Jump
	db $80
	db $00
Anim_Yoshi_Ducking:
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $80
	db $00
Anim_Yoshi_Fall:
	dw SprMap_Yoshi_Walk1
	db $01
	db $00
	dw SprMap_Yoshi_Walk1
	db $80
	db $00
	dw SprMap_Yoshi_Stand
	db $0A
	db $00
	dw SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Tongue:
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue4
	db $04
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Flinch1
	db $80
	db $00
Anim_Yoshi_TongueDuck:
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Duck
	db $01
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue4
	db $04
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Flinch1
	db $80
	db $00
Anim_Yoshi_TongueWalk:
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch1
	db $01
	db $00
	dw SprMap_Yoshi_Flinch2
	db $01
	db $00
	dw SprMap_Yoshi_Flinch2
	db $01
	db $00
	dw SprMap_Yoshi_Flinch2
	db $01
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue4
	db $04
	db $00
	dw SprMap_Yoshi_Tongue3
	db $02
	db $00
	dw SprMap_Yoshi_Tongue2
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Tongue1
	db $02
	db $00
	dw SprMap_Yoshi_Flinch1
	db $80
	db $00
SprMap_Yoshi_Stand:
	db $04
	db $04
	db $91
	db $18
	db $FF, $76, $77, $FF
	db $78, $79, $7A, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
SprMap_Yoshi_Walk1:
	db $04
	db $04
	db $93
	db $18
	db $FF, $F8, $F9, $FF
	db $FA, $FB, $EB, $FF
	db $FF, $EC, $ED, $EE
	db $FF, $FF, $EF, $F0
SprMap_Yoshi_Jump:
	db $04
	db $04
	db $91
	db $18
	db $71, $72, $73, $FF
	db $FF, $74, $75, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $7B, $7C
SprMap_Yoshi_Flinch1:
	db $04
	db $04
	db $91
	db $18
	db $71, $72, $73, $FF
	db $FF, $74, $75, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
SprMap_Yoshi_Tongue1:
	db $04
	db $03
	db $9A
	db $18
	db $AB, $AC, $FF, $FF
	db $B8, $AF, $AE, $AD
	db $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue2:
	db $05
	db $03
	db $9A
	db $20
	db $FF, $AB, $AC, $FF, $FF
	db $B2, $B0, $AF, $AE, $AD
	db $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue3:
	db $06
	db $03
	db $9A
	db $28
	db $FF, $FF, $AB, $AC, $FF, $FF
	db $B2, $B1, $B0, $AF, $AE, $AD
	db $FF, $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Tongue4:
	db $07
	db $03
	db $9A
	db $30
	db $FF, $FF, $FF, $AB, $AC, $FF, $FF
	db $B2, $B1, $B1, $B0, $AF, $AE, $AD
	db $FF, $FF, $FF, $B6, $B5, $B4, $B3
SprMap_Yoshi_Flinch2:
	db $04
	db $04
	db $93
	db $18
	db $F1, $F2, $F3, $FF
	db $F4, $F5, $F6, $FF
	db $FF, $FF, $F7, $EE
	db $FF, $FF, $EF, $F0
SprMap_Yoshi_Duck:
	db $04
	db $04
	db $92
	db $18
	db $FF, $B8, $B9, $FF
	db $BA, $BB, $AB, $FF
	db $FF, $AC, $AD, $AE
	db $FF, $FF, $AF, $B0
YoshiAnimTablesTbl_2:
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
	dw pnt3_CD36
pnt3_CD36:
	dw pnt3_CD58
	dw pnt3_CD60
	dw pnt3_CD6C
	dw pnt3_CD60
	dw pnt3_CD78
	dw pnt3_CD78
	dw pnt3_CDA4
	dw pnt3_CD8C
	dw pnt3_CD58
	dw pnt3_CD78
	dw pnt3_CD94
	dw pnt3_CD94
	dw pnt3_CD84
	dw pnt3_CDB0
	dw pnt3_CDC4
	dw pnt3_CD78
	dw pnt3_CD58
pnt3_CD58:
	dw SprMap_YoshiEat_Stand
	db $0A
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD60:
	dw SprMap_YoshiEat_Walk2
	db $04
	db $00
	dw SprMap_YoshiEat_Stand
	db $04
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD6C:
	dw SprMap_YoshiEat_Stand
	db $01
	db $00
	dw SprMap_YoshiEat_Walk2
	db $01
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD78:
	dw SprMap_YoshiEat_Jump
	db $23
	db $00
	dw SprMap_YoshiEat_Walk2
	db $02
	db $00
	dw SprMap_YoshiEat_Jump
	db $81
	db $00
pnt3_CD84:
	dw SprMap_YoshiEat_Jump
	db $01
	db $00
	dw SprMap_YoshiEat_Jump
	db $80
	db $00
pnt3_CD8C:
	dw SprMap_YoshiEat_Duck
	db $01
	db $00
	dw SprMap_YoshiEat_Duck
	db $80
	db $00
pnt3_CD94:
	dw SprMap_YoshiEat_Walk2
	db $01
	db $00
	dw SprMap_YoshiEat_Walk2
	db $80
	db $00
	dw SprMap_YoshiEat_Stand
	db $0A
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CDA4:
	dw SprMap_YoshiSpit_Duck
	db $04
	db $00
	dw SprMap_YoshiSpit_Duck
	db $04
	db $00
	dw SprMap_YoshiSpit_Duck
	db $80
	db $00
pnt3_CDB0:
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $80
	db $00
pnt3_CDC4:
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $02
	db $00
	dw SprMap_YoshiSpit_Stand
	db $80
	db $00
SprMap_YoshiEat_Stand:
	db $04
	db $05
	db $9B
	db $18
	db $FF, $FF, $F6, $FF
	db $F7, $F8, $F9, $FF
	db $FA, $FB, $FC, $FF
	db $FF, $FF, $FD, $F2
	db $FF, $FF, $EB, $F5
SprMap_YoshiEat_Walk2:
	db $03
	db $04
	db $A3
	db $10
	db $FA, $F9, $FF
	db $FB, $FC, $FF
	db $FD, $F0, $EB
	db $FF, $F4, $F3
SprMap_YoshiEat_Jump:
	db $04
	db $04
	db $9B
	db $18
	db $F7, $EC, $ED, $FF
	db $EE, $EF, $F0, $FF
	db $FF, $FF, $F1, $F2
	db $FF, $FF, $F3, $F4
SprMap_YoshiEat_Duck:
	db $04
	db $04
	db $A0
	db $18
	db $FF, $36, $37, $FF
	db $38, $39, $3A, $FF
	db $FF, $3B, $3C, $3D
	db $FF, $FF, $3F, $35
SprMap_YoshiSpit_Stand:
	db $04
	db $04
	db $91
	db $18
	db $FF, $7D, $7F, $FF
	db $FF, $6B, $6C, $FF
	db $FF, $FF, $6D, $6E
	db $FF, $FF, $6F, $70
SprMap_YoshiSpit_Duck:
	db $04
	db $04
	db $A0
	db $18
	db $FF, $2B, $2C, $FF
	db $2D, $2E, $2F, $FF
	db $FF, $30, $31, $32
	db $FF, $FF, $33, $34
YoshiAnimTablesTbl_3:
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
	dw pnt3_CE5E
pnt3_CE5E:
	dw pnt3_CE80
	dw pnt3_CE8C
	dw pnt3_CE98
	dw pnt3_CE8C
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CEA0
	dw pnt3_CE98
	dw pnt3_CE80
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CE98
	dw pnt3_CEA0
	dw pnt3_CEB4
	dw pnt3_CE98
	dw pnt3_CE80
pnt3_CE80:
	dw SprMap_YoshiEat_Stand
	db $04
	db $00
	dw SprMap_Yoshi_Stand
	db $04
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CE8C:
	dw SprMap_YoshiEat_Walk2
	db $04
	db $00
	dw SprMap_Yoshi_Stand
	db $04
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CE98:
	dw SprMap_YoshiEat_Stand
	db $0A
	db $00
	dw SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CEA0:
	dw pnt3_CED8
	db $04
	db $00
	dw pnt3_CED8
	db $04
	db $00
	dw pnt3_CEF0
	db $04
	db $00
	dw pnt3_CEF0
	db $04
	db $00
	dw pnt3_CED8
	db $80
	db $00
pnt3_CEB4:
	dw pnt3_CED8
	db $02
	db $00
	dw pnt3_CED8
	db $02
	db $00
	dw pnt3_CF04
	db $02
	db $00
	dw pnt3_CF04
	db $02
	db $00
	dw pnt3_CEF0
	db $02
	db $00
	dw pnt3_CEF0
	db $02
	db $00
	dw pnt3_CF14
	db $02
	db $00
	dw pnt3_CF14
	db $02
	db $00
	dw pnt3_CED8
	db $80
	db $00
pnt3_CED8:
	db $04
	db $05
	db $A1
	db $18
	db $FF, $75, $76, $FF
	db $77, $78, $79, $FF
	db $7A, $7B, $7C, $FF
	db $FF, $7F, $7D, $72
	db $FF, $FF, $73, $74
pnt3_CEF0:
	db $04
	db $04
	db $A1
	db $18
	db $FF, $6B, $6C, $FF
	db $6D, $6E, $6F, $FF
	db $FF, $70, $71, $72
	db $FF, $FF, $73, $74
pnt3_CF04:
	db $03
	db $04
	db $A2
	db $10
	db $AB, $AC, $FF
	db $AD, $AE, $FF
	db $AF, $B0, $B1
	db $FF, $B2, $B3
pnt3_CF14:
	db $04
	db $04
	db $A2
	db $18
	db $FF, $B4, $B5, $FF
	db $B6, $B7, $B8, $FF
	db $FF, $B9, $BA, $B1
	db $FF, $FF, $B2, $B3
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
;SPECIAL WARP DATA
;This is used for special warps such as the bonus room and cannon pipes.
SpecialWarpSettings:
	dw pnt3_D07C
	dw pnt3_D080
	dw pnt3_D084
	dw pnt3_D088
	dw pnt3_D08C
	dw pnt3_D090
	dw pnt3_D094
	dw pnt3_D098
	dw pnt3_D09C
	dw pnt3_D0A0
	dw pnt3_D0A4
	dw pnt3_D0A8
	dw pnt3_D0AC
	dw pnt3_D0B0
	dw pnt3_D0B4
	dw pnt3_D0B8
	dw pnt3_D0BC
	dw pnt3_D0C0
	dw pnt3_D0C4
	dw pnt3_D0C8
	dw pnt3_D0CC
	dw pnt3_D0D0
	dw pnt3_D0D4
	dw pnt3_D0D8
	dw pnt3_D0DC
	dw pnt3_D0E0
	dw pnt3_D0E4
	dw pnt3_D0E8
	dw SPWarp_BonusRoomSettings
	dw SPWarp_6_3_CannonSettings
	dw pnt3_D1D0
SpecialWarpCoords:
	dw pnt3_D0EC
	dw pnt3_D0F4
	dw pnt3_D0FC
	dw pnt3_D104
	dw pnt3_D10C
	dw pnt3_D114
	dw pnt3_D11C
	dw pnt3_D124
	dw pnt3_D12C
	dw pnt3_D134
	dw pnt3_D13C
	dw pnt3_D144
	dw pnt3_D14C
	dw pnt3_D154
	dw pnt3_D15C
	dw pnt3_D164
	dw pnt3_D16C
	dw pnt3_D174
	dw pnt3_D17C
	dw pnt3_D184
	dw pnt3_D18C
	dw pnt3_D194
	dw pnt3_D19C
	dw pnt3_D1A4
	dw pnt3_D1AC
	dw pnt3_D1B4
	dw pnt3_D1BC
	dw pnt3_D1C4
	dw SPWarp_BonusRoomPos
	dw SPWarp_6_3_CannonPos
	dw pnt3_D1DC
;Warp Level Settings Format
;Byte 1: Level flags and ID(?)
; Format: UUPLLLLL
; >UU: Underwater bits. Which one is set is irrelevant.
; >P: BG Priority bit. Player priority seems to be overriden by the level being warped to.
; >LLLLL: Destination level ID
;Byte 2: Tileset
;Byte 3: Second PRG Bank
;Byte 4: Palette ID
pnt3_D07C:
	db $00
	db $00
	db $1C
	db $00
pnt3_D080:
	db $01
	db $01
	db $1C
	db $01
pnt3_D084:
	db $02
	db $02
	db $1C
	db $02
pnt3_D088:
	db $03
	db $23
	db $23
	db $1D
pnt3_D08C:
	db $04
	db $04
	db $1D
	db $04
pnt3_D090:
	db $05
	db $05
	db $1D
	db $05
pnt3_D094:
	db $03
	db $27
	db $23
	db $1C
pnt3_D098:
	db $03
	db $23
	db $23
	db $1D
pnt3_D09C:
	db $08
	db $08
	db $1E
	db $08
pnt3_D0A0:
	db $49
	db $09
	db $1E
	db $09
pnt3_D0A4:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0A8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0AC:
	db $0C
	db $0C
	db $1F
	db $0C
pnt3_D0B0:
	db $0D
	db $0D
	db $1F
	db $0D
pnt3_D0B4:
	db $0E
	db $0E
	db $1F
	db $0E
pnt3_D0B8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0BC:
	db $10
	db $10
	db $20
	db $10
pnt3_D0C0:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0C4:
	db $52
	db $12
	db $20
	db $12
pnt3_D0C8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0CC:
	db $14
	db $14
	db $21
	db $14
pnt3_D0D0:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0D4:
	db $16
	db $15
	db $21
	db $16
pnt3_D0D8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0DC:
	db $18
	db $18
	db $22
	db $18
pnt3_D0E0:
	db $19
	db $19
	db $22
	db $19
pnt3_D0E4:
	db $03
	db $27
	db $23
	db $1C
pnt3_D0E8:
	db $03
	db $23
	db $23
	db $1D
pnt3_D0EC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D0F4:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D0FC:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D104:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D10C:
	db $0A
	db $01
	db $80
	db $A8
	db $FF
	db $11
	db $FF
	db $01
pnt3_D114:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $11
	db $FF
	db $01
pnt3_D11C:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D124:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D12C:
	db $06
	db $00
	db $90
	db $58
	db $FF
	db $11
	db $FF
	db $00
pnt3_D134:
	db $03
	db $00
	db $70
	db $48
	db $FF
	db $0C
	db $FF
	db $00
pnt3_D13C:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D144:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D14C:
	db $0B
	db $01
	db $80
	db $C8
	db $FF
	db $11
	db $FF
	db $01
pnt3_D154:
	db $0B
	db $01
	db $70
	db $A8
	db $FF
	db $11
	db $00
	db $01
pnt3_D15C:
	db $06
	db $01
	db $70
	db $38
	db $FF
	db $11
	db $FF
	db $01
pnt3_D164:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D16C:
	db $0B
	db $01
	db $80
	db $98
	db $FF
	db $11
	db $00
	db $01
pnt3_D174:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D17C:
	db $00
	db $01
	db $40
	db $B0
	db $FF
	db $0E
	db $FF
	db $01
pnt3_D184:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D18C:
	db $00
	db $01
	db $80
	db $B0
	db $FF
	db $11
	db $00
	db $01
pnt3_D194:
	db $00
	db $01
	db $40
	db $C0
	db $FF
	db $00
	db $00
	db $01
pnt3_D19C:
	db $0F
	db $01
	db $80
	db $98
	db $FF
	db $11
	db $00
	db $01
pnt3_D1A4:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D1AC:
	db $00
	db $01
	db $80
	db $B0
	db $FF
	db $11
	db $00
	db $01
pnt3_D1B4:
	db $08
	db $01
	db $60
	db $18
	db $FF
	db $11
	db $00
	db $01
pnt3_D1BC:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
pnt3_D1C4:
	db $00
	db $00
	db $40
	db $C0
	db $FF
	db $00
	db $FF
	db $00
SPWarp_6_3_CannonSettings:
	db $16
	db $15
	db $21
	db $16
pnt3_D1D0:
	db $16
	db $15
	db $21
	db $16
SPWarp_6_3_CannonPos:
	db $06
	db $01
	db $90
	db $5C
	db $FF
	db $11
	db $00
	db $01
pnt3_D1DC:
	db $10
	db $01
	db $80
	db $5C
	db $FF
	db $11
	db $00
	db $01
SPWarp_BonusRoomSettings:
	db $23
	db $22
	db $2B
	db $25
SPWarp_BonusRoomPos:
	db $00
	db $01
	db $10
	db $B0
	db $FF
	db $00
	db $FF
	db $01
;End of special warp data
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $C0
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $80 ;Why the hell is this here? Seriously, why? All this does is prevent me from padding the rest of this bank.
