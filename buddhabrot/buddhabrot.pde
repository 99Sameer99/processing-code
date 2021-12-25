size(800, 800);
noLoop();
background(0);
blendMode(BLEND); //<>//
int maxiters = 10000;
float w = 4;
float h = 4;
float maxval = 4.0;
float xmin = -w/2;
float xmax = xmin + w;
float ymin = -h/2;
float ymax = ymin + h;
float dx = (xmax - xmin) / width;
float dy = (ymax - ymin) / height;
int[][] densityplot = new int[width][height];
int maxsteps = 0;

for (int i = 0; i < width; i++) {
  float x = xmin + i * dx;
  for (int j = 0; j < height; j++) {
    float y = ymin + j * dy;
    float a = x;
    float b = y;
    int n = 1;
    ArrayList<PVector> trail = new ArrayList<PVector>();
    trail.add(new PVector(i, j));
    float prevval = dist(0, 0, a, b);
    while (prevval < maxval && n < maxiters) {
      float aa = a * a;
      float bb = b * b;
      float twoab = 2 * a * b;
      a = aa - bb + x;
      b = twoab + y;
      float currentval = dist(0, 0, a, b);
      if (currentval < maxval) {
        int xco = floor((a - xmin) / dx);
        int yco =  floor((b - ymin) / dy);
        if ((xco >= 0 && xco < width) && (yco >= 0 && yco < height)) {
          trail.add(new PVector(xco, yco));
        }
      }
      n++;
      prevval = currentval;
    }
    if (n < maxiters) {
      for (PVector p : trail) {
        densityplot[(int) p.x][(int) p.y] += 1;
      }
    }
  }
}

for (int i = 0; i < width; i++) {
  for (int j = 0; j < height; j++) {
    maxsteps = maxsteps < densityplot[i][j] ? densityplot[i][j] : maxsteps;
  }
}

loadPixels();
for (int i = 0; i < width; i++) {
  for (int j = 0; j < height; j++) {
    int mindensity = 7;
    if (densityplot[i][j] > mindensity) {
      float alpha = map(densityplot[i][j], mindensity+1, maxsteps, 100, 255);
      float hue = 255;//map(densityplot[i][j], mindensity+1, maxsteps, 0, 255);
      pixels[i + j*width] = color(hue, 215, 0, floor(alpha));
    } else {
      pixels[i + j*width] = color(0);
    }
  }
}
updatePixels();
println(maxsteps);
println("Done");
