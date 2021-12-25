int scl = 8;
int cols, rows;
float zoff = 0;
float dz = 0.001;
ArrayList<Particle> particles;
PVector[][] field;

void setup() {
  size(600, 600, P2D);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 1500; i++) {
    PVector p = new PVector(random(width), random(height));
    PVector v = new PVector(0, 0);
    PVector a = new PVector(0, 0);
    particles.add(new Particle(p, v, a));
  }
  
  cols = floor(width / scl);
  rows = floor(height / scl);
  field = new PVector[cols][rows];
  background(255);
}

void mousePressed(){
  noLoop();
  println("Done");
}

void draw() {
  //field = noiseflowfield(zoff, cols, rows);
  field = complexToPowerflowfield(zoff, cols, rows);
  zoff += dz;
  
  for (Particle p : particles) {
    p.follow(field);
    p.update();
    p.edges();
    p.show();
  }
}

PVector[][] noiseflowfield(float zoff, int cols, int rows){
  float inc = 0.15;
  PVector[][] field = new PVector[cols][rows];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0; 
    for (int x = 0; x < cols; x++) {
      //int index = x + y*width;
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.1);
      field[x][y] = v;
      xoff += inc;
    }
    yoff += inc;
  }
  return field;
}

PVector[][] complexToPowerflowfield(float p, int cols, int rows){
  PVector[][] field = new PVector[cols][rows];
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      PVector v = raise(new PVector(x, y), p);
      v.setMag(0.01);
      field[x][y] = v;
    }
  }
  return field;
}

PVector raise(PVector input, float p) {
  //x^2 where x is a complex number
  float power = p;
  float rtopower = pow(input.x*input.x + input.y*input.y, power/2);
  float theta = input.heading();
  float x = rtopower * cos(power * theta);
  float y = rtopower * sin(power * theta);
  return new PVector(x, y);
}

PVector function(PVector input) {
  PVector op = raise(input, 3).add(raise(input, 4.2));
  return new PVector(op.x + 1, op.y);
}
