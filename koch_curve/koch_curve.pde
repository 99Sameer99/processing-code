ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list){
  for(Segment s : arr){
    list.add(s);
  }
}

void setup(){
  size(900, 600);
  segments = new ArrayList<Segment>();
  PVector a = new PVector(0, height/2);
  PVector b = new PVector(width, height/2);
  Segment start = new Segment(a, b);
  segments.add(start);
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
