float g;
float l = 13;
float w = 5;
float x;
float s = 0.6;

void setup() {
  size(600, 600);
  g = width / (w + 3);
  noStroke();
  rectMode(CENTER);
  noLoop();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int j = 0; j < g; j++) {
    for (int i = 0; i < g; i++) {
      x = round(noise(i*s, j*s));
      rect(l*(i - (g-1)/2), l*(j - (g-1)/2), x > 0 ? w : l, x > 0 ? l : w);
      fill(0);
      rect(l*(i - (g-1)/2), l*(j - (g-1)/2), x > 0 ? w+3 : l, x > 0 ? l : w+3);
      fill(255);
      rect(l*(i - (g-1)/2), l*(j - (g-1)/2), x > 0 ? w : l, x > 0 ? l : w);
    }
  }
}
