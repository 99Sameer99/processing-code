class Leaf {
  PVector pos;
  boolean reached = false;

  Leaf() {
    pos = PVector.random2D();
    pos.mult(random(width/2));
    pos.x += width/2;
    pos.y += height/2;

    //pos = new PVector(random(10, width-10), random(10, height-40));
  }

  void reached() {
    reached = true;
  }

  void show() {
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, 4, 4);
  }
}
