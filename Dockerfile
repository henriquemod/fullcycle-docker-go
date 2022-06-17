FROM golang:1.18 as builder

WORKDIR /go/src

RUN go mod init fullcycle/henrique

COPY hello.go /go/src/

RUN go build

FROM scratch

COPY --from=builder /go/src/henrique .

CMD ["./henrique"]
