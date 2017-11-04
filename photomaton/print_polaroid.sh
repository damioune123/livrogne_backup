#!/bin/bash
name=$(ls /home/pi/Desktop/photos -1t | head -1)
old_path="/home/pi/Desktop/photos/"$name
new_path="/home/pi/compressed_pic/"$name
cp $old_path /home/pi/compressed_pic 
jpegoptim --size=250k $new_path

