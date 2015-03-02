// This is a smiley  made for Drawing with Code for The Ellis School 
// by Caroline Record 2015
// Make it your own! Modify it and have fun.



void setup(){
  size (600, 600);
  smooth(); 
  

}

void draw (){
  // no outlines around the circles
  noStroke(); 
  background(252);
  
  // 
  fill(255,222,0); 
  // draw a face (circle) in the middle of the screen 
  // x position, y position, width, height
  // to learn more about circles check this out : 
  ellipse(300,300, 184,253);
  
  
  // time to draw some eyes!
  // let's choose the eye color.
  fill(0,0,1);
  // left eye
  ellipse(250,250, 19,20); 
  //right eye
  ellipse(350,250, 20,20); 
  
  // little triangle nose
  // https://www.processing.org/reference/triangle_.html
  fill(112,99,99);
  triangle(300, 290, 290, 300, 310, 300);
  
  
  noFill(); 
  strokeCap(ROUND);
  stroke(22);
  strokeWeight(5); 
  
  
  // circle mouth 
  //fill(255,255,255);
  arc(300, 340, 100, 100, radians(0), radians(180));
  
  // I think we need some whiskers! 
  
  //right whiskers
  line(378,320,444,303);
  line(376,341,431,341);
  line(367,367,432,389); 

  // left whiskers
  line(221,324,178,295);
  line(220,348,169,350);
  line(230,374,188,390);
} 


void mouseClicked() {
  
    println (mouseX +"," + mouseY);
}

void keyPressed() {
 if (key == 's' ) {
   println ("saving new drawing!");
   save("smiley_" +millis()+ ".jpg");
 }
}
