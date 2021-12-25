PGraphics canvas;
ArrayList<doublependulum> dp;
void setup() {
  size(1000, 800);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
  dp = new ArrayList<doublependulum>();
  for (int i = 1; i < 2500; i++) {
    //dp.add(new doublependulum( random(PI/2, PI/2 + 0.2), random(PI/2, PI/2 + 0.2), 0, 0, 1));
    dp.add(new doublependulum( PI/2, PI/2, 0, 0, random(.9, 1.1)));
  }
}

void draw() {

  for (doublependulum p : dp) {
    p.update();
  }
  image(canvas, 0, 0);
  translate(width/2, height/2);
  stroke(255, 215, 0);
  strokeWeight(0.1);
  for (doublependulum p : dp) {
    p.swing();
  }
}
