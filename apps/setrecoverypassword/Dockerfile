# syntax=docker/dockerfile:1

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
FROM docker.io/library/python:3.12-slim@sha256:9c1d9ed7593f2552a4ea47362ec0d2ddf5923458a53d0c8e30edf8b398c94a31
ARG VERSION

LABEL internal.flatops.image.target_platform=$TARGETPLATFORM
LABEL internal.flatops.image.target_architecture=$TARGETARCH
LABEL internal.flatops.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/woodleighschool/SetRecoveryPassword"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        catatonit \
    && \
    pip install --no-cache-dir "https://github.com/woodleighschool/SetRecoveryPassword/releases/download/v${VERSION}/setrecoverypassword-${VERSION}-py3-none-any.whl" \
    && \
    mkdir -p /packages \
    && \
    chown -R nobody:nogroup /packages \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get autoremove -y \
    && apt-get clean

COPY . /

USER nobody:nogroup

VOLUME ["/config"]

ENV DB_PATH="/config/state.db"

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
