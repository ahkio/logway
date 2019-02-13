## Setup

First install Apache + Passenger.

Clone repo:
```
git clone git@github.com:jonikanerva/logway.git /home/your_site/logway
```

Fix permissions:
```bash
chmod 0771 /home/your_site /home/your_site/logway /home/your_site/logway/logs
chown your_site:logstash /home/your_site/logway/log
```

Add Apache config:
```apache
# /etc/httpd/conf.d/logway.conf

<VirtualHost *:443>
  SSLEngine on

  ServerName logway.your_site.com
  DocumentRoot /home/your_site/logway/public
  CustomLog /var/log/httpd/logway_access_log combined
  ErrorLog /var/log/httpd/logway_error_log

  <Directory /home/your_site/logway/public>
    AuthName Logway
    AuthType Basic
    AuthUserFile /home/your_site/htpasswd_users
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

/home/your_site/logway/log/logway-*.log {
  daily
  dateext
  rotate 30
  copytruncate
  compress
  missingok
}
```

## Run locally

```
rackup -p 4567
```
