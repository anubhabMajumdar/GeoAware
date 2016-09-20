
#include <Servo.h>

Servo servoLeft;          // create servo objects
Servo servoRight;
int rightSensor =A5;
int leftSensor = A4;
int frontSensor =A3;
float rightValue, leftValue,frontValue,volts;
int leftMinDist,rightMinDist,frontMinDist,pathIndex;  //minimum dist from the wall to start turning or stop
boolean gotPath;
String path;

void setup(){
  leftMinDist =40;
  rightMinDist=40;
  frontMinDist = 50;
  Serial.begin(9600);
  getPath();
  path += 'O';
  Serial.println(path);
}

void loop(){
 
  refreshReads();
  while((rightValue >rightMinDist) && (leftValue > leftMinDist) && (frontValue > frontMinDist)){  //keep going forward
    reverse();
    refreshReads();
    Serial.println("Forward");
  }
  while(frontValue <frontMinDist){
    stopBot();
    refreshReads();
    Serial.println("stop!");
  }
  while(leftValue <leftMinDist){
    turnLeft();
    refreshReads();
    Serial.println("Left");
  }
  while(rightValue <rightMinDist){
    turnRight();
    refreshReads();
    Serial.println("Right");
  }
  //while(frontValue <40 ) stopBot();
  
}

void refreshReads(){
  volts = analogRead(rightSensor)*0.003222;   // value from sensor * (5/1024) - if running 3.3.volts then change 5 to 3.3
  rightValue = 65*pow(volts, -1.10);
  
  volts = analogRead(leftSensor)*0.003222;   // value from sensor * (5/1024) - if running 3.3.volts then change 5 to 3.3
  leftValue = 65*pow(volts, -1.10);      //0.0048828125
  
  volts = analogRead(frontSensor)*0.003222;   // value from sensor * (5/1024) - if running 3.3.volts then change 5 to 3.3
  frontValue = 65*pow(volts, -1.10);
  
  Serial.print((int)leftValue);
  Serial.print("\t\t");
  
  Serial.print((int)frontValue);
  Serial.print("\t\t");
  
  Serial.print((int)rightValue);
  Serial.print("\n");
  delay(20);
  /*
  rightValue = ((analogRead(rightSensor) <20 0) ? 1 :0);
  leftValue = ((analogRead(leftSensor) < 200) ? 1 :0);
  frontValue = ((analogRead(frontSensor) < 200) ? 1 :0);
  */
}

void reverse() {
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(0);
  servoRight.write(180);
  delay(50);
  servoRight.detach();
  servoLeft.detach();
}

void forward() {
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(0);
  delay(50);
  servoRight.detach();
  servoLeft.detach();
}

void turnLeft() {
  servoLeft.attach(9);
  servoLeft.write(0);
  servoRight.write(0);
  delay(50);
  servoLeft.detach();
  servoRight.detach();
}

void turnRight() {
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(180);
  delay(50);
  servoRight.detach();
  servoLeft.detach();
}

void stopBot(){
  servoRight.detach();
  servoLeft.detach();
  delay(50);
  dafuckNext();
  
}
void goLeft(){
  servoLeft.attach(9);
  servoRight.attach(10);
  servoLeft.write(180);
  servoRight.write(180);
  delay(600);
  servoLeft.detach();
  servoRight.detach();
}
void goRight() {
  servoRight.attach(10);
  servoLeft.attach(9);
  servoRight.write(0);
  servoLeft.write(0);
  delay(700);
  servoRight.detach();
  servoLeft.detach();
}

void dafuckNext(){
  delay(1000);
  if(path[pathIndex] == 'L') goLeft();
  else if(path[pathIndex] == 'R') goRight();
  else if(path[pathIndex] == 'O') {
    stopBot();
    Serial.print(1);
  }
  pathIndex++;
}

void getPath(){
  while(!gotPath){
      if(Serial.available() > 0){
          path = Serial.readString();
          gotPath = true;
      }
  }
}
