FROM golang:1.16.4-buster AS builder

ARG VERSION=dev

WORKDIR /go/src/app
COPY hello.go .
RUN go build -o hello -ldflags=-X=hello.version=${VERSION} hello.go 

FROM debian:stable-20220228-slim
COPY --from=builder /go/src/app/hello /go/bin/hello
ENV PATH="/go/bin:${PATH}"
CMD ["hello"]
