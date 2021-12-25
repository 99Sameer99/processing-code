import com.hamoid.*;
VideoExport video;

int size;
int[][] grid;

void setup() {
  size(800, 800);
  int fps = 60;
  frameRate(fps);
  
  video = new VideoExport(this, "crystal-like-growth8.mp4");
  video.setFrameRate(fps);
  video.setQuality(100, 0);
  
  size = 2;
  grid = new int[height/size][width/size];
  //initialising grid values with 0 or dead state
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[0].length; x++) {
      grid[y][x] = 0;
    }
  }
  // initialising some grids with 1 or alive state
  int w = 4;
  for (int y = (height/size)/2-w; y < (height/size)/2+w+1; y += 1) {
    for (int x = (width/size)/2-w; x < (width/size)/2+w+1; x += 1) {
      grid[y][x] = 1;
    }
  }
  //grid[height/(size*2)][width/(size*2)] = 1;
  //noLoop();
  //video.startMovie();
}

//void mousePressed() {
//  redraw();
//}

void keyPressed() {
  if (key == 'q') {
    video.endMovie();
    exit();
  }
}

void draw() {
  background(255);
  // drawing the generation on the screen
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[0].length; x++) {
      noStroke();
      color a = color(#f1f1f1);
      color d = color(#000000);
      fill(grid[y][x] == 0 ? d : a);
      rect(x*size, y*size, size, size);
    }
  }

  // updating grid
  int[][] next = new int[height/size][width/size];// empty grid for next gen state
  for (int y = 0; y < grid.length; y++) {
    for (int x = 0; x < grid[0].length; x++) {
      int[] State = getneighboursState(x, y, grid);
      int g = Rule3(grid[y][x], toSum(State));
      next[y][x] = g;
    }
  }
  grid = next;// updated grid assigned
  //video.saveFrame();
}


int Rule3(int value, int env) {
  int[] l = {4,1};
  if(value == 0 && contains(env, l)){
    return 1;
  }
  return value;
}

int Rule2(int value, int env) {
  //int[] l = {1};
  if(value == 0 && env == 1){
    return 1;
  }
  return value;
}

int Rule1(int value, int env) {// crystal like growth
  int modulo = 3;
  int remainder = 1;
  //env -= value;
  if(value == 0 && (env%modulo == remainder)){
    return 1;
  }
  return value;
}

int conway(int value, int env) {
  env -= value;
  if (value == 0 && env == 3) {// birth
    return 1;
  } else if (value == 1 && (env == 2 || env == 3)) {// survival
    return 1;
  }
  return 0;//death
}

int toSum(int[] neighboursState) {
  int sum = 0;
  for (int i = 0; i < neighboursState.length; i++) {
    sum += neighboursState[i];
  }
  return sum;
}

int[] getneighboursState(int x, int y, int[][] gen) {
  int nx = gen[0].length;
  int ny = gen.length;
  if ((x > 0 && x < nx-1) && (y > 0 && y < ny-1)) {
    int[] result = { gen[y][x], gen[y][x+1], gen[y-1][x+1], gen[y-1][x], gen[y-1][x-1], 
      gen[y][x-1], gen[y+1][x-1], gen[y+1][x], gen[y+1][x+1] };
    return result;
  } else if (x == 0 && y == 0) {
    int[] result = { gen[y][x], gen[y][x+1], gen[ny-1][x+1], gen[ny-1][x], gen[ny-1][nx-1], 
      gen[y][nx-1], gen[y+1][nx-1], gen[y+1][x], gen[y+1][x+1] };
    return result;
  } else if (x == nx-1 && y == 0) {
    int[] result = { gen[y][x], gen[y][0], gen[ny-1][0], gen[ny-1][x], gen[ny-1][x-1], 
      gen[y][x-1], gen[y+1][x-1], gen[y+1][x], gen[y+1][0] };
    return result;
  } else if (x == 0 && y == ny-1) {
    int[] result = { gen[y][x], gen[y][x+1], gen[y-1][x+1], gen[y-1][x], gen[y-1][nx-1], 
      gen[y][nx-1], gen[0][nx-1], gen[0][x], gen[0][x+1] };
    return result;
  } else if (x == nx-1 && y == ny-1) {
    int[] result = { gen[y][x], gen[y][0], gen[y-1][0], gen[y-1][x], gen[y-1][x-1], 
      gen[y][x-1], gen[0][x-1], gen[0][x], gen[0][0] };
    return result;
  } else if (y == 0) {
    int[] result = { gen[y][x], gen[y][x+1], gen[ny-1][x+1], gen[ny-1][x], gen[ny-1][x-1], 
      gen[y][x-1], gen[y+1][x-1], gen[y+1][x], gen[y+1][x+1] };
    return result;
  } else if (x == 0) {
    int[] result = { gen[y][x], gen[y][x+1], gen[y-1][x+1], gen[y-1][x], gen[y-1][nx-1], 
      gen[y][nx-1], gen[y+1][nx-1], gen[y+1][x], gen[y+1][x+1] };
    return result;
  } else if (y == ny-1) {
    int[] result = { gen[y][x], gen[y][x+1], gen[y-1][x+1], gen[y-1][x], gen[y-1][x-1], 
      gen[y][x-1], gen[0][x-1], gen[0][x], gen[0][x+1] };
    return result;
  } else if (x == nx-1) {
    int[] result = { gen[y][x], gen[y][0], gen[y-1][0], gen[y-1][x], gen[y-1][x-1], 
      gen[y][x-1], gen[y+1][x-1], gen[y+1][x], gen[y+1][0] };
    return result;
  }
  return null;
}

String toBinary(int x, int len) {
  if (len > 0) {
    return String.format("%" + len + "s", 
      Integer.toBinaryString(x)).replaceAll(" ", "0");
  }
  return null;
}

int toDecimal(String num, int base) {
  return Integer.parseInt(num, base);
}

int toIndex(int[] neighboursState) {
  int n = 0;
  for (int i = 1; i < neighboursState.length; i++) {
    int w = neighboursState[i] * raise(2, i);
    n += w;
  }
  //n = constrain(n, 0, 511);
  return n;
}

int raise(int b, int e) {
  int n = 1;
  for (int i = 0; i < e; i++) {
    n *= b;
  }
  return n;
}

boolean contains(int el, int[] alist) {
  for (int i = 0; i < alist.length; i++) {
    if (alist[i] == el) {
      return true;
    }
  }
  return false;
}
