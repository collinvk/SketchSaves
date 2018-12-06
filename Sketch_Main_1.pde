import processing.video.*;
Movie vid;
String movieName = "IMG_1935";
String movieFormat = ".MP4";
String commitName;

PImage canvas;

void setup() {
  
  //size( 1920, 1080 );
  fullScreen();
  vid = new Movie(this, movieName + movieFormat); 
 frameRate(24);
  
  vid.play();
  vid.volume(0);

  String[] lines = loadStrings("../COMMIT_NAME");
  commitName = lines[lines.length - 1];
 
}

void draw() {
  
vid.speed(1);

background(250);
  
  vid.loadPixels();
 

   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<2000; ++i) {

    int x = int(random(vid.width));
    int y = int(random(vid.height));
    int iPix = (x + y * vid.width);

    float r = red(vid.pixels[iPix]);
    float g = green(vid.pixels[iPix]);
    float b = blue(vid.pixels[iPix]);
    color pixel = color(r,g,b,250); 

    noStroke();
    fill( pixel );
    float mapx = map(x,0,vid.width,0,width);
    float mapy = map(y,0,vid.height,0,height);
  
    pushMatrix();
  translate(width/2,height/2);
  rotate(frameCount*radians(90) / 20);
  translate(0, -60);
    rect (mapx,mapy, random(20,5),random(5,20));
    popMatrix();
    
    
  }
  
  for (int i= 0; i<20000;++i){
    
    int xA = int(random(width));
    int yA = int(random(height));
    
   noStroke();
   fill(1);
   rect(xA,yA,random(1,3),random(10,20));
    
  
  }
  

    
  vid.updatePixels();
 filter(BLUR,3);
 String hash = "-" + commitName + " -";
 String fileName = "RotateWholeImageAroundCenter-";
 

 String folderName = fileName + hash;
 saveFrame("Exports\\" + folderName + "\\" + fileName + movieName + "-######.tif" );
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
