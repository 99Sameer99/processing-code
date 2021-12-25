class Circle {
  float x;
  float y;
  float r;
  float thickness;
  float initialradius = 2;
  float finalradius = 10;

  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = initialradius;
    thickness = 2;
  }

  boolean atedge(ArrayList<Circle> circles) {
    boolean e = false;
    boolean n = false;
    if (x+r > width || x - r < 0 || y + r > height || y - r < 0) {
      e = true;
    }
    for (Circle other : circles) {
      if (other != this) {
        if (dist(x, y, other.x, other.y) - 2*thickness < other.r + r) {
          n = true;
        }
      }
    }

    return e || n;
  }

  void grow() {
    if (r < finalradius) {
      r += 1;
    } else {
      r += 0;
    }
  }

  void display() {
    stroke(255);
    strokeWeight(thickness);
    noFill();
    ellipse(x, y, r*2, r*2);
  }
}
