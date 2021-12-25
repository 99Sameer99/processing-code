class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed = 4;
  PVector prevpos;
  int w = 2;

  Particle(PVector p, PVector v, PVector a) {
    pos = p;
    prevpos = pos.copy();
    vel = v;
    acc = a;
  }
  
  void updateprevpos(){
    prevpos.x = pos.x;
    prevpos.y = pos.y;
  }

  void follow(PVector[][] field) {
    int x = floor(this.pos.x / w);
    int y = floor(this.pos.y / w);
    x = constrain(x, 0, field[0].length - 1);
    y = constrain(y, 0, field.length - 1);
    PVector force = field[x][y];
    this.applyforce(force);
  }

  void edges() {
    if (pos.x > width) { 
      pos.x = 0;
      this.updateprevpos();
    }
    if (pos.x < 0) { 
      pos.x = width;
      this.updateprevpos();
    }
    if (pos.y < 0) { 
      pos.y = height;
      this.updateprevpos();
    }
    if (pos.y > height) { 
      pos.y = 0;
      this.updateprevpos();
    }
  }

  void update() {
    this.vel.add(this.acc);
    this.vel.limit(maxSpeed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void applyforce(PVector force) {
    this.acc.add(force);
  }

  void show() {
    stroke(0, 5);
    //stroke(map(this.vel.mag(), 0, maxSpeed, 0, 255), 0, 0, 5);
    strokeWeight(3);
    //point(this.pos.x, this.pos.y);
    line(pos.x, pos.y, prevpos.x, prevpos.y);
    this.updateprevpos();
  }
}
