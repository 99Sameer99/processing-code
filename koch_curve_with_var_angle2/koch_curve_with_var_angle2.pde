import com.hamoid.*;
VideoExport video;

float theta = 0;
ArrayList<Segment> segments;


void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(800, 800, P2D);
  frameRate(15);
  video = new VideoExport(this, "koch-curve-with-variable-angle.mp4");
  video.setQuality(100, 0);
  video.setFrameRate(30);
  video.startMovie();
}

void draw() {
  background(0);
  //theta = map(mouseX, 0, width, 0, TWO_PI);
  
  segments = new ArrayList<Segment>();
  PVector a = new PVector(0, height/2);
  PVector b = new PVector(width, height/2);
  Segment seg1 = new Segment(a, b, theta);
  segments.add(seg1);
  Segment seg2 = new Segment(b, a, theta);
  segments.add(seg2);
  
  for (int i = 0; i <= 5; i++) {
    ArrayList<Segment> nextgen = new ArrayList<Segment>();
    for (Segment s : segments) {
      Segment[] children = s.generate();
      addAll(children, nextgen);
    }
    segments = nextgen;
  }

  for (Segment s : segments) {
    s.show();
  }
  video.saveFrame();
  if(theta <= TWO_PI){
    theta += 0.01;
  }else{
    theta = 0;
    video.endMovie();
  }
}
