#!/bin/sh

docker build -t latex .
docker run --rm -i -v "$PWD":/data latex pdflatex resume.tex
docker run --rm -i -v "$PWD":/data latex pdftoppm -png resume.pdf > resume.png
docker run --rm -i -v "$PWD":/data latex make4ht resume.tex
