class Square{
  PVector c;
  float side;
  float omega;
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  float d;
  
  Square(PVector center, float angularvel, float sideLength){
    c = center;
    omega = angularvel;
    side = sideLength;
    d = (side / sqrt(2));
  }
  
  void show(float theta){
    // claculating vertices co-ordinates
    float rot = this.omega * theta;
    float shift1 = cos(rot) * this.d;
    float shift2 = sin(rot) * this.d;
    p1 = new PVector(c.x - shift1, c.y - shift2);
    p2 = new PVector(c.x + shift1, c.y + shift2);
    p3 = new PVector(c.x - shift2, c.y + shift1);
    p4 = new PVector(c.x + shift2, c.y - shift1);
    // drawing square
    stroke(0);
    strokeWeight(2);
    fill(p1.x + width/2);
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p3.x, p3.y);
    vertex(p2.x, p2.y);
    vertex(p4.x, p4.y);
    endShape(CLOSE); 
  }
  
  
}
