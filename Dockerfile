# build stage
FROM ruby:alpine as builder

RUN gem install asciidoctor \
    && gem install asciidoctor-pdf --pre

RUN mkdir /tmp/static-html-directory
WORKDIR /tmp/static-html-directory

COPY ./src/resume.adoc .

RUN asciidoctor -b html5 resume.adoc -o index.html
RUN asciidoctor-pdf  resume.adoc -o resume.pdf


# run stage
FROM nginx:alpine

LABEL maintainer="Julien Glotain <jglotain@gmail.com>"

COPY --from=builder /tmp/static-html-directory /usr/share/nginx/html

