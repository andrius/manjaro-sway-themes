FROM alpine:3.15

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

ENV LANG=C.UTF-8
ENV LC_ALL C.UTF-8

ENV WORKDIR /themes
WORKDIR ${WORKDIR}

RUN set -e \
&&  apk --update --no-cache add \
      ca-certificates \
      python3 \
      ruby \
      bash \
      git \
      wget \
&& git clone --depth 1 \
    https://github.com/mbadolato/iTerm2-Color-Schemes.git \
    /tmp/iTerm2-Color-Schemes \
&& cd /tmp/iTerm2-Color-Schemes/tools \
&& chmod +x . \
&& cp -R . /usr/local/bin/

COPY *?rb /code/
COPY convert.sh /
CMD ["/convert.sh"]
# vim: set ft=dockerfile ts=2 sts=2 sw=2 et fileencoding=utf-8 ff=unix:
