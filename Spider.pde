class Spider{
  PVector location, velocity, acceleration;
  float size, mul, topSpeed;
  color col;
  
  Leg[] legs;
  
  
  Spider(float s){
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    size = s;
    mul = 3;
    topSpeed = 0.7;
    
    col = color(random(0, 50));
    
    legs = new Leg[8];
    for(int i = 0, len = legs.length; i < len; i++) legs[i] = new Leg(location, size * mul);
  }
  
  void Draw(){
    fill(col);
    
    for(int i = 0, len = legs.length; i < len; i++){
      legs[i].Draw(col, location);
      if(
        legs[i].location.x > location.x + size * mul ||
        legs[i].location.x < location.x - size * mul ||
        legs[i].location.y > location.y + size * mul ||
        legs[i].location.y < location.y - size * mul
      ) legs[i].MoveTo(location);
    }
    
    ellipse(location.x, location.y, size, size);
  }
  
  void ApplyForce(PVector force){
    PVector f = PVector.div(force, size);
    acceleration.add(f);
  }
  
  void Move(FloatDict movement){
    PVector movementVector = new PVector(movement.get("left"), movement.get("up"));
    movementVector.add(movement.get("right"), movement.get("down"));
    
    acceleration.add(movementVector);
    velocity.add(acceleration);
    velocity.limit(0.5);
    
    //if(movement.get("up") == 0 && movement.get("down") == 0) velocity.y = 0;
    //if(movement.get("left") == 0 && movement.get("right") == 0) velocity.x = 0;
    
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void KeepInView(){
    location.x = constrain(location.x, size / 2, width - size / 2);
    location.y = constrain(location.y, size / 2, height - size / 2);
  }
}