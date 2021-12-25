class arrow {
  PVector a;
  float angle;
  float mag;

  arrow(PVector start, float theta, float len) {
    a = start;
    angle = theta;
    mag = len;
  }

  void display() {
    PVector b = new PVector(a.x + mag*cos(-angle), a.y + mag*sin(-angle));
    float arrowheadsize = mag > 20 ? mag/10 : 2;
    PVector v = PVector.sub(a, b);
    v.setMag(arrowheadsize);
    v.rotate(PI/6);
    PVector h1 = PVector.add(b, v);
    v.rotate(-PI/3);
    PVector h2 = PVector.add(b, v);
    float h = map(dist(0, 0, a.x, a.y), 0, width/2, 0, 360);
    stroke(h, 255, 255);
    strokeWeight(2);
    line(a.x, a.y, b.x, b.y);
    line(b.x, b.y, h1.x, h1.y);
    line(b.x, b.y, h2.x, h2.y);
  }
}
