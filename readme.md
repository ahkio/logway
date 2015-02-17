## Setup

First install Apache + Passenger.

Clone repo:
```
git clone git@github.com:ahkio/logway.git /home/ahkio/logway
```

Fix permissions:
```bash
chmod 0771 /home/ahkio /home/ahkio/logway /home/ahkio/logway/logs
chown ahkio:logstash /home/ahkio/logway/log
```

Add Apache config:
```apache
# /etc/httpd/conf.d/logway.conf

<VirtualHost *:443>
  SSLEngine on

  ServerName logway.example.com
  DocumentRoot /home/ahkio/logway/public
  CustomLog /var/log/httpd/logway_access_log combined
  ErrorLog /var/log/httpd/logway_error_log

  <Directory /home/ahkio/logway/public>
    AuthName Logway
    AuthType Basic
    AuthUserFile /home/ahkio/htpasswd_users
    Require user logdrainuser
    Order allow,deny
    Satisfy any
    Options -MultiViews
  </Directory>
</VirtualHost>
```

Add logrotate config:
```bash
# /etc/logrotate.d/logway

/home/ahkio/logway/log/logway.log {
  daily
  dateext
  rotate 30
  copytruncate
  compress
  missingok
}
```
