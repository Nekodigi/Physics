class Star{
  PVector pos, vel;
  float r, mass;
  boolean broken;
  
  Star(){
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-initVel, initVel), random(-initVel, initVel));
    r = startR;
    mass = r*r*PI*starDens;
  }
  
  void update(ArrayList<Star> others){
    if(broken)return;
    for(Star other : others){
      if(other != this && !other.broken){
        PVector diff = PVector.sub(other.pos, pos);
        float sqrDst = diff.x*diff.x + diff.y*diff.y;
        float f = G*other.mass*mass/(sqrDst);
        if(r>=other.r && sqrDst < ((r+other.r)/2)*((r+other.r)/2)){//when collide update mass and velocity
          vel = PVector.mult(vel, mass).add(PVector.mult(other.vel, other.mass)).div(mass+other.mass);
          r = sqrt(r*r+other.r*other.r);
          other.broken = true;
          mass = r*r*PI*starDens;
        }
        vel.add(diff.setMag(f));
      }
    }
    pos = PVector.lerp(pos, new PVector(width/2, height/2), centerAttr);
    pos.add(vel);
    vel.mult(1-drag);
  }
    
  void show(){
    if(!broken)ellipse(pos.x, pos.y, r, r);
  }
}
