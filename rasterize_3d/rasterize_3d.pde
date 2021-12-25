PImage img;

void settings() {
  img = loadImage("E:/WALLPAPERS/the_eye-2560x1600.jpg");
  img.resize(900, 0);
  size(img.width, img.height, P3D);
}

void draw() {
  background(#f1f1f1);
  //image(img, 0, 0);
  float tiles = 200;//mouseX/4;
  float tileSize = width / tiles;
  sphereDetail(3);
  
  push();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, 0, PI));
  for (int x = 1; x < tiles; x++) {
    for (int y = 1; y < tiles; y++) {
      noStroke();
      color c = img.get(int(x*tileSize), int(y*tileSize));
      float b = map(brightness(c), 0, 255, 1, 0);
      float z = map(b, 0, 1, -100, 100);
      fill(c);
      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(b * tileSize);
      pop();
    }
  }
  pop();
}
