#!/bin/bash
# ==========================================


echo "0 5 * * * root clearlog && cd && ./sl-fix-reboot" >> /etc/crontab
