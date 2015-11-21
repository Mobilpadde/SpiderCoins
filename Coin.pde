class Coin{
  float size, mass, topSpeed;
  PVector location, velocity, acceleration;
  
  Coin(){
    size = 12;
    mass = size * 2;
    topSpeed = 0.4;
    
    location = PVector.random2D();
    location.x = map(location.x, -1, 1, 0, width - size / 2);
    location.y = map(location.y, -1, 1, 0, height - size / 2);
    
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void Draw(){
    noStroke();
    fill(255, 215, 0);
    ellipse(location.x, location.y, size, size);
  }
  
  void ApplyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void Move(){
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void KeepInView(){
    location.x = constrain(location.x, size / 2, width - size / 2);
    location.y = constrain(location.y, size / 2, height - size / 2);
  }
  
  boolean PickUp(PVector spider){
    float magnitude = PVector.sub(location, spider).mag();
    return (magnitude < size / 2 ? true : false);
  }
}