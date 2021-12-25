ArrayList<Circle> circles;
PImage img;
ArrayList<PVector> spots;


void setup() {
  size(966, 405);
  circles = new ArrayList<Circle>();
  spots = new ArrayList<PVector>();
  img = loadImage("img1.png");
  img.loadPixels();
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++) {
      int index = x + y*width;
      color c = img.pixels[index];
      float b = brightness(c);
      if (b < 2) {
        spots.add(new PVector(x, y));
      }
    }
  }
}

void draw() {
  background(0);
  int total = 10;
  int count = 0;
  int attempt = 0;
  while (count < total) {
    Circle newc = newCircle();
    if (newc != null) {
      circles.add(newc);
      count++;
    }
    attempt++;
    if (attempt > 1000) {
      noLoop();
      println("finished");
      break;
    }
  }

  for (Circle c : circles) {
    if (!c.atedge(circles)) {
      c.grow();
    }
    c.display();
  }
}

Circle newCircle() {
  PVector randompoint = spots.get(int(random(0, spots.size())));
  //float x = random(0, width);
  //float y = random(0, height);
  float x = randompoint.x;
  float y = randompoint.y;
  boolean valid = true;

  for (Circle c : circles) {
    float d = dist(x, y, c.x, c.y);
    if (d < c.r + c.initialradius) {
      valid = false;
      break;
    }
  }
  if (valid) {
    return new Circle(x, y);
  } else {
    return null;
  }
}
