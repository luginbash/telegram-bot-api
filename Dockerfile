ARG GITHUB_WORKSPACE
FROM debian:bookworm-slim

COPY --chmod=0755 ./bin/telegram-bot-api /usr/bin/telegram-bot-api
RUN apt update && apt install openssl -y && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["/usr/bin/telegram-bot-api"]

