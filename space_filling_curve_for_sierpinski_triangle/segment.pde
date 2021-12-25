class Segment {
  PVector a;
  PVector c;
  PVector b;
  Segment(PVector start, PVector center,PVector end){
    a = start.copy();
    c = center.copy();
    b = end.copy();
  }
  
  Segment[] generate(){
    Segment[] children = new Segment[3];
    PVector newc = PVector.add(b, a).div(2);
    PVector b1 = PVector.add(c, a).div(2);
    PVector a1 = PVector.add(b, c).div(2);
    children[0] = new Segment(a, newc, b1);
    children[1] = new Segment(b1, c, a1);
    children[2] = new Segment(a1, newc, b);

    return children;
  }
  
  void show(){
    stroke(map(a.x, 0, width, 0, 360), 255, 255);
    strokeWeight(2);
    line(a.x, a.y, c.x, c.y);
    line(c.x, c.y, b.x, b.y);
  }
}
