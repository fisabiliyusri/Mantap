#!/bin/bash
# ==========================================


echo "0 4 * * * root clearlog && cd && ./sslh-fix-reboot.sh" >> /etc/crontab
