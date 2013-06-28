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

