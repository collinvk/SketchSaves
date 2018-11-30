
import processing.video.*;
Movie vid;
String movieName = "IMG_1935";
String movieFormat = ".MP4";

PImage canvas;

void setup() {
  
  //size( 1920, 1080 );
  fullScreen();
  vid = new Movie(this, movieName + movieFormat); 
 frameRate(24);
  
  vid.play();
  vid.volume(0);

 
}

void draw() {
  
vid.speed(1);

background(250);
  
  vid.loadPixels();
 

   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<150000; ++i) {

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
    rect (mapx,mapy, random(50,50),random(50,50));
    
    
  }
  

    
  vid.updatePixels();
 filter(BLUR,3);
 String hash = "794dd60";
 

 String fileName = hash + "-DishesWithSquares\\";
 saveFrame("Exports\\" + fileName + "-######.tif" + movieName);
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
