class Projectile{
  float v0;
  float theta;
  PVector v = new PVector();
  PVector pos = new PVector();
  PVector p0;
  float x;
  
  Projectile(PVector pos, float v0, float x){
    this.pos = pos;
    p0 = pos.copy();
    this.v0 = v0;
    this.x = x;
    calcTheta();
    firing();
  }
  
  void calcTheta(){//based on this site https://www.youtube.com/watch?v=3UYjw30h0jU
    theta = 1./2.*asin(g*x/(v0*v0));
  }
  
  void firing(){
    v = PVector.fromAngle(theta).mult(v0);
  }
  
  void update(){
    v.add(0, -g*dt);
    pos.add(PVector.mult(v, dt));
  }
  
  void show(){
    stroke(0);
    point(pos.x, height-pos.y);
    stroke(255, 0, 0);
    point(p0.x+x, height-p0.y);
  }
}