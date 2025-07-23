FROM alpine:latest

RUN apk add --no-cache git curl bash build-base libressl-dev pcre-dev sqlite-dev \
    ca-certificates nim
    
RUN git clone https://github.com/zedeus/nitter.git /app && \
    cd /app && \
    nimble build -d:release --accept
    
WORKDIR /app
COPY nitter.conf /app/nitter.conf

EXPOSE 8080

CMD ["./nitter"]
