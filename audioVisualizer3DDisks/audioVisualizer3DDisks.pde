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
  background(000);
  for (int i=1; i<bufferSize;i++) {
    ellipse(i+10,300,myfft.spectrum[i]*-500,myfft.spectrum[i]*-500);
    if(i <= bufferSize/2)
    {
      fill(millis()%i+1, 0, i);
    } else fill(millis()%i, 0, bufferSize-i);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
