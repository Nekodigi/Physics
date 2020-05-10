class Object{
  PVector pos, vel, f = new PVector();
  float mass;
  
  Object(float x, float y, float vx, float vy){
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    mass = 1;
  }
  
  void update(){
    vel.add(f.div(mass/dt));
    pos.add(PVector.mult(vel, dt));
    f = new PVector();
  }
  
  void show(){
    fill(0, vel.mag()*100-50, 100);
    ellipse(pos.x*scale, pos.y*scale, 50, 50);
  }
}
