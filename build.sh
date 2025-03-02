#!/bin/sh

docker buildx install
mkdir -p out
docker run --rm -v "$(pwd):/data" resume-builder sh -c "\
    pdflatex -output-directory=out resume.tex && \
    pdftoppm -png out/resume.pdf > out/resume.png && \
    convert out/resume.png -quality 100 out/resume.webp && \
    sleep 1 && \
    rm out/resume.aux out/resume.log out/resume.out
"

