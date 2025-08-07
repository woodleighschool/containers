# syntax=docker/dockerfile:1

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
FROM docker.io/library/python:3.12-alpine@sha256:9b8808206f4a956130546a32cbdd8633bc973b19db2923b7298e6f90cc26db08
ARG VERSION

LABEL internal.flatops.image.target_platform=$TARGETPLATFORM
LABEL internal.flatops.image.target_architecture=$TARGETARCH
LABEL internal.flatops.image.target_os=$TARGETOS
LABEL org.opencontainers.image.source="https://github.com/woodleighschool/JCDSSync"

USER root

# Install runtime dependencies
RUN \
    apk add --no-cache \
        catatonit \
    && \
    pip install --no-cache-dir "https://github.com/woodleighschool/JCDSSync/releases/download/v${VERSION}/jcdssync-${VERSION}-py3-none-any.whl" \
    && \
    mkdir -p /packages \
    && \
    chown -R nobody:nogroup /packages

COPY . /

USER nobody:nogroup

VOLUME ["/packages"]

ENV PACKAGES_DIR="/packages"

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
