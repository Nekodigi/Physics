class Spring{
  Node A, B;
  float baseLen, len;
  float V, baseThickness;
  float sPow = 1;//spring power
  
  Spring(Node A, Node B, float baseThickness){
    this.A = A;
    this.B = B;
    this.baseThickness = baseThickness;
    this.baseLen = PVector.dist(A.pos, B.pos);
    this.V = baseThickness * baseLen;
  }
  
  void update(){
    PVector diff = PVector.sub(B.pos, A.pos);
    len = diff.mag();
    float lenDiff = min(baseLen, len - baseLen);//limit max force
    A.f.add(PVector.mult(diff, lenDiff*sPow));
    B.f.add(PVector.mult(diff, -lenDiff*sPow));
  }
  
  void show(){
    float thickness = min(baseThickness, V / len);//limit max thickness
    strokeWeight(thickness);
    line(A.pos.x, A.pos.y, B.pos.x, B.pos.y);
  }
}
