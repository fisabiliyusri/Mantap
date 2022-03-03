#!/bin/bash
# ==========================================


echo "0 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
echo "0 6 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
