

void setup(){
size(600,600);
}

void draw(){
  background(250,250,250);
  int sizeC = 100;
    for(int i = 0; i < 5; i++ ){
      ellipse(200 - sizeC / 2,200,sizeC,sizeC);
      sizeC-=20;
    
  }

}
