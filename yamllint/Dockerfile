FROM python:3.11.3-alpine3.17

COPY yamllint.json /yamllint.json
COPY entrypoint.sh /entrypoint.sh

RUN pip install yamllint==1.30.0 --no-cache-dir \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["."]
