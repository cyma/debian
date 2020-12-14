#!/bin/bash

if ! command -v pdflatex &> /dev/null
    then
        echo "pdflatex command could not be found"
        exit 0

    else
        pdflatex $1.tex
        bibtex $1.aux
        pdflatex $1.tex
        pdflatex $1.tex
        exit 0
fi
