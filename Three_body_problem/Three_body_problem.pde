float scale = 200;
float dt = 0.03;
float g = 1;
Object[] objects = new Object[3];

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  objects[0] = new Object(0.97000436, -0.243087530, 0.4662036850, 0.4323657300);
  objects[1] = new Object(0.00000000, 0.0000000000, -0.93240737, -0.86473146);
  objects[2] = new Object(-0.97000436, 0.243087530, 0.4662036850, 0.4323657300);
  background(360);
}

void draw(){
  fill(360, 50);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  PVector s = PVector.sub(objects[0].pos, objects[1].pos);
  float t = s.mag();
  objects[0].f.add(PVector.mult(s, -g*objects[1].mass/(t*t*t)));
  s = PVector.sub(objects[0].pos, objects[2].pos);
  t = s.mag();
  objects[0].f.add(PVector.mult(s, -g*objects[2].mass/(t*t*t)));
  s = PVector.sub(objects[1].pos, objects[2].pos);
  t = s.mag();
  objects[1].f.add(PVector.mult(s, -g*objects[2].mass/(t*t*t)));
  s = PVector.sub(objects[1].pos, objects[0].pos);
  t = s.mag();
  objects[1].f.add(PVector.mult(s, -g*objects[0].mass/(t*t*t)));
  s = PVector.sub(objects[2].pos, objects[0].pos);
  t = s.mag();
  objects[2].f.add(PVector.mult(s, -g*objects[0].mass/(t*t*t)));
  s = PVector.sub(objects[2].pos, objects[1].pos);
  t = s.mag();
  objects[2].f.add(PVector.mult(s, -g*objects[1].mass/(t*t*t)));
  for(Object object : objects){
    object.update();
    object.show();
  }
}
