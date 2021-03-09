#!/bin/bash

#Run this in the repo root after compiling
#First arg is path to where you want to deploy
#creates a work tree free of everything except what's necessary to run the game

#second arg is working directory if necessary
if [[ $# -eq 2 ]] ; then
  cd $2
fi

mkdir -p \
    $1/_maps \
    $1/icons/runtime \
    $1/sound/runtime \
    $1/strings

if [ -d ".git" ]; then
  mkdir -p $1/.git/logs
  cp -r .git/logs/* $1/.git/logs/
fi

cp tgstation.dmb tgstation.rsc $1/
cp -r _maps/* $1/_maps/
cp -r icons/runtime/* $1/icons/runtime/
cp -r sound/runtime/* $1/sound/runtime/
cp -r strings/* $1/strings/

#remove .dm files from _maps

#this regrettably doesn't work with windows find
#find $1/_maps -name "*.dm" -type f -delete

#dlls on windows
if [ "$(uname -o)" = "Msys"  ]; then
	cp ./*.dll $1/
fi
