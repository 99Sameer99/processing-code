float angle = 0;
ArrayList<Sierpinski3d> thing;

void addAll(Sierpinski3d[] arr, ArrayList<Sierpinski3d> list){
  for(Sierpinski3d s : arr){
    list.add(s);
  }
}

void setup() {
  size(900, 900, P3D);
  thing = new ArrayList<Sierpinski3d>();
  float ol = 800;
  PVector p1 = new PVector(0, -ol/sqrt(2), 0);
  Sierpinski3d pyramid = new Sierpinski3d(p1, ol);
  thing.add(pyramid);
}

void mousePressed(){
  ArrayList<Sierpinski3d> nextthing = new ArrayList<Sierpinski3d>();
  for(Sierpinski3d s: thing){
    Sierpinski3d[] children = s.generate();
    addAll(children, nextthing);
  }
  thing = nextthing;
}

void draw() {
  background(0);
  translate(width/2, height/2);
  lights();
  //directionalLight(255, 255, 255, 1000, 1000, 1000);
  camera(700, -700, 700, 0, 0, 0, 0, 1, 0);
  //camera(0, -700, 0, 0, 0, 0, 1, 1, 0);
  //ortho();
  rotateY(angle);
  //strokeWeight(4);
  //stroke(255, 0, 0); //y red
  //line(0, 0, 0, 0, 500, 0);
  //stroke(0, 255, 0);// x green
  //line(0, 0, 0, 500, 0, 0);
  //stroke(0, 0, 255);// z blue
  //line(0, 0, 0, 0, 0, 500);

  for (Sierpinski3d p : thing) {
    p.show();
  }

  angle += 0.01;
}
