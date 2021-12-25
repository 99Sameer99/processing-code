import processing.pdf.*;

void setup() {
  size(1200, 600);
  //beginRecord(PDF, "collatz_visual.pdf");
  background(0);
  float len = 8;
  float angle = 0.15;
  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    //visualization start
    resetMatrix();
    translate(width/2, height);
    for (int j = 0; j < sequence.size(); j++) {
      int val = sequence.get(j);
      if ( val % 2 == 0 ) { 
        rotate(angle);
      } else { 
        rotate(-angle);
      }
      stroke(255, 50);
      strokeWeight(2);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
  //endRecord();
}

void draw() {
}


int collatz(int n) {
  if (n % 2 == 0) {
    return n / 2;
  } else {
    return (3*n + 1)/2;
  }
}
