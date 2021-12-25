float i, n, p, x, y, t, k;
void setup() {
  size(900, 900);
  strokeWeight(2);
  stroke(255);
}

void draw() {
  t += 0.01;
  k = map(mouseX, 0, width, 10, 100);
  clear();
  translate(width/2, height/2);
  for (n= 0; n < 200; n += 5) {
    for (i = 0; i < k; i++) {
      p = ( i + i) / (n % k);
      x = n * (sin(TAU * p) + sin(t));
      y = n * (cos(TAU * p) + cos(t));
      point(x, y);
    }
  }
}
