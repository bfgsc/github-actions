FROM public.ecr.aws/docker/library/alpine:3.16.1
LABEL maintainer="Glen Stummer <glen@glen.dev>"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN addgroup -S shark -g 1000 && adduser -S shark -u 1000 -G shark &&\
    apk add --no-cache --virtual .build-deps \
    zip \
    curl &&\
    curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip &&\
    unzip tflint.zip &&\
    rm tflint.zip &&\
    mv tflint /usr/local/bin/ &&\
    chown shark:shark /usr/local/bin/tflint &&\
    apk del --purge .build-deps

USER shark
ENTRYPOINT ["/usr/local/bin/tflint"]
CMD ["."]
