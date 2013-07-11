import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(500, 800);
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
  for (int i = 1; i < width; i++) {
    fill(i, millis() % 1000 - i, 255);
    rect(i, 0, 1, myfft.spectrum[i] * 900);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
