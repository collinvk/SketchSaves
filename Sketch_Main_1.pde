
import processing.video.*;
Movie vid;


PImage canvas;

void setup() {
  
  //size( 1920, 1080 );
  fullScreen();
  vid = new Movie(this,"Collage Flowers Wall.MP4"); 
 frameRate(1);
  
  vid.play();
  vid.volume(0);

 
}

void draw() {
  
vid.speed(.02);

background(250);
  
  vid.loadPixels();
 
background(250);
   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<300000; ++i) {

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
    ellipse ( mapx, mapy, random(2, 10), random(4, 2) );
    
    
  }
  

    
  vid.updatePixels();
 filter(BLUR,3);
 
 saveFrame("J:\\PCA\\Code\\Processing\\Sketch_Main_1\\Sketch_Main_1\\Exports\\WallFlowerCollage-######.tif");
  
}
void movieEvent(Movie m) {
  m.read();
}
