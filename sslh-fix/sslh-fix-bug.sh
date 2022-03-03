#!/bin/bash
# ==========================================


echo "0 5 * * * root clearlog && cd && ./sslh-fix-reboot.sh" >> /etc/crontab
