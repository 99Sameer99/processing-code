int side = 8;
float space = side * sqrt(2);
float k = 0;
float n;
void setup() {
  size(600, 600);
  smooth(4);
  n = (width)/(space) - 2;
}

void rotated_line(float x, float y, float side, float angle) {
  stroke(255, 215, 0);
  strokeWeight(1.5);
  push();
  translate(x, y);
  rotate(angle);
  line(0, 0, side, side);
  pop();
}


void draw() {
  background(0);
  for (int x = 1; x < n+1; x++) {
    for (int y = 1; y < n+1; y++) {
      //rotated_line(x*space, y*space, side, k + (x+y));
      //rotated_line(x*space, y*space, side, sin(y*k) + cos(x*k));
      rotated_line(x*space, y*space, side, map(sin(y*k) + cos(x*k), 0, 1, 1.1, 1.3));
    }
  }
  k += 0.04;
}
