FROM public.ecr.aws/docker/library/alpine:3.17.3
LABEL maintainer="Glen Stummer <glen@glen.dev>"

ENV TERRAFORM_VERSION=1.4.5
ENV TERRAFORM_SHA256SUM=ce10e941cd11554b15a189cd00191c05abc20dff865599d361bdb863c5f406a9

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
