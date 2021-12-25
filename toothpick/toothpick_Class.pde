class Toothpick {
  int ax, ay, bx, by;
  int dir;
  int len = 23;
  boolean newpick = true;
  Toothpick(int x, int y, int d){
    dir = d;
    if(dir == 1){
      ax = x - len/2;
      bx = x + len/2;
      ay = y;
      by = y;
    }else {
      ax = x;
      bx = x;
      ay = y - len/2;
      by = y + len/2;
    }
  }
  
  boolean intersects(int x, int y){
    if(ax == x && ay == y){ return true; }
    else if(bx == x && by == y){ return true; }
    else{ return false; }
  }
  
  ArrayList<Toothpick> create(ArrayList<Toothpick> others){
    ArrayList<Toothpick> newpicks = new ArrayList<Toothpick>();
    boolean ata = true;
    boolean atb = true;
    for(Toothpick other : others){
      if(other != this && other.intersects(ax, ay)){
        ata = false;
      }
      if(other != this && other.intersects(bx, by)){
        atb = false;
      }
      if(ata == false && atb == false){ break; }
    }
    if(ata){
      newpicks.add(new Toothpick(ax, ay, dir*-1));
    }
    if(atb){
      newpicks.add(new Toothpick(bx, by, dir*-1));
    }
    return newpicks;
  }
  
  void show(float factor){
    stroke(0);
    if(newpick){ stroke(0, 0, 255); }
    strokeWeight(1/factor);
    line(ax, ay, bx, by);
  }
}
