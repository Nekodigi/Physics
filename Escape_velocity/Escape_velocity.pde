float R = 100;//earth radius
float M = 100;//earth mass
float G = 1;
Obj Earth, Moon;

void setup(){
  size(500, 500);
  Earth = new Obj(new PVector(width/2, height/2), new PVector(), R, M);
  float v1 = sqrt(G*M/R);println(v1);
  float v2 = v1*sqrt(2);println(v2);
  Moon = new Obj(new PVector(width/2, height/2-R), new PVector(v1, 0), 10, 1);
  noStroke();
}

void draw(){
  background(0);
  Moon.update();
  Earth.show();
  Moon.show();
}

class Obj{
  PVector pos, vel, acc = new PVector();
  float mass;
  float r;
  
  Obj(PVector pos, PVector vel, float r, float mass){
    this.pos = pos;
    this.vel = vel;
    this.r = r;
    this.mass = mass;
  }
  
  void update(){
    PVector diff = PVector.sub(Earth.pos, pos);
    float sqDst = diff.x*diff.x + diff.y*diff.y;
    acc.add(PVector.mult(diff.normalize(), G*Earth.mass*mass/(sqDst)));
    vel.add(acc);
    pos.add(vel);
    acc = new PVector();
  }
  
  void show(){
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
