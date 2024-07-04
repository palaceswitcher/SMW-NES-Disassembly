# General Style
## Labels
- Jumps, branches, tables, and RAM addresses should always be written in TitleCase and should not be too verbose.
- Shortening longer words in a label is highly encouraged.
- What type of memory it is should not be specified unless it's a table. Do not put things like "RAM" in a RAM label or "branch" in a branch label.
- Use local labels with a "@" at the start of them to reduce overly long names when possible. For example, the routine that checks calculates the player's horizontal jump speed and the routine that caluclates the horizontal jump speed for the Chargin' Chuck could both use `@CalcJumpXSpeed` within the routine instead of using `CalcPlayerJumpXSpeed` and `CalcChuckJumpXSpeed` respectively.
## Constants
- Constant values should be written in camelCase, with an underscore separating the first word.
- Constants should have their names abbreviated, if possible.
	- Examples: `sfx_Jump`, `evt1_Door`
## Comments & Spacing
- Comments should describe what something does, obviously.
- Avoid describing the literal assembly code unless it's relevant to the code's function, such as "this loads \<variable\> into the X index."
- If you aren't entirely sure of what something does, add a question mark after the comment.
# Code Spacing and Comments
## Spacing
- Blocks of code that are executed conditionally should be indented. 
	- This includes nested conditional code, which should be given another indent for every condition it's in.
- Blocks of code should be separated by two lines, with a blank line between them. This also applies if the block below has a comment at the start of it.
## Separating Comments
- Separating comments should always be represented by 40 dashes.
- Comments that describe a long block of code should come above that block of code and be one indentation behind that code. So if the block of code is indented by one, the comment should have no indents.
### Description Blocks
Description blocks refer to a comment "block" that marks the start of something significant, such as an important routine or the start of significant code. It should be between two separating comments (see above).\
- The first line between the separator should describe what the code is in all caps, such as a subroutine, the start of an object's code, or the start for an important routine. It should also have the address in parentheses, if possible.
	- Example: `SUBROUTINE ($BEBC)`, `KOOPA CODE START ($8000)`
- The remaining lines should describe the code, if necessary. If the name is explanatory enough, then a description probably isn't needed.
#### Example Block
```
;----------------------------------------
;SUBROUTINE ($A6D4)
;Checks if an object is being hit by a cape and kills it accordingly.
;----------------------------------------
```
# Labels
## Routine Names
- Routine names should generally state what they do while not being too verbose.
- Note that subroutines do not have to state that they are subroutines in their name.
	- Examples: `RewardPoints`, `SkipCapeKill`

## Special Label Names
Specific formatting should be used for code that serves a specific and common purpose or for tables of a certain function. The naming scheme for these can be found below, with words like "Purpose" being replaced by the purpose of the code or data the label represents.
### Objects
`Obj_Object`: The start of an object's code\
`Obj_Purpose`: Routine or subroutine used by multiple objects\
`Object_AnimTbl`: Animation table\
`SprMap_ObjectAnim<frame number>`: Sprite mappings\
`Object_SprMapPtrs`: Sprite mapping pointers
