FROM public.ecr.aws/docker/library/alpine:3.18.2
LABEL maintainer="CloudOps <cloudops@icariohealth.com>"

ENV KUSTOMIZE_VERSION=5.0.1

COPY entrypoint.sh /entrypoint.sh
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018,DL4006,DL3047
RUN addgroup -S cops -g 1000 && adduser -S cops -u 1000 -G cops &&\
    apk add --no-cache --virtual .build-deps \
    bash \
    tar \
    curl &&\
    wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz &&\
    tar -xvzf kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz &&\
    mv kustomize /usr/local/bin/kustomize &&\
    chown cops:cops /usr/local/bin/kustomize &&\
    apk del --purge .build-deps

USER cops
ENTRYPOINT ["/entrypoint.sh"]