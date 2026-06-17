#!/usr/bin/python3
# SMW NES Data Extractor v1.5.0 by PalaceSwitcher
# For use with the disassembly
import argparse
import typing
import os
import sys

# Argument parsing

parser = argparse.ArgumentParser(usage="Extracts data from a Super Mario World NES ROM for use with the disassembly. All data will be extracted unless any of the arguments below are passed.")

parser.add_argument("filename", type=str, help="Extracted ROM filename")

parser.add_argument("--chr", help="Extract the CHR ROM", action="store_true")
parser.add_argument("--chr-full", help="Extracted the CHR as a single file rather than banks", action="store_true")
parser.add_argument("--levels", help="Extract all level data, including the title screen", action="store_true")
parser.add_argument("--overworld", help="Extract all overworld-related data", action="store_true")
parser.add_argument("--rle", help="Extract all RLE-compressed 8x8 tilemaps", action="store_true")
parser.add_argument("--rle-title", help="Extract the title screen logo RLE data", action="store_true")
parser.add_argument("--rle-ending", help="Extract the ending screen RLE data", action="store_true")
parser.add_argument("--rle-copyright", help="Extract the copyright screen RLE data", action="store_true")
parser.add_argument("--rle-thank-you", help="Extract the \"Thank You\" screen RLE data", action="store_true")
parser.add_argument("--rle-yoshi-house", help="Extract the unused Yoshi House RLE data", action="store_true")
parser.add_argument("-v", "--version", action="version", version="%(prog)s 1.5.0")
args = parser.parse_args()

extract_chr = True
extract_levels = True
extract_overworld = True
filename = args.filename
extract_single_chr = args.chr_full
extract_rle_title = True
extract_rle_ending= True
extract_rle_copyright = True
extract_rle_thankyou = True
extract_rle_yoshihouse = True

if True in [args.chr, args.levels, args.overworld, args.rle, args.rle_title, args.rle_ending, args.rle_copyright, args.rle_thank_you, args.rle_yoshi_house]:
	extract_chr = args.chr
	extract_levels = args.levels
	extract_overworld = args.overworld

	if not args.rle:
		extract_rle_title = args.rle_title
		extract_rle_ending= args.rle_ending
		extract_rle_copyright = args.rle_copyright
		extract_rle_thankyou = args.rle_thank_you
		extract_rle_yoshihouse = args.rle_yoshi_house

# Drag and drop functionality
try:
	filename = sys.argv[1]
except IndexError:
	filename = input("Filename: ")

# File error handling
while True:
	try:
		f = open(filename, "rb") # Get file
		break
	except FileNotFoundError as not_found:
		print("File \""+not_found.filename+"\" not found!")
		filename = input("Filename: ")

rom_data = f.read() # Read file

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

# Get little-endian u16 from a byte array
def bytes_to_u16(bytes: bytearray, index: int) -> int:
	if index + 1 >= len(bytes):
		return -1
	return (bytes[index] & 0xFF) | ((bytes[index+1] & 0xFF) << 8)

class Pointer:
	def __init__(self, value):
		self.ptr = value

	def __repr__(self):
		return "<${0:04X}>".format(self.ptr)

	def __str__(self):
		return "<${0:04X}>".format(self.ptr)

# Decompiles data to ASM
def decomp_data(data: bytearray, base_addr: int) -> list:
	intermediate_data = [] # Intermediate decompilation data
	ptr_addrs: list[int] = [] # Addresses of each pointer

	# Look for pointers
	i = 0
	while i < len(data):
		current_u16 = bytes_to_u16(data, i) # Currently indexed data as a u16
		if base_addr + i in ptr_addrs:
			intermediate_data.append(base_addr + i) # Add a 16-bit number for each pointer location
		if current_u16 > base_addr and current_u16 < base_addr + len(data):
			intermediate_data.append(Pointer(current_u16))
			ptr_addrs.append(current_u16)
			i += 2 # Go an extra byte ahead for a pointer
		else:
			intermediate_data.append(data[i])
			i += 1
	
	return intermediate_data

def decomp_spawndata(bin_data: bytearray, base_addr: int, prefix: str) -> str:
	data = decomp_data(bin_data, base_addr) # Decomp data
	out_lines: list[str] = [".include \"macros.asm\""] # Decompiled lines
	ptr_names = {}

	i = 0
	world_num = 1 # World number for each pointer
	while i < len(data):
		if type(data[i]) == Pointer:
			ptr_names[data[i].ptr] = f"{prefix}{world_num}"
			out_lines.append(f"\t.word {prefix}{world_num}")
			world_num += 1
			i += 1
		else:
			if data[i] > 255:
				out_lines.append(f"\n{ptr_names[data[i]]}:")
				i += 1
			elif i < len(data):
				x_pos = "$"+"{0:04X}".format(data[i+2] | (data[i] << 8))
				y_pos = "$"+"{0:04X}".format(data[i+3] | (data[i+1] << 8))
				x_lock = "$"+"{0:02X}".format(data[i+4])
				y_lock = "$"+"{0:02X}".format(data[i+6])

				out_lines.append(f"\tspawndata {x_pos}, {y_pos}, {data[i+5]}, {data[i+7]}, {x_lock}, {y_lock}")
				i += 8
	
	return "\n".join(out_lines)

# Decomp unformatted data
def decomp_generic(bin_data: bytearray, base_addr: int, split_size=1, split_half: bool = False, ptr_names: dict = {}) -> str:
	data = decomp_data(bin_data, base_addr) # Decomp data
	out_lines: list[str] = [] # Decompiled lines

	ptr_count = 0 # Amount of pointers
	for d in data:
		if type(d) == Pointer:
			ptr_count += 1

	ptrs_until_half = ptr_count // 2 # Amount of pointers until the middle of the pointer table is reached

	i = 0
	while i < len(data):
		if split_half and ptrs_until_half == 0:
			out_lines.append("\nplayer2LevelPalettes:")

		if type(data[i]) == Pointer:
			if data[i].ptr not in ptr_names:
				ptr_names[data[i].ptr] = f"lbl_{data[i].ptr}"
			out_lines.append(f"\t.word {ptr_names[data[i].ptr]}")
			ptrs_until_half -= 1
			i += 1
		else:
			if data[i] > 255:
				out_lines.append(f"\n{ptr_names[data[i]]}:")
				i += 1
			else:
				line = "\t.byte " # Output line being added
				for j in range(split_size):
					if j != split_size - 1:
						line += "${0:02X}, ".format(data[i]) # Only insert comma until last byte reached
					else:
						line += "${0:02X}".format(data[i])
					i += 1
				out_lines.append(line)
	
	return "\n".join(out_lines)

# Create directories if they don't exist
create_dir("data/levels")
create_dir("data/tilesets")
create_dir("data/screens")
create_dir("data/chr")

if extract_chr:
	print("Extracting CHR...")
	if extract_single_chr:
		dump_chunk(rom_data, f"data/chr/smw.chr", 0x80010, 0xC0010)
	for i in range(256):
		dump_chunk(rom_data, f"data/chr/chr{i:03d}.chr", 0x80010+(i*0x400), 0x80010+(i*0x400)+0x400)

if extract_levels:
	print("Extracting level data...")
	# Dump levels
	dump_chunk(rom_data, "data/levels/lvl_1-1.bin", 0x10, 0x2010)
	dump_chunk(rom_data, "data/levels/lvl_1-2.bin", 0x2010, 0x4010)
	dump_chunk(rom_data, "data/levels/lvl_1-3.bin", 0x4010, 0x6010)
	dump_chunk(rom_data, "data/levels/lvl_1-4_1.bin", 0x6010, 0x6910) # 1st part of 1-4
	dump_chunk(rom_data, "data/levels/lvl_GhostHouseIntro.bin", 0x6910, 0x6C10) # Unused screen at end of this
	dump_chunk(rom_data, "data/levels/lvl_CastleIntro.bin", 0x6C10, 0x6D10)
	dump_chunk(rom_data, "data/levels/lvl_YoshiHouse.bin", 0x6D10, 0x7210) # 0x300 bytes of 0 after this
	dump_chunk(rom_data, "data/levels/lvl_1-4_2.bin", 0x7210, 0x7810) # 2nd part of 1-4
	dump_chunk(rom_data, "data/levels/lvl_Bonus.bin", 0x7810, 0x8010)

	for i in range(4, 27):
		dump_chunk(rom_data, f"data/levels/lvl_{i//4+1}-{i%4+1}.bin", 0x2000*i+0x10, 0x2000*i+0x2010)
	dump_chunk(rom_data, "data/levels/lvl_7-4.bin", 0x36010, 0x37710)
	dump_chunk(rom_data, "data/levels/lvl_BowserRoom.bin", 0x37710, 0x37810)
	dump_chunk(rom_data, "data/levels/lvl_ClownCar.bin", 0x37810, 0x38010)
	dump_chunk(rom_data, "data/levels/lvl_Title.bin", 0x5A010, 0x5AE10)

	# Dump tilesets
	for i in range(28):
		dump_chunk(rom_data, f"data/tilesets/ts_{i//4+1}-{i%4+1}.bin", 0x800*i+0x38010, 0x800*i+0x38810)
	dump_chunk(rom_data, "data/tilesets/ts_YoshiHouse.bin", 0x46010, 0x46810)
	dump_chunk(rom_data, "data/tilesets/ts_Unused1.bin", 0x46810, 0x47010)
	dump_chunk(rom_data, "data/tilesets/ts_GhostHouseIntro.bin", 0x47010, 0x47810)
	dump_chunk(rom_data, "data/tilesets/ts_CastleIntro.bin", 0x47810, 0x48010)
	dump_chunk(rom_data, "data/tilesets/ts_Bowser.bin", 0x4D810, 0x4DE10)
	dump_chunk(rom_data, "data/tilesets/ts_Bonus.bin", 0x56010, 0x56610)
	dump_chunk(rom_data, "data/tilesets/ts_Title.bin", 0x58010, 0x58810)
	dump_chunk(rom_data, "data/tilesets/ts_Unused2.bin", 0x59010, 0x59810)
	dump_chunk(rom_data, "data/tilesets/ts_Unused3.bin", 0x59810, 0x5A010)
	
	# Dump level metadata
	print("Decompiling level metadata...")
	open("data/levels/SpawnData.asm", "w").write(decomp_spawndata(rom_data[0x7B686:0x7B77E], 0xB676, "spawnDataWorld"))
	open("data/levels/CheckpointSpawnData.asm", "w").write(decomp_spawndata(rom_data[0x7B77E:0x7B86C], 0xB76E, "spawnDataCheckpointWorld"))
	#open("data/levels/Palettes.asm", "w").write(decomp_generic(rom_data[0x7FA0C:0x7FE9C], 0xF9FC, 4, True, PALETTE_LABELS))

# Dump overworld data
if extract_overworld:
	print("Extracting overworld data...")
	dump_chunk(rom_data, "data/levels/lvl_Map.bin", 0x5C010, 0x5D910)
	dump_chunk(rom_data, "data/tilesets/ts_Map.bin", 0x58810, 0x59010)

# Dump screens
if extract_rle_title:
	print("Extracting compressed tilemaps...")
	dump_chunk(rom_data, "data/screens/TitleLogo.bin", 0x5401A, 0x54123)
if extract_rle_ending:
	print("Extracting compressed tilemaps...")
	dump_chunk(rom_data, "data/screens/EndingScreen.bin", 0x54123, 0x541F2)
if extract_rle_thankyou:
	print("Extracting compressed tilemaps...")
	dump_chunk(rom_data, "data/screens/ThankYouScreen.bin", 0x541F2, 0x5448C)
if extract_rle_copyright:
	print("Extracting compressed tilemaps...")
	dump_chunk(rom_data, "data/screens/CopyrightScreen.bin", 0x5448C, 0x544E2)
if extract_rle_yoshihouse:
	print("Extracting compressed tilemaps...")
	dump_chunk(rom_data, "data/screens/YoshiHouse.bin", 0x544E2, 0x5473B)

print("Data dumped successfully.")
