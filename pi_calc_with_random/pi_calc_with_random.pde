void setup(){
  size(400, 400);
  r = width/2;
  background(0);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(1);
  noFill();
  ellipse(0, 0, r*2, r*2);
  rectMode(CENTER);
  rect(0, 0, r*2, r*2);
}
int r;
int total = 0;
int circle = 0;

void draw(){
  translate(width/2, height/2);
  for(int i = 0; i < 200; i++){
    float x = random(-r, r);
    float y = random(-r, r);
    if((double)x*(double)x + (double)y*(double)y < (double)r*(double)r){
      stroke(0, 255, 0);
      circle++;
    }else{
      stroke(255);
    }
    total++;
    point(x, y);
  }
  double pi = (double)4 * ((double)circle / (double)total);
  println(pi);
}
