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