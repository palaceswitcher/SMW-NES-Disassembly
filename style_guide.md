# Style Guide

## General Style

### General Styling

- Avoid referring to the player as "Mario" or "Luigi", and instead just say "Player".
- Immediate values for instructions should be represented by hexadecimal in most cases, unless used for math or PRG bank switching, where decimal should instead be used. Bitwise instructions should always use binary literals, unless they're used for modulo operations.
	- Example: `AND #$07` should not be written as `AND #%00000111` if it's used to run code every 8th frame.

### Label Styling

- Jumps, branches, tables, and RAM addresses should always be written in TitleCase and should not be too verbose.
- Tables have their own special formatting conventions, which can be found [below](#labels).
- Shortening longer words in a label is highly encouraged.
- What type of memory it is should not be specified unless it's a table. Do not put things like "RAM" in a RAM label or "branch" in a branch label (pre-existing disassembler-generated labels are exempt from this).
- Use local labels with a "@" at the start of them to reduce overly long names when possible. For example, the routine that calculates the player's horizontal jump speed and the routine that caluclates the horizontal jump speed for the Chargin' Chuck could both use `@CalcJumpXSpeed` within the routine instead of using `CalcPlayerJumpXSpeed` and `CalcChuckJumpXSpeed` respectively.

### Constant Styling

- Constant values should be written in camelCase, with an underscore separating the first word or phrase.
- Constants should have their names abbreviated, if possible.
	- Examples: `sfx_Jump`, `evt1_Door`, `objID_Koopa`

### Macro Styling

- Macro names should be written in all lowercase with no underscores if they represent data. If they represent a repeated block of code, they should use the same conventions as labels.
- Macro code should be indented the same way as any other code. See [below](#code-spacing-and-comments).

### Comments & Spacing

- Comments should describe what something does, obviously.
- Avoid describing the literal assembly code unless it's relevant to the code's function, such as "this loads \<variable\> into the X index."
- If you aren't entirely sure of what something does, add a question mark after the comment.

## Code Spacing and Comments

### Spacing

- Blocks of code that are executed conditionally should be indented. 
	- This includes nested conditional code, which should be given another indent for every condition it's in. If two conditions come one after another with no instructions between, however, they should be treated as one condition.
	- Indents should be a tab, not spaces.
- Blocks of code should be separated by two lines, with a blank line between them. This also applies if the block below has a comment at the start of it.

### Separating Comments

Separating comments act as visual separators for the code to break it up and make it more readable.

- Separating comments should always be represented with dashes.
	- Separating comments should use 60 dashes for the start or end of a bank or separating drastically different parts of a bank. 
	- Separating comments should use 40 dashes if they represent a block of code (see below)
	- Separating comments should use 20 dashes if they separate parts of a larger block of code, such as a subroutine.
- Comments that describe a long block of code should come above that block of code on its own line and be one indentation behind that code. So if the block of code is indented by one, the comment should have no indents. The comment itself should also have a space after the semicolon.

### Indented Comments

Certain tables should have comments indented with tabs to a uniform distance if their data is laid out in a special way or is handled a special way. This is most commonly done for sprite mapping tables, as seen in the example below.

Example:

```asm
SprMapTbl_SuperKoopa:
	dw SprMap_SuperKoopa_Walk1		;Walking animation (Feather)
	dw SprMap_SuperKoopa_Walk2		;
	dw SprMap_SuperKoopa_Walk1		;Walking animation (Normal)
	dw SprMap_SuperKoopa_Walk2		;

	dw SprMap_SuperKoopa_Takeoff2	;Takeoff animation (Feather)
	dw SprMap_SuperKoopaRed_Takeoff	;
	dw SprMap_SuperKoopa_Takeoff2	;Takeoff animation (Normal)
	dw SprMap_SuperKoopa_Takeoff1	;

	dw SprMap_SuperKoopa_Fly2		;Fly animation (Feather)
	dw SprMap_SuperKoopaRed_Fly		;
	dw SprMap_SuperKoopa_Fly2		;Fly animation (Normal)
	dw SprMap_SuperKoopa_Fly1		;

	dw SprMap_SuperKoopa_Defeated
```

#### Description Blocks

Description blocks refer to a comment "block" that marks the start of something significant, such as an important routine or the start of significant code. It should be between two separating comments (see above).

- The first line between the separator should describe what the code is in all caps, such as a subroutine, the start of an object's code, or the start for an important routine. It should also have the address in parentheses, if possible.
	- Example: `SUBROUTINE ($BEBC)`, `KOOPA CODE START ($8000)`
- The remaining lines should describe the code, if necessary. If the name is explanatory enough, then a description probably isn't needed.

##### Example Block

```
;----------------------------------------
;SUBROUTINE ($A6D4)
;Checks if an object is being hit by a cape and kills it accordingly.
;----------------------------------------
```

## Labels

### Table Names

- Tables of a certain data type or format should start with their data type (see below) separated by an underscore.
	- Example: `Anim_PlayerFire_Hold`

#### Common Data Types

Object function pointer table: `FuncTbl_Object`\
Animation pointer table: `AnimTbl_Object`\
Object animation data: `Anim_Object_Animation`\
Sprite mappings: `SprMap_Object_Animation<frame number>`\
Sprite mapping pointers: `SprMapTbl_Object`

### Routine Names

- Routine names should generally state what they do while not being too verbose.
- If a routine's function is related to something or performs a specific function for something, said thing should come before the label separated with an underscore. For example, the routine that gets the PPU upload parameters is called `HUD_GetPPUUploadParams`, as it gets the upload parameters *specifically* for the PPU.
- Note that subroutines do not have to state that they are subroutines in their name.
	- Examples: `RewardPoints`, `SkipCapeKill`

### Special Label Names

Specific formatting should be used for code that serves a specific and common purpose. The naming scheme for these can be found below, with words like "Purpose" being replaced by the purpose of the code or data the label represents.

#### Objects
`Obj_Object`: The start of an object's code\
`Obj_Purpose`: Routine or subroutine used by multiple objects\
`GenObj_Purpose`: Generic object code that's either shared or used by object(s) via a subroutine call\
`Object_GetFunction`: The code that an object uses to call from its function table\
`Object_HitCheck`: The function that checks if the player successfully hit and object\
`Object_HitRespond`: The object's response to being hit by the player\

## Constants

- Outside of special cases like object IDs, constants should be put in `constants.asm`.
- Avoid modifying existing constants unless they contain typos or are innacurate.
- The correct type of constant should be used in the right scenario. For example, you shouldn't use a constant meant to represent the IDs of a sound effect for something related to objects, even if they have the same value.

### Constant Types

Below is a list of every type of constant currently used.\
`sfx_`: SFX ID\
`mus_`: Song ID\
`objID_`: Object ID\
`pAction_`: Player action\
`evt0_`: Game state 0 event\
`evt1_`: Game state 1 event

## Macros

- Avoid creating macros for something that can reasonably done with a existing directive like `db`.
- Use macros for specialized data formats that would otherwise be tedious or impossible to do with existing directives. Macros should also be used for chunks of code that are repeated frequently (preferably over 10 times)
