//
// move the "pencil" with your face
// angle your face left, right, up, & down
// press c to clear the screen
// press s to save a jpeg
//
// derived from the FaceOSCReceiver demo
// 
// OSC stands for Open Sound Control it is how we are talking to the face tracking app.
// we need to have the OSC processing library installed!
import oscP5.*;
OscP5 oscP5;

int found; // this will tell us whether we found a face.
PVector poseOrientation; //this will store the orientation of our face. 
float faceX;
float faceY; 
float faceSize;
float lastFaceX;
float lastFaceY; 
float mouthHeight;
float mouthWidth;

void setup() {
  // the size of our paper
  size(600, 400);
  // set the frame rate
  frameRate(30);
  // this is the port we are talking to osc on
  oscP5 = new OscP5(this, 8338);
  // these are the variables we want to know from the face tracker
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  
  // this initializes the variable that will understand the orientation
  poseOrientation = new PVector();
  //this sets the background to white.
  background(255);
  // this set the starting values to 0
  faceX = 0;
  faceY = 0; 
  faceSize =0; 
}

void draw() { 
  // this creates the fading effect. Change the second parameter to make it more or less "fadey"  
  fill(255,5);
  rect(0,0,width,height);
  // this if statement asks whether a face is detected.
  if (found > 0) {
    
    
    //set the x position of the circle
    faceX = map(poseOrientation.y, -.5, .5, 0, height);
    //set the y position of the circle
    faceY = map(poseOrientation.x, -.5, .5, 0, width);
    // this uses your distance from the screen to set the size of the circle
    faceSize = map(poseOrientation.z, .2, 0, 20, 30 );

    
    
    
    // this fills the circle with a orange coloe
    //fill(255,176,38); 
    // draw the circle
    //noStroke(); 
    //ellipse(faceX, faceY, faceSize, faceSize);
    
    
    // this draws with a continuous line. 
    
    
    //faceSize = map(faceSize,20, 30, 2, 10 );
    //faceSize = constrain(faceSize, 0, 13);
    //strokeWeight(faceSize);
    //stroke(255,176,38); 
    //line(lastFaceX, lastFaceY, faceX, faceY);
    
    
    // this draws with a crazy ball of fire. 
    stamp(faceX, faceY, faceSize, faceSize);
    
   
    lastFaceX = faceX;
    lastFaceY = faceY;
  }
}






// this is fired whenever a key is pressed. 

void keyPressed() {
  if (key == 's') {
    // save a picture with a unique file name.
    int m = millis();
    save("faceDoodle" + m +".jpg");
 }
 else if (key == 'c'){
   // clear the screen by drawing a white rectangle.
   noStroke();
   fill(255);
  rect(0,0,width,height);
 }
}

// this function tells us whether we found a face.
public void found(int i) {
  found = i;
}

// this funtion tells us the oreintation of the face.
public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}




 
void stamp(float x, float y, float wd, float ht)
{
  wd *=4;
  ht *=4; 
  float transp =90;
  for (float i=3; i<random(5,50); i=i+random(1,10)) {
    //arc
    stroke(255, transp);
    //stroke(random(200,255),70);
    noFill();
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);
 
    //arc
    noStroke();
    //    fill(random(0,100), random(10, transp));
    fill(random(231, 255), random(3, 252), random(100), random(transp));
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), 0, PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI/2, PI);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), PI, TWO_PI-PI/2);
    arc(x, y, random(wd/2-(wd/2-2), wd/2), random(ht/2-(ht/2-2), ht/2), TWO_PI-PI/2, TWO_PI);
  }
}


public void mouthWidthReceived(float w) {
  //println("mouth Width: " + w);
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  //println("mouth height: " + h);
  mouthHeight = h;
}
