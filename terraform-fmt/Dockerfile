FROM public.ecr.aws/docker/library/alpine:3.18.2
LABEL maintainer="Glen Stummer <glen@glen.dev>"

ENV TERRAFORM_VERSION=1.5.2
ENV TERRAFORM_SHA256SUM=781ffe0c8888d35b3f5bd0481e951cebe9964b9cfcb27e352f22687975401bcd

COPY entrypoint.sh /entrypoint.sh

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN addgroup -S shark -g 1000 && adduser -S shark -u 1000 -G shark &&\ 
    apk add --no-cache --virtual .build-deps \
    zip \
    curl &&\
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /bin/terraform && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    chmod +x /entrypoint.sh && \
    apk del --purge .build-deps

USER shark
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["."]
