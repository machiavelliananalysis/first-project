

void setup(){
size(600,600);

}

void draw(){
  background(0,0,0);
  //rect(100,100,100,100);
  stroke(225,225,225);
  vierkant(260,260,100,100);
}

void vierkant(int x,int y,int w,int h){
 
  line(x,y,x+w,y);
  line(x,y+h,x+w,y+h);
  line(x,y,x,y+h);
  line(x+w,y,x+w,x+h);
}
