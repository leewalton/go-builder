FROM golang:alpine AS builder
RUN apk --no-cache add git

FROM builder AS appbuild
WORKDIR /go/src/github.com/leewalton/go-builder
RUN go get -d -v golang.org/x/net/html  
COPY app .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=1 /go/src/github.com/leewalton/go-builder/app .
CMD ["./app"]  
