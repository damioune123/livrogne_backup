# livrogne_backup

This repository is a mixed between various IoT projects for a bar on a Rarspberry Pi model 3B (GPIO)
- The cocktail maker is a project of automated cocktail maker using pumps controlled by GPIO (python 3), the user interface is a web application made in PHP vanilla.
- The RFID_C project aims to read RFID cards (GPIO) and to connect to the bar WEB API ( https://github.com/damioune123/ivrogne_api_raspberry ).The RFID part is made in language C for performance. Python is used to communicate with the API and shows information on the current order on a lcd display.
- the insertion_produits is fully made in python and is aimed to add / update product in database through the WEB API (see above)
- the cam project aims to encode ip camera stream (rpst) and encode it in avi, after being triggered by sensors (switch GPIO).
- the cam remote project aims to do the same thing as cam project but the encoding is made on antoher raspberry (SSH bridge)

The RFID card reader in C language is based on the following : https://github.com/paguz/RPi-RFID
The RFID card reader in python is based on the following : https://github.com/mxgxw/MFRC522-python
