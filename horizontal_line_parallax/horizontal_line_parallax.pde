float minspeed = 1;
float maxspeed = 20;


class Horizon {
  float y;
  int edges;
  float variance;
  float speed;
  ArrayList<PVector> vertices;
  float[] yVals;
  int i;

  Horizon(float y, int  edges, float variance, float speed) {
    this.y = y;
    this.edges = edges;
    this.variance = variance;
    this.speed = speed;
    yVals = new float[this.edges];
    vertices = new ArrayList<PVector>();
    for (int i = 0; i < edges; i++) {
      append(this.yVals, 10*noise(this.variance) + this.y);
    }

    this.i = 0;
    //this.vertices.add(new PVector(0, this.yVals[0]));
    for (int i = 0; i < edges; i++) {
      float x = map(i, 0, edges, 0, width);
      this.vertices.add(new PVector(x, this.yVals[i]));
    }
  }

  void update() {
    ArrayList<PVector> updatevertices = new ArrayList<PVector>();
    for(PVector v : this.vertices){
      updatevertices.add(v.add(new PVector(-this.speed, 0)));
    }
    
    if (updatevertices.size() > 1 && updatevertices.get(0).x < 0) {
      updatevertices.add(new PVector(0, this.y));
    }
    if (updatevertices.get(updatevertices.size() - 1).x < width) {
      updatevertices.add(new PVector(width + float(width)/float(this.edges), this.yVals[this.edges-1]));
    }
    
    this.vertices = updatevertices;
    this.i++;
  }

  void Draw() {
    beginShape();
    //noStroke();
    stroke(map(this.y, height/2, height, 50, 230));
    //vertex(0, height);
    for(PVector v : this.vertices){
      vertex(v.x, 100+v.y);
    }
    //vertex(width, height);
    endShape();
  }
}

ArrayList<Horizon> horizons;

void setup() {
  size(600, 600);
  horizons = new ArrayList<Horizon>();
  for (float y = height/2; y < height; y += 5) {
    Horizon h = new Horizon(y, 50, map(y, height/2, height, 30, 0), map(y, height/2, height, minspeed, maxspeed));
    horizons.add(h);
  }
  noFill();
  stroke(230);
  frameRate(60);
}

void draw() {
  background(0);
  for(Horizon h: horizons){
    h.update();
    h.Draw();
  }
}
