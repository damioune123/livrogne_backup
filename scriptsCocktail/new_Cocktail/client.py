import sys
from threading import Thread
from pump import Pump
import time
import RPi.GPIO as GPIO



class Client(Thread):

	buf = ""
	pins = [18, 17, 22, 23, 24, 25,27]
	basesleeptime = [0.4, 0.4, 0.4, 0.4, 0.4, 0.4,0.4]

	def __init__(self, buf):
		Thread.__init__(self)
		self.buf = buf

		
	def run(self):
		#lcd = LCD()
		print('Starting client thread')	
		print(self.buf)
		
		
		#lcd.lcd_string("Service en cours", 0x80)		
		#lcd.lcd_string(" -- Sheitan -- ", 0xC0)
		pumpname = self.buf.split('-')[0]
		value = int(self.buf.split('-')[1])
			
		if(pumpname == "pump1"):
			pump = Pump("Pump1", self.pins[0], self.basesleeptime[0], value)
			pump.start()
		elif(pumpname == "pump2"):
			pump = Pump("Pump2", self.pins[1], self.basesleeptime[1], value)
			pump.start()
		elif(pumpname == "pump3"):
			pump = Pump("Pump3", self.pins[2], self.basesleeptime[2], value)
			pump.start()
		elif(pumpname == "pump4"):
			pump = Pump("Pump4", self.pins[3], self.basesleeptime[3], value)
			pump.start()
		elif(pumpname == "pump5"):
			pump = Pump("Pump5", self.pins[4], self.basesleeptime[4], value)
			pump.start()
		elif(pumpname == "pump6"):
			pump = Pump("Pump6", self.pins[5], self.basesleeptime[5], value)
			pump.start()
		elif(pumpname == "pump7"):
			pump = Pump("Pump7", self.pins[6], self.basesleeptime[6], value)
			pump.start()
		else:
			print('unable to fin the pump')
		pump.join()
				
		print ('exiting Thread client')
		return
