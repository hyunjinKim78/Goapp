FROM golang:1.15-alpine3.12 AS gobuilder-stage

MAINTAINER jini

WORKDIR /user/src/goapp

COPY goapp.go .
