//CPU frequence 160MHz


#include <ESP8266WiFi.h>          //https://github.com/esp8266/Arduino
#include <WiFiUdp.h>          //https://github.com/esp8266/Arduino

#define IMAGE_SIZE 131
uint8_t frame[IMAGE_SIZE*IMAGE_SIZE];
uint8_t packed[512];
WiFiUDP Udp;


void setup() {
  delay(1000);
  

  WiFi.softAP("POV","",8);

  pinMode(0, OUTPUT); //D0
  pinMode(1, OUTPUT); //D1
  pinMode(2, OUTPUT); //D2
  pinMode(3, OUTPUT); //D3
  pinMode(12, OUTPUT); //D4
  pinMode(13, OUTPUT); //D5
  pinMode(14, OUTPUT); //D6
  pinMode(15, OUTPUT); //D7

  pinMode(4, OUTPUT); //CLK  IS GPIO 5 
  pinMode(5, OUTPUT); //SYNC IS GPIO 4
  pinMode(16, OUTPUT); //data_open
  
  Udp.begin(9999);

}


// the loop function runs over and over again forever
unsigned long last_packed=0; 
int out_pos=0;

void loop() {
  unsigned long t=0;

  int packetSize = Udp.parsePacket();
  if(packetSize){
    int len = Udp.read(packed, 512);
    int pos = packed[0]*256 +packed[1];
    if((pos+len-2)<=IMAGE_SIZE*IMAGE_SIZE){
      for(int i=0; i<len-2;i++)
        frame[pos+i]=packed[i+2];
    }
    last_packed=millis();
  }

  if(millis()-last_packed > 1000){
    digitalWrite(16, LOW); 
  }
  else{
   digitalWrite(16, HIGH); 
  }
  
  volatile byte timout;
  for (int i=0; i<512; i++){
    GPOC = 0x0010; // CLK falling edge
    for(timout=0;timout<10;timout++); //Sleep 2µs
    GPOC = 0xF03F;
    if (out_pos==0) {
      GPOS = 0x0020; //SYNC                            
    }
    GPOS = frame[out_pos]&0x000F; //D0-3
    GPOS = ((frame[out_pos]<<8)&0xF000)| 0x0010; //D4-7 + CLK rising edge       
    for(timout=0;timout<10;timout++); //Sleep 2µs
    out_pos++;
    if(out_pos>=IMAGE_SIZE*IMAGE_SIZE){
      out_pos=0;     
    }
  }
}
