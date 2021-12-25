final int N = 128;
fluid liq;
final int SCALE = 5;
float t = 0;

void settings(){
  size(N*SCALE, N*SCALE);
}

void setup(){
  liq = new fluid(0.1, 0, 0.000000000000001);
}

void draw(){
  background(0);
  liq.addDensity(int(0.5*width/SCALE), int(0.5*height/SCALE), 500);
  float angle = noise(t) * TWO_PI * 2;
  PVector v = PVector.fromAngle(angle);
  v.mult(0.2);
  liq.addVelocity(int(0.5*width/SCALE), int(0.5*height/SCALE), v.x, v.y);
  t += 0.01;
  liq.step();
  liq.renderD();
  liq.renderV();
  liq.fadeD();
}

//void mouseDragged(){
//  liq.addDensity(mouseX/SCALE, mouseY/SCALE, 100);
//  float amtx = mouseX - pmouseX;
//  float amty = mouseY - pmouseY;
//  liq.addVelocity(mouseX/SCALE, mouseY/SCALE, amtx, amty);
//}
