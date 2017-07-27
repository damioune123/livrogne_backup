#!/bin/bash
start()
{
pgrep script.bash && echo "already running" || ( sudo /home/pi/RFID_C/rfid &)
}

stop()
{
  pkill rfid

}

restart()
{
	stop;
	sleep 1;
	start;
}
case $1 in
start)
	start;;
stop)
	stop;;
restart)
	restart;;
force-reload)
	restart;;
status)
	echo /var/run/mydaemon/rfid.pid;;
*)
	start;;
esac
