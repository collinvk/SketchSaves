import processing.video.*;
Movie vid;
String movieName = ("Plant Light Key 3-21-19");

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
  rectMode(CENTER);
 
}

void draw() {
  
vid.speed(.03);

//background(250);
  
  vid.loadPixels();
 

   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<50000; ++i) {

    int x = int(random(vid.width));
    int y = int(random(vid.height));
    int iPix = (x + y * vid.width);

    float r = red(vid.pixels[iPix]);
    float g = green(vid.pixels[iPix]);
    float b = blue(vid.pixels[iPix]);
    color pixel = color(r,g,b,45); 

    noStroke();
    fill( pixel );
    float mapx = map(x,0,vid.width,0,width);
    float mapy = map(y,0,vid.height,0,height);
  
   
  
  
  
   ellipse (mapx,mapy, random(7,13),random(4,20));
   
  }
  
   for (int i= 0; i<10000;++i){
    
    int xA = int(random(width));
    int yA = int(random(height));
    
   noStroke();
   fill(250,40);
   ellipse(xA,yA,random(15,4),random(15,9));
    
  
  }
  

    
  vid.updatePixels();
 filter(BLUR,2);
 String hash = "-" + commitName + " -";
 String fileName = "plants Light Key 2";
 

 String folderName = fileName + hash;
saveFrame("Exports\\" + folderName + "\\" + fileName + movieName + "-######.tif" );
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
