# SMW NES Disassembly
This is a WIP disassembly of the unlicensed Famicom port of SMW. It is (or at least, should be) completely shiftable, but much of the code is undocumented.

We have a [Discord](https://discord.gg/3rJSuzqzmE) if you want to assist in reverse engineering or simply want to follow the project. See [here](https://github.com/palaceswitcher/SMW-NES-Disassembly/blob/master/CONTRIBUTING.md) for more info on contributing.

# How to assemble
- Drag and drop your ROM onto the Python script `smw_nes_extractor.py` or run the script and enter your ROM's filename. This will dump the game's assets.
- Run either "assemble.bat" or "assemble.sh", depending on your OS.
(The assembler used can be found [here](https://github.com/morskoyzmey/asm6).) You may also just run `./asm6 smw.asm smw.nes`.

# To-do:
- Better document some of the collision and object code.
- Finish fixing the labels, cleaning, and organizing the music ASM. As of right now, they're extremely messy.
