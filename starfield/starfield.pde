Star[] stars = new Star[200];
float speed;

void setup(){
  size(800, 800);
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX, 0, width, 0, 20);
  background(0);
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
    stars[i].update();
  }
}
