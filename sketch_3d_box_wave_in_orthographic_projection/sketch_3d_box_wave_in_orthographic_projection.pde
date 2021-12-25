float angle = 0;
float w = 10;
float roty;
float maxD;

void setup() {
  size(600, 600, P3D);
  roty = atan(1 / sqrt(2));
  maxD = dist(0, 0, width/2, height/2);
}

void draw() {
  background(51);
  translate(width/2, height/2, 0);
  ortho(-width/2, width/2, -height/2, height/2, 0, 1000 );
  lights();
  rotateX(-QUARTER_PI);
  rotateY(-roty - 1.71);

  for (int z = 0; z < height/2; z += w) {
    for (int x = 0; x < width/2; x += w) {
      push();
      float d = dist(x+w/2, w/2 + z, width/4, height/4);
      float offset = map(d, 0, maxD, -3, 3);
      float h = map(sin(angle + offset), -1, 1, 50, 300);
      //ambient(255);
      fill(255 - d, 215, 0);
      translate(x,  0, z - height/2);
      box(w, h, w);
      pop();
    }
  }

  angle -= 0.1;
}
