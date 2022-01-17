#!/bin/bash

### BEGIN INIT INFO
# Provides:          ShadowsocksR
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop:     $network $local_fs $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Lightweight SOCKS5 proxy tool
# Description:       Start or stop the ShadowsocksR mudbjson server
### END INIT INFO

NAME="ShadowsocksR"
NAME_BIN="server.py"
FOLDER="/usr/local/shadowsocksr"
BIN="/usr/local/shadowsocksr/server.py"
Info_font_prefix="\033[32m" && Error_font_prefix="\033[31m" && Info_background_prefix="\033[42;37m" && Error_background_prefix="\033[41;37m" && Font_suffix="\033[0m"
RETVAL=0

check_running(){
	PID=`ps -ef |grep "${NAME_BIN}" |grep -v "grep" |grep -v "init.d" |grep -v "service" |awk '{print $2}'`
	if [[ ! -z ${PID} ]]; then
		return 0
	else
		return 1
	fi
}
do_start(){
	check_running
	if [[ $? -eq 0 ]]; then
	echo -e "${Info_font_prefix}[Informasi]${Font_suffix} $NAME (PID ${PID}) Running..." && exit 0
	else
		cd ${FOLDER}
		#python_ver=$(ls /usr/bin|grep -e "^python[23]\.[1-9]\+$"|tail -1)
		python_ver="python"
		ulimit -n 512000
		nohup "${python_ver}" "$BIN" a >> ssserver.log 2>&1 &
		sleep 2s
		check_running
		if [[ $? -eq 0 ]]; then
			echo -e "${Info_font_prefix}[Info]${Font_suffix} $NAME Start Successfully !"
		else
			echo -e "${Error_font_prefix}[Info]${Font_suffix} $NAME Failed to Activate !"
		fi
	fi
}
do_stop(){
	check_running
	if [[ $? -eq 0 ]]; then
		kill -9 ${PID}
		RETVAL=$?
		if [[ $RETVAL -eq 0 ]]; then
			echo -e "${Info_font_prefix}[Info]${Font_suffix} $NAME Stopped Successfully !"
		else
			echo -e "${Error_font_prefix}[Info]${Font_suffix}$NAME Failed to Stop !"
		fi
	else
		echo -e "${Info_font_prefix}[Info]${Font_suffix} $NAME Not Running !"
		RETVAL=1
	fi
}
do_status(){
	check_running
	if [[ $? -eq 0 ]]; then
		echo -e "${Info_font_prefix}[Info]${Font_suffix} $NAME (PID ${PID}) Running.."
	else
		echo -e "${Info_font_prefix}[Info]${Font_suffix} $NAME Not Running !"
		RETVAL=1
	fi
}
do_restart(){
	do_stop
	do_start
}
case "$1" in
	start|stop|restart|status)
	do_$1
	;;
	*)
	echo "使用方法: $0 { start | stop | restart | status }"
	RETVAL=1
	;;
esac
exit $RETVAL
