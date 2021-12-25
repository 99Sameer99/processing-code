ArrayList<Particle> particles;

void setup() {
  size(800, 800);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 2000; i++) {
    PVector p = new PVector(random(width), random(height));
    PVector v = new PVector(0, 0);
    PVector a = new PVector(0, 0);
    particles.add(new Particle(p, v, a));
  }
  background(255);
}

void draw() {
  int w = 2;
  int nx = width/w;
  int ny = height/w;
  PVector[][] field = new PVector[ny][nx];
  for (int x = -nx/2; x < nx/2; x += 1) {
    for (int y = -ny/2; y < ny/2; y += 1) {
      PVector ip = new PVector(x*w, y*w);
      PVector op = raise(ip, 3);
      float angle = op.heading();
      PVector v = PVector.fromAngle(angle);
      v.setMag(w/10.0);
      field[y + ny/2][x + nx/2] = v;
    }
  }

  for (Particle p : particles) {
    p.follow(field);
    p.update();
    p.edges();
    p.show();
  }
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
