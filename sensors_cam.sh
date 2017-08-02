#!/bin/bash
start()
{
pgrep script.bash && echo "already running" || ( sudo /home/pi/cam_remote/caisseAndFrigoCamTrigger.py & )
}

stop()
{
   kill `head -1 /var/lock/cam_pid.lock`

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
	head -1 /home/pi/cam_remote/cam_pid.lock;;
*)
	start;;
esac
