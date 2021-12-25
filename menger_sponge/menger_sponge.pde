float a = 0;
Box b;
ArrayList<Box> sponge;

void setup() {
  size(1000, 900, P3D);
  sponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 500);
  sponge.add(b);
}

void draw(){
  background(0);
  noFill();
  lights();
  translate(width/2, height/2);
  rotateX(a);
  rotateY(a + 0.5);
  rotateZ(a + 0.1);
  
  for(Box b : sponge){
    b.show();
  }
  
  a += 0.01;
}

void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box b : sponge){
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}
