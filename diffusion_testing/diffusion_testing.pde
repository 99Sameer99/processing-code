composition[][] grid;
composition[][] next;
float da = 1;
float db = 0.5;
float feed = 0.055;
float k = 0.062;   //kill rate
float dt = 1;
float diagw = 0.2;
float adjw = 0.2;

void setup(){
  size(600, 600);
  grid = new composition[width][height];
  next = new composition[width][height];
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float b = random(1) < 0.5 ? 1 : 0;
      grid[i][j] = new composition(1, b);
      next[i][j] = new composition(1, b);
    }
  }
  //for(int i = 200; i < 211; i++){
  //  for(int j = 200; j < 211; j++){
  //    grid[i][j] = new composition(1, 1);
  //    next[i][j] = new composition(1, 1);
  //  }
  //}
}

void draw(){
  println(frameRate);
  background(51);
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      float a = grid[i][j].a;
      float b = grid[i][j].b;
      float lapa = laplacea(i, j);
      float lapb = laplaceb(i, j);
      next[i][j].a = (lapa)*dt;
      next[i][j].b = (lapb)*dt;
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
      pixels[i + j*width] = color(grid[i][j].a*255, 255*grid[i][j].b, 50);
    }
  }
  updatePixels();
}

float laplacea(int x, int y){
  float suma = 0;
  suma += grid[x][y].a*-1;
  if(x-1 >= 0 && y-1 >= 0){suma += grid[x-1][y-1].a*diagw;}
  if(x+1 <= grid[0].length-1 && y+1 <= grid.length-1){ suma += grid[x+1][y+1].a*diagw; }
  if(x-1 >= 0 && y+1 <= grid.length-1){ suma += grid[x-1][y+1].a*diagw; }
  if(x+1 <= grid[0].length-1 && y-1 >= 0){ suma += grid[x+1][y-1].a*diagw; }
  if(x-1 >= 0){ suma += grid[x-1][y].a*adjw; }
  if(x+1 <= grid[0].length-1){ suma += grid[x+1][y].a*adjw; }
  if(y-1 >= 0){ suma += grid[x][y-1].a*adjw; }
  if(y+1 <= grid.length-1){ suma += grid[x][y+1].a*adjw; }
  return suma;
}

float laplaceb(int x, int y){
  float sumb = 0;
  sumb += grid[x][y].b*-1;
  if(x-1 >= 0 && y-1 >= 0){sumb += grid[x-1][y-1].b*diagw; }
  if(x+1 <= grid[0].length-1 && y+1 <= grid.length-1){ sumb += grid[x+1][y+1].b*diagw;}
  if(x-1 >= 0 && y+1 <= grid.length-1){ sumb += grid[x-1][y+1].b*diagw;}
  if(x+1 <= grid[0].length-1 && y-1 >= 0){ sumb += grid[x+1][y-1].b*diagw;}
  if(x-1 >= 0){ sumb += grid[x-1][y].b*adjw;}
  if(x+1 <= grid[0].length-1){ sumb += grid[x+1][y].b*adjw;}
  if(y-1 >= 0){ sumb += grid[x][y-1].b*adjw;}
  if(y+1 <= grid.length-1){ sumb += grid[x][y+1].b*adjw;}
  return sumb;
}
