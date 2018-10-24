#!/bin/bash

if [ -z $MAIL_DISABLED ] || [ $MAIL_DISABLED != YES ]; then
  echo "root=${MAIL_USER}" > /etc/ssmtp/ssmtp.conf
  echo "mailhub=${MAIL_SERVER}" >> /etc/ssmtp/ssmtp.conf
  echo "AuthUser=${MAIL_USER}" >> /etc/ssmtp/ssmtp.conf
  echo "AuthPass=${MAIL_PASS}" >> /etc/ssmtp/ssmtp.conf
  echo "UseTLS=${MAIL_USE_TLS}" >> /etc/ssmtp/ssmtp.conf
  echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf

  echo "root:${MAIL_USER}:${MAIL_HUB}" >> /etc/ssmtp/revaliases
fi

echo "${SCHEDULE} /backup.sh" >> /etc/crontabs/root
crond -f
