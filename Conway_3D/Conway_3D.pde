import com.hamoid.*;

int size;
int[][][] grid;
int n = 50;

void setup() {
  size(800, 800, P3D);
  frameRate(5);
  size = 10;
  grid = new int[n][n][n];
  //initialising grid values with 0 or dead state
  for (int z = 0; z < grid.length; z++) {
    for (int y = 0; y < grid[0].length; y++) {
      for (int x = 0; x < grid[0][0].length; x++) {
        grid[z][y][x] = 0;
      }
    }
  }
  // initialising some grids with 1 or alive state
  int w = 5;
  for (int z = (grid.length)/2-w; z < (grid.length)/2+w+1; z += 1) {
    for (int y = (grid[0].length)/2-w; y < (grid[0].length)/2+w+1; y += 1) {
      for (int x = (grid[0][0].length)/2-w; x < (grid[0][0].length)/2+w+1; x += 1) {
        grid[z][y][x] = 1;
      }
    }
  }
}

void draw() {
  background(0);
  translate(100, height, -600);
  // drawing the generation on the screen
  for (int z = 0; z < grid.length; z++) {
    for (int y = 0; y < grid[0].length; y++) {
      for (int x = 0; x < grid[0][0].length; x++) {
        stroke(255);
        if (grid[z][y][x] == 1) {
          color a = color(255, 0, 0);
          fill(a);
          push();
          translate(x*size, -y*size, -z*size);
          box(size);
          pop();
        }
      }
    }
  }

  // updating grid
  int[][][] next = new int[n][n][n];// empty grid for next gen state
  for (int z = 0; z < grid.length; z++) {
    for (int y = 0; y < grid[0].length; y++) {
      for (int x = 0; x < grid[0][0].length; x++) {
        int[] State = getneighboursState(x, y, z, grid);
        int g = conway(grid[z][y][x], toSum(State));
        next[z][y][x] = g;
      }
    }
  }
  grid = next;// updated grid assigned
}

int conway(int value, int env) {
  env -= value;
  if (value == 0 && (env == 5 || env == 10)) {// birth
    return 1;
  } else if (value == 1 && (env == 9 || env == 10 || env == 13)) {// survival
    return 1;
  }
  return 0;//death
}

int toSum(int[] neighboursState) {
  int sum = 0;
  if (neighboursState != null) {
    for (int i = 0; i < neighboursState.length; i++) {
      sum += neighboursState[i];
    }
  }
  return sum;
}

int[] getneighboursState(int x, int y, int z, int[][][] gen) {
  int nx = gen[0][0].length;
  int nz = gen.length;
  int ny = gen[0].length;
  if ((x > 0 && x < nx-1) && (y > 0 && y < ny-1) && (z > 0 && z < nz-1)) {
    int[] result = { gen[z][y][x], gen[z][y][x+1], gen[z][y-1][x+1], gen[z][y-1][x], gen[z][y-1][x-1], 
      gen[z][y][x-1], gen[z][y+1][x-1], gen[z][y+1][x], gen[z][y+1][x+1], 
      gen[z-1][y][x], gen[z-1][y][x+1], gen[z-1][y-1][x+1], gen[z-1][y-1][x], gen[z-1][y-1][x-1], 
      gen[z-1][y][x-1], gen[z-1][y+1][x-1], gen[z-1][y+1][x], gen[z-1][y+1][x+1], 
      gen[z+1][y][x], gen[z+1][y][x+1], gen[z+1][y-1][x+1], gen[z+1][y-1][x], gen[z+1][y-1][x-1], 
      gen[z+1][y][x-1], gen[z+1][y+1][x-1], gen[z+1][y+1][x], gen[z+1][y+1][x+1] };
    return result;
  }
  return null;
}
