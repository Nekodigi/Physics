class Node{
  PVector pos, vel = new PVector(), f = new PVector();
  float mass = 1;
  
  Node(float x, float y){
    this.pos = new PVector(x, y);
  }
  
  void update(){
    vel.add(PVector.mult(f,dt/mass));
    pos.add(PVector.mult(vel, dt));
    f = new PVector();
    vel.mult(1-drag);
  }
  
  void show(){
    ellipse(pos.x, pos.y, 50, 50);
  }
}
