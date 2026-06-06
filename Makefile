# Config
AS = ca65
LD = ld65
CONFIG = smw.cfg
FLAGS = -g --feature force_range -U -I include -I data/sound -I data/levels

# OS Detection
ifeq ($(OS),Windows_NT)
    MKDIR_P = if not exist "$(subst /,\,$1)" mkdir "$(subst /,\,$1)"
else
    MKDIR_P = mkdir -p "$1"
endif

# Output filename
TARGET = smw.nes

SRC_DIR = src

OBJ_DIR = bin

SOURCES = $(foreach dir, $(SRC_DIR), $(wildcard $(dir)/*.asm))

all: $(TARGET)

# Object order in each bank
PRG36_OBJS := \
	$(OBJ_DIR)/src/prg036.o

PRG37_OBJS := \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Spike.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Spike.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SpikeHitbox.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Spike.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_CollPlayer.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PrincessMushroom.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_PrincessMushroom.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PrincessMushroom.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_DinoRhinos.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_DinoRhinos.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_DinoRhinos.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Propeller.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Bowser.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_FinalBossObjects.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_ClownCarHitbox.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Propeller.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_ApplyBowserVel.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Princess.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Princess.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_ClownCarExplosionSmoke.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_ClownCarExplosionSmoke.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_ClownCarExplosionSmokeAlt.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Bowser.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Princess.o \
	$(OBJ_DIR)/src/padding/padding037.o

PRG38_OBJS := \
	$(OBJ_DIR)/src/prg038.o

PRG39_OBJS := \
	$(OBJ_DIR)/src/prg039.o

PRG40_OBJS := \
	$(OBJ_DIR)/src/prg040.o

PRG41_OBJS := \
	$(OBJ_DIR)/src/prg041.o

PRG42_OBJS := \
	$(OBJ_DIR)/src/prg042.o

PRG43_OBJS := \
	$(OBJ_DIR)/src/prg043.o

PRG44_OBJS := \
	$(OBJ_DIR)/src/prg044.o

PRG45_OBJS := \
	$(OBJ_DIR)/src/prg045.o

PRG46_OBJS := \
	$(OBJ_DIR)/src/prg046.o

PRG47_OBJS := \
	$(OBJ_DIR)/src/prg047.o

PRG48_OBJS := \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_ParseChuckMovement.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_CharginChuck.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_CharginChuck.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_CharginChuckChase.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_CharginChuckChase.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_CharginChuckStunned.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_CharginChuckStunned.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PitchinChuck.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PitchinChuck.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Baseball.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Baseball.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PuntinChuck.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PuntinChuck.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Football.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Football.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_DigginChuck.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_DigginChuck.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Rock.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Rock.o \
	$(OBJ_DIR)/src/obj/render/ObjDrawShared_ChuckProjectiles.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_ChuckProjectiles.o \
	$(OBJ_DIR)/src/obj/render/ObjDrawShared_Chucks.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Chucks.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_BooBuddiesGenerator.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BooBuddiesGenerator.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BooBuddy.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Boo.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SwarmBooPatrolling.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SwarmBooAttacking.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_SwarmBoo.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Boo.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_BooBuddy.o \
	$(OBJ_DIR)/src/obj/render/ObjDrawShared_Boos.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Boos.o \
	$(OBJ_DIR)/data/obj/Obj_ChuckBooMovementData.o \

PRG49_OBJS := \
	$(OBJ_DIR)/src/prg049.o

PRG50_OBJS := \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Ninji.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Ninji.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Ninji.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Thwomp.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Thwomp.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Thwomp.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_UnusedObj.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_FuzzyAlt.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_FuzzyAlt.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_FuzzyAlt.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_UrchinVertical.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_UrchinHorizontal.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Urchin.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Urchin.o \
	$(OBJ_DIR)/data/obj/Obj_NinjiMovementData.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_MortonRoy.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_MortonRoy.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_LemmyWendy.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Koopalings.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_PodobooDiagonalBossColl.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PodobooDiagonalBoss.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PodobooDiagonal.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_LemmyWendy.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PodobooDiagonal.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_VinePlant.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_VinePlant.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_ItemBoxVine.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_VinePlant.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_DistCalc2.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_DrawVineTile.o

PRG51_OBJS := \
	$(OBJ_DIR)/data/obj/Obj_MovementData.o \
	$(OBJ_DIR)/src/padding/padding051.o \
	$(OBJ_DIR)/src/prg051.o

PRG52_OBJS := \
	$(OBJ_DIR)/src/prg052.o

PRG53_OBJS := \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Yoshi.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Yoshi.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_ItemBoxYoshi.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_ItemBoxPSwitch.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PSwitch.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_ThrowUpwards.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Spring.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Shell.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_ShellKicked.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_1UP.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PlayerFireball1.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PlayerFireball2.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_YoshiFireballBottom.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_DistCalc.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_YoshiFireballMiddle.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_YoshiFireballTop.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SuperMushroomIdle.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SuperMushroom.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvShared_SuperMushroom.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_FireFlower.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_ResetFunction.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Feather.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Star.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Pop.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_MoveYoshiFireball.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_ItemBlockYoshi.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PSwitch_ItemBlock.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_GlobalObjects.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Spring.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_KoopaShell.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_1UP.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PlayerFireball.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_YoshiFireball.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_PodobooHorizontal.o \
	$(OBJ_DIR)/src/obj/render/ObjDrawShared_SuperMushroom.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_FireFlower.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Feather.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_StopIfInBlock.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Star.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Pop.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BuzzyBeetle.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_BuzzyBeetle.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_BuzzyBeetle.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_BuzzyShell.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_BuzzyShellKicked.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_BuzzyShell.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Checkpoint.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Checkpoint.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Checkpoint.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_GoalTape.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_GoalTape.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PodobooHorizontal.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PodobooHorizontal.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_GoalTape.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhvFunc_MakePlayerBig.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_LevelExit.o \

PRG54_OBJS := \
	$(OBJ_DIR)/src/prg054.o

PRG55_OBJS := \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Koopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDrawShared_Koopas.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Koopas.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Paratroopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Rex.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Rex.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Rex.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PiranhaPlant.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PiranhaPlant.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_PiranhaPlant.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PiranhaPlantMask.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SuperKoopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_SuperKoopa.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_SuperKoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_VolcanoLotus.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_VolcanoLotus.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_VolcanoLotus.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_LotusPollen.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_LotusPollen.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_LotusPollen.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Swooper.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Swooper.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Swooper.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Blurp.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Blurp.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Blurp.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Mechakoopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Mechakoopa.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_Mechakoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_MechakoopaStunned.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_MechakoopaStunned.o \
	$(OBJ_DIR)/data/obj/sprites/ObjSpr_MechakoopaStunned.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_UnshelledKoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BgPriorityToggleLeft.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BgPriorityToggleVertical.o \
	$(OBJ_DIR)/src/padding/padding055.o

PRG56_OBJS := \
	$(OBJ_DIR)/src/prg056.o \
	$(OBJ_DIR)/src/padding/padding056.o

PRG57_OBJS := \
	$(OBJ_DIR)/src/prg057.o

PRG58_59_OBJS := \
	$(OBJ_DIR)/src/prg058_59.o

PRG60_OBJS := \
	$(OBJ_DIR)/src/prg060.o

PRG61_OBJS := \
	$(OBJ_DIR)/src/prg061.o

PRG62_OBJS := \
	$(OBJ_DIR)/src/prg062.o

PRG63_OBJS := \
	$(OBJ_DIR)/src/prg063.o

OBJECTS := \
	$(OBJ_DIR)/src/smw.o \
	$(PRG36_OBJS) \
	$(PRG37_OBJS) \
	$(PRG38_OBJS) \
	$(PRG39_OBJS) \
	$(PRG40_OBJS) \
	$(PRG41_OBJS) \
	$(PRG42_OBJS) \
	$(PRG43_OBJS) \
	$(PRG44_OBJS) \
	$(PRG45_OBJS) \
	$(PRG46_OBJS) \
	$(PRG47_OBJS) \
	$(PRG48_OBJS) \
	$(PRG49_OBJS) \
	$(PRG50_OBJS) \
	$(PRG51_OBJS) \
	$(PRG52_OBJS) \
	$(PRG53_OBJS) \
	$(PRG54_OBJS) \
	$(PRG55_OBJS) \
	$(PRG56_OBJS) \
	$(PRG57_OBJS) \
	$(PRG58_59_OBJS) \
	$(PRG60_OBJS) \
	$(PRG61_OBJS) \
	$(PRG62_OBJS) \
	$(PRG63_OBJS) \

# Link everything
$(TARGET): $(OBJECTS)
	$(LD) -C $(CONFIG) $(OBJECTS) -o $@ -m map.txt --dbgfile smw.dbg

# Assemble every asm file to an object
$(OBJ_DIR)/%.o: %.asm
	@$(call MKDIR_P,$(dir $@))
	$(AS) $(FLAGS) $< -o $@
