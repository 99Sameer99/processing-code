class Segment {
  PVector a;
  PVector b;
  float angle = PI/40;
  Segment(PVector start, PVector end){
    a = start.copy();
    b = end.copy();
  }
  
  Segment[] generate(){
    Segment[] children = new Segment[4];
    PVector v = PVector.sub(b, a);
    float l = v.mag() / (2 + 2*sin(angle/2));
    v.setMag(l);
    // Segment 0
    PVector b1 = PVector.add(a, v);
    children[0] = new Segment(a, b1);
    // Segment 1
    v.rotate(-(PI - angle)/2);
    PVector c = PVector.add(b1, v);
    children[1] = new Segment(b1, c);
    //Segment 2
    v.rotate(PI - angle);
    PVector a1 = PVector.add(c ,v);
    children[2] = new Segment(c, a1);
    //segment 3
    children[3] = new Segment(a1, b);
    return children;
  }
  
  void show(){
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }
}
