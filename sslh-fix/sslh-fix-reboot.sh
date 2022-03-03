#!/bin/bash
# ==========================================

systemctl stop ws-tls 
&& 
systemctl start sslh 
&& 
/etc/init.d/sslh start 
&& 
/etc/init.d/sslh restart 
&& 
systemctl daemon-reload 
&& 
systemctl start ws-tls
