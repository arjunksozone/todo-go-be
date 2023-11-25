FROM golang:1.19-buster as builder
WORKDIR /helloworld
COPY . ./
RUN go mod download
RUN go build -v -o helloworld

FROM debian:buster-slim
RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /helloworld/helloworld ./helloworld

CMD ["./helloworld"]