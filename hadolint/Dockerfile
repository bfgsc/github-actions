FROM alpine:3.15.0

ENV HADOLINT_VERSION=2.8.0
ENV HADOLINT_SHA256SUM=9dfc155139a1e1e9b3b28f3de9907736b9dfe7cead1c3a0ae7ff0158f3191674
ENV HADOLINT_DOWNLOAD=https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64

COPY hadolint-action.sh /usr/local/bin/hadolint-action

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN apk add --no-cache \
    bash \
    ca-certificates \
    coreutils \
    curl \
    jq &&\
    curl -o /usr/bin/hadolint -fsSL "${HADOLINT_DOWNLOAD}" &&\
    echo "${HADOLINT_SHA256SUM}  /usr/bin/hadolint" | sha256sum -c - &&\
    chmod +x /usr/bin/hadolint /usr/local/bin/hadolint-action


CMD ["hadolint-action"]