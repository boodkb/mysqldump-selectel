FROM alpine:latest
MAINTAINER bood "me@bood.su"

RUN apk --no-cache add mysql-client curl bash file ssmtp && \
    wget https://raw.github.com/selectel/supload/master/supload.sh -O /usr/local/bin/supload && \
    chmod +x /usr/local/bin/supload

COPY ./entrypoint.sh /entrypoint.sh
COPY ./backup.sh /backup.sh
COPY ./send_mail.sh /send_mail.sh

RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]
