FROM golang:1.21 as builder

WORKDIR /usr/src/app
COPY ./src ./
RUN go build /usr/src/app/hello.go

FROM scratch
COPY --from=builder /usr/src/app/hello .

ENTRYPOINT ["./hello"]