#!/usr/bin/env bash

orig='./SuperMarioWorld.nes'
built='./smw.nes'

./asm6 -q smw.asm smw.nes
diff $orig $built && echo 'Files are identical.' && exit
cmp -l SuperMarioWorld.nes smw.nes | mawk 'function oct2dec(oct,     dec) {for (i = 1; i <= length(oct); i++) {dec *= 8; dec += substr(oct, i, 1)}; return dec} {printf "%08X %02X %02X\n", $1, oct2dec($2), oct2dec($3)}' > diff.log
