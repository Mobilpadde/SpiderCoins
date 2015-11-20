class LegThread extends Thread{
  Leg leg;
  float last;
  
  LegThread(Leg l){
    leg = l;
    last = millis();
  }
  
  void run(){
    PVector sub = PVector.sub(leg.location, leg.to);
    float magnitude = sub.mag();
    
    while(magnitude > 1){
      sub = PVector.sub(leg.location, leg.to);
      magnitude = sub.mag();
      
      if(millis() - last > 1000 / 60){
        leg.location.lerp(leg.to, 0.15);
        last = millis();
      }
    }
  }
}