ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Spring> springs = new ArrayList<Spring>();
float dt = 0.005;
float drag = 0.01;
Node A;

void setup() {
  //fullScreen();
  size(1000, 1000);
  A = new Node(0, 0);
  Node prevNode = A;
  nodes.add(A);
  for (int i = 1; i < 20; i++) {
    Node node = new Node(0, i*30);
    nodes.add(node);
    Spring spring = new Spring(prevNode, node, 100);
    springs.add(spring);
    prevNode = node;
  }
  A = prevNode;
}

void draw() {
  background(255);
  strokeWeight(1);
  for (int i = 0; i < 30; i++) {
    A.pos = new PVector(mouseX, mouseY);//loking A position
    for (Node node : nodes) {
      node.update();
    }
    for (Spring spring : springs) {
      spring.update();
    }
  }
  for (Node node : nodes) {
    node.show();
  }
  for (Spring spring : springs) {
    spring.show();
  }
}
