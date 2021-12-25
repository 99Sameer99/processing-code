float angle = 0;
Square[] squares;

void setup(){
  size(600, 600);
  colorMode(HSB);
  squares = new Square[40];
  for(int i = 0; i < squares.length; i++){
    squares[i] = new Square(new PVector(0, 0), map(i, 0, squares.length-1, 0.1, 2.1), map(i, 0, squares.length + 5, 10, width));
  }
}

void draw(){
  background(#000000);
  translate(width/2, height/2);
  for(int i = squares.length-1; i >= 0; i--){
    squares[i].show(angle, i);
  }
  angle += 0.01;
}
