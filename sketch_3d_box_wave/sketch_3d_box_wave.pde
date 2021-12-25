float k = 0;
float side = 50;
int nobr = 9; // number of bosex in a row
int nobc = 9; // number of boxes in a column

void setup() {
  size(900, 900, P3D);
}

void draw() {
  background(0);
  camera(width/2, height/2, mouseY, width/2, height/2, 0, 0, 1, 0);
  lights();
  translate(width/2, height/2);
  strokeWeight(2);
  rotateY(-PI/4);//map(mouseX, 0, width, 0, PI)
  rotateX(-0.3);
  rotateZ(0.3);
  for (int x = 0; x < nobr; x++) {
    for (int z = 0; z < nobc; z++) {
      fill((x+z)*10);
      stroke(255, 215, 0, map(x+z, 0, 14, 0, 255));
      push();
      translate(x*(side + side/10), 0, z*(side + side/10));
      float offset = map(dist(x, z, 0, 0), 0, 9*sqrt(2), -PI, PI);//
      box(side, 10 + side*abs(sin(k + (offset))), side);
      pop();
    }
  }
  k += 0.01;
}
