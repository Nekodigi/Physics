float g = 0.98;
float dt = 1;
float initVel = 10;
Ball ball;

void setup(){
  size(500, 500);
  ball = new Ball(new PVector(width/2, height/2));
}

void draw(){
  //background(255);
  fill(255, 50);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  ball.update();
  ball.show();
}

void mousePressed(){
  ball = new Ball(new PVector(mouseX, mouseY));
}
