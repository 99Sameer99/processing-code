//=================================================================//
//   F+-[]                                                         //
// F --> FF+[+F-F-F]-[-F+F+F] else char stay the same              //
//=================================================================//
// A --> AB and B --> A                                            //
//=================================================================//

String axiom = "F";
String sentence = axiom;
float len = 100;
float angle = PI/10;

void setup() {
  size(900, 900);
}

void draw() {
  turtle();
}

void mousePressed() {
  sentence = applyRule(sentence);
}

String applyRule(String s) {
  len *= 0.6;
  String newsentence = "";
  for (int i = 0; i < s.length(); i++) {
    char letter = s.charAt(i);
    if (letter == 'F') { 
      newsentence += "FF+[+F-F-F]-[-F+F+F]";
    } else {
      newsentence += letter;
    }
  }
  return newsentence;
}


void turtle() {
  resetMatrix();
  translate(width/2, height);
  background(#f1f1f1);
  stroke(0, 100);
  strokeWeight(1);
  for (int i = 0; i < sentence.length(); i++) {
    char current = sentence.charAt(i);
    if (current == 'F') {
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (current == '+') {
      rotate(angle);
    } else if (current == '-') {
      rotate(-angle);
    } else if (current == '[') {
      push();
    } else if (current == ']') {
      pop();
    }
  }
}
