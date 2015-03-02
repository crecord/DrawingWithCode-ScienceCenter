import processing.sound.*;

//global variables. 
//
Amplitude amp;
AudioIn audioInput;
float volume; 
float mappedVolume; 

void setup() {
  size(640, 360);
  background(255);
  volume = 0; 
  mappedVolume =0; 
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  audioInput = new AudioIn(this, 1);
  audioInput.play();
  amp.input(audioInput);
}      

void draw() {
  background(255); 
  println(amp.analyze());
  volume = amp.analyze();
  mappedVolume = map (volume, 0,1,0,width); 
  
  if(volume > .1){  
    ellipse(width/2, height/2, 20,20); 
    
  }
 
}


void exit(){
  audioInput.stop(); 
}
