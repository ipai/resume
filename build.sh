#!/bin/sh

docker build -t resume-builder .
mkdir -p out
docker run --rm -v "$(pwd):/data" resume-builder sh -c "\
    pdflatex -output-directory=out resume.tex && \
    pdftoppm -png out/resume.pdf > out/resume.png && \
    convert out/resume.png -resize 700x906 out/resume.resized.webp && \
    convert out/resume.png -resize 700x906 out/resume.resized.png
"