#!/bin/sh

docker build -t latex .
docker run --rm -i -v "$PWD":/data latex mkdir -p out/
docker run --rm -i -v "$PWD":/data latex pdflatex -output-directory=out resume.tex
docker run --rm -i -v "$PWD":/data latex pdftoppm -png out/resume.pdf > out/resume.png
