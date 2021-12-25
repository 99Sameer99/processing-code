float size = 5;
void setup(){
  size(1000, 700);
}

void draw(){
  background(200);
  for(float i = 0; i < width; i += size){
    for(float j = 0; j < height; j += size){
      fill(round(5000 / dist(i + size/2, j + size/2, mouseX, mouseY)));
      rect(i, j, size, size);
    }
  }
  
}
