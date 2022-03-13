FROM golang:1.17-buster as builder
#Add as a builder

# Create and change to the app directory.
WORKDIR /app

COPY go.* ./
RUN go mod download

# Copy local code to the container image.
COPY . ./

# Build the binary.
RUN go build -v -o server

FROM ubuntu:bionic-20220301
COPY --from=builder /app/server /app/server

# Run the web service on container startup.
CMD ["/app/server"]
