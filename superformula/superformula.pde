void setup(){
  size(800, 700);
  noFill();
  stroke(255);
  strokeWeight(2);
}
// m rotational symmetry
// n1 size
float r(float theta, float a, float b, float m, float n1, float n2, float n3){
  return pow(pow(abs(cos(m*theta/4.0) / a), n2) + 
  pow(abs(sin(m*theta/4.0) / b), n3), -1.0 / n1);
}

float t = 0;

void draw(){
  background(0);
  translate(width/2, height/2);
  beginShape();
  for(float theta = 0; theta <= 2*PI; theta += 0.01){
    
  float rad = r(theta, 5, t%5, 4, 70, 60, 50);
  float x = rad * cos(theta) * 50;
  float y = rad * sin(theta) * 50;
  vertex(x, y);
  
  }
  endShape();
  t += 0.01;
}
