import processing.sound.*;

//global variables. 
//
Amplitude amp;
AudioIn audioInput;
float volume; 

void setup() {
  size(640, 360);
  background(255);
  volume = 0; 
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 1);
  in.play();
  amp.input(in);
}      

void draw() {
  background(255); 
  println(amp.analyze());
  volume = amp.analyze();
  
  
  if(volume > .1){  
    ellipse(width/2, height/2, 20,20); 
    
  }
 
}


void exit(){
  in.stop(); 
}
