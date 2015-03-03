
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioInput  accessMic;
FFT         fft;
float volume; 
float mappedVolume; 


void setup () {
  size(512, 200, P3D);
  minim = new Minim(this);
  accessMic = minim.getLineIn();
  // set the starting values to 0. 
  volume =0;
  mappedVolume = 0; 
  
}

void draw() {
  // get the volume of the left mic!
  volume = accessMic.left.level();
  mappedVolume = map (volume, 0, 1, 0, width); 
  background(255);
  println(mappedVolume);
  fill(0);
}
