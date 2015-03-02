import processing.sound.*;
import geomerative.*;

  float translateX; 
  float translateY ; 

  
  float apexX; 
  float apexY ; 
  
  int fontSize;

Amplitude amp;
AudioIn audioInput;
float volume; 


void setup() 
{
  
  
  size(1280, 500);
  //size(14400, 5625);
  background(255);
  smooth();
  //colorMode(HSB, 255);
  //fill(0);
  //noStroke();
  
  translateX = width * .132; 
  translateY = height * .6; 
  apexX = -translateX; 
  apexY = -translateY;   
  fontSize =int( width * .086);

  RG.init(this);
  drawText(); 
 
  
  volume = 0; 
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  audioInput = new AudioIn(this, 1);
  audioInput.play();
  amp.input(audioInput);
}

void draw(){
  volume = amp.analyze();
  if( volume > .01){
  noStroke();
  fill(255); 
  rect(0,0,width, height);
  drawText(); 
  }

}

void keyPressed() {
 if (key == 's' ) {
   println ("saving new drawing!");
   save("DrawingWithCodeTitle_" +millis()+ ".jpg");
 }
}

void drawText(){
 // initialize the geomerative library
  
  
  
  translate(translateX, translateY);
  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // before we generate anything, we need to tell the library how long we want between the points of the font
  RCommand.setSegmentLength(5);

  // We can also tell it how to space them out
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  //RCommand.setSegmentator(RCommand.ADAPTATIVE); 

  // get a group from a word. Because we want the reduced points, we need to call toPolygonGroup,
  // because otherwise we would get the actual vertices
  RGroup group = font.toGroup("Drawing with Code").toPolygonGroup();
 stroke(random(0,255),random(0,255),random(0,255),200);
  // now loop through the polygons in the group
  for(int k = 0; k < group.elements.length; k++)
  {
    // now get each character as a polygon
    RPolygon polygon = (RPolygon) group.elements[k];
    apexX = int(random (-translateX, width -translateX)); 
    apexY = int(random (-translateY, height -translateY)); 
    // because a character has multiple contours (the whole in the 'a' is one, the outline another),
    // let's loop through all the contours first
    for(int i = 0; i < polygon.contours.length; i++)
    {
      // for each contour, let's loop through all the points
      RContour curContour = polygon.contours[i];
      for(int j = 0; j < curContour.points.length; j++)
      {
        
        // now for each RPoint (which is a vector), make an ellipse
        RPoint curPoint = curContour.points[j];
        
        strokeWeight(.01); 
        //stroke(253,250,39,200);
        
        //stroke(127,205,255,20);
        line(curPoint.x, curPoint.y, apexX, apexY);
      }
    }
  }
  
  
    // now loop through the polygons in the group
  for(int k = 0; k < group.elements.length; k++)
  {
    // now get each character as a polygon
    RPolygon polygon = (RPolygon) group.elements[k];
   
    // because a character has multiple contours (the whole in the 'a' is one, the outline another),
    // let's loop through all the contours first
    for(int i = 0; i < polygon.contours.length; i++)
    {
      // for each contour, let's loop through all the points
      RContour curContour = polygon.contours[i];
      for(int j = 0; j < curContour.points.length; j++)
      {
        
        // now for each RPoint (which is a vector), make an ellipse
        RPoint curPoint = curContour.points[j];
        //fill(200,random(100,200),150 );  
        //stroke(100,random(100,200),150 ); 
        fill(255); 
        stroke(random(20,200)); 
        strokeWeight(1); 
        ellipse(curPoint.x,curPoint.y, width * .0078, width * .0078);
println(curPoint.x);
println(); 
      }
    }
  }
}
