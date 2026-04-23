FROM docker.io/library/alpine:3.22

ENV OTP_VERSION="29.0-rc3" \
    REBAR3_VERSION="3.25.1"

LABEL org.opencontainers.image.version=$OTP_VERSION

COPY build.sh .
RUN set -xe \
    && chmod +x build.sh \
    && exec ./build.sh

CMD ["erl"]
