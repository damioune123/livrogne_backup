/*
Arduino UNO reads rising edge trigger pulses on pin 2 and displays counter on 
Sparkfun SerLCD LCD-10097
Photo of setup: http://ompldr.org/vZGNlbA/photo.JPG
Pariksheet <p.nanda@andor.com> Mar 2012
*/




/* Pin assignments */
#define INTERRUPT_INPUT 2
int incomingByte = 0;   // for incoming serial data&

void interrupt_handler();
int pulse_counter = 0;


void setup()
{
  Serial.begin(9600);
 
  // For noise suppression, enable pullup on interrupt pin
  digitalWrite(INTERRUPT_INPUT, HIGH);
  attachInterrupt(INTERRUPT_INPUT - 2,
                 interrupt_handler,
                  RISING);
  pulse_counter=0;
}


void loop(){
  if (Serial.available() > 0) {
      // read the incoming byte:
      incomingByte = Serial.read();
      switch (incomingByte) {
        case 49://1
          Serial.println(pulse_counter);
          break;
        case 50://2
          pulse_counter=0;
          break;
        case 51: //3
          Serial.println("OK");
          break;
        default: 
          // if nothing else matches, do the default
          // default is optional
        break;
     }
     
  }
  if (pulse_counter > 0)
  {
    
    
  }
}



void interrupt_handler()
{
  pulse_counter = pulse_counter + 1;
}
