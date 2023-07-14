FROM golang:1.15-alpine3.12 AS gobuilder-stage

MAINTAINER jini

WORKDIR /user/src/goapp

COPY goapp.go .

RUN CGO_EMABLED=0 GOOS=linux GOARCH=amd64 go build -o /usr/local/bin/gostart

FROM scratch AS runtime-stage

COPY --from=gobuilder-stage /usr/local/bin/gostart /usr/local/bin/gostart

CMD ["/usr/local/bin/gostart"]
