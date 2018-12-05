
}

void draw() {
  

background(250);

  for (int i=0; i<150000; ++i) {
  Ellipse (random(width),random(height), 50,50)
  }

 String hash = "-794dd60-";
 String fileName = "-DisheswithNoRectButNoise-" 
 

 String folderName = hash + "-fileName\\";
 saveFrame("Exports\\" + folderName + fileName+movieName + "-######.tif" );
  vid.noLoop();
}
void movieEvent(Movie m) {
  m.read();
}
