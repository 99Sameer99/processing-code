Tree tree;
float min_dist = 5;
float max_dist = 100;

void setup() {
  size(800, 800);
  tree = new Tree();
}

void draw() {
  background(#f1f1f1);
  tree.show();
  tree.grow();
}
