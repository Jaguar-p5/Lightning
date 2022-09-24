



void setup()
 {
   size(600, 600);
   background(55);
   strokeWeight(14);
   frameRate(77);

 }
float r = 255;
float g = 255;
float b = 255;

float rShift = 0;
float gShift = 0;
float bShift = 0;

float shiftTimer = 1;

color theColor = color (r,g,b);
Bolt [] boltList = {new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111), new Bolt(theColor,-11111)};


    
void draw()
{
 fill(11,11, 11, 7);
 rect(-111,-111,8900,8090); // Elegant solution
 
 for(int i = 0; i < boltList.length; i++)
   if(boltList[i].status == true)
     boltList[i].inc();

}

void mousePressed()
{
  for(int i = 0; i <boltList.length; i++)
  {
    if(boltList[i].status == false)
    {
      theColor = color (r,g,b);
      boltList[i] = new Bolt(theColor, mouseX);
      break;
    }
  }
}
  

class Bolt
{
 
  int xStart, yStart, xEnd, yEnd;
  color myColor;
  boolean status = true;

 
  Bolt(color inColor, int myX)
  {
    xStart = myX;
    yStart = 0;
    xEnd = myX;
    yEnd = 0;
    myColor = inColor;

    
  }
  
   void inc()
  {
     xStart = xEnd;
     yStart = yEnd;
     yEnd += ((int)(Math.random()* 39) + 4 ); 
     xEnd += ((int)(Math.random()* 71) - 35);
     stroke(myColor);
     
     beginShape();
     curveVertex(xStart,  yStart);
     curveVertex(xStart,  yStart);
     curveVertex((xStart + xEnd)/2, (yStart + yEnd)/2);
     curveVertex(xEnd,  yEnd);
     curveVertex(xEnd,  yEnd);
     endShape();
     if(yStart >= height)
     {
       status = false;
       if(xStart > -555) //totally reasonable way of handling the starting lightning bolts, ceartainly should not just be using a variable here.
       { 
         r += rShift;
         g += gShift;
         b += bShift;
         shiftTimer -= 1;
         if(shiftTimer == 0)
         {
           rShift = ((int)(Math.random() * 256)- r)/5.0;
           gShift = ((int)(Math.random() * 256)- g)/5.0;
           bShift = ((int)(Math.random() * 256)- b)/5.0;
           shiftTimer = 13;
         }
       }
         
        
     }

  }
  
}



