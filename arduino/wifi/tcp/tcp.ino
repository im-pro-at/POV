//CPU frequence 160MHz !!!!!!!!

#include <ESP8266WiFi.h>          //https://github.com/esp8266/Arduino
#include <DNSServer.h>            //Local DNS Server used for redirecting all requests to the configuration portal
#include <ESP8266WebServer.h>     //Local WebServer used to serve the configuration portal
#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager WiFi Configuration Magic

WiFiServer server(9999);

#define BUFFER_SIZE 1024
uint8_t buffer[BUFFER_SIZE];

void setup() {
  delay(1000);
  
  //  WiFiManager wifiManager;  
  //  wifiManager.autoConnect();

  WiFi.softAP("POV");

  server.begin();

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
  
}

// the loop function runs over and over again forever
void loop() {
  unsigned long t=0;
  digitalWrite(16, LOW); //data_open

  //if(WiFi.status() != WL_CONNECTED){
  //  ESP.reset();
  //}
  
  WiFiClient client = server.available();
  if (client)
  {
    t=millis();
    client.setNoDelay(1);
    int counter =0;
    volatile byte timout;
    digitalWrite(16, HIGH); //data_open
    while (client.connected())
    {
      if (client.available()){
        t=millis();
        int resived = client.read(buffer,BUFFER_SIZE);
        for (int i=0; i<resived; i++){
          GPOC = 0x0010; // CLK falling edge
          for(timout=0;timout<10;timout++); //Sleep 2µs
          GPOC = 0xF03F;
          if (counter==0) {
            GPOS = 0x0020; //SYNC                            
          }
          GPOS = buffer[i]&0x000F; //D0-3
          GPOS = ((buffer[i]<<8)&0xF000)| 0x0010; //D4-7 + CLK rising edge       
          for(timout=0;timout<10;timout++); //Sleep 2µs
          counter++;
          if(counter>=(131*131-19*19*4+1)*3/2){
            counter=0;     
          }
        }
      }
      if(t+1000<=millis()){
        break;
      }
    }    
    client.stop();  
  }
}
