FROM python:3.10-alpine

COPY yamllint.json /yamllint.json
COPY entrypoint.sh /entrypoint.sh

RUN pip install yamllint==1.26.3 --no-cache-dir \
    && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["."]