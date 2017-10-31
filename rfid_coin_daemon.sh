#!/bin/bash
start()
{
 sudo /home/pi/coin_acceptor/rfidCoin & 
}

stop()
{
  killall rfidCoin

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
