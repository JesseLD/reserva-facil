# Dockerfile
FROM golang:1.21 as builder

WORKDIR /app

# Copia os arquivos para o container
COPY ./go-app /app

# Compila o código
RUN go build -o app .

# Define uma imagem mínima para execução
FROM debian:bullseye-slim

WORKDIR /app

# Copia o binário da fase de build
COPY --from=builder /app/app .

# Define a porta e o comando de inicialização
EXPOSE 8080
CMD ["./app"]
