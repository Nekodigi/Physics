boolean isIntersect(PVector s1, PVector e1, PVector s2, PVector e2){
  float det0 = (e1.x - s1.x)*(s2.y - e1.y) - (e1.y - s1.y)*(s2.x - e1.x);
  float det1 = (e1.x - s1.x)*(e2.y - e1.y) - (e1.y - s1.y)*(e2.x - e1.x);
  return det0<0 && det1>=0 || det0>=0&&det1<0;
}

PVector intersection(PVector p1s, PVector p1e, PVector p2s, PVector p2e, boolean check) {
  if(check && !isIntersect(p1s, p1e, p2s, p2e))return null;
  float x1 = p1s.x;float y1 = p1s.y;
  float x2 = p1e.x;float y2 = p1e.y;
  float x3 = p2s.x;float y3 = p2s.y;
  float x4 = p2e.x;float y4 = p2e.y;
  float den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
  if (den == 0) {
    return null;
  }
  
  float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
  float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
  if (t > 0 && t < 1 && u > 0) {
    PVector pt = new PVector();
    pt.x = x1 + t * (x2 - x1);
    pt.y = y1 + t * (y2 - y1);
    return pt;
  } else {
    return null;
  }
}
