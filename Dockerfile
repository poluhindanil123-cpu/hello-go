# Этап 1: сборка
FROM golang:1.23-alpine AS builder
WORKDIR /build

# Копируем go.mod и go.sum (если есть)
COPY go.* ./

# Скачиваем зависимости (кэшируется при неизменном go.mod)
RUN go mod download

# Копируем исходники
COPY . .

# Собираем статический бинарник
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o hello-go .

# Этап 2: запуск
FROM alpine:3.20

# Непривилегированный пользователь
RUN adduser -D appuser
USER appuser
WORKDIR /home/appuser

COPY --from=builder /build/hello-go ./hello-go

ENTRYPOINT ["./hello-go"]
