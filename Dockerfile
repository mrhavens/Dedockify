FROM alpine:3.11.3

RUN apk --no-cache update && apk add --no-cache python3 wget \
    && wget -q --no-check-certificate https://bootstrap.pypa.io/get-pip.py \
    && apk del wget && python3 get-pip.py && rm -f get-pip.py \
    && pip install -U docker-py pip && yes | pip uninstall pip

RUN mkdir /app
COPY entrypoint.sh /.
COPY dedockify.py /app/.

ENTRYPOINT ["/entrypoint.sh"]
