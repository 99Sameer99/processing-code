class Thing{
  PVector c;
  float R;
  float omega;
  float nov = 6;
  
  Thing(PVector center, float angularvel, float radius){
    c = center;
    omega = angularvel;
    R = radius;
  }
  
  void show(float angle){
    // claculating vertices co-ordinates
    stroke(0);
    strokeWeight(2);
    //noFill();
    fill(random(360), 255, 255);
    beginShape();
    for(int i = 0; i <= TWO_PI; i += TWO_PI/nov){
      float r = this.R + random(-1, 1);
      r = constrain(r, this.R-10, this.R+10);
      vertex(this.c.x + r * cos(i + angle*omega), this.c.y + r * sin(i + angle*omega));
    }
    endShape(CLOSE);
  }
}
