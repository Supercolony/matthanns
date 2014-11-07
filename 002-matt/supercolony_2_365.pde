import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim; 
AudioPlayer player;
AudioInput in;
FFT fft;

int radius = 100;
int value = 0;

void setup(){
  size(1000,1000,OPENGL);
  background(255);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw(){
  background(255);
  
  //audio calling & limits
  fft.forward(in.mix);
  fft.window(FFT.HAMMING);
  float threshold = 100;
  float leftLevel = in.left.level();
  float rightLevel = in.right.level();

  if (leftLevel > threshold) {              
    leftLevel = threshold;
  }
  if (rightLevel > threshold) {
    rightLevel = threshold;
  }
  
  translate(width/2,height/2,300);
  scale(2);
  rotateY(frameCount*0.003);
  rotateX(frameCount*0.004);
  
  float s=0;
  float t=0;
  float lastx=0;
  float lasty=0;
  float lastz=0;
  for(int i = 0; i < fft.specSize(); i++){
  while(t<540){
    s+=50*fft.getBand(i);
    t+=1;
    float radianS=radians(s);
    float radianT=radians(t);
    
    float thisx = 0 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    
    if (lastx !=0) {
        //fill(0,50);
        stroke(0,50);
      line(thisx,thisy,thisz,lastx*i,lasty*i,lastz*i);
      ellipse(thisx, thisy, thisz, 50);
    }
    lastx=thisx;
    lasty=thisy;
    lastz=thisz;
  }
}
}
void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_2_365-###.png"); 
  }
}
