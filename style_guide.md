# General Style
## Labels
- Jumps, branches, tables, and RAM addresses should always be written in TitleCase and should not be too verbose.
- Shortening longer words in a label is highly encouraged.
- What type of memory it is should not be specified unless it's a table. Do not put things like "RAM" in a RAM label or "branch" in a branch label.
- Only tables should separate words with underscores. See below for data labeling conventions.
- Please use local labels like "+" or "-" for forward and backward branches respectively when possible. If there are multiple near each other, you can put up to two more plus or minus signs. Local labels may also use an @ sign, such as `@Stop`.
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

## Data Label Names
Below are naming schemes for types of tables. The word "Object" should be replaced with whatever is using the table. If you find something that doesn't fit into any of these, you can give it your own naming scheme, provided that it follows the convention for labels stated above.

`AnimTbl_Object`: Animation Table\
`SprMap_ObjectAnim<frame number>`: Sprite Mappings\
`Object_SprMapPtrs`: Sprite Pointers
