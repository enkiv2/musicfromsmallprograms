#!/usr/bin/env zsh

rate=4000
time=60

cc=gcc

play=play
if [[ $# -gt 1 ]]; then
	play=sox
fi

echo '#include <stdio.h>

int main() {
	int t;
	for (t=0; t<('"$((rate*time))"'); t++) {
		putchar('"$1"');
	}
}' > smallprog.c

$cc smallprog.c -o smallprog

./smallprog | $play -r $rate -e signed -b 8 -c 1 -t raw - $2

