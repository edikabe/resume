#!/bin/bash

asciidoctor -b html5 resume.adoc -o index.html
asciidoctor-pdf  resume.adoc -o resume.pdf
