#!/bin/bash

/usr/sbin/sshd -D
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
