# Todo list.

```
located           # configs (current behavior)
located -archive  # .tar, .gz, .zip, .bz2, .xz, .7z
located -logs     # /var/log/* and other log locations
located -service  # systemd service files
located -cron     # crontabs, /etc/cron.*
located -cert     # SSL/TLS certificates (.pem, .crt, .key)
located -backup   # .bak, .old, backup dirs
```

Each mode could have its own priority list and search paths. Like: *located -logs* could prioritize:

```
/var/log/syslog
/var/log/apache2/error.log
/var/log/auth.log
/var/log/mysql/error.log
```