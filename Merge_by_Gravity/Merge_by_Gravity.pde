float G = 0.0001;//this value is not real value, it's determined for easy simulation
float drag = 0.01;//to collide easily
float startR = 2;//5
float initVel = 3;//20
float starDens = 1;//star density
ArrayList<Star> stars = new ArrayList<Star>();
int starN = 2000;//number of stars
float centerAttr = 0.001;//center attract

void setup(){
  size(500, 500);
  //fullScreen();
  for(int i=0; i<starN; i++){
    stars.add(new Star());
  }
}

void draw(){
  background(255);
  //fill(255, 10);rect(0, 0, width, height);
  fill(0);noStroke();
  for(Star star : stars){
    star.update(stars);
    star.show();
  }
}
