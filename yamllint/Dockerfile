FROM public.ecr.aws/docker/library/python:3.11-alpine3.18

COPY yamllint.json /yamllint.json
COPY entrypoint.sh /entrypoint.sh

RUN pip install yamllint==1.30.0 --no-cache-dir \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["."]
