ArrayList<boid> flock;

void setup(){
  size(800, 800);
  flock = new ArrayList<boid>();
  for(int i = 0; i < 200; i++){
    flock.add(new boid());
  }
}

void draw(){
  background(0);
  for(boid b: flock){
    b.edges();
    b.flock(flock);
    b.show();
    b.update();
  }
}
