// This is a smileyGenerator  made for Drawing with Code for The Ellis School 
// by Caroline Record 2015
// Make it your own! Modify it and have fun.
// press "s" to save a picture


void setup() {
  size (600, 600);
  smooth();
  mouseClicked();
}

void draw () {
} 


void mouseClicked() {
  // no outlines around the circles
  noStroke(); 
  background(252);

  // this is the color of the face
  fill(random(0, 255), random(0, 255), random(0, 255)); 
  // draw a face (circle) in the middle of the screen 
  // x position, y position, width, height
  // to learn more about circles check this out : 
  ellipse(300, 300, random(150, 300), random(150, 300));


  // time to draw some eyes!
  // let's choose the eye color.
  fill(0, 0, 1);

  int eyeHeight = int(random(15, 30)); 
  int eyeWidth = int(random(15, 30));
  // left eye
  ellipse(250, 250, eyeHeight, eyeWidth); 
  //right eye
  ellipse(350, 250, eyeHeight, eyeWidth); 

  // little triangle nose
  // https://www.processing.org/reference/triangle_.html
  fill(112, 99, 99);
  triangle(300, 290, 290, 300, 310, 300);


  noFill(); 
  strokeCap(ROUND);
  stroke(22);
  strokeWeight(5); 


  // circle mouth 
  //fill(255,255,255);
  int smileFactorRight = int(random(-30, 60)); 
  int smileFactorLeft = int(random(150, 240)); 
  arc(300, 340, 100, 100, radians(smileFactorRight), radians(smileFactorLeft));

  // I think we need some whiskers! 

  //let's randomly set the color of the whiskers
  stroke(random(0, 255), random(0, 255), random(0, 255));
  //let's randomly set the thickness of the whiskers
  strokeWeight(random(0, 10)); 


  //right whiskers
  line(378, 320, 444, 303);
  line(376, 341, 431, 341);
  line(367, 367, 432, 389); 

  // left whiskers
  line(221, 324, 178, 295);
  line(220, 348, 169, 350);
  line(230, 374, 188, 390);
}

void keyPressed() {
  if (key == 's' ) {
    println ("saving new drawing!");
    save("smiley_" +millis()+ ".jpg");
  }
}
