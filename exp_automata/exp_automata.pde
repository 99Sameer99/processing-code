int d;
char currentState;
float x, y;
int pathLength;

void setup() {
  size(900, 900);
  background(#000000);
  d = 15;
  currentState = 'a';
  x = width/2;
  y = height/2;
  pathLength = 5000;
}

char automata(char state, int input) {
  if (state == 'a') { 
    return input == 0 ? 'c' : 'd';
  }
  if (state == 'b') { 
    return input == 0 ? 'd' : 'a';
  }
  if (state == 'c') { 
    return input == 0 ? 'a' : 'b';
  }
  if (state == 'd') { 
    return input == 0 ? 'b' : 'c';
  }
  return 'q';
}

void draw() {
  stroke(255, 215, 0);
  float nx = x;
  float ny = y;
  if (pathLength > 0) {
    if (currentState == 'a') {
      nx = x;
      ny = (y+d >= height) ? y : y + d;
      //line(x, y, nx, ny);
      noFill();
      //ellipse(x+d/2, y+d/2, d, d);
      arc(x+d/2, y, d, d, 0, PI, OPEN);
    }
    if (currentState == 'b') {
      nx = (x-d <= 0) ? x : x - d;
      ny = y;
      line(x, y, nx, ny);
    }
    if (currentState == 'c') {
      nx = (x+d >= width)? x : x + d;
      ny = y;
      line(x, y, nx, ny);
    }
    if (currentState == 'd') {
      nx = x;
      ny = (y-d <= 0) ? y : y - d;
      line(x, y, nx, ny);
    }
  }
  x = nx;
  y = ny;
  //ellipse(x, y, 4, 4);
  currentState = automata(currentState, random(1, 100) >= 60 ? 1 : 0);
  pathLength -= 1;
}
