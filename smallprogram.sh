#!/usr/bin/env zsh

rate=4000
time=60

cc=gcc

while [[ $# -gt 1 ]] ; do
	{ echo "$1" | grep -q '^-' } || break
	{ echo "$1" | grep -q '^-h' } && {
		echo -e "Usage: $0 -h[elp] | [ -cc compiler ] [ -rate bitrate ] [ -time duration ] script [ filename ]\n\nduration should be in seconds. If filename is not specified, the audio will be played rather than recorded"
		exit 0
	}
	{ echo "$1" | grep -q '^-cc' } && { cc=$2 ; shift 2 }
	{ echo "$1" | grep -q '^-rate' } && { rate=$2 ; shift 2 }
	{ echo "$1" | grep -q '^-time' } && { time=$2 ; shift 2 }
done

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

