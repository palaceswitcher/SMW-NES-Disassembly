# SMW NES Disassembly

This is a WIP disassembly of the unlicensed Famicom port of SMW. It is (or at least, should be) completely shiftable, but much of the code is undocumented.

We have a [Discord](https://discord.gg/3rJSuzqzmE) if you want to assist in reverse engineering or simply want to follow the project. See [here](https://github.com/palaceswitcher/SMW-NES-Disassembly/blob/master/CONTRIBUTING.md) for more info on contributing.

## How to assemble

- Drag and drop your ROM onto the Python script `smw_nes_extractor.py` or run the script and enter your ROM's filename. This will dump the game's assets.
- Run `make` in the root directory of the disassembly. See [below](#how-to-install-make-windows) if you are on Windows and do not have make installed.

### How to install make (Windows)

The most simple way to install make on Windows is to install it via [GnuWin](https://sourceforge.net/projects/gnuwin32/). After installing you may need to add the environment variable for it, which can be done by doing the following:

- Go to `Control Panel > Edit the system environment variables > Environment Variables > System Variables`
- Select "Path" and hit "Edit".
- Select "Browse" and select the "bin" folder in the directory where GnuWin is installed.

## To-do

- Better document some of the collision and object code.
- Finish fixing the labels, cleaning, and organizing the music ASM. As of right now, they're extremely messy.
