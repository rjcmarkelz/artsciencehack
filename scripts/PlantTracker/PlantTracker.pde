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

// Depth image
PImage depthImg;

// Which pixels do we care about?
int minDepth =  60;
int maxDepth = 860;

// What is the kinect's angle
float angle;

void setup() {
  size(1280, 480);

  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();
  tracker = new KinectTracker();

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
}