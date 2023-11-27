String a;


void setup(){
  a = b("hello ","world ","here ","we go again");
  println(a);
}

void draw(){
  
}

String b(String c, String d, String e, String f){
 String all = c + d + e + f;
 return(all);
}
