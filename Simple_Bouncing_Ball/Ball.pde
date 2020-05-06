class Ball{
  PVector pos, vel, acc = new PVector();
  
  Ball(PVector pos){
    this.pos = pos;
    vel = PVector.fromAngle(random(TWO_PI)).mult(initVel);
  }
  
  void update(){
    acc.add(new PVector(0, g));
    vel.add(acc.mult(dt));
    pos.add(PVector.mult(vel, dt));
    //boundary condition
    if(pos.x < 0 || pos.x > width){
      //pos.x = constrain(pos.x, 0, width);
      vel.x = -vel.x;
    }
    if(pos.y < 0 || pos.y > height){
      //pos.y = constrain(pos.y, 0, height);
      vel.y = -vel.y;
    }
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
      pos.add(PVector.mult(vel, dt));
    }
    acc = new PVector();
  }
  
  void show(){
    ellipse(pos.x, pos.y, 100, 100);
  }
}
