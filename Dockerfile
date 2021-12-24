ARG GITHUB_WORKSPACE
FROM debian:11-slim 

COPY ./telegram-bot-api.bin /usr/bin/telegram-bot-api

RUN ldd  /usr/bin/telegram-bot-api

ENTRYPOINT ["/usr/bin/telegram-bot-api"]

