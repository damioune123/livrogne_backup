# livrogne_backup

This repository is a mixed between various IoT projects for a bar on a Rarspberry Pi model 3B (GPIO)
- The cocktail maker is a project of automated cocktail maker using pumps controlled by GPIO (python 3), the user interface is a web application made in PHP vanilla.
- The RFID_C project aims to read RFID cards (GPIO) and to connect to the bar WEB API (https://github.com/damioune123/ivrogne_api_raspberry).The RFID part is made in language C for performance. Python is used to communicate with the API and shows information on the current order on a lcd display.
- the insertion_produits is fully made in python and is aimed to add / update product in database through the WEB API (see above)
