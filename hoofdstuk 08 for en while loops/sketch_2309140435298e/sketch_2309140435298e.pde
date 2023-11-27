size(500,500);
background(255,255,255);

int sizeC = 60;

for(int i = 0; i < 5; i++){
  ellipse(250, 250, sizeC,sizeC);
  sizeC = sizeC - 10;
  println("grote: " + sizeC);
}
