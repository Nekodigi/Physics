Projectile proj;
float g = -9.8;
float v0 = 100;
float dt = 0.1;

void setup(){
  size(700, 700);
  strokeWeight(20);
  proj = new Projectile(new PVector(100, 350), new PVector(600, 200), v0);
}

void draw(){
  background(255);
  proj.update();
  proj.show();
  
}

void mousePressed(){
  proj = new Projectile(new PVector(100, 350), new PVector(mouseX, mouseY), v0);
}