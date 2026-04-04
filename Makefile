# Config
AS = ca65
LD = ld65
CONFIG = smw.cfg
FLAGS = -g --feature force_range -U -I include -I sound -I levels

# Output filename
TARGET = smw.nes

SRCDIRS = src

SOURCES = $(foreach dir, $(SRCDIRS), $(wildcard $(dir)/*.asm))

OBJECTS = $(SOURCES:.asm=.o)

DEPS = $(SOURCES:.asm=.d)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) -C $(CONFIG) $(OBJECTS) -o $@ -m map.txt --dbgfile smw.dbg

%.o: %.asm
	$(AS) $(FLAGS) $< -o $@
