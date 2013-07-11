import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(800,800);
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
  float theta = PI;
    
  for (int i = 10; i < 800; i++) {
   rotate(90);
  
    fill(millis()%i, millis()%i+1, 0);
    if (i < bufferSize) {
      ellipse(i, i, myfft.spectrum[i] * -600, myfft.spectrum[i] * -600);
    } else {
      ellipse(i, i, myfft.spectrum[512 - (i/2)] * -600, myfft.spectrum[512 - (i/2)] * -600);
    }  
  }
  
//    for (int i = 10; i < 800; i++) {
//    rotate(100);
//    fill(255, 125, 0);
//    if (i < bufferSize) {
//      ellipse(i, 0, myfft.spectrum[i] * -600, myfft.spectrum[i] * -600);
//    } else {
//      ellipse(i, 0, myfft.spectrum[512 - (i/2)] * -600, myfft.spectrum[512 - (i/2)] * -600);
//    }  
//  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
