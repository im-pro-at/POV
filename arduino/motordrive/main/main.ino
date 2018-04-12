#include <AutoPID.h>

#define NUM1_EN 10
#define NUM2_EN 11

#define NUM_NON 0
#define NUM_A 2
#define NUM_B 3
#define NUM_C 4
#define NUM_D 5
#define NUM_E 6
#define NUM_F 7
#define NUM_G 8
#define NUM_DOT 9

#define BTN1 A1
#define BTN2 A2
#define BTN3 A3
#define BTN4 A4

#define TRIGGER A0

#define LED 12
#define MOTOR 9

byte segments[] ={NUM_A  ,NUM_B  ,NUM_C  ,NUM_D  ,NUM_E  ,NUM_F  ,NUM_G};
byte numbers[][7]= {  
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_D  ,NUM_E  ,NUM_F  ,NUM_NON}, // 0
                        {NUM_NON,NUM_B  ,NUM_C  ,NUM_NON,NUM_NON,NUM_NON,NUM_NON}, // 1
                        {NUM_A  ,NUM_B  ,NUM_NON,NUM_D  ,NUM_E  ,NUM_NON,NUM_G  }, // 2
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_D  ,NUM_NON,NUM_NON,NUM_G  }, // 3
                        {NUM_NON,NUM_B  ,NUM_C  ,NUM_NON,NUM_NON,NUM_F  ,NUM_G  }, // 4
                        {NUM_A  ,NUM_NON,NUM_C  ,NUM_D  ,NUM_NON,NUM_F  ,NUM_G  }, // 5
                        {NUM_A  ,NUM_NON,NUM_C  ,NUM_D  ,NUM_E  ,NUM_F  ,NUM_G  }, // 6
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_NON,NUM_NON,NUM_NON,NUM_NON}, // 7
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_D  ,NUM_E  ,NUM_F  ,NUM_G  }, // 8
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_NON,NUM_NON,NUM_F  ,NUM_G  }, // 9
                        {NUM_A  ,NUM_B  ,NUM_C  ,NUM_NON,NUM_E  ,NUM_F  ,NUM_G  }, // A
                        {NUM_NON,NUM_NON,NUM_C  ,NUM_D  ,NUM_E  ,NUM_F  ,NUM_G  }, // B
                        {NUM_NON,NUM_NON,NUM_NON,NUM_D  ,NUM_E  ,NUM_NON,NUM_G  }, // C
                        {NUM_NON,NUM_B  ,NUM_C  ,NUM_D  ,NUM_E  ,NUM_NON,NUM_G  }, // D
                        {NUM_A  ,NUM_NON,NUM_NON,NUM_D  ,NUM_E  ,NUM_F  ,NUM_G  }, // E
                        {NUM_A  ,NUM_NON,NUM_NON,NUM_NON,NUM_E  ,NUM_F  ,NUM_G  }, // F
                   }; 


byte temp;
byte num1, num2;
unsigned long num_last_number_update;
byte num_last=0;

void update_num(){
  if(millis()-num_last_number_update > 10 ){
    num_last_number_update = millis();
    byte akt_number= 0;
    if(num_last==0){
      num_last=1;
      akt_number=num2;
      digitalWrite(NUM1_EN, HIGH);
    }
    else{ 
      num_last=0;    
      akt_number=num1;
      digitalWrite(NUM2_EN, HIGH);
    }

    for (int i =0;i<7;i++){
      digitalWrite(segments[i], LOW);      
    }
    if(akt_number<=15){
      for (int i =0;i<7;i++){
        if(numbers[akt_number][i]!=0)
          digitalWrite(numbers[akt_number][i], HIGH);      
      }
    }
    if(num_last==0){
      digitalWrite(NUM1_EN, LOW);
    }
    else{
      digitalWrite(NUM2_EN, LOW);
    }
  }
}

byte BTNs[] {BTN1,BTN2,BTN3,BTN4};
unsigned long btn_last_aktivity=0;
int btn_last_pressed = -1;
void update_btn(){
  if(millis() - btn_last_aktivity > 20 ){
    if(btn_last_pressed == -1){
      //search for new button press
      for(int i=0;i<4;i++){
        if(digitalRead(BTNs[i])==LOW){
          btn_last_pressed=i;
          btn_last_aktivity = millis();
          btn_pressed(btn_last_pressed+1);
        }
      }
    }
    else{
      btn_last_aktivity = millis();
      if(digitalRead(BTNs[btn_last_pressed])!=LOW){
        btn_last_pressed=-1;
      }
    }
  }
}

void pciSetup(byte pin)
{
    *digitalPinToPCMSK(pin) |= bit (digitalPinToPCMSKbit(pin));  // enable pin
    PCIFR  |= bit (digitalPinToPCICRbit(pin)); // clear any outstanding interrupt
    PCICR  |= bit (digitalPinToPCICRbit(pin)); // enable interrupt for the group
}

volatile double pid_in, pid_out, pid_set;
AutoPID myPID(&pid_in, &pid_set, &pid_out, 0, 255, 10, 10, 0);


void setup() {
  Serial.begin(115200);

  // put your setup code here, to run once:
  pinMode(NUM1_EN, OUTPUT); 
  pinMode(NUM2_EN, OUTPUT); 
  pinMode(NUM_A, OUTPUT); 
  pinMode(NUM_B, OUTPUT); 
  pinMode(NUM_C, OUTPUT); 
  pinMode(NUM_D, OUTPUT); 
  pinMode(NUM_E, OUTPUT); 
  pinMode(NUM_F, OUTPUT); 
  pinMode(NUM_G, OUTPUT); 
  pinMode(NUM_DOT, OUTPUT); 

  pinMode(BTN1, INPUT_PULLUP);
  pinMode(BTN2, INPUT_PULLUP);
  pinMode(BTN3, INPUT_PULLUP);
  pinMode(BTN4, INPUT_PULLUP);

  pinMode(TRIGGER, INPUT_PULLUP);

  pinMode(MOTOR, OUTPUT);
  digitalWrite(MOTOR, LOW);
  pinMode(LED, OUTPUT);
  digitalWrite(LED, LOW);


  pciSetup(A0);

  myPID.setBangBang(10);
  myPID.setTimeStep(10);
}



volatile unsigned long trigger_last_mil=0;
volatile int trigger_val=-1;
ISR (PCINT1_vect) // handle pin change interrupt for A0 to A5 here
{
  if(digitalRead(A0)== LOW){
    if(trigger_last_mil!=0){
      if(millis()-trigger_last_mil >1000){
        trigger_val=-1;
      }
      else{
        trigger_val=millis()-trigger_last_mil;
      }
    }
    trigger_last_mil= millis();
  }
}  
void update_tigger(){
  //timeout:
  
  cli();               
  if(millis()-trigger_last_mil >1000){
    trigger_last_mil=0;
    trigger_val=-1;
  }
  sei();               
}


int set_rpm = 25;
byte motor_on_off=0;
byte led_on_off=0;
unsigned long motor_on_mil=0;
unsigned long set_last_mil=0;

void btn_pressed(int btn){
  if(btn==1){ //ON OFF MOTOR
    if(motor_on_off==1){
      motor_on_off=0;
    }
    else{
      motor_on_off=1;  
      motor_on_mil=millis();   
    }
  }
  if(btn==2){ //ON OFF LED
    if(led_on_off==1){
      led_on_off=0;
      digitalWrite(LED, LOW);      
    }
    else{
      led_on_off=1;
      digitalWrite(LED, HIGH);            
    }
    
  }
  if(btn==3){ //SET +
    set_rpm++;
    if(set_rpm>60) set_rpm=60;
    set_last_mil= millis();
  }
  if(btn==4){ //SET -
    set_rpm--;
    if(set_rpm<5) set_rpm=5;    
    set_last_mil= millis();
  }
}


int tigger_last=-2;
int akt_rps=100;
void loop() {
  update_num();
  update_btn();
  update_tigger();

  //update time:
  cli();                
  int temp=trigger_val;
  sei();               
  if(temp!=tigger_last){
    tigger_last=temp;
    if(tigger_last==-1){
      akt_rps=0;
      num1=0;   //show 0F
      num2=0;
    }
    else{
      //calc rps
      akt_rps = 1000/tigger_last;
      num1=akt_rps/10;
      if(num1==0) num1=16;
      num2=akt_rps%10;
    }
  }

  if(motor_on_off==0){
      num1=0;   //show 0F
      num2=15;
      tigger_last=-2; 
  }

  //show set for 1 secound
  if(millis()-set_last_mil < 1000){
      num1=set_rpm/10;
      if(num1==0) num1=16;
      num2=set_rpm%10;   
      tigger_last=-2; 
  }

  if(akt_rps==0 and millis()-motor_on_mil >3000){
    motor_on_off=0; // no rotation switch motor off
  }

  //calc pid
  pid_set=set_rpm;
  if(motor_on_off==0){ //simulate high spinning motor => PWM = 0
    pid_in=100;
  }
  else{
    pid_in=akt_rps;
  }
  myPID.run();
  
  static unsigned long timetemp=0;
  if(millis()-timetemp >100){
    timetemp=millis();
    Serial.print(pid_in);
    Serial.print(",");
    Serial.print(pid_set);
    Serial.print(",");
    Serial.println(pid_out);
  }
  analogWrite(MOTOR,pid_out);
    
}




