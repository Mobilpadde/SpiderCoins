class ArrowThread extends Thread{
  Arrow arrow;
  PVector lerpTo;
  float last;
  
  ArrowThread(Arrow a, PVector l){
    arrow = a;
    lerpTo = l;
    last = millis();
  }
  
  void run(){
    while(true){
      if(millis() - last > 1000 / 60){
        arrow.location.lerp(lerpTo, 0.002);
        last = millis();
      }
    }
  }
}