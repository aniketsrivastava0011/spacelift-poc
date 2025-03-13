# Stage 1: Build Stage (using a build environment)
FROM golang:1.21-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN go build -o my-app .

# Stage 2: Runtime Stage (using a minimal runtime environment)
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy the built binary from the build stage
COPY --from=builder /app/my-app ./

# Copy other needed files. Example: static assets
COPY static/ ./static/

# Expose the port your application listens on
EXPOSE 8080

# Run the application
CMD ["./my-app"]
