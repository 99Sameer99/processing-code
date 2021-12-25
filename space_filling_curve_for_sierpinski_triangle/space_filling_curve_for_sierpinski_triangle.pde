
ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list){
  for(Segment s : arr){
    list.add(s);
  }
}

void setup(){
  size(810, 800);
  colorMode(HSB, 360, 255, 255);
  
  segments = new ArrayList<Segment>();
  int d = 50;
  float s = 400;
  float h = s * sqrt(3);
  PVector b = new PVector(width/2, d);
  PVector a = new PVector(width/2-s, h + d);
  PVector c = new PVector(width/2+s, h + d);
  Segment side1 = new Segment(a, c, b);
  segments.add(side1);
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
