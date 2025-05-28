#!/usr/bin/python
# SMW NES Data Extractor v1.1.0 by PalaceSwitcher
import os
import sys

# Drag and drop functionality
try:
	filename = sys.argv[1]
except IndexError:
	filename = input("Filename: ")

# File error handling
while True:
	try:
		f = open(filename, "rb") #Get file
		break
	except FileNotFoundError as not_found:
		print("File \""+not_found.filename+"\" not found!")
		filename = input("Filename: ")

rom_data = f.read() #Read file

# Export part of rom
def dump_chunk(data, path, start_offs, end_offs):
	try:
		with open(path, "wb") as file:
			file.write(data[start_offs:end_offs])
	except PermissionError:
		print("Error: Permission denied. Unable to write to file \""+path+"\".")
	except IOError:
		print("Error: An error occured while writing to file \""+path+"\".")

# Create directory if it doesn't exist
def create_dir(dir):
	if not os.path.exists(dir):
		os.makedirs(dir)

# Create directories if they don't exist
create_dir("levels")
create_dir("tilesets")
create_dir("screens")

dump_chunk(rom_data, "SMW.chr", 0x80010, 0xC0010) # Dump CHR

# Dump levels
dump_chunk(rom_data, "levels/lvl_1-1.bin", 0x10, 0x2010)
dump_chunk(rom_data, "levels/lvl_1-2.bin", 0x2010, 0x4010)
dump_chunk(rom_data, "levels/lvl_1-3.bin", 0x4010, 0x6010)
dump_chunk(rom_data, "levels/lvl_1-4_1.bin", 0x6010, 0x6910) # 1st part of 1-4
dump_chunk(rom_data, "levels/lvl_GhostHouseIntro.bin", 0x6910, 0x6C10) # Unused screen at end of this
dump_chunk(rom_data, "levels/lvl_CastleIntro.bin", 0x6C10, 0x6D10)
dump_chunk(rom_data, "levels/lvl_YoshiHouse.bin", 0x6D10, 0x7210) # 0x300 bytes of 0 after this
dump_chunk(rom_data, "levels/lvl_1-4_2.bin", 0x7210, 0x7810) # 2nd part of 1-4
dump_chunk(rom_data, "levels/lvl_Bonus.bin", 0x7810, 0x8010)

for i in range(4, 27):
	dump_chunk(rom_data, f"levels/lvl_{i//4+1}-{i%4+1}.bin", 0x2000*i+0x10, 0x2000*i+0x2010)
dump_chunk(rom_data, "levels/lvl_7-4.bin", 0x36010, 0x37710)
dump_chunk(rom_data, "levels/lvl_BowserRoom.bin", 0x37710, 0x37810)
dump_chunk(rom_data, "levels/lvl_ClownCar.bin", 0x37810, 0x38010)
dump_chunk(rom_data, "levels/lvl_Title.bin", 0x5A010, 0x5AE10)
dump_chunk(rom_data, "levels/lvl_Map.bin", 0x5C010, 0x5D910)

# Dump tilesets
for i in range(28):
	dump_chunk(rom_data, f"tilesets/ts_{i//4+1}-{i%4+1}.bin", 0x800*i+0x38010, 0x800*i+0x38810)
dump_chunk(rom_data, "tilesets/ts_YoshiHouse.bin", 0x46010, 0x46810)
dump_chunk(rom_data, "tilesets/ts_Unused1.bin", 0x46810, 0x47010)
dump_chunk(rom_data, "tilesets/ts_GhostHouseIntro.bin", 0x47010, 0x47810)
dump_chunk(rom_data, "tilesets/ts_CastleIntro.bin", 0x47810, 0x48010)
dump_chunk(rom_data, "tilesets/ts_Bowser.bin", 0x4D810, 0x4DE10)
dump_chunk(rom_data, "tilesets/ts_Bonus.bin", 0x56010, 0x56610)
dump_chunk(rom_data, "tilesets/ts_Title.bin", 0x58010, 0x58810)
dump_chunk(rom_data, "tilesets/ts_Map.bin", 0x58810, 0x59010)
dump_chunk(rom_data, "tilesets/ts_Unused2.bin", 0x59010, 0x59810)
dump_chunk(rom_data, "tilesets/ts_Unused3.bin", 0x59810, 0x5A010)

# Dump screens
dump_chunk(rom_data, "screens/TitleLogo.bin", 0x5401A, 0x54123)
dump_chunk(rom_data, "screens/EndingScreen.bin", 0x54123, 0x541F2)
dump_chunk(rom_data, "screens/ThankYouScreen.bin", 0x541F2, 0x5448C)
dump_chunk(rom_data, "screens/CopyrightScreen.bin", 0x5448C, 0x544E2)
dump_chunk(rom_data, "screens/YoshiHouse.bin", 0x544E2, 0x5473B)

print("Data dumped successfully.")
