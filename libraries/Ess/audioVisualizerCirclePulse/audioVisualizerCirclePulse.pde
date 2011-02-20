import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(800,600);
  frameRate(30);
  background(000);
  noStroke();
  fill(0);

  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005,.05);
}

void draw() {
  background(0);
  for (int i=0; i<bufferSize;i++) {
    ellipse(400,300,myfft.spectrum[i]*-600,myfft.spectrum[i]*-600);
    fill(255, 1, 0);
    ellipse(400,300,myfft.spectrum[i]*-500,myfft.spectrum[i]*-500);
    fill(255, 255, 255);
    ellipse(400,300,myfft.spectrum[i]*-400,myfft.spectrum[i]*-400);
    fill(i, i, i);
    //ellipse(250,150,myfft.spectrum[i]*-100,myfft.spectrum[i]*-100);
    //fill(100, 100, 100);
    
  }
}




/*void draw() {
  background(000);
  for (int i=0; i<bufferSize;i++) {
    ellipse(i+10,150,5,myfft.spectrum[i]*-500);
    if(i <= bufferSize/2)
    {
      fill(i, 0, i);
    } else fill(i, 0, bufferSize-i);
  }
}*/

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
