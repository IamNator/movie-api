FROM golang:latest as builder

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go build -o api cmd/api/main.go

COPY --from=builder /app/api /app/api

COPY --from=builder /app/docs /app/docs

CMD ["/app/api"]