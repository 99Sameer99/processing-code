composition[][] grid;
composition[][] next;
float da = 1;
float db = 1.223; //1.2, 1.5
float feed = 0.055;
float k = 0.062;   //kill rate
float dt = 1.09;
float diagw = 0.05;
float adjw = 0.2;

void setup(){
  size(360, 240);
  grid = new composition[width][height];
  next = new composition[width][height];
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float b = 0; //random(1) < 0.5 ? 1 : 0;
      grid[i][j] = new composition(1, b);
      next[i][j] = new composition(1, b);
    }
  }
  int sx = round(width/2);
  int sy = round(height/2);
  int l = 10;
  for(int i = sx-l; i < sx + l + 1; i++){
    for(int j = sy-l; j < sy + l + 1; j++){
      grid[i][j] = new composition(1, 1);
      next[i][j] = new composition(1, 1);
    }
  }
}

void draw(){
  println(frameRate);
  background(51);
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float a = grid[i][j].a;
      float b = grid[i][j].b;
      next[i][j].a = a + (laplacea(i, j)*da - a*b*b + feed*(1-a))*dt;
      next[i][j].b = b + (laplaceb(i, j)*db + a*b*b - (k + feed)*b)*dt;
      next[i][j].a = constrain(next[i][j].a, 0, 1);
      next[i][j].b = constrain(next[i][j].b, 0, 1);
    }
  }
  composition[][] temp = next;
  next = grid;
  grid = temp;
  loadPixels();
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float c = 255*(grid[i][j].a - grid[i][j].b);
      c = constrain(c, 0, 255);
      pixels[i + j*width] = color(c);//(grid[i][j].a*255, 255*grid[i][j].b, 0);
    }
  }
  updatePixels();
  //saveFrame("frames/####.png");
}


float laplacea(int x, int y){
  float suma = 0;
  suma += grid[x][y].a*-1;
  if(x-1 >= 0 && y-1 >= 0){suma += grid[x-1][y-1].a*diagw;}
  if(x+1 <= width-1 && y+1 <= height-1){ suma += grid[x+1][y+1].a*diagw; }
  if(x-1 >= 0 && y+1 <= height-1){ suma += grid[x-1][y+1].a*diagw; }
  if(x+1 <= width-1 && y-1 >= 0){ suma += grid[x+1][y-1].a*diagw; }
  if(x-1 >= 0){ suma += grid[x-1][y].a*adjw; }
  if(x+1 <= width-1){ suma += grid[x+1][y].a*adjw; }
  if(y-1 >= 0){ suma += grid[x][y-1].a*adjw; }
  if(y+1 <= height-1){ suma += grid[x][y+1].a*adjw; }
  return suma;
}

float laplaceb(int x, int y){
  float sumb = 0;
  sumb += grid[x][y].b*-1;
  if(x-1 >= 0 && y-1 >= 0){sumb += grid[x-1][y-1].b*diagw; }
  if(x+1 <= width-1 && y+1 <= height-1){ sumb += grid[x+1][y+1].b*diagw;}
  if(x-1 >= 0 && y+1 <= height-1){ sumb += grid[x-1][y+1].b*diagw;}
  if(x+1 <= width-1 && y-1 >= 0){ sumb += grid[x+1][y-1].b*diagw;}
  if(x-1 >= 0){ sumb += grid[x-1][y].b*adjw;}
  if(x+1 <= width-1){ sumb += grid[x+1][y].b*adjw;}
  if(y-1 >= 0){ sumb += grid[x][y-1].b*adjw;}
  if(y+1 <= height-1){ sumb += grid[x][y+1].b*adjw;}
  return sumb;
}
