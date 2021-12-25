ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list){
  for(Segment s : arr){
    list.add(s);
  }
}

void setup(){
  size(800, 800);
  
  segments = new ArrayList<Segment>();
  PVector a = new PVector(200, 200);
  PVector b = new PVector(600, 200);
  PVector c = new PVector(200, 600);
  PVector d = new PVector(600, 600);
  Segment side1 = new Segment(a, b);
  segments.add(side1);
  Segment side2 = new Segment(b, d);
  segments.add(side2);
  Segment side3 = new Segment(d, c);
  segments.add(side3);
  Segment side4 = new Segment(c, a);
  segments.add(side4);
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
