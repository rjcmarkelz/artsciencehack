// Matt Harlan

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

void setup(){
size (800,800);
background (255);

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


void draw(){
  
  background(255);
  //background
  noStroke();
  fill(0);
  rect(0,height/2,width,height/2);
  
  pushMatrix();
  translate(width/2, height/2);
  int lifespan =  round((height - mouseY)/2)*2;
  root(25, lifespan); 
  popMatrix();
  
  pushMatrix();
  len = mouseY/6 + 10;
  theta = map(mouseX,0,width,0,PI/6);
  c = 8;
  translate(width/2, height/2);
  l = mouseX/40 + 10;
  branch(len); 
  popMatrix();
  
  
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
      }else{
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




    