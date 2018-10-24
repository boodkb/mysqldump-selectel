A small docker image to backup a Mysql database to Selectel cloud storage


### Environment

* SCHEDULE : cron job string (ex. * * */5 * *)

* MYSQL_HOST : Hostname of mysql database.
* MYSQL_USER : Username to connect to mysql database.
* MYSQL_PASSWORD : Password to connect to mysql database.
* MYSQL_DATABASE : Database name

* SELECTEL_USER: Username to connect to Selectel cloud storage.
* SELECTEL_PASSWORD: Password to connect to Selectel cloud storage.
* SELECTEL_DEST: Destination directory or container name in Selectel cloud storage.

* MAIL_DISABLED: Disable email notifications. If set to "YES", all other mail parameters are ignored.
* MAIL_SERVER: Mail server (ex. smtp.yandex.ru:465)
* MAIL_USER: Mail user (ex. "alert@yandex.ru")
* MAIL_PASS: Mail password
* MAIL_USE_TLS: (YES or NO) Whether to use TLS.
* MAIL_FROM: Notification sender name
* MAIL_RECIPIENT: Email for notifications
* MAIL_SUCCESS: (YES or NO) Whether to send "success" notifications.


### Usage example

In docker-compose.yml:

```
version: '2'
services:
  backup:
    image: boodkb/mysqldump-selectel
    volumes:
      - "/etc/localtime:/etc/localtime:ro"
    environment:
      SCHEDULE: "*/5 * * * *"

      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: db_password
      MYSQL_DATABASE: db_name

      SELECTEL_USER: selectel_user
      SELECTEL_PASSWORD: selectel_password
      SELECTEL_DEST: container_name

      MAIL_SERVER: smtp.yandex.ru:465
      MAIL_USER: "alert@yandex.ru"
      MAIL_PASS: mail_password
      MAIL_USE_TLS: "YES"
      MAIL_FROM: "sender name"
      MAIL_RECIPIENT: recipient@gmail.com
      MAIL_SUCCESS: "YES"
      # MAIL_DISABLED: "NO"
```

