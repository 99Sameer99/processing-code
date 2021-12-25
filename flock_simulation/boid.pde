class boid{
  PVector p, v, a;
  float maxForce, maxSpeed;
  boid(){
    p = new PVector(random(200, 600), random(200, 600));
    v = new PVector(random(-3, 3), random(-3, 3));
    a = new PVector(0, 0);
    maxForce = random(1, 2);
    maxSpeed = random(4, 6);
  }
  
  void edges(){
    // for x
    if(this.p.x > width){ this.p.x = 0; }
    else if(this.p.x < 0){ this.p.x = width; }
    // for y
    if(this.p.y > height){ this.p.y = 0; }
    else if(this.p.y < 0){ this.p.y = height; }
  }
  
  PVector align(ArrayList<boid> boids){
    float perception = 50;
    PVector steer = new PVector(0, 0);
    int total = 0;
    for(boid other : boids){
      if(dist(other.p.x, other.p.y, this.p.x, this.p.y) < perception && other != this){
        steer.add(other.v);
        total++;
      }
    }
    if(total > 0){ 
      steer.div(total);
      steer.setMag(this.maxSpeed);
      steer.sub(this.v);
      steer.limit(this.maxForce);
    }
    return steer;
  }
  
  PVector cohesion(ArrayList<boid> boids){
    float perception = 50;
    PVector steer = new PVector(0, 0);
    int total = 0;
    for(boid other : boids){
      if(dist(other.p.x, other.p.y, this.p.x, this.p.y) < perception && other != this){
        steer.add(other.p);
        total++;
      }
    }
    if(total > 0){ 
      steer.div(total);
      steer.sub(this.p);
      steer.setMag(this.maxSpeed);
      steer.sub(this.v);
      steer.limit(this.maxForce);
    }
    return steer;
  }
  
  PVector separation(ArrayList<boid> boids){
    float perception = 50;
    PVector steer = new PVector(0, 0);
    int total = 0;
    for(boid other : boids){
      float d = dist(other.p.x, other.p.y, this.p.x, this.p.y);
      if(d < perception && other != this){
        PVector diff = PVector.sub(this.p, other.p);
        diff.div(d);
        steer.add(diff);
        total++;
      }
    }
    if(total > 0){ 
      steer.div(total);
      steer.setMag(this.maxSpeed);
      steer.sub(this.v);
      steer.limit(this.maxForce);
    }
    return steer;
  }
  
  void flock(ArrayList<boid> boids){
    PVector alignment = this.align(boids);
    PVector cohesion = this.cohesion(boids);
    PVector separation = this.separation(boids);
    this.a.add(alignment);
    this.a.add(cohesion);
    this.a.add(separation);
  }
  
  void update(){
    this.p.add(this.v);
    this.v.add(this.a);
    this.v.limit(this.maxSpeed);
    this.a.set(0, 0);
  }
  
  void show(){
    strokeWeight(2);
    stroke(255);
    float r = map(this.v.mag(), 0, this.maxSpeed, 0, 255);
    float g = map(this.p.x, 0, this.maxSpeed, 0, 255);
    float b = map(this.p.y, 0, this.maxSpeed, 0, 255);
    fill(r, g, b);
    ellipse(this.p.x, this.p.y, 15, 15);
  }
}
