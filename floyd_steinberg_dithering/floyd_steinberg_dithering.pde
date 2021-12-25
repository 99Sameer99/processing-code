PImage img;
void setup(){
  size(1024, 512);
  img = loadImage("anime art1.png");
  img.resize(width/2, 0);
  //img.filter(GRAY);
  image(img, 0, 0);
}

int index(int x, int y){ return x + y*img.width; }

void draw(){
  img.loadPixels();
  for(int y = 0; y < img.height-1; y++){
    for(int x = 1; x < img.width-1; x++){
      color pix = img.pixels[index(x, y)];
      float oldr = red(pix);
      float oldg = green(pix);
      float oldb = blue(pix);
      int factor = 1;
      int newr = round(factor * oldr / 255) * 255 / factor;
      int newg = round(factor * oldg / 255) * 255 / factor;
      int newb = round(factor * oldb / 255) * 255 / factor;
      img.pixels[index(x, y)] = color(newr, newg, newb);
      
      float errr = oldr - newr;
      float errg = oldg - newg;
      float errb = oldb - newb;
      
      int index = index(x+1, y);
      color c = img.pixels[index];
      float r = red(c) + errr * (7/16.0);
      float g = green(c) + errg * (7/16.0);
      float b = blue(c) + errb * (7/16.0);
      img.pixels[index] = color(r, g, b);
      
      index = index(x-1, y+1);
      c = img.pixels[index];
      r = red(c) + errr * (3/16.0);
      g = green(c) + errg * (3/16.0);
      b = blue(c) + errb * (3/16.0);
      img.pixels[index] = color(r, g, b);
      
      index = index(x, y+1);
      c = img.pixels[index];
      r = red(c) + errr * (5/16.0);
      g = green(c) + errg * (5/16.0);
      b = blue(c) + errb * (5/16.0);
      img.pixels[index] = color(r, g, b);
      
      index = index(x+1, y+1);
      c = img.pixels[index];
      r = red(c) + errr * (1/16.0);
      g = green(c) + errg * (1/16.0);
      b = blue(c) + errb * (1/16.0);
      img.pixels[index] = color(r, g, b);
    }
  }
  img.updatePixels();
  image(img, width/2, 0);
}
