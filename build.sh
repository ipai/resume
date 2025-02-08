#!/bin/sh

docker build -t sb2nov/latex .
docker run --rm -i -v "$PWD":/data latex pdflatex resume.tex
docker run --rm -i -v "$PWD":/data latex pdftoppm -png resume.pdf > resume.png
