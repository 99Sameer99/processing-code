class Star {
  float x;
  float y; 
  float z;
  float pz;
  
  Star(){
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width);
    pz = z;
  }
  
  void update() {
    z = z - speed;
    if(z <= 0){
      z = width;
      x = random(-width/2, width);
      y = random(-height/2, height);
    }
  }
  
  void show() {
    fill(255);
    noStroke();
    float sx = map(x/z, 0, 1, 0, width);
    float sy = map(y/z, 0, 1, 0, height);
    float px = map(x/pz, 0, 1, 0, width);
    float py = map(y/pz, 0, 1, 0, height);
    float size = map(z, 0, width, 16, 0);
    ellipse(sx, sy, size, size);
    stroke(255);
    line(px, py, sx, sy);
    pz = z;
  }
}
