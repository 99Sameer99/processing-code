class Sierpinski3d {
  PVector p1;
  PVector p2;
  PVector p3;
  PVector p4;
  PVector p5;
  float l;
  
  Sierpinski3d (PVector p1_, float l_) {
    p1 = p1_;
    l = l_;
    float h = l / sqrt(2);
    p2 = new PVector(p1.x + l/2, p1.y + h, p1.z + l/2); //p2_;
    p3 = new PVector(p1.x - l/2, p1.y + h, p1.z + l/2); //p3_;
    p4 = new PVector(p1.x - l/2, p1.y + h, p1.z - l/2); //p4_;
    p5 = new PVector(p1.x + l/2, p1.y + h, p1.z - l/2); //p5_;
  }
  
  Sierpinski3d[] generate(){
    Sierpinski3d[] children = new Sierpinski3d[5];
    
    children[0] = new Sierpinski3d(this.p1, this.l/2);
    
    PVector top1 = PVector.add(this.p1, this.p2).div(2); 
    children[1] = new Sierpinski3d(top1, this.l/2);
    
    PVector top2 = PVector.add(this.p1, this.p3).div(2);
    children[2] = new Sierpinski3d(top2, this.l/2);
    
    PVector top3 = PVector.add(this.p1, this.p4).div(2);
    children[3] = new Sierpinski3d(top3, this.l/2);
    
    PVector top4 = PVector.add(this.p1, this.p5).div(2);
    children[4] = new Sierpinski3d(top4, this.l/2);
    
    return children;
  }
  
  void show(){
    //noFill();
    strokeWeight(1);
    stroke(255, 0, 0);
    //noStroke();
    beginShape();
    fill(255);
    vertex(p2.x, p2.y, p2.z);
    vertex(p3.x, p3.y, p3.z);
    vertex(p4.x, p4.y, p4.z);
    vertex(p5.x, p5.y, p5.z);

    vertex(p2.x, p2.y, p2.z);
    vertex(p1.x, p1.y, p1.z);
    vertex(p3.x, p3.y, p3.z);

    vertex(p4.x, p4.y, p4.z);
    vertex(p1.x, p1.y, p1.z);
    vertex(p3.x, p3.y, p3.z);

    vertex(p4.x, p4.y, p4.z);
    vertex(p1.x, p1.y, p1.z);
    vertex(p5.x, p5.y, p5.z);

    vertex(p2.x, p2.y, p2.z);
    vertex(p1.x, p1.y, p1.z);
    vertex(p5.x, p5.y, p5.z);
    endShape(CLOSE);
  }
}
