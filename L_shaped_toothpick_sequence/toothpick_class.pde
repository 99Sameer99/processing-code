class Toothpick {
  int[][] d = {{0, 1}, {2, 3}};
  int ax, ay, cx, cy, bx, by;
  int dir;
  int len = 55;
  boolean newpick = true;
  Toothpick(int x, int y, int d){
    dir = d;
    if(dir == 0){
      cx = x;
      cy = y;
      ax = x - len/2;
      bx = x;
      ay = y;
      by = y - len/2;
    }else if(dir == 1){
      cx = x;
      cy = y;
      ax = x + len/2;
      bx = x;
      ay = y;
      by = y - len/2;
    }else if(dir == 3){
      cx = x;
      cy = y;
      ax = x + len/2;
      bx = x;
      ay = y;
      by = y + len/2;
    }else if(dir == 2){
      cx = x;
      cy = y;
      ax = x - len/2;
      bx = x;
      ay = y;
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
      int y = dir % 2;
      int x = (dir/2) % 2;
      int newdir = d[x == 0 ? 1 : 0][y];
      newpicks.add(new Toothpick(ax, ay, newdir));
    }
    if(atb){
      int y = dir % 2;
      int x = (dir/2) % 2;
      int newdir = d[x][y == 0 ? 1 : 0];
      newpicks.add(new Toothpick(bx, by, newdir));
    }
    return newpicks;
  }
  
  void show(){
    stroke(255);
    if(newpick){ stroke(0, 0, 255); }
    strokeWeight(1);
    line(ax, ay, cx, cy);
    line(cx, cy, bx, by);
  }
}
