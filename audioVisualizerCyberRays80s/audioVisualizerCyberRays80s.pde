import ddf.minim.*;
 
Minim minim;
AudioInput in;

void setup()
{
  size(800, 600, P3D);
 
  minim = new Minim(this);
  minim.debugOn();
 
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);

}
 
void draw()
{
  background(0);
  //stroke(255);
  // draw the waveforms
  for(int i = 1; i < in.bufferSize() - 1; i++)
  { 
    //fill(50, 50, 50);
    //ellipse(400,300,400+in.left.get(i)*1000,400+in.left.get(i)*1000);
    //fill(255, 1, 0);
    //ellipse(400,300,200+in.left.get(i)*1000,200+in.left.get(i)*1000);
    
    
    
    stroke(0, 0, millis()%-i);
    line(0, 50 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(0, 150 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(0, 250 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(0, 350 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(0, 450 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(0, 550 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    stroke(0, millis()%-i, 0);
    line(100 + in.left.get(i)*1000, 100 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(200 + in.left.get(i)*1000, 200 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(300 + in.left.get(i)*1000, 300 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(400 + in.left.get(i)*1000, 400 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    line(500 + in.left.get(i)*1000, 500 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
 
    
    
    //stroke(0, 0, millis()%-i);
    //line(i, 300 + in.left.get(i)*1000, millis()%i*1000, 50 + in.left.get(i+1)*100);
    
    //line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    
  }
}
 
 
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}
