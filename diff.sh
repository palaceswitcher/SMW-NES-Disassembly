#!/usr/bin/env bash

if [[ $1 == *h* ]]; then
	printf "Optional Arugments:\n\
 -h, --help\n\
   Display this message.\n\
 -o <path>\n\
   Log the difference to file <path>. Defaults to \"diff.log\" if no path argument is given.\n"
	exit
fi

orig='./SuperMarioWorld.nes'
built='./smw.nes'
diffscript='
function oct2dec(oct, dec) {
	for (i = 1; i <= length(oct); i++) {
		dec *= 8; dec += substr(oct, i, 1)
	};
	return dec
}
{
	printf "%08X %02X %02X\n", $1, oct2dec($2), oct2dec($3)
}'

./asm6 -q smw.asm smw.nes
diff $orig $built && echo 'Files are identical.' && exit
if [[ -z $1 ]]; then
	cmp -l SuperMarioWorld.nes smw.nes | mawk "$diffscript"
elif [[ $1 = "-o" ]]; then
	if [[ -z $2 ]]; then
		outdir="diff.log"
	else
		outdir=$2
	fi
	cmp -l SuperMarioWorld.nes smw.nes | mawk "$diffscript" > $outdir && printf "Difference saved to $outdir.\n"
fi
