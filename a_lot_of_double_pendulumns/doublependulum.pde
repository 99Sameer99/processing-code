class doublependulum {
  float rratio = .5; // r2 / r1
  float r1 = 250;
  float r2 = r1 * rratio;
  float mratio = 1; // m2 / m1
  float m1 = 5;
  float m2 = m1 * mratio;
  float theta1;
  float theta2;
  float theta1_v;
  float theta2_v;
  float g;
  float damp = 1;

  doublependulum(float t1, float t2, float t1v, float t2v, float gravity) {
    theta1 = t1;
    theta2 = t2;
    theta1_v = t1v;
    theta2_v = t2v;
    g = gravity;
  }

  void update() {
    float den = 2*m1 + m2 - m2*cos(2*theta1 - 2*theta2);

    float t1num1 = -g * (2*m1 + m2) * sin(theta1);// theta1 numerator part 1
    float t1num2 = -m2 * g * sin(theta1 - 2*theta2);
    float t1num3 = -2 * sin(theta1 - theta2) * m2;
    float t1num4 = theta2_v*theta2_v*r2 + theta1_v*theta1_v*r1*cos(theta1 - theta2);
    float theta1_a = (t1num1 + t1num2 + t1num3*t1num4) / (r1 * den);

    float t2num1 = 2 * sin(theta1 - theta2);
    float t2num2 = theta1_v * theta1_v * r1 * (m1 + m2);
    float t2num3 = g * (m1 + m2) * cos(theta1);
    float t2num4 = theta2_v * theta2_v * r2 * m2 * cos(theta1 - theta2);
    float theta2_a = (t2num1 * (t2num2 + t2num3 + t2num4)) / (r2 * den);

    theta1_v += theta1_a;
    theta2_v += theta2_a;
    theta1 += theta1_v;
    theta2 += theta2_v;

    theta1_v *= damp;
    theta2_v *= damp;
  }

  void swing() {
    float x1 = r1 * sin(theta1);
    float y1 = r1 * cos(theta1);

    float x2 = x1 + r2 * sin(theta2);
    float y2 = y1 + r2 * cos(theta2);

    fill(0);
    line(0, 0, x1, y1);
    ellipse(x1, y1, 1, 1);

    line(x1, y1, x2, y2);
    ellipse(x2, y2, 1, 1);
  }
}
