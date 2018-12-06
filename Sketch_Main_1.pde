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

  //String[] lines = loadStrings(".git/ORIG_HEAD");
  //print(lines);
 
}

void draw() {
  
vid.speed(1);

background(250);
  
  vid.loadPixels();
 

   
   if (vid.pixels.length <= 0) { return; }
 
  for (int i=0; i<100000; ++i) {

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
  
    
    //rect (mapx,mapy, random(20,5),random(5,20));
    
    
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
 String hash = "-794dd60-";
 String fileName = "-TestsForRepository5-" ;
 

 String folderName = hash + "-fileName\\";
 saveFrame("Exports\\" + folderName + fileName+movieName + "-######.tif" );
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
