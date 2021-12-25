float Langle, Rangle;

void setup() {
  size(900, 800);
}

void draw() {
  background(#f1f1f1);
  stroke(0);
  translate(width/2, height);
  Langle = map(mouseX, 0, width, 0, PI);
  Rangle = map(mouseY, 0, width, 0, PI);
  branch(220);
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 4) { 
    push();
    rotate(Langle);
    branch(len * 0.67);
    pop();
    push();
    rotate(-Rangle);
    branch(len * 0.67);
    pop();
  }
}
