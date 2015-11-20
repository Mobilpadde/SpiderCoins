Coin[] coins;

Spider spider;

FloatDict movement;
int points;

Wind wind;

void settings(){
  size(500, 500);
}

void setup(){
  noStroke();
  
  coins = new Coin[3];
  for(int i = 0, len = coins.length; i < len; i++) coins[i] = new Coin();
  
  spider = new Spider(random(7, 13));
  
  movement = new FloatDict();
  movement.set("up", 0);
  movement.set("down", 0);
  movement.set("left", 0);
  movement.set("right", 0);
  points = 0;
  
  wind = new Wind();
  
}

void draw(){
  clear();
  background(0, 205, 255);
  
  wind.Update();
  PVector w = wind.wind;
  wind.Draw();
  
  for(int i = 0, len = coins.length; i < len; i++){
    coins[i].Draw();
    coins[i].ApplyForce(w);
    coins[i].Move();
    coins[i].KeepInView();
    if(coins[i].PickUp(spider.location)){
      points++;
      coins[i] = new Coin();
    }
  }
  
  spider.Draw();
  spider.ApplyForce(w);
  spider.Move(movement);
  spider.KeepInView();
  
  fill(255, 255 * 0.9);
  text("Points: " + points, 7, 15);
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP) movement.set("up", -0.1);
    if(keyCode == DOWN) movement.set("down", 0.1);
    
    if(keyCode == LEFT) movement.set("left", -0.1);
    if(keyCode == RIGHT) movement.set("right", 0.1);
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == UP) movement.set("up", 0);
    if(keyCode == DOWN) movement.set("down", 0);
    
    if(keyCode == LEFT) movement.set("left", 0);
    if(keyCode == RIGHT) movement.set("right", 0);
  }
}