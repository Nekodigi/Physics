class Projectile{
  float v0;
  float theta;
  PVector v = new PVector();
  PVector pos = new PVector();
  PVector p0;
  float x;
  float h;
  
  Projectile(PVector pos, PVector epos, float v0){
    this.pos = pos;
    p0 = pos.copy();
    this.v0 = v0;
    this.x = epos.x - pos.x;
    this.h = pos.y - epos.y;
    AcalcTheta();
    firing();
  }
  
  void AcalcTheta(){//different height. based on this site https://www.youtube.com/watch?v=3UYjw30h0jU
    float num = v0*v0-sqrt(pow(v0, 4) - g*(g*x*x + 2*h*v0*v0));
    theta = atan(num/(g*x));
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
    point(p0.x+x, height-p0.y-h);
  }
}