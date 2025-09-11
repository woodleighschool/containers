# syntax=docker/dockerfile:1

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
FROM docker.io/library/python:3.12-slim@sha256:31551bd80310d95ed82a4a14dba8c908c85098f07457e8a5b6a946385cfd86c8
ARG VERSION

LABEL internal.flatops.image.target_platform=$TARGETPLATFORM
LABEL internal.flatops.image.target_architecture=$TARGETARCH
LABEL internal.flatops.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/woodleighschool/UpdateUserInfo"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        catatonit \
    && \
    pip install --no-cache-dir "https://github.com/woodleighschool/UpdateUserInfo/releases/download/v${VERSION}/UpdateUserInfo-${VERSION}-py3-none-any.whl" \
    && \
    mkdir -p /packages \
    && \
    chown -R nobody:nogroup /packages \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get autoremove -y \
    && apt-get clean

COPY . /

USER nobody:nogroup

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
