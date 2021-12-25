float w;
float h;
float xmin;
float xmax;
float ymin;
float ymax;
float dx;
float dy;
float ca;
float cb;
float dc;
float theta;
float dtheta;
float c;

void setup(){
  size(360, 360);
  background(255, 0, 0);
  w = 4;
  h = (w * height) / width;
  xmin = -w/2;
  xmax = xmin + w;
  ymin = -h/2;
  ymax = ymin + h;
  dx = (xmax - xmin) / width;
  dy = (ymax - ymin) / height;
  ca = -2;
  cb = -2;
  c = 0.7885;
  theta = 0;
  dc = 0.001;
  dtheta = 0.01;
  colorMode(HSB);
}



void draw(){
  int maxiters = 80;
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
        a = aa - bb + c*cos(theta);
        b = twoab + c*sin(theta);
        n++;
        oldval = newval;
      }
      
      if (n == maxiters) {
        pixels[i+j*width] = color(0);
      } else {
        float norm = map(m, 0, maxiters, 0, 1);
        pixels[i+j*width] = color(map(norm, 0, 1, 0, 255), 255, 255);
      }
      y += dy;
    }
    x += dx;
  }
  updatePixels();
  //if(ca <= 2 && cb <= 2){
  //  ca += dc;
  //  cb += dc;
  //}else{
  //  ca = 0;
  //  cb = 0;
  //}
  theta += dtheta;
}
