/*
    Artnet DMX Control of many 12v SMD5050 RGB Strips with P9813 chip modules
    Arduino Mega 2560
    Hardware: Conceptinetics DMX Shield
    P9813 RGB LED Strip Driver Modules
*/
#define FASTLED_ALLOW_INTERRUPTS 0
#define FASTLED_INTERRUPT_RETRY_COUNT 0
#include "FastLED.h"
#include <SPI.h>         // needed for Arduino versions later than 0018
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>         // UDP library from: bjoern@cs.stanford.edu 12/30/2008
#define short_get_high_byte(x) ((HIGH_BYTE & x) >> 8)
#define short_get_low_byte(x)  (LOW_BYTE & x)
#define bytes_to_short(h,l) ( ((h << 8) & 0xff00) | (l & 0x00FF) );

// How many led strips are you driving
#define NUM_LEDS 300
#define MAX_BRIGHTNESS 50

// For led chips like Neopixels, which have a data line, ground, and power, you just
// need to define DATA_PIN.  For led chipsets that are SPI based (four wires - data, clock,
// ground, and power), like the LPD8806 define both DATA_PIN and CLOCK_PIN
#define DATA_PIN1 4
#define DATA_PIN2 0
#define CLOCK_PIN 13

//MAC and IP of the ethernet shield
//MAC adress of the ethershield is stamped down the shield
//to translate it from hexa decimal to decimal, use: http://www.frankdevelopper.com/outils/convertisseur.php
//HARDWARE


byte SubnetID = {0};
byte UniverseID = {0};
byte UniverseID2 = {1};

short select_universe= ((SubnetID*16)+UniverseID);
short select_universe2= ((SubnetID*16)+UniverseID2);
//customisation: edit this if you want for example read and copy only 4 or 6 channels from channel 12 or 48 or whatever.
const int number_of_channels=512; //512 for 512 channels
const int start_address=0; // 0 if you want to read from channel 1


// the next two variables are set when a packet is received
byte remoteIp[4];        // holds received packet's originating IP
unsigned int remotePort; // holds received packet's originating port


//buffers
const int MAX_BUFFER_UDP=1024;//definition to do to make work UDP lib
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //buffer to store incoming data
//byte buffer_dmx[number_of_channels+channel_position]; //buffer to store filetered DMX data

// art net parameters
unsigned int localPort = 6454;      // artnet UDP port is by default 6454
const int art_net_header_size=17;
const int max_packet_size=576;
char ArtNetHead[8]="Art-Net";
char OpHbyteReceive=0;
char OpLbyteReceive=0;
short is_artnet_version_1=0;
short is_artnet_version_2=0;
short seq_artnet=0;
short artnet_physical=0;
short incoming_universe=0;
boolean is_opcode_is_dmx=0;
boolean is_opcode_is_artpoll=0;
boolean match_artnet=1;
short Opcode=0;
WiFiUDP Udp;
//const char* ssid     = "telenet-A2E18F4";
//const char* password = "nRrbmfrznw5u";
const char* ssid     = "Douglass";
const char* password = "Livrogne";
//const char* ssid     = "AndroidAP";
//const char* password = "azertyui";

IPAddress local_ip(192, 168, 0, 201);
IPAddress gateway_ip(192, 168, 0, 1);
IPAddress subnet_ip(255, 255, 255, 0);
CRGB leds1[NUM_LEDS];
CRGB leds2[NUM_LEDS];

void setup() {
  // Uncomment/edit one of the following lines for your leds arrangement.
  // FastLED.addLeds<TM1803, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<TM1804, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<TM1809, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<WS2811, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<WS2812, DATA_PIN, RGB>(leds, NUM_LEDS);
  FastLED.addLeds<WS2812B, DATA_PIN1, RGB>(leds1, NUM_LEDS);
  FastLED.addLeds<WS2812B, DATA_PIN2, RGB>(leds2, NUM_LEDS);
  // FastLED.addLeds<NEOPIXEL, DATA_PIN>(leds, NUM_LEDS);
  // FastLED.addLeds<UCS1903, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<UCS1903B, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<GW6205, DATA_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<GW6205_400, DATA_PIN, RGB>(leds, NUM_LEDS);
  
  // FastLED.addLeds<WS2801, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<SM16716, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<LPD8806, RGB>(leds, NUM_LEDS);

  // FastLED.addLeds<WS2801, DATA_PIN, CLOCK_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<SM16716, DATA_PIN, CLOCK_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<LPD8806, DATA_PIN, CLOCK_PIN, RGB>(leds, NUM_LEDS);
  // FastLED.addLeds<P9813, DATA_PIN, CLOCK_PIN, RGB>(leds, NUM_STRIPS);
  

  Serial.begin(9600);
  WiFi.setSleepMode(WIFI_NONE_SLEEP);


  WiFi.begin(ssid, password);
  WiFi.config(local_ip, gateway_ip, subnet_ip);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Udp.begin(localPort); // Open ArtNet port

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  //FastLED.setBrightness(MAX_BRIGHTNESS);
}

void loop() {
  int packetSize = Udp.parsePacket();
  
  //FIXME: test/debug check
  //if(packetSize>art_net_header_size && packetSize<=max_packet_size)//check size to avoid unneeded checks
  if(packetSize) {
    /*
    Serial.print("Packet received! (size: ");
    Serial.print(packetSize);
    Serial.print(") \n");
    Serial.print(art_net_header_size);
    Serial.print("\n");
    Serial.print(max_packet_size);
    Serial.print("\n");
    */
    
    IPAddress remote = Udp.remoteIP();    
    remotePort = Udp.remotePort();
    Udp.read(packetBuffer,UDP_TX_PACKET_MAX_SIZE);
    
    //read header
    match_artnet=1;
    for (int i=0;i<7;i++) {
      //if not corresponding, this is not an artnet packet, so we stop reading
      if(char(packetBuffer[i])!=ArtNetHead[i]) {
        match_artnet=0;break;
      } 
    } 
       
     //if its an artnet header
    if(match_artnet==1) { 
        //artnet protocole revision, not really needed
        //is_artnet_version_1=packetBuffer[10]; 
        //is_artnet_version_2=packetBuffer[11];*/
      
        //sequence of data, to avoid lost packets on routeurs
        //seq_artnet=packetBuffer[12];*/
          
        //physical port of  dmx N°
        //artnet_physical=packetBuffer[13];*/
        
      //operator code enables to know wich type of message Art-Net it is
      Opcode=bytes_to_short(packetBuffer[9],packetBuffer[8]);
       
      //if opcode is DMX type
      if(Opcode==0x5000) {
        is_opcode_is_dmx=1;is_opcode_is_artpoll=0;
      }   
       
      //if opcode is artpoll 
      else if(Opcode==0x2000) {
         is_opcode_is_artpoll=1;is_opcode_is_dmx=0;
         //( we should normally reply to it, giving ip adress of the device)
      } 
       
      //if its DMX data we will read it now
      if(is_opcode_is_dmx=1) {
           incoming_universe= bytes_to_short(packetBuffer[15],packetBuffer[14])
         //if it is selected universe DMX will be read
        if(incoming_universe==select_universe) setLEDS(0);
        if(incoming_universe==select_universe2) setLEDS(170);
  
       
      }
    }//end of sniffing
            
    FastLED.show();
   
  }  
   
  
}

void setLEDS(int startled){
  int j=startled;
    for(int i=start_address;i< number_of_channels;i=i+3) {
      if (j<=NUM_LEDS){
        leds1[j].r = byte(packetBuffer[i+art_net_header_size+1]);
        leds1[j].g = byte(packetBuffer[i+art_net_header_size+2]);
        leds1[j].b = byte(packetBuffer[i+art_net_header_size+3]);
        leds2[j].r = byte(packetBuffer[i+art_net_header_size+1]);
        leds2[j].g = byte(packetBuffer[i+art_net_header_size+2]);
        leds2[j].b = byte(packetBuffer[i+art_net_header_size+3]);

      }
      j++;
   // buffer_channel_arduino[i-start_address]= byte(packetBuffer[i+art_net_header_size+1]);
  }
}


