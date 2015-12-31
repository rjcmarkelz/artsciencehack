// based on code by Daniel Shiffman and Elie Zananiri
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/
// http://www.silentlycrashing.net
// hackers honor

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

///////////////////////////////////
///////// TreeRoot Code ///////////
///////////////////////////////////
float len;
float theta;
float [] thetaN = new float [200];
float [] lenN = new float [200];
int b;
int c;
int x;
int y;
int ranWalkno = 80;
int ranWalklen = 2000;
int [][] path = new int [ranWalkno][ranWalklen];
int l;

///////////////////////////////////
///////// TreeRoot Code ///////////
///////////////////////////////////

// Plant plant;
// Leaf leaf;
// Stem stem;
// Root root;

// Depth image
PImage depthImg;

// Which pixels do we care about?
int minDepth =  60;
int maxDepth = 500;

float xx = 0, yy = 0;

// What is the kinect's angle
float angle;

void setup() {
  size (800,800);
  background (255);

  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();
  tracker = new KinectTracker();
  // plant = new Plant();

  // leaf = new Leaf();
  // stem = new Stem(100, 100, 20, 20);
  // root = new Root();

  // Blank image
  depthImg = new PImage(kinect.width, kinect.height);

///////////////////////////////////
///////// TreeRoot Code ///////////
///////////////////////////////////
// size (800,800);
// background (255);

for (int i = 0; i < thetaN.length; i +=1 ){
  thetaN[i] = random(-PI/6, PI/6);
} //<>//
for (int i = 0; i < lenN.length; i +=1 ){
  lenN[i] = random(-10, 10);
}

for (int i = 0; i < ranWalkno; i ++){

    x = 0;
    y = 0;
    
   float r2 = random(-.15,.15);
    for (int j = 0; j < ranWalklen; j += 2){
        float r = random(1);
        if (r < 0.35 + r2) {    
          x++;
        } else if (r < 0.7) {
          x--;
        } else if (r < .95) {
          y++;
        } else {
          y--;
        }
        path [i][j] = x;
        path [i][j+1] = y; 
        
        
    }
  }
}

void draw() {
  // Draw the raw image
  image(kinect.getDepthImage(), 0, 0);

  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      depthImg.pixels[i] = color(255);
    } else {
      depthImg.pixels[i] = color(0);
    }
  }

  // Draw the thresholded image
  depthImg.updatePixels();
  image(depthImg, kinect.width, 0);

  fill(0);
  text("TILT: " + angle, 10, 20);
  text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);


  // Run the tracking analysis
  tracker.track();
  // Show the image
  // tracker.display();

  // Let's draw the raw location
  // PVector v1 = tracker.getPos();
  // fill(50, 100, 250, 200);
  // noStroke();
  // ellipse(v1.x, v1.y, 20, 20);

  // // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  // fill(100, 250, 50, 200);
  // noStroke();
  // ellipse(v2.x, v2.y, 20, 20);

  // plant.transmit();
  xx = int(v2.x);
  yy = int(v2.y);

  background(255);
  //background
  noStroke();
  fill(0);
  rect(0, height/2, width, height/2);
  
  pushMatrix();
  translate(width/2, height/2);
  int lifespan =  round((height - yy)/2)*2;
  root(25, lifespan); 
  popMatrix();
  
  pushMatrix();
  len = yy/6 + 10;
  theta = map(xx, 0, width, 0, PI/6);
  c = 8;
  translate(width/2, height/2);
  l = int(xx/40 + 10);
  branch(len); 
  popMatrix();

  // println(xx);
  // println(yy);
  // stem.display(xx, yy);


  // Display some info
  // int t = tracker.getThreshold();
  // fill(0);
  // text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
  //   "UP increase threshold, DOWN decrease threshold", 10, 500);

}

void branch(float len){
  
  strokeWeight(len/6);
  stroke(c*20-100);
  line (0,0,0,-len + lenN[c]);
  translate(0,-len + lenN[c]);
  len *= 0.8; 
  
  c += 2;
  
  if (len > 10){
      
    pushMatrix();
    rotate(theta + -thetaN[c]);
    branch(len);
    popMatrix();
      
    c -= 2;
      
    pushMatrix();
    rotate(-theta + thetaN[c+1]);
    branch(len);
    popMatrix();
    
  } else {
      fill(120);
      noStroke();
      ellipse(0,0,l/2,l);
  }
      
  c -= 1;

}

void root(int b, int lifespan){
  
     constrain(b, 10, 70);
    
    for (int i = 0; i < lifespan; i += 2){
    
      stroke(255);
      strokeWeight(lifespan/90);
      point(path[b][i],path[b][i+1]);
    
    }
    
   
    
    translate (path[b][lifespan],path[b][lifespan-1]);
    lifespan = round(lifespan/4+20)*2;
    b += 3;
    if (lifespan > 150) {
      
      pushMatrix();
      root(b-1, lifespan);
      popMatrix();
      pushMatrix();
      root(b+2, lifespan);
      popMatrix();
    
    }
    
  }

