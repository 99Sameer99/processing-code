void setup(){
  size(800, 600, P3D);
  background(0);
  colorMode(HSB);
}

float x = 0.01;
float y = 0;
float z = 0;
float a = 10;
float b = 28;
float c = 8/3;
ArrayList<PVector> points = new ArrayList<PVector>();

void draw(){
  float dt = 0.01;
  float dx = dt * (a * (y - x));
  float dy = dt * (x * (b - z) - y);
  float dz = dt * (x * y - c * z);
  points.add(new PVector(x, y, z));
  translate(width/2, height/2);
  scale(5);
  stroke(255);
  noFill();
  beginShape();
  float hue = 0;
  for(PVector v: points){
    stroke(hue, 255, 255);
    point(v.x, v.y, v.z);
    hue += 0.1;
    if(hue > 255){ hue = 0; }
  }
  endShape();
  
  x += dx;
  y += dy;
  z += dz;
}
