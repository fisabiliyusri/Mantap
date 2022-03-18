#!/bin/bash
# ==========================================


echo "10 4 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
echo "10 5 * * * root clearlog && sslh-fix-reboot" >> /etc/crontab
