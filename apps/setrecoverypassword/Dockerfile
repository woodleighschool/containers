# syntax=docker/dockerfile:1

FROM docker.io/library/python:3.12-slim@sha256:abc799c7ee22b0d66f46c367643088a35e048bbabd81212d73c2323aed38c64f
ARG VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV DB_PATH="/config/state.db"

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        catatonit \
        sqlite3 \
    && \
    pip install \
         "https://github.com/woodleighschool/SetRecoveryPassword/releases/download/v${VERSION}/setrecoverypassword-${VERSION}-py3-none-any.whl" \
    \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get autoremove -y \
    && apt-get clean

COPY . /

USER nobody:nogroup

VOLUME ["/config"]

ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
