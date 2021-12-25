PImage mainimg;
int scl = 8;
PImage smaller;
int w, h;
PImage[] allimg;
float[] brightness;
PImage[] brightImages;


void setup() {
  size(625, 938);
  File[] files = listFiles("E:/WALLPAPERS/Pins");
  //printArray(files);
  allimg = new PImage[files.length];
  brightness = new float[files.length];
  brightImages = new PImage[256];
  
  for (int i = 0; i < allimg.length; i++) {
    String filename = files[i].toString();
    allimg[i] = loadImage(filename);
    float avg = 0;
    for (int j = 0; j < allimg[i].pixels.length; j++) {
      float b = brightness(allimg[i].pixels[i]);
      avg += b;
    }
    avg /= allimg[i].pixels.length;
    brightness[i] = avg;
  }

  for (int i = 0; i < brightImages.length; i++) {
    float record = 256;
    for (int j = 0; j < brightness.length; j++) {
      float diff = abs(i - brightness[j]);
      if (diff < record) {
        record = diff;
        brightImages[i] = allimg[j];
      }
    }
  }

  mainimg = loadImage("E:/2e809d2078ca58599b64efd8549deb04.jpg");
  w = mainimg.width/scl;
  h = mainimg.height/scl;
  smaller = createImage(w, h, RGB);
  smaller.copy(mainimg, 0, 0, mainimg.width, mainimg.height, 0, 0, w, h);
}

void draw() {
  smaller.loadPixels();
  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      int index = x + y*w;
      color c = smaller.pixels[index];
      //fill(brightness(c));
      //noStroke();
      //rect(x*scl, y*scl, scl, scl);
      int indeximg = int(brightness(c));
      image(brightImages[indeximg], x*scl, y*scl, scl, scl);
    }
  }

  noLoop();
}

File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}
