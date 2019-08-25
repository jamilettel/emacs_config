#!/bin/bash

if ls ~/.emacs ~/.emacs.d &>/dev/null
then
    echo "Please remove (and maybe backup) ~/.emacs and ~/.emacs.d/"
else
    cp .emacs .emacs.d ~/ -r && echo "Done"
fi

