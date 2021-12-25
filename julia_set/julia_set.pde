size(1000, 800);
noLoop();
background(255, 0, 0);
int maxiters = 100;
float w = 4;
float h = (w * height) / width;
float xmin = -w/2;
float xmax = xmin + w;
float ymin = -h/2;
float ymax = ymin + h;
float dx = (xmax - xmin) / width;
float dy = (ymax - ymin) / height;
float ca = -0.70176; //0.285;-0.8;
float cb = -0.3842; //0.01;0.156;


loadPixels();
float x = xmin;
for(int i = 0; i < width; i++){
  float y = ymin;
  for(int j = 0; j < height; j++){
    float a = x;
    float b = y;
    int n = 0;
    float maxval = 4.0;
    float oldval = 0.0;
    float m = 0;
    
    while(n < maxiters){
      float aa = a*a;
      float bb = b*b;
      float newval = sqrt(aa + bb);
      if(newval > maxval){
        float difftoold = (float) (newval - oldval);
        float difftomax = (float) (maxval - newval);
        m = n + (difftomax / difftoold);
        break;
      }
      float twoab = 2 * a * b;
      a = aa - bb + ca;
      b = twoab + cb;
      n++;
      oldval = newval;
    }
    
    if (n == maxiters) {
      pixels[i+j*width] = color(0);
    } else {
      float norm = map(m, 0, maxiters, 0, 1);
      pixels[i+j*width] = color(map(norm, 0, 1, 0, 255));
    }
    y += dy;
  }
  x += dx;
}
updatePixels();
