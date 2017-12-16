import time
import RPi.GPIO as GPIO
port_GPIO_LIGHT_BUTTON=23

def lightButtonOn():
    print("lightbuttonOn")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.LOW)

def lightButtonOff():
    print("lightbuttonOff")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.HIGH)

def lightButtonBlink():
    for i in range (5):
        lightButtonOn()
        time.sleep(0.2)
        lightButtonOff()
        time.sleep(0.2)
print("yo")

lightButtonBlink()
