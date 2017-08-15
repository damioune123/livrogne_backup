#!/bin/bash
start()
{
 sudo /home/pi/RFID_C/rfid & 
}

stop()
{
  killall rfid

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
	head -1 /var/run/rfid.pid;;
*)
	start;;
esac
