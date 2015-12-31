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