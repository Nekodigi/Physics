Rail L, R;
Wheel wheel;
int res = 100;
float speed = 5;

void setup(){
  //size(1000, 1000);
  fullScreen();
  L = new Rail();
  PVector prevPos = new PVector(height-200, 0);
  for(int i=1; i<=res; i++){
    float theta = map(i, 0, res, 0, HALF_PI);
    PVector pos = PVector.fromAngle(theta).mult(height-200);
    L.edges.add(new Edge(pos.x, pos.y, prevPos.x, prevPos.y));
    prevPos = pos;
  }
  R = new Rail();
  prevPos = new PVector(height-100, 0);
  for(int i=1; i<=res; i++){
    float theta = map(i, 0, res, 0, HALF_PI);
    PVector pos = PVector.fromAngle(theta).mult(height-100);
    R.edges.add(new Edge(pos.x, pos.y, prevPos.x, prevPos.y));
    prevPos = pos;
  }
  wheel = new Wheel(height-300, 50, height-50, 50, 50);
  strokeWeight(5);
  //frameRate(1);
  background(0);
}

void draw(){
  //background(255);
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  stroke(255);
  fill(0);
  L.show();
  R.show();
  wheel.show();
  wheel.update();
}

class Wheel{
  PVector A, B;
  float r, wl;//radius wheel length
  
  Wheel(float x1, float y1, float x2, float y2, float r){
    A = new PVector(x1, y1);
    B = new PVector(x2, y2);
    wl = PVector.dist(A, B);
    this.r = r;
  }
  
  void update(){
    PVector interL = null;
    PVector interR = null;
    for(Edge e : L.edges){
      PVector t = intersection(A, B, e.A, e.B, true);
      if(t != null){interL = t;}
    }
    for(Edge e : R.edges){
      PVector t = intersection(A, B, e.A, e.B, true);
      if(t != null){interR = t;}
    }
    
    float dstL = PVector.dist(A, interL);
    if(dstL > wl/2) dstL = wl - dstL;//use smaller dist to A or B
    float Lr = dstL/wl*r*2;
    ellipse(interL.x, interL.y, Lr*2, Lr*2);
    float dstR = PVector.dist(B, interR);
    if(dstR > wl/2) dstR = wl - dstL;//use smaller dist to A or B
    float Rr = dstR/wl*r*2;
    ellipse(interR.x, interR.y, Rr*2, Rr*2);
    //calculate movement axis of rotation
    float x = wl*Rr/(Lr-Rr);//distance between intersection and axis of rotation
    float theta = atan2(B.y-A.y, B.x-A.x);
    float dtheta = -speed/x;
    if(Lr > Rr){
      PVector aor = PVector.add(interR, PVector.fromAngle(theta).mult(x));//axis of rotation
      float dstB_aor = PVector.dist(B, aor);
      //ellipse(aor.x, aor.y, 10, 10);
      PVector newB = PVector.add(aor, PVector.fromAngle(theta+dtheta).mult(-dstB_aor));
      //ellipse(newB.x, newB.y, Rr, Rr);
      PVector newA = PVector.add(aor, PVector.fromAngle(theta+dtheta).mult(-dstB_aor-wl));
      //ellipse(newA.x, newA.y, Lr, Lr);
      A = newA;
      B = newB;
    }
    else{x = wl*Lr/(Rr-Lr);
      PVector aor = PVector.add(interL, PVector.fromAngle(theta).mult(-x));//axis of rotation
      float dstA_aor = PVector.dist(A, aor);
      //ellipse(aor.x, aor.y, 10, 10);
      PVector newB = PVector.add(aor, PVector.fromAngle(theta+dtheta).mult(dstA_aor+wl));
      //ellipse(newB.x, newB.y, Rr, Rr);
      PVector newA = PVector.add(aor, PVector.fromAngle(theta+dtheta).mult(dstA_aor));
      //ellipse(newA.x, newA.y, Lr, Lr);
      A = newA;
      B = newB;
    }
  }
  
  void show(){
    line(A.x, A.y, B.x, B.y);
    PVector mid = PVector.add(A, B).div(2);
    PVector normal = PVector.sub(A, B).normalize().rotate(HALF_PI);
    beginShape();
    vertex(A.x, A.y);
    PVector nu = PVector.add(mid, PVector.mult(normal, r));
    vertex(nu.x, nu.y);
    vertex(B.x, B.y);
    PVector nd = PVector.add(mid, PVector.mult(normal, -r));
    vertex(nd.x, nd.y);
    endShape(CLOSE);
  }
}

class Rail{
  ArrayList<Edge> edges = new ArrayList<Edge>();
  
  Rail(){}
  
  Rail(float x1, float y1, float x2, float y2){
    Edge e = new Edge(x1, y1, x2, y2);
    edges.add(e);
  }
  
  void show(){
    for(Edge e : edges){
      e.show();
    }
  }
}

class Edge{
  PVector A, B;
  
  Edge(float x1, float y1, float x2, float y2){
    A = new PVector(x1, y1);
    B = new PVector(x2, y2);
  }
  
  void show(){
    line(A.x, A.y, B.x, B.y);
  }
}
