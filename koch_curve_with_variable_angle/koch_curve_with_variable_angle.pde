ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list){
  for(Segment s : arr){
    list.add(s);
  }
}

void setup(){
  size(800, 800, P2D);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(0, height/2);
  PVector b = new PVector(width, height/2);
  Segment seg1 = new Segment(a, b);
  segments.add(seg1);
  Segment seg2 = new Segment(b, a);
  segments.add(seg2);
}

void mousePressed(){
  ArrayList<Segment> nextgen = new ArrayList<Segment>();
  for(Segment s: segments){
    Segment[] children = s.generate();
    addAll(children, nextgen);
  }
  segments = nextgen;
}

void draw(){
  background(0);
  stroke(255);
  
  for (Segment s : segments){
    s.show();
  }
  
}
