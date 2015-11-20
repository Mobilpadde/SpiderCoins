class Wind{
  float min, max;
  PVector wind;
  Arrow arrow;
  
  Wind(){
    min = -0.01;
    max = min * -1;
    arrow = new Arrow(new PVector());
    Update();
  }
  
  void Update(){
    wind = new PVector(map(noise(frameCount), 0, 1, min, max), map(noise(frameCount), 0, 1, min, max));
    arrow.SetWind(wind.copy());
  }
  
  void Draw(){
    arrow.Draw();
  }
}