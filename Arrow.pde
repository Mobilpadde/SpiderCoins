class Arrow{
  PVector wind, location;
  ArrowThread aT;

  Arrow(PVector w){
    wind = w;

    PVector fakeWind = wind.copy();
    fakeWind.y *= -1;
    location = PVector.sub(fakeWind, new PVector()); 
    location.normalize();
    
    aT = new ArrowThread(this, new PVector());
    aT.start();
  }
  
  void SetWind(PVector w){
    wind = w;
  }

  void Draw(){
    pushMatrix();
    translate(width - 25 + location.x / 2, height - 25 + location.y / 2);

    noStroke();
    fill(0);
    rotate(atan2(location.x, location.y));
    ellipse(location.x, location.y, 10, 10);
    triangle(location.x - -5, location.y + 0, location.x - 5, location.y + 0, location.x - 0, location.y - 10);
    popMatrix();
    
    PVector fakeWind = wind.copy();
    fakeWind.y *= -1;
    fakeWind.normalize();
    PVector lerpTo = PVector.sub(fakeWind, new PVector()); 
    aT.lerpTo = lerpTo;
  }
}