FROM golang:1.15

RUN apt update && apt install libpcap-dev jq --assume-yes && apt clean

WORKDIR /go/src/memsniff

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o /go/src/memsniff/memsniff

ENTRYPOINT [ "/go/src/memsniff/memsniff" ]