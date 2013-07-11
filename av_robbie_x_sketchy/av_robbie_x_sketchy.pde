import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(500, 500);
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
  for (int i = 30; i <= 470; i++) { 
    
    // draw the X
    fill(255, 128, 0);
    rect(i, i, myfft.spectrum[500] * random(50), myfft.spectrum[500] * 500);
    rect(width - i, i, myfft.spectrum[500] * random(50), myfft.spectrum[500] * 500);
    
    // block out the stripes in the X
    if ((i > 50 && i < 70) || (i > 400 && i < 410) || (i > 420 && i < 430)) {
      fill(0, 0, 0);    
      rect(width - i, i, myfft.spectrum[500] * random(50), myfft.spectrum[500] * 500);  
    }    
    
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
