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
// Plant plant;
Stem stem;

// Depth image
PImage depthImg;

// Which pixels do we care about?
int minDepth =  60;
int maxDepth = 500;

float xx = 0, yy = 0;

// What is the kinect's angle
float angle;

void setup() {
  size(1280, 480);

  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();
  tracker = new KinectTracker();
  // plant = new Plant();
  stem = new Stem(100, 100, 20, 20);

  // Blank image
  depthImg = new PImage(kinect.width, kinect.height);
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
  tracker.display();

  // Let's draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  // plant.transmit();
  xx = v2.x;
  yy = v2.y;

  // println(xx);
  // println(yy);
  stem.display(xx, yy);


  // Display some info
  // int t = tracker.getThreshold();
  // fill(0);
  // text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
  //   "UP increase threshold, DOWN decrease threshold", 10, 500);

}

// class stem
class Stem {
    float x, y, h, w, xd, yd;

    Stem(float xpos, float ypos, float hit, float wid){
        x = xpos;
        y = ypos;
        h = hit;
        w = wid; 
    }

    void display(float xdis, float ydis){
        xd = xdis;
        yd = ydis;

        fill(255, 196, 12);
        rect(x, y, xd, yd);
        // rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
    }
}
