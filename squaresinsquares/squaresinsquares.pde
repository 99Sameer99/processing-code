import com.hamoid.*;
VideoExport video;

float angle = 0;
Square[] squares;

void setup(){
  size(600, 600);
  squares = new Square[12];
  for(int i = 0; i < squares.length; i++){
    squares[i] = new Square(new PVector(0, 0), 1 + i/2.0, 10 * pow(2, i/2.0));
  }
  video = new VideoExport(this, "Saquara-b&w.mp4");
  video.setFrameRate(30);
  video.startMovie();
}

void draw(){
  background(#f1f1f1);
  translate(width/2, height/2);
  for(int i = squares.length-1; i >= 0; i--){
    squares[i].show(angle);
  }
  video.saveFrame();
  angle += 0.01;
}

void keyPressed() {
  if (key == 'q') {
    video.endMovie();
    exit();
  }
}
