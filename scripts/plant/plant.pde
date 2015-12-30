// intialize objects
Leaf l1;
Stem s1;
Root r1;
// RootInit r1;

// make screen
void setup(){
    size(500, 500);
    fill(255, 204);
    noStroke();

    l1 = new Leaf();
    s1 = new Stem();
    r1 = new Root();
}

// draw screen
void draw(){
    background(0); // black

    l1.display();
    s1.display();
    r1.display();
}

////mouseX is one input
////mouseY is another input
////click is another input


// class leaf
class Leaf {
    float x, y, radius;

    Leaf(){
        radius = 40;
        x = width*.25;
        y = height*.15;
    }

    void display(){
        fill(102);
        ellipse(x, y, radius*5, radius*2);
    }
}

// class stem
class Stem {
    float xpos, ypos, h, w;

    Stem(){
        xpos = width*.4;
        ypos = height*.15;
        h = 300;
        w = 100; 
    }

    void display(){
        fill(150);
        rect(xpos, ypos, w, h);
    }
}

// class stem
class Root {
    float x1, y1, x2, y2, x3, y3;

    Root(){
        x1 = width*.4;
        y1 = height*.75;

        x2 = 300;
        y2 = 350;
        x3 = 250;
        y3 = 450;
    }

    void display(){
        fill(255);
        triangle(x1, y1, x2, y2, x3, y3);
    }
}
////shape is elipse
// class stem
////shape is rectangle
// class root
////shape is triangle
