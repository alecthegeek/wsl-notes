#!/usr/bin/env bash

# Call the Windows vim as vim or gvim from Window Subsystem for Linux

# Alec Clews March 2019

# Install this file as vim and gvim

for i in "$@" ; do
        if [[ $i =~ .*/.* ]]  &&  wslpath -aw "$i" 2>&1 > /dev/null ; then
                VIMARGS=$VIMARGS\ "$(wslpath -aw "$i")"
        else
                VIMARGS=$VIMARGS\ "$i"
        fi
done

# echo $VIMARGS

# Assumes that default WSL mount point has been changed from "/mnt" to "/"
/c/Program\ Files\ \(x86\)/vim/vim80/$(basename $0).exe $VIMARGS
