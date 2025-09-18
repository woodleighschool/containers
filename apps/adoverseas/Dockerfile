# syntax=docker/dockerfile:1

FROM docker.io/library/python:3.12-alpine3.22
ARG VERSION

ENV DB_PATH="/config/schedules.db"

USER root

RUN \
    apk add --no-cache \
        catatonit \
        sqlite \
    && \
    pip3 install \
        "https://github.com/woodleighschool/ADOverseas/releases/download/v${VERSION}/adoverseas-${VERSION}-py3-none-any.whl" \
    && \
    rm -rf /tmp/*

COPY . /

USER nobody:nogroup

VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
