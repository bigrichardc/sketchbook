float Gx = 0;
float Gy = 0;
color px;

float redvalue = 0;
float bluevalue = 0;
float greenvalue = 0;

float intensity = 0;

float glength = 0;
int prevglength = 0;

size(375,500);

int[] pixelarray = new int[width*height];
      
  PImage img = loadImage("richard2.jpg");
  image(img,0,0);
  
  loadPixels();
  
  // iterate over each pixel in the image
  for (int x = 1 ; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
        
      Gx = 0;
      Gy = 0;
           
      //top left Pixel
      px = pixels[((y-1)*width)+(x-1)];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gx += -intensity;
      Gy += intensity;

      //middle left pixel
      px = pixels[(y*width)+(x-1)];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gx += -2 * intensity;

      //bottom left
      px = pixels[((y+1)*width)+(x-1)];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gx += -intensity;
      Gy += -intensity;
      
      //top middle
      px = pixels[((y-1)*width)+x];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gy += 2 * intensity;
      
      //bottom middle
      px = pixels[((y+1)*width)+x];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gy += -2 * intensity;
      
      // top right 
      px = pixels[((y-1)*width)+x+1];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gx += +intensity;
      Gy += +intensity;

      //middle right
      px = pixels[(y*width)+x+1];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      intensity = redvalue + greenvalue + bluevalue;
      Gx += 2 * intensity;
      
      //bottom right
      px = pixels[((y+1)*width)+x+1];
      redvalue = red(px);
      bluevalue = blue(px);
      greenvalue = green(px);
      Gx += +intensity;
      Gy += -intensity;
 
      //calculate normalised length of gradient
      glength = sqrt((Gx*Gx)+(Gy*Gy));
      glength = (glength/4328) * 255;
      
      
      if (glength > 10)
        pixelarray[x+(width*y)] = color(glength);
      else
        pixelarray[x+(width*y)] = color(0);
      
        
        
    }
  }

for(int i = 0; i<width*height;i++) {
  pixels[i] = pixelarray[i];
}

background(0);
updatePixels();

