#SMW NES Data Extractor v1.0 by PalaceSwitcher

import sys

# Drag and drop functionality
try:
	filename = sys.argv[1]
except IndexError:
	#filename = input("Filename: ")
	parser.print_help()
	sys.exit(1)

# File error handling
while True:
	try:
		f = open(filename, "rb") #Get file
		break
	except FileNotFoundError as not_found:
		print("File \""+not_found.filename+"\" not found!")
		filename = input("Filename: ")

rom_data = f.read() #Read file

open("SMW.chr", "wb").write(rom_data[0x80010:0xC0010]) #Dump CHR

# Dump levels
open("levels/lvl_1-1.bin", "wb").write(rom_data[0x10:0x2010])
open("levels/lvl_1-2.bin", "wb").write(rom_data[0x2010:0x4010])
open("levels/lvl_1-3.bin", "wb").write(rom_data[0x4010:0x6010])
open("levels/lvl_1-4_1.bin", "wb").write(rom_data[0x6010:0x6910]) #1st part of 1-4
open("levels/lvl_GhostHouseIntro.bin", "wb").write(rom_data[0x6910:0x6C10]) #Unused screen at end of this
open("levels/lvl_CastleIntro.bin", "wb").write(rom_data[0x6C10:0x6D10])
open("levels/lvl_YoshiHouse.bin", "wb").write(rom_data[0x6D10:0x7210]) #0x300 bytes of 0 after this
open("levels/lvl_1-4_2.bin", "wb").write(rom_data[0x7210:0x7810]) #2nd part of 1-4
open("levels/lvl_Bonus.bin", "wb").write(rom_data[0x7810:0x8010])

for i in range(4, 27):
    open(f"levels/lvl_{i//4+1}-{i%4+1}.bin", "wb").write(rom_data[0x2000*i+0x10:0x2000*i+0x2010])
open("levels/lvl_7-4.bin", "wb").write(rom_data[0x36010:0x37710])
open("levels/lvl_BowserRoom.bin", "wb").write(rom_data[0x37710:0x37810])
open("levels/lvl_ClownCar.bin", "wb").write(rom_data[0x37810:0x38010])
open("levels/lvl_Title.bin", "wb").write(rom_data[0x5A010:0x5AE10])
open("levels/lvl_Map.bin", "wb").write(rom_data[0x5C010:0x5D910])

# Dump tilesets
for i in range(28):
    open(f"tilesets/ts_{i//4+1}-{i%4+1}.bin", "wb").write(rom_data[0x800*i+0x38010:0x800*i+0x38810])
open("tilesets/ts_YoshiHouse.bin", "wb").write(rom_data[0x46010:0x46810])
open("tilesets/ts_Unused1.bin", "wb").write(rom_data[0x46810:0x47010])
open("tilesets/ts_GhostHouseIntro.bin", "wb").write(rom_data[0x47010:0x47810])
open("tilesets/ts_CastleIntro.bin", "wb").write(rom_data[0x47810:0x48010])
open("tilesets/ts_Bowser.bin", "wb").write(rom_data[0x4D810:0x4DE10])
open("tilesets/ts_Bonus.bin", "wb").write(rom_data[0x56010:0x56610])
open("tilesets/ts_Title.bin", "wb").write(rom_data[0x58010:0x58810])
open("tilesets/ts_Map.bin", "wb").write(rom_data[0x58810:0x59010])
open("tilesets/ts_Unused2.bin", "wb").write(rom_data[0x59010:0x59810])
open("tilesets/ts_Unused3.bin", "wb").write(rom_data[0x59810:0x5A010])

print("Data dumped successfully.")
