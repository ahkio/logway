## Setup

First install Apache + Passenger.

Clone repo:
```
git clone git@github.com:ahkio/logway.git /home/ahkio/logway
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
