FROM alpine:3.20 AS package
RUN apk add --no-cache unzip
COPY game.zip /tmp/game.zip
RUN unzip -q /tmp/game.zip -d /game

FROM barichello/godot-ci:4.4.1
COPY --from=package /game /game

CMD ["godot", "--headless", "--path", "/game", "--server"]
