#!/bin/bash

docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor ./src/resume.adoc -o index.html
cp index.html resume.html
docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf ./src/resume.adoc -o resume.pdf
