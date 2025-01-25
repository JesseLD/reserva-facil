# Etapa de build
FROM golang:1.23 AS builder

WORKDIR /app

# Cache de dependências
COPY go.mod go.sum ./
RUN go mod download

# Copia o código-fonte e compila
COPY . .
RUN go build -o app ./cmd/server

# Etapa de runtime com imagem compatível
FROM debian:bookworm-slim

WORKDIR /app

# Copia apenas o binário
COPY --from=builder /app/app .

# Certifica-se de que o binário seja executável
RUN chmod +x ./app

EXPOSE 8080
CMD ["./app"]
