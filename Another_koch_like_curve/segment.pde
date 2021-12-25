class Segment {
  PVector a;
  PVector b;
  Segment(PVector start, PVector end){
    a = start.copy();
    b = end.copy();
  }
  
  Segment[] generate(){
    Segment[] children = new Segment[7];
    PVector v = PVector.sub(b, a);
    v.div(4);
    // Segment 0
    PVector b1 = PVector.add(a, v);
    children[0] = new Segment(a, b1);
    // Segment 6
    PVector a1 = PVector.sub(b, v);
    children[6] = new Segment(a1, b);
    
    v.rotate(PI/2);
    //Segment 1
    PVector c1 = PVector.add(b1, v);
    children[1] = new Segment(b1, c1);
    v.rotate(-PI/2);
    //segment 2
    PVector c2 = PVector.add(c1, v);
    children[2] = new Segment(c1, c2);
    v.rotate(-PI/2);
    //segment 3
    PVector twicev = PVector.add(v, v);
    PVector c3 = PVector.add(c2, twicev);
    children[3] = new Segment(c2, c3);
    v.rotate(PI/2);
    // segment 4
    PVector c4 = PVector.add(c3, v);
    children[4] = new Segment(c3, c4);
    //segment 5
    children[5] = new Segment(c4, a1);
    
    return children;
  }
  
  void show(){
    stroke(a.x + b.x, a.y + b.y, a.x);
    strokeWeight(1);
    line(a.x, a.y, b.x, b.y);
  }
}
