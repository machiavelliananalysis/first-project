 
int a = 0;
int b = 8;
int c = 5;
  
void setup(){  
  size(500,500);
  frameRate(3);
  noLoop();
}

void draw(){
a = a + c / 2;
println(a);
}
