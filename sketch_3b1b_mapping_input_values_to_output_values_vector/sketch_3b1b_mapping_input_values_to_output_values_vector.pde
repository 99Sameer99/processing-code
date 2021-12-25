float w;
float vlen;
float k = 0;

void setup() {
  size(1000, 900);
  colorMode(HSB, 360, 255, 255);
  w = 25;
  vlen = w;
  //noLoop();
}

void draw() {
  background(0);
  for (int i = 1; i < width/w; i += 1) {
    stroke(255);
    strokeWeight(1);
    if (i == int (width/(w*2))) {
      strokeWeight(4);
    }
    line(i*w, 0, i*w, height);
  }
  for (int i = 1; i < height/w; i += 1) {
    stroke(255);
    strokeWeight(1);
    if (i == int (height/(2*w))) {
      strokeWeight(4);
    }
    line(0, i*w, width, i*w);
  }

  translate(width/2, height/2);
  float nx = width/w;
  float ny = height/w;
  for (float x = -nx/2; x < nx/2; x += 1) {
    for (float y = -ny/2; y < ny/2; y += 1) {
      PVector ip = new PVector(x*w, y*w);
      PVector op = function(ip);
      //PVector op = sinof(ip);
      float angle = op.heading();
      arrow v = new arrow(ip, angle, vlen);
      v.display();
    }
  }
  if ( k > TWO_PI ) { 
    k = 0;
  }
  k += 0.01;
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
