# syntax=docker/dockerfile:1

FROM docker.io/library/python:3.12-alpine3.22
ARG VERSION

USER root

RUN \
    apk add --no-cache \
        catatonit \
    && \
    pip3 install \
        "https://github.com/woodleighschool/UpdateUserInfo/releases/download/v${VERSION}/UpdateUserInfo-${VERSION}-py3-none-any.whl" \
    && \
    rm -rf /tmp/*

COPY . /

USER nobody:nogroup

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
