// pseudo code

// intialize objects
// Leaf l1;
// StemInit s1;
// RootInit r1;

// make screen
void setup(){
    size(500, 500);
    fill(255, 204);
    noStroke();
}

// draw screen
void draw(){
    background(0); // black
    
    fill(100);
    ellipse(252, 144, 72, 72);

    fill(102);
    rect(81, 81, 63, 63);

    fill(204);
    triangle(18, 18, 18, 360, 81, 360);
    // l1.display();
}

////mouseX is one input
////mouseY is another input
////click is another input


// class leaf
class Leaf {
    fill(204);
    triangle(18, 18, 18, 360, 81, 360);
}


////shape is elipse
// class stem
////shape is rectangle
// class root
////shape is triangle
