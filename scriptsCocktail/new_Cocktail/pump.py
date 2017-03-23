import RPi.GPIO as GPIO
from threading import Thread
import time


class Pump(Thread):
	name = ""
	gpionumber = 0
	basesleeptime = 0
	duration = 0
	
	def __init__(self, name, gpionumber, basesleeptime, duration):
		Thread.__init__(self)
		self.name = name
		self.gpionumber = gpionumber
		self.basesleeptime = basesleeptime
		self.duration = duration
		
	def run(self):
		#lcd = LCD()
		try:
			GPIO.setmode(GPIO.BCM)
			GPIO.setup(self.gpionumber, GPIO.OUT) 
			GPIO.output(self.gpionumber, GPIO.HIGH)
			# Start the pump 
			print(self.name + ' starting for ' + str(self.duration*self.basesleeptime) + 'seconds')
			GPIO.output(self.gpionumber, GPIO.LOW)
			time.sleep(self.duration * self.basesleeptime)
			GPIO.output(self.gpionumber, GPIO.HIGH)
			print(self.name + 'finished')
		except KeyboardInterrupt:
			print('Execution aborted')
			GPIO.output(self.gpionumber, GPIO.HIGH)
		#lcd.lcd_string("     Sante !    ", 0x80)
		#lcd.lcd_string(" -- Sheitan -- ", 0xC0)
		print('exiting Thread ' + self.name)
		return
