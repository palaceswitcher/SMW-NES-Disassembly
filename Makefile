# Config
AS = ca65
LD = ld65
CONFIG = smw.cfg
FLAGS = -g --feature force_range -U -I include -I sound -I levels

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
	$(OBJ_DIR)/src/prg037.o

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
	$(OBJ_DIR)/src/prg048.o

PRG49_OBJS := \
	$(OBJ_DIR)/src/prg049.o

PRG50_OBJS := \
	$(OBJ_DIR)/src/prg050.o

PRG51_OBJS := \
	$(OBJ_DIR)/src/obj/data/Obj_MovementData.o \
	$(OBJ_DIR)/src/padding/padding051.o \
	$(OBJ_DIR)/src/prg051.o

PRG52_OBJS := \
	$(OBJ_DIR)/src/prg052.o

PRG53_OBJS := \
	$(OBJ_DIR)/src/prg053.o

PRG54_OBJS := \
	$(OBJ_DIR)/src/prg054.o

PRG55_OBJS := \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Koopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_GenKoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Paratroopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Rex.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Rex.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PiranhaPlant.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_PiranhaPlant.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_PiranhaPlantMask.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_SuperKoopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_SuperKoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_VolcanoLotus.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_VolcanoLotus.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_LotusPollen.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_LotusPollen.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Swooper.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Swooper.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Blurp.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Blurp.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_Mechakoopa.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_Mechakoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_MechakoopaStunned.o \
	$(OBJ_DIR)/src/obj/render/ObjDraw_MechakoopaStunned.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_UnshelledKoopa.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BgPriorityToggleLeft.o \
	$(OBJ_DIR)/src/obj/behavior/ObjBhv_BgPriorityToggleVertical.o \
	$(OBJ_DIR)/src/padding/padding055.o

PRG56_OBJS := \
	$(OBJ_DIR)/src/prg056.o

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
	@if not exist "$(dir $@)" mkdir "$(subst /,\,$(dir $@))"
	$(AS) $(FLAGS) $< -o $@
