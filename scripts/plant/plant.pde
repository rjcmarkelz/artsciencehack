//artsciencehackathon 2015
//

Plant p1;

// make screen
void setup(){

    size(500, 500);
    fill(255, 204);
    noStroke();

    p1 = new Plant();

}

// draw screen
void draw(){

    background(0); // black
    p1.transmit();

}

// class leaf
class Leaf {
    float x, y, radius;

    Leaf(){
        radius = 40;
        x = width*.25;
        y = height*.15;
    }

    void display(){
        fill(0, 255, 0);
        // ellipse(x, y, radius*5, radius*2);
        ellipse(mouseX, mouseY, radius*5, radius*2);
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
        fill(255, 196, 12);
        // rect(xpos, ypos, w, h);
        rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
    }
}

// class root
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
        fill(204, 19, 34);
        // triangle(x1, y1, x2, y2, x3, y3);
        triangle(mouseX, mouseY, x2, y2, x3, y3);
        
    }
}

// composition class
class Plant{
    Leaf l2;
    Stem s2;
    Root r2;

    Plant(){
        l2 = new Leaf();
        s2 = new Stem();
        r2 = new Root();
    }

    void transmit(){
        l2.display();
        s2.display();
        r2.display();

    }
}

