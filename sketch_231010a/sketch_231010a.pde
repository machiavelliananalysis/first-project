int mijnGetal;

void setup(){
  size(500,500);
  frameRate(2);
  mijnGetal = 5;
  loop();
  
}


void draw(){
  mijnGetal++;
  println(mijnGetal);
}
