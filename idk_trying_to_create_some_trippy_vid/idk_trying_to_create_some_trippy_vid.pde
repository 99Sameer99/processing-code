import com.hamoid.*;
VideoExport video;

float angle = 0;
float duration = 30;
float movieFPS = 30;

Thing[] things;
Thing[] things1;
Thing[] things2;
Thing[] things3;
Thing[] things4;

void setup() {
  size(600, 600);
  //frameRate(30);
  float ogr = 12;
  float ogm = 10;
  int n = 10;
  things = new Thing[n];
  for (int i = 0; i < things.length; i++) {
    things[i] = new Thing(new PVector(0, 0), 0.5 + i/2.0, ogr + ogm*i);
  }
  things1 = new Thing[n];
  for (int i = 0; i < things1.length; i++) {
    things1[i] = new Thing(new PVector(-width/4, -height/4), 1 + i/2.0, ogr + ogm*i);
  }
  things2 = new Thing[n];
  for (int i = 0; i < things2.length; i++) {
    things2[i] = new Thing(new PVector(width/4, -height/4), 1 + i/2.0, ogr + ogm*i);
  }
  things3 = new Thing[n];
  for (int i = 0; i < things3.length; i++) {
    things3[i] = new Thing(new PVector(-width/4, height/4), 1 + i/2.0, ogr + ogm*i);
  }
  things4 = new Thing[n];
  for (int i = 0; i < things4.length; i++) {
    things4[i] = new Thing(new PVector(width/4, height/4), 1 + i/2.0, ogr + ogm*i);
  }
  colorMode(HSB, 360, 255, 255);
  video = new VideoExport(this, "idk.mp4");
  video.setFrameRate(movieFPS);
  video.startMovie();
}

void draw() {
  background(0);//frameCount%360, 255, 255
  for (int i = 0; i < width; i+=10) {
    for (int j = 0; j < height; j+= 10) {
      fill(map(i+j + 4*frameCount, 0, 1200 + 4*frameCount, 0, 360), 255, 255);
      noStroke();
      rect(i, j, 50, 50);
    }
  }
  translate(width/2, height/2);
  for (int i = things.length-1; i >= 0; i--) {
    things[i].show(angle);
    things1[i].show(angle);
    things2[i].show(angle);
    things3[i].show(angle);
    things4[i].show(angle);
  }
  video.saveFrame();
  angle += 0.01;
  
  if(frameCount > round(movieFPS * duration)){
    video.endMovie();
    exit();
  }
}

//void keyPressed() {
//  if (key == 'q') {
//    video.endMovie();
//    exit();
//  }
//}
