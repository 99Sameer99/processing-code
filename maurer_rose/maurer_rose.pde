float n = 6;
float d = 71;
float t = 0;

void setup() {
  size(800, 800);
}

void draw() {
  //n = map(mouseX, 0, width, 0, 100);
  //d = map(mouseY, 0, height, 0, 100);
  n = 10*noise(t);
  d = 10*noise(t*2);
  background(0);
  translate(width/2, height/2);
  stroke(255);
  
  noFill();
  strokeWeight(1);
  beginShape();
  for(int a = 0; a  < 361; a += 1){
    float k = radians(a) * d;
    float r = 350 * sin(n*k);
    float x = r * cos(k);
    float y = r * sin(k);
    vertex(x, y);
  }
  endShape();
  
  noFill();
  stroke(255, 0, 255);
  strokeWeight(3);
  beginShape();
  for(int a = 0; a  < 361; a += 1){
    float k = radians(a);
    float r = 350 * sin(n*k);
    float x = r * cos(k);
    float y = r * sin(k);
    vertex(x, y);
  }
  endShape();
  t += 0.01;
}
