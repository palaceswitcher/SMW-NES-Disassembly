; 0x048010-0x04A00F
lda_36_C000: 
	.word PlayerAnimTablesTbl   ; 00 No Yoshi
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
	db $0A
	db $00
	.word SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Walk:
	.word SprMap_PSmall_Stand
	db $04
	db $00
	.word SprMap_PSmall_Walk1
	db $04
	db $00
	.word SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Run:
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Stand
	db $02
	db $00
	.word SprMap_PSmall_Walk1
	db $02
	db $00
	.word SprMap_PSmall_Run1
	db $02
	db $00
	.word SprMap_PSmall_Run2
	db $02
	db $00
	.word SprMap_PSmall_Run1
	db $02
	db $00
	.word SprMap_PSmall_Run2
	db $02
	db $00
	.word SprMap_PSmall_Run1
	db $90
	db $00
Anim_PSmall_Jump:
	.word SprMap_PSmall_Jump
	db $23
	db $00
	.word SprMap_PSmall_Fall
	db $02
	db $00
	.word SprMap_PSmall_Fall
	db $81
	db $00
Anim_PSmall_RunJump:
	.word SprMap_PSmall_RunJump
	db $0A
	db $00
	.word SprMap_PSmall_RunJump
	db $80
	db $00
Anim_PSmall_Spin:
	.word SprMap_PSmall_Stand
	db $01
	db $00
	.word SprMap_PSmall_Back
	db $01
	db $00
	.word SprMap_PSmall_Flipped
	db $01
	db $00
	.word SprMap_PSmall_Front
	db $01
	db $00
	.word SprMap_PSmall_Stand
	db $80
	db $00
Anim_PSmall_Turn:
	.word SprMap_PSmall_Turn
	db $0A
	db $00
	.word SprMap_PSmall_Turn
	db $80
	db $00
Anim_PSmall_Duck:
	.word SprMap_PSmall_Duck
	db $08
	db $00
	.word SprMap_PSmall_Duck
	db $80
	db $00
Anim_PSmall_Up:
	.word SprMap_PSmall_LookUp
	db $02
	db $00
	.word SprMap_PSmall_LookUp
	db $80
	db $00
Anim_PSmall_Fall:
	.word SprMap_PSmall_Fall
	db $02
	db $00
	.word SprMap_PSmall_Fall
	db $80
	db $00
Anim_PSmall_Sink:
	.word SprMap_PSmall_Swim1
	db $01
	db $00
	.word SprMap_PSmall_Swim1
	db $80
	db $00
Anim_PSmall_Swim:
	.word SprMap_PSmall_RunJump
	db $03
	db $00
	.word SprMap_PSmall_Swim1
	db $03
	db $00
	.word SprMap_PSmall_RunJump
	db $80
	db $00
Anim_PSmall_ClimbIdle:
	.word SprMap_PSmall_Climb1
	db $08
	db $00
	.word SprMap_PSmall_Climb1
	db $80
	db $00
Anim_PSmall_Climb:
	.word SprMap_PSmall_Climb1
	db $08
	db $00
	.word SprMap_PSmall_Climb2
	db $08
	db $00
	.word SprMap_PSmall_Climb1
	db $80
	db $00
Anim_PSmall_Win:
	.word SprMap_PSmall_Victory
	db $0A
	db $00
	.word SprMap_PSmall_Victory
	db $80
	db $00
Anim_PSmall_Die:
	.word SprMap_PSmall_Death1
	db $28
	db $00
	.word SprMap_PSmall_Death1
	db $08
	db $00
	.word SprMap_PSmall_Death2
	db $08
	db $00
	.word SprMap_PSmall_Death1
	db $81
	db $00
Anim_PSmall_Hold:
	.word SprMap_PSmall_Hold
	db $0A
	db $00
	.word SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldWalk:
	.word SprMap_PSmall_Hold
	db $04
	db $00
	.word SprMap_PSmall_HoldWalk
	db $04
	db $00
	.word SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldRun:
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $90
	db $00
Anim_PSmall_HoldJump:
	.word SprMap_PSmall_HoldWalk
	db $23
	db $00
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $81
	db $00
Anim_PSmall_HoldDuck:
	.word SprMap_PSmall_DuckHold
	db $08
	db $00
	.word SprMap_PSmall_DuckHold
	db $80
	db $00
	.word SprMap_PSmall_Hold
	db $02
	db $00
	.word SprMap_PSmall_Hold
	db $80
	db $00
Anim_PSmall_HoldFall:
	.word SprMap_PSmall_HoldWalk
	db $02
	db $00
	.word SprMap_PSmall_HoldWalk
	db $80
	db $00
Anim_PSmall_HoldSink:
	.word pnt3_C2D8
	db $01
	db $00
	.word pnt3_C2D8
	db $80
	db $00
Anim_PSmall_HoldSwim:
	.word pnt3_C2D8
	db $03
	db $00
	.word pnt3_C2D8
	db $03
	db $00
	.word pnt3_C2D8
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
	db $0A
	db $00
	.word SprMap_PBig_Stand
	db $80
	db $00
Anim_PBig_Walk:
	.word SprMap_PBig_Walk1
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Stand
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Walk1
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Stand
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Walk1
	db $80
	db $00
Anim_PBig_Run:
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Run1
	db $02
	db $00
	.word SprMap_PBig_Run2
	db $02
	db $00
	.word SprMap_PBig_Run3
	db $02
	db $00
	.word SprMap_PBig_Run2
	db $02
	db $00
	.word SprMap_PBig_Run1
	db $90
	db $00
Anim_PBig_Jump:
	.word SprMap_PBig_Jump
	db $23
	db $00
	.word SprMap_PBig_Fall
	db $02
	db $00
	.word SprMap_PBig_Fall
	db $81
	db $00
Anim_PBig_RunJump:
	.word SprMap_PBig_RunJump
	db $0A
	db $00
	.word SprMap_PBig_RunJump
	db $80
	db $00
Anim_PBig_Spin:
	.word SprMap_PBig_Front
	db $01
	db $00
	.word SprMap_PBig_Back
	db $01
	db $00
	.word SprMap_PBig_Side1
	db $01
	db $00
	.word SprMap_PBig_Side2
	db $01
	db $00
	.word SprMap_PBig_Front
	db $80
	db $00
Anim_PBig_Turn:
	.word SprMap_PBig_Turn
	db $0A
	db $00
	.word SprMap_PBig_Turn
	db $80
	db $00
Anim_PBig_Duck:
	.word SprMap_PBig_Duck
	db $08
	db $00
	.word SprMap_PBig_Duck
	db $80
	db $00
Anim_PBig_LookUp:
	.word SprMap_PBig_LookUp
	db $02
	db $00
	.word SprMap_PBig_LookUp
	db $80
	db $00
Anim_PBig_Fall:
	.word SprMap_PBig_Fall
	db $02
	db $00
	.word SprMap_PBig_Fall
	db $80
	db $00
Anim_PBig_Sink:
	.word SprMap_PBig_Swim1
	db $01
	db $00
	.word SprMap_PBig_Swim1
	db $80
	db $00
Anim_PBig_Swim:
	.word SprMap_PBig_RunJump
	db $03
	db $00
	.word SprMap_PBig_Swim2
	db $03
	db $00
	.word SprMap_PBig_Swim1
	db $03
	db $00
	.word SprMap_PBig_Swim2
	db $03
	db $00
	.word SprMap_PBig_Fall
	db $80
	db $00
Anim_PBig_Climb:
	.word SprMap_PBig_Climb1
	db $08
	db $00
	.word SprMap_PBig_Climb1
	db $80
	db $00
Anim_PBig_ClimbMove:
	.word SprMap_PBig_Climb1
	db $08
	db $00
	.word SprMap_PBig_Climb2
	db $08
	db $00
	.word SprMap_PBig_Climb1
	db $80
	db $00
Anim_PBig_Win:
	.word SprMap_PBig_Victory
	db $0A
	db $00
	.word SprMap_PBig_Victory
	db $80
	db $00
Anim_PBig_Hold:
	.word SprMap_PBig_Hold
	db $0A
	db $00
	.word SprMap_PBig_Hold
	db $80
	db $00
Anim_PBig_HoldWalk:
	.word SprMap_PBig_HoldWalk1
	db $04
	db $00
	.word SprMap_PBig_HoldWalk2
	db $04
	db $00
	.word SprMap_PBig_Hold
	db $04
	db $00
	.word SprMap_PBig_HoldWalk2
	db $04
	db $00
	.word SprMap_PBig_HoldWalk1
	db $04
	db $00
	.word SprMap_PBig_HoldWalk2
	db $04
	db $00
	.word SprMap_PBig_Hold
	db $04
	db $00
	.word SprMap_PBig_HoldWalk2
	db $04
	db $00
	.word SprMap_PBig_HoldWalk1
	db $80
	db $00
Anim_PBig_HoldRun:
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_Hold
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_Hold
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_Hold
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_Hold
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_Hold
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $90
	db $00
Anim_PBig_HoldJump:
	.word SprMap_PBig_HoldWalk1
	db $23
	db $00
	.word SprMap_PBig_HoldWalk1
	db $02
	db $00
	.word SprMap_PBig_HoldWalk1
	db $81
	db $00
Anim_PBig_HoldDuck:
	.word SprMap_PBig_DuckHold
	db $08
	db $00
	.word SprMap_PBig_DuckHold
	db $80
	db $00
	.word SprMap_PBig_LookUp
	db $02
	db $00
	.word SprMap_PBig_LookUp
	db $80
	db $00
Anim_PBig_HoldFall:
	.word SprMap_PBig_HoldWalk2
	db $02
	db $00
	.word SprMap_PBig_HoldWalk2
	db $80
	db $00
Anim_PBig_HoldSwim:
	.word SprMap_PBig_Swim1
	db $03
	db $00
	.word SprMap_PBig_Swim1
	db $03
	db $00
	.word SprMap_PBig_Swim1
	db $03
	db $00
	.word SprMap_PBig_Swim1
	db $03
	db $00
	.word SprMap_PBig_Swim1
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
	db $0A
	db $00
	.word SprMap_PFire_Stand
	db $80
	db $00
Anim_PFire_Walk:
	.word SprMap_PFire_Walk1
	db $04
	db $00
	.word SprMap_PFire_Walk2
	db $04
	db $00
	.word SprMap_PFire_Stand
	db $04
	db $00
	.word SprMap_PFire_Walk2
	db $04
	db $00
	.word SprMap_PFire_Walk1
	db $04
	db $00
	.word SprMap_PFire_Walk2
	db $04
	db $00
	.word SprMap_PFire_Stand
	db $04
	db $00
	.word SprMap_PFire_Walk2
	db $04
	db $00
	.word SprMap_PFire_Walk1
	db $80
	db $00
Anim_PFire_Run:
	.word SprMap_PFire_Walk1
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Stand
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Walk1
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Stand
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Walk1
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Stand
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Walk1
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Stand
	db $02
	db $00
	.word SprMap_PFire_Walk2
	db $02
	db $00
	.word SprMap_PFire_Run1
	db $02
	db $00
	.word SprMap_PFire_Run2
	db $02
	db $00
	.word SprMap_PFire_Run3
	db $02
	db $00
	.word SprMap_PFire_Run2
	db $02
	db $00
	.word SprMap_PFire_Run1
	db $90
	db $00
Anim_PFire_Jump:
	.word SprMap_PFire_Jump
	db $23
	db $00
	.word SprMap_PFire_Fall
	db $02
	db $00
	.word SprMap_PFire_Fall
	db $81
	db $00
Anim_PFire_RunJump:
	.word SprMap_PFire_RunJump
	db $0A
	db $00
	.word SprMap_PFire_RunJump
	db $80
	db $00
Anim_PFire_Spin:
	.word SprMap_PFire_Front
	db $01
	db $00
	.word SprMap_PFire_Back
	db $01
	db $00
	.word SprMap_PFire_Stand
	db $01
	db $00
	.word SprMap_PFire_Flipped
	db $01
	db $00
	.word SprMap_PFire_Front
	db $80
	db $00
Anim_PFire_Turn:
	.word SprMap_PFire_Turn
	db $0A
	db $00
	.word SprMap_PFire_Turn
	db $80
	db $00
Anim_PFire_Duck:
	.word SprMap_PFire_Duck
	db $08
	db $00
	.word SprMap_PFire_Duck
	db $80
	db $00
Anim_PFire_Lookup:
	.word SprMap_PFire_LookUp
	db $02
	db $00
	.word SprMap_PFire_LookUp
	db $80
	db $00
Anim_PFire_Fall:
	.word SprMap_PFire_Fall
	db $02
	db $00
	.word SprMap_PFire_Fall
	db $80
	db $00
Anim_PFire_Sink:
	.word SprMap_PFire_Swim1
	db $01
	db $00
	.word SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_Swim:
	.word SprMap_PFire_RunJump
	db $03
	db $00
	.word SprMap_PFire_Swim2
	db $03
	db $00
	.word SprMap_PFire_Swim1
	db $03
	db $00
	.word SprMap_PFire_Swim2
	db $03
	db $00
	.word SprMap_PFire_Fall
	db $80
	db $00
Anim_PFire_Climb:
	.word SprMap_PFire_Climb1
	db $08
	db $00
	.word SprMap_PFire_Climb1
	db $80
	db $00
Anim_PFire_ClimbMove:
	.word SprMap_PFire_Climb1
	db $08
	db $00
	.word SprMap_PFire_Climb2
	db $08
	db $00
	.word SprMap_PFire_Climb1
	db $80
	db $00
Anim_PFire_Win:
	.word SprMap_PFire_Victory
	db $0A
	db $00
	.word SprMap_PFire_Victory
	db $80
	db $00
Anim_PFire_ShootAir:
	.word SprMap_PFire_Swim1
	db $03
	db $00
	.word SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_ShootSwim:
	.word SprMap_PFire_Swim2
	db $03
	db $00
	.word SprMap_PFire_Swim1
	db $03
	db $00
	.word SprMap_PFire_Swim1
	db $80
	db $00
Anim_PFire_Shoot:
	.word SprMap_PFire_Shoot
	db $03
	db $00
	.word SprMap_PFire_Shoot
	db $80
	db $00
Anim_PFire_Hold:
	.word SprMap_PFire_Hold
	db $0A
	db $00
	.word SprMap_PFire_Hold
	db $80
	db $00
Anim_PFire_HoldWalk:
	.word SprMap_PFire_HoldWalk1
	db $04
	db $00
	.word SprMap_PFire_HoldWalk2
	db $04
	db $00
	.word SprMap_PFire_Hold
	db $04
	db $00
	.word SprMap_PFire_HoldWalk2
	db $04
	db $00
	.word SprMap_PFire_HoldWalk1
	db $04
	db $00
	.word SprMap_PFire_HoldWalk2
	db $04
	db $00
	.word SprMap_PFire_Hold
	db $04
	db $00
	.word SprMap_PFire_HoldWalk2
	db $04
	db $00
	.word SprMap_PFire_HoldWalk1
	db $80
	db $00
Anim_PFire_HoldRun:
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_Hold
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_Hold
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_Hold
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_Hold
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_Hold
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $90
	db $00
Anim_PFire_HoldJump:
	.word SprMap_PFire_HoldWalk1
	db $23
	db $00
	.word SprMap_PFire_HoldWalk1
	db $02
	db $00
	.word SprMap_PFire_HoldWalk1
	db $81
	db $00
Anim_PFire_HoldDuck:
	.word SprMap_PFire_DuckHold
	db $08
	db $00
	.word SprMap_PFire_DuckHold
	db $80
	db $00
Anim_PFire_HoldSwim:
	.word SprMap_PFire_HoldWalk2
	db $02
	db $00
	.word SprMap_PFire_HoldWalk2
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
	db $0A
	db $00
	.word SprMap_PCape_Stand
	db $80
	db $00
Anim_PCape_Walk:
	.word SprMap_PBig_Walk1
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PCape_Stand
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Walk1
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PCape_Stand
	db $04
	db $00
	.word SprMap_PBig_Walk2
	db $04
	db $00
	.word SprMap_PBig_Walk1
	db $80
	db $00
Anim_PCape_Run:
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PCape_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PCape_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PCape_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Walk1
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PCape_Stand
	db $02
	db $00
	.word SprMap_PBig_Walk2
	db $02
	db $00
	.word SprMap_PBig_Run1
	db $02
	db $00
	.word SprMap_PBig_Run2
	db $02
	db $00
	.word SprMap_PBig_Run3
	db $02
	db $00
	.word SprMap_PBig_Run2
	db $02
	db $00
	.word SprMap_PBig_Run1
	db $90
	db $00
Anim_PCape_Spin:
	.word SprMap_PBig_Front
	db $01
	db $00
	.word SprMap_PCape_Back
	db $01
	db $00
	.word SprMap_PBig_Side1
	db $01
	db $00
	.word SprMap_PBig_Side2
	db $01
	db $00
	.word SprMap_PBig_Front
	db $80
	db $00
Anim_PCape_LookUp:
	.word SprMap_PCape_LookUp
	db $02
	db $00
	.word SprMap_PCape_LookUp
	db $80
	db $00
Anim_PCape_Climb:
	.word SprMap_PCape_Climb1
	db $08
	db $00
	.word SprMap_PCape_Climb1
	db $80
	db $00
Anim_PCape_ClimbMove:
	.word SprMap_PCape_Climb1
	db $08
	db $00
	.word SprMap_PCape_Climb2
	db $08
	db $00
	.word SprMap_PCape_Climb1
	db $80
	db $00
Anim_PCape_HoldStand:
	.word SprMap_PCape_Hold
	db $0A
	db $00
	.word SprMap_PCape_Hold
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
	db $0A
	db $00
	.word SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Walk:
	.word SprMap_Yoshi_Walk1
	db $04
	db $00
	.word SprMap_Yoshi_Stand
	db $04
	db $00
	.word SprMap_Yoshi_Walk1
	db $04
	db $00
	.word SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Run:
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Jump:
	.word SprMap_Yoshi_Jump
	db $23
	db $00
	.word SprMap_Yoshi_Walk1
	db $02
	db $00
	.word SprMap_Yoshi_Jump
	db $81
	db $00
Anim_Yoshi_Swim:
	.word SprMap_Yoshi_Jump
	db $01
	db $00
	.word SprMap_Yoshi_Jump
	db $80
	db $00
Anim_Yoshi_Ducking:
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $80
	db $00
Anim_Yoshi_Fall:
	.word SprMap_Yoshi_Walk1
	db $01
	db $00
	.word SprMap_Yoshi_Walk1
	db $80
	db $00
	.word SprMap_Yoshi_Stand
	db $0A
	db $00
	.word SprMap_Yoshi_Stand
	db $80
	db $00
Anim_Yoshi_Tongue:
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue4
	db $04
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Flinch1
	db $80
	db $00
Anim_Yoshi_TongueDuck:
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Duck
	db $01
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue4
	db $04
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Flinch1
	db $80
	db $00
Anim_Yoshi_TongueWalk:
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch1
	db $01
	db $00
	.word SprMap_Yoshi_Flinch2
	db $01
	db $00
	.word SprMap_Yoshi_Flinch2
	db $01
	db $00
	.word SprMap_Yoshi_Flinch2
	db $01
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue4
	db $04
	db $00
	.word SprMap_Yoshi_Tongue3
	db $02
	db $00
	.word SprMap_Yoshi_Tongue2
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Tongue1
	db $02
	db $00
	.word SprMap_Yoshi_Flinch1
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
	db $0A
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD60:
	.word SprMap_YoshiEat_Walk2
	db $04
	db $00
	.word SprMap_YoshiEat_Stand
	db $04
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD6C:
	.word SprMap_YoshiEat_Stand
	db $01
	db $00
	.word SprMap_YoshiEat_Walk2
	db $01
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CD78:
	.word SprMap_YoshiEat_Jump
	db $23
	db $00
	.word SprMap_YoshiEat_Walk2
	db $02
	db $00
	.word SprMap_YoshiEat_Jump
	db $81
	db $00
pnt3_CD84:
	.word SprMap_YoshiEat_Jump
	db $01
	db $00
	.word SprMap_YoshiEat_Jump
	db $80
	db $00
pnt3_CD8C:
	.word SprMap_YoshiEat_Duck
	db $01
	db $00
	.word SprMap_YoshiEat_Duck
	db $80
	db $00
pnt3_CD94:
	.word SprMap_YoshiEat_Walk2
	db $01
	db $00
	.word SprMap_YoshiEat_Walk2
	db $80
	db $00
	.word SprMap_YoshiEat_Stand
	db $0A
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CDA4:
	.word SprMap_YoshiSpit_Duck
	db $04
	db $00
	.word SprMap_YoshiSpit_Duck
	db $04
	db $00
	.word SprMap_YoshiSpit_Duck
	db $80
	db $00
pnt3_CDB0:
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $80
	db $00
pnt3_CDC4:
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
	db $02
	db $00
	.word SprMap_YoshiSpit_Stand
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
	db $04
	db $00
	.word SprMap_Yoshi_Stand
	db $04
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CE8C:
	.word SprMap_YoshiEat_Walk2
	db $04
	db $00
	.word SprMap_Yoshi_Stand
	db $04
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CE98:
	.word SprMap_YoshiEat_Stand
	db $0A
	db $00
	.word SprMap_YoshiEat_Stand
	db $80
	db $00
pnt3_CEA0:
	.word pnt3_CED8
	db $04
	db $00
	.word pnt3_CED8
	db $04
	db $00
	.word pnt3_CEF0
	db $04
	db $00
	.word pnt3_CEF0
	db $04
	db $00
	.word pnt3_CED8
	db $80
	db $00
pnt3_CEB4:
	.word pnt3_CED8
	db $02
	db $00
	.word pnt3_CED8
	db $02
	db $00
	.word pnt3_CF04
	db $02
	db $00
	.word pnt3_CF04
	db $02
	db $00
	.word pnt3_CEF0
	db $02
	db $00
	.word pnt3_CEF0
	db $02
	db $00
	.word pnt3_CF14
	db $02
	db $00
	.word pnt3_CF14
	db $02
	db $00
	.word pnt3_CED8
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
; End of special warp data
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
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
	db $80 ; Why the hell is this here? Seriously, why? All this does is prevent me from padding the rest of this bank.
