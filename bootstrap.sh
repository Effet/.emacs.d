#!/bin/bash

if [[ ! -e ~/.cask ]]
then
    echo "Cloning Cask repo"
    git clone git@github.com:cask/cask.git ~/.cask
fi

export PATH=$HOME/.cask/bin:$PATH

cd ~/.emacs.d/
cask install
