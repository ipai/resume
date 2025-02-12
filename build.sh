#!/bin/sh

docker build -t resume-builder .
mkdir -p out
docker run --rm -v "$(pwd):/data" resume-builder sh -c "\
    pdflatex -output-directory=out resume.tex && \
    pdftoppm -png out/resume.pdf > out/resume.png && \
    cwebp -resize 700 906 -q 100 out/resume.png -o out/resume.resized.webp \
"