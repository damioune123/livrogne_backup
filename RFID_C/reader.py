from keyboard_alike import reader

reader = reader.Reader(0x05fe, 0x1010, 84, 16, should_reset=False)
reader.initialize()
print(reader.read().strip())
reader.disconnect()
