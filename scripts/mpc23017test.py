import time
import smbus

i2c = 1
chip1 = 0x20

bus = smbus.SMBus(i2c)

bus.write_byte_data(chip1, 0x00, 0x00)
bus.write_byte_data(chip1, 0x01, 0x00)

try:
    while True:
# Chip 1 GPIO A
        bus.write_byte_data(chip1, 0x12, 0x01)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x02)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x04)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x08)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x10)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x20)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x40)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0x80)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x12, 0xFF)
        time.sleep(1)

# Chip 1 GPIO B
        bus.write_byte_data(chip1, 0x13, 0x01)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x02)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x04)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x08)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x10)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x20)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x40)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0x80)
        time.sleep(1)
        bus.write_byte_data(chip1, 0x13, 0xFF)
        time.sleep(1)

except KeyboardInterrupt:
    bus.write_byte_data(chip1, 0x12, 0x00)
    bus.write_byte_data(chip1, 0x13, 0x00) 

    print 'End of Program'
