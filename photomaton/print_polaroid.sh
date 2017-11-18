#!/bin/bash
name=$(ls /home/pi/Desktop/photos -1t | head -1)
old_path="/home/pi/Desktop/photos/"$name
new_path="/home/pi/compressed_pic/"$name.jpg
cp $old_path /home/pi/compressed_pic/$name.jpg 
jpegoptim --size=50k $new_path
mv $new_path /home/pi/photomaton/test.jpg
obexftp --nopath --noconn --uuid none --bluetooth 00:04:48:0F:B9:88 --channel 1 -p /home/pi/photomaton/test.jpg
