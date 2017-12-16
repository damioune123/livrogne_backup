#!/usr/bin/python2
from lcddriver_fut import lcd
import sys
def printLCD(string):
    lines = string
    if lines == "off" :
        my_lcd = lcd()
        my_lcd.backlight_off();
        quit()

    if lines == "on" :
        my_lcd = lcd()
        my_lcd.backlight_on();
        quit()

    my_lcd = lcd()
    my_lcd.clear()
    lines = lines.split('~')
    my_lcd = lcd()
    print("yo")
    for (i, line) in enumerate(lines):
        line = line.replace('_', ' ')
        if len(line) > 16 :
            line = lines[0:16]
        my_lcd.display_string(line, i+1)
printLCD(sys.argv[1])
