#!/bin/bash

now=$(date +"%s_%Y-%m-%d")
filename=${now}_${MYSQL_DATABASE}.sql.gz

set -o pipefail

mysqldump --opt -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} | gzip > ${filename} && \
supload -u ${SELECTEL_USER} -k ${SELECTEL_PASSWORD} ${SELECTEL_DEST} ${filename}

res=$?

if [ -z $MAIL_DISABLED ] || [ $MAIL_DISABLED != YES ]; then
  if [ $res -ne 0 ]; then
    /send_mail.sh "Backup failure" "Backup failed" "$MAIL_FROM" "$MAIL_RECIPIENT"
  else
    if [ $MAIL_SUCCESS == YES ]; then
      /send_mail.sh "Backup" "Backup completed successfully" "$MAIL_FROM" "$MAIL_RECIPIENT"
    fi
  fi
fi
rm -f ${filename}
