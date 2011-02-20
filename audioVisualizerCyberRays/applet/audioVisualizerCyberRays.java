import processing.core.*; 
import processing.xml.*; 

import ddf.minim.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class audioVisualizerCyberRays extends PApplet {


 
Minim minim;
AudioInput in;
 
public void setup()
{
  size(800, 600, P3D);
 
  minim = new Minim(this);
  minim.debugOn();
 
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}
 
public void draw()
{
  background(0);
  //stroke(255);
  // draw the waveforms
  for(int i = 1; i < in.bufferSize() - 1; i++)
  { 
    stroke(0, millis()%-i, 0);
    line(i, 100 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    stroke(0, 0, millis()%-i);
    line(i, 200 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    stroke(0, millis()%-i, 0);
    line(i, 300 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    stroke(0, 0, millis()%-i);
    line(i, 400 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    stroke(0, millis()%-i, 0);
    line(i, 500 + in.left.get(i)*1000, millis()%i*100, 50 + in.left.get(i+1)*1000);
    
    
    //stroke(0, 0, millis()%-i);
    //line(i, 300 + in.left.get(i)*1000, millis()%i*1000, 50 + in.left.get(i+1)*100);
    
    //line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    
  }
}
 
 
public void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "audioVisualizerCyberRays" });
  }
}
