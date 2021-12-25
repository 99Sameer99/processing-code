int cols, rows;
int scale = 20;

float[][] terrain;
int w = 2000;
int h = 1600;
float flying;

void setup(){
  size(600, 600, P3D);
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
}

void draw(){
  flying -= 0.1;
  float yoffset = flying;
  for(int y = 0; y < rows; y++){
    float xoffset = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoffset, yoffset), 0, 1, -100, 100);
      xoffset += 0.1;
    }
    yoffset += 0.1;
  }
  background(0);
  lights();
  noStroke();
  //stroke(255);
  fill(180, 100, 0);
  translate(width/2, height/2 + 50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}
