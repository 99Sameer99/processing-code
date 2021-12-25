ArrayList<Toothpick> picks;
int minx;
int maxx;

void setup(){
  //frameRate(1);
  size(900, 900);
  minx = -width/2;
  maxx = width/2;
  picks = new ArrayList<Toothpick>();
  picks.add(new Toothpick(0, 0, 1));
  //noLoop();
}

//void mousePressed(){
//  redraw();
//}

void draw(){
  //println(picks.size());
  translate(width/2, height/2);
  float factor = float (width) / (maxx - minx + 10);
  scale(factor);
  background(255);
  
  for(Toothpick p : picks){
    p.show(factor);
    minx = min(p.ax, minx);
    maxx = max(p.ax, maxx);
  }
  
  ArrayList<Toothpick> next = new ArrayList<Toothpick>();
  for(Toothpick p : picks){
    if(p.newpick){
      next.addAll(p.create(picks));
      p.newpick = false;
    }
  }
  picks.addAll(next);
}
