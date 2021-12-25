int[][] g;

void setup() {
  noLoop();
  g = new int[5][5];
  for (int y = 0; y < g.length; y++) {
    for (int x = 0; x < g[0].length; x++) {
      g[y][x] = x + y;
    }
  }
}

void draw() {
  for (int y = 0; y < g.length; y++) {
    for (int x = 0; x < g[0].length; x++) {
      print(g[y][x], " ");
    }
    println();
  }
  println("---------------------------------");
  int[] s = getneighboursState(2, 4, g);
  for (int i = 0; i < s.length; i++) {
    println(s[i]);
  }
  println(toSum(s));
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
