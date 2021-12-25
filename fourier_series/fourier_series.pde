float time = 0;
ArrayList<Float> wave;

void setup() {
  size(800, 600);
  wave = new ArrayList<Float>();
}

void draw() {
  background(#f1f1f1);
  translate(100, height/2);

  float x = 0;
  float y = 0;
  float r = 0;
  float ws = 0;
  for (int i = 0; i < map(mouseX, 0, width, 0, 10); i++) {
    float px = x;
    float py = y;
    int n = 2*i + 1;
    r = (4 / (n * PI)) * 40;
    ws += r;
    x += r * cos(n * time);
    y += r * sin(n * time);
    fill(0);
    stroke(0);
    strokeWeight(1);
    line(px, py, x, y);
    
  }
  wave.add(y);
  ellipse(x, y, 8, 8);
  line(x, y, ws+10, wave.get(wave.size()-1));
  
  beginShape();
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);
  for (int i = wave.size()-1; i >= 0; i--) {
    vertex(wave.size()-1-i + ws+10, wave.get(i));
  }
  endShape();

  if (wave.size() >= width - ws - 10) {
    wave.remove(0);
  }

  time += map(mouseY, 0, height, 0, 0.5);
}
