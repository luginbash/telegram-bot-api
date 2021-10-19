ARG GITHUB_WORKSPACE
FROM gcc:bullseye AS build

RUN apt update && apt -y install zlib1g-dev libssl-dev cmake gperf ccache

COPY . /src/telegram-bot-api
WORKDIR /src/telegram-bot-api

RUN mkdir build && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . --config Release --target install/strip
#    && strip -s /src/telegram-bot-api/build/telegram-bot-api

FROM busybox:glibc

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /src/telegram-bot-api/build/telegram-bot-api /usr/local/bin/telegram-bot-api

ENTRYPOINT ["/app/telegram-bot-api"]

