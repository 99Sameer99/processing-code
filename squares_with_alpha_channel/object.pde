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
  
  void show(float theta, int i){
    // claculating vertices co-ordinates
    float rot = this.omega * theta;
    float shift1 = cos(theta) * cos(rot) * this.d;
    float shift2 = cos(0) * sin(rot) * this.d;
    p1 = new PVector(c.x - shift1, c.y - shift2);
    p2 = new PVector(c.x + shift1, c.y + shift2);
    p3 = new PVector(c.x - shift2, c.y + shift1);
    p4 = new PVector(c.x + shift2, c.y - shift1);
    // drawing square
    //stroke(0);
    noStroke();
    //strokeWeight(2);
    //fill(map(this.side, 10, width*8/9, 50, 100), 255, 255, map(this.side, 10, width*8/9, 50, 60));
    fill(210, map(this.side, 10, width*8/9, 0, 255), 360, map(this.side, 10, width*8/9, 50, 60));
    beginShape();
    vertex(p1.x, p1.y);
    vertex(p3.x, p3.y);
    vertex(p2.x, p2.y);
    vertex(p4.x, p4.y);
    endShape(CLOSE); 
  }
  
  
}
