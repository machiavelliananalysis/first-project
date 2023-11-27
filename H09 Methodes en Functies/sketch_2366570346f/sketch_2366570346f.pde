

void setup(){
size(600,600);
vierkant(500,300,40,40);
}

void draw(){

}

void vierkant(int x,int y,int w,int h){
 
  ellipse(x - 0,y,w,h);
  ellipse(x - 10,y,w,h);
  ellipse(x - 20,y,w,h);
  ellipse(x - 30,y,w,h);
  ellipse(x - 40,y,w,h);
}
