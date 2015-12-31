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