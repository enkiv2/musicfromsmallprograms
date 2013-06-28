musicfromsmallprograms
======================

A helper script for writing music in the form of small c programs

Inspired by this blog post: http://countercomplex.blogspot.com/2011/10/algorithmic-symphonies-from-one-line-of.html

There are already several online implementations of this, mostly in javascript. However, none of them allow you to download the resulting file, and using the online version requires you to be online. Since it's already so easy to do this from the command line, I figured -- why not write a helper script, in good UNIX style, to provide the means to listen to and record these experiments?

Requirements:
* zsh
* sox (with soxplay)
* a c compiler with support for the -o flag

Usage: ./smallprogram.sh _-cc compiler_ _-rate bitrate_ _-duration seconds_ script _filename.wav_

If you provide an output filename, the script will produce a file with that filename, whether or not one already exists. If you do not provide an output filename, it will use sox to play the result.

Examples:
./smallprogram.sh 't&t>>8' # play the plain vanilla 'sierpinski harmony'
./smallprogram.sh -rate 8000 '((t\*(t>>8|t>>9)&46&t>>8))^(t&t>>13|t>>6)' # play xpansive's 'Lost in Space' from http://pouet.net/topic.php?which=8357&page=2

For a lot of interesting examples, try [viznut's collection of notable one-line music formulas](http://pelulamu.net/countercomplex/music_formula_collection.txt). To try to build your own more scientifically, take a look at [his blog post, analysing the attributes of these formulas](http://countercomplex.blogspot.com/2011/10/some-deep-analysis-of-one-line-music.html).

