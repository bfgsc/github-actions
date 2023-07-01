FROM public.ecr.aws/docker/library/alpine:3.18.2

ENV HADOLINT_VERSION=2.12.0
ENV HADOLINT_SHA256SUM=2a5b7afcab91645c39a7cebefcd835b865f7488e69be24567f433dfc3d41cd27
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