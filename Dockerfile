FROM python:3.9.7-alpine3.14

WORKDIR /saltbot

COPY requirements.txt saltbot/* /saltbot/

RUN apk add tzdata gcc musl-dev zlib-dev && \
    python3 -m pip install -r /saltbot/requirements.txt && \
    cp /usr/share/zoneinfo/US/Eastern /etc/localtime && \
    echo "US/Eastern" > /etc/timezone && \
    mkdir -p /.config/saltbot/reminders && \
    mkdir -p /.config/saltbot/polls && \
    touch /saltbot/log.txt && \
    chown -R 69:420 /.config && \
    chown -R 69:420 /saltbot/log.txt

USER 69:420

ENTRYPOINT python3 /saltbot
