PImage img;

void settings() {
  img = loadImage("E:/WALLPAPERS/abstract_pyramids-2560x1440.jpg");
  int h = 600;
  int w = int(float(h) * (float(img.width)/float(img.height)));
  img.resize(w, h);
  size(w, h);
}

void draw() {
  background(255);
  fill(0);
  float tiles = mouseX/5;
  float tileSize = width/tiles;
  for (int x = 1; x < tiles; x++) {
    for (int y = 1; y < tiles; y++) {
      color c = img.get(int(x * tileSize), int(y * tileSize));
      float size = map(brightness(c), 0, 255, 10, 0);
      ellipse(x * tileSize, y * tileSize, size, size);
    }
  }
}
