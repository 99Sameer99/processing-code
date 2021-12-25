int[][] sandpile;
int nx;
int ny;

void setup(){
  size(1000, 900);
  nx = 100;
  ny = 100;
  sandpile = new int[nx][ny];
  sandpile[nx/2][ny/2] = 1000000000;
}

void topple(){
  int[][] nextpile = new int[nx][ny];
  for(int x = 0; x < nx; x++){
    for(int y = 0; y < ny; y++){
      int num = sandpile[x][y];
      if(num >= 4){ 
        nextpile[x][y] += num - 4;
        nextpile[x+1][y]++;
        nextpile[x-1][y]++;
        if(nextpile[x][y+1] <= 0) nextpile[x][y+1]++ ;
        nextpile[x][y-1]++;
      }else if(num < 4){
        nextpile[x][y] += num;
      }
    }
  }
  sandpile = nextpile;
}

void render(){
  for(int x = 0; x < nx; x++){
    for(int y = 0; y < ny; y++){
      int num = sandpile[x][y];
      color col = color(0);
      if(num == 0){
        col = color(255);
      }else if(num == 1){
        col = color(0, 255, 0);
      }else if(num == 2){
        col = color(0, 0, 255);
      }else if(num == 3){
        col = color(255, 0, 0);
      }
      fill(col);
      rect(x*width/nx, y*height/ny, width/nx, height/ny);
    }
  }
}

void draw(){
  frameRate(100);
  render();
  topple();
}
