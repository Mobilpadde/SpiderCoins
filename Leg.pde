class Leg{
  PVector location, to;
  float len;
  
  Leg(PVector location, float len){
    this.location = new PVector(location.x + random(-len, len), location.y + random(-len, len));
    this.len = len;
  }
  
  void Draw(color col, PVector loc){
    stroke(col);
    line(location.x, location.y, loc.x, loc.y);
  }
  
  void MoveTo(PVector loc){ // Lerp to to new location (Thread)
    to = new PVector(
      loc.x + (location.x < loc.x ? random(len / 2, len) : random(-len, -len / 2)),
      loc.y + (location.y < loc.y ? random(len / 2, len) : random(-len, -len / 2))
    );
    
    new LegThread(this).start();
  }
}