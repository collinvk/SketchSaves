
import processing.video.*;
Movie vid;


PImage canvas;

void setup() {
  
  //size( 1920, 1080 );
  fullScreen();
  vid = new Movie(this,"IMG_1935.MP4"); 
 frameRate(24);
  
  vid.play();
  vid.volume(0);

 
}

void draw() {
  
vid.speed(1);

background(250);
  
  vid.loadPixels();
 
background(500);
   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<20000; ++i) {

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
    
    ellipse ( mapx, mapy, random(50, 50), random(50, 50) );
    
    
  }
  

    
  vid.updatePixels();
 filter(BLUR,3);
 String hash = "aca3d67";
 String fileName = hash + "-WallFlowerTest\\";
 saveFrame("Exports\\" + fileName + "-######.tif");
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
