# syntax=docker/dockerfile:1

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
FROM docker.io/library/python:3.12-slim@sha256:abc799c7ee22b0d66f46c367643088a35e048bbabd81212d73c2323aed38c64f
ARG VERSION

LABEL internal.flatops.image.target_platform=$TARGETPLATFORM
LABEL internal.flatops.image.target_architecture=$TARGETARCH
LABEL internal.flatops.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/woodleighschool/ADOverseas"

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        catatonit \
        sqlite3 \
    && \
    pip install --no-cache-dir "https://github.com/woodleighschool/ADOverseas/releases/download/v${VERSION}/adoverseas-${VERSION}-py3-none-any.whl" \
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

ENV DB_PATH="/config/schedules.db"

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
