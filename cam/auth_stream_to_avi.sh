#!/bin/bash
# ------------
name="`date +%Y-%m-%d_%H:%M:%S`"

BASEpath='/mnt/cam_hdd'
RECpath=$BASEpath'/'$1
if [ ! -d $RECpath ]; then
  mkdir $RECpath;
fi

# Save the streams using ffmpeg at 30 fps, stopping the capture after 300 seconds (15 minutes). Add more lines if you have more than 2 cameras
exec avconv -i rtsp://admin:Livrogn7@192.168.0.101/live1.264 -r 5  -vcodec copy -an -t 600 $RECpath/$name.mp4 </dev/null >/dev/null 2>/tmp/cam01.log  
