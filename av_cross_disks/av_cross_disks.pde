import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(800, 800);
  frameRate(30);
  background(000);
  noStroke();
  fill(0);

  Ess.start(this);
  myinput = new AudioInput(bufferSize);
  myfft = new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005,.05);
}

void draw() {
  background(000);
  for (int i = 1; i < bufferSize; i++) {
    if (i <= bufferSize / 2) { 
      ellipse(i, i + 100, myfft.spectrum[i] * 500, myfft.spectrum[bufferSize-i] * 500);
      ellipse(width - i, i + 100, myfft.spectrum[i] * 500, myfft.spectrum[bufferSize-i] * 500);
    } else {
      ellipse(i, i + 100, myfft.spectrum[i] * 500, myfft.spectrum[i] * 500);
      ellipse(width-i, i + 100, myfft.spectrum[i] * 500, myfft.spectrum[i] * 500);    
    }
    fill(millis() % i + 1, 0, i);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
