import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

float x = 0;
float y = 0;
float speed = 10;


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
  move();
  display();
}


void move() {
  x = x + speed;
  
  if (x > width) {
    x =0;
    y+=50;
  }
  
  if (y > height) {
    y = 0;
  }
   
}

void display() {
   
  for (int i=1; i<bufferSize;i++) {
  
    ellipse(x,y,myfft.spectrum[i]*-300,myfft.spectrum[i]*-300);
    if(i <= bufferSize/2)
    {
      fill(millis()%100+1, 0, i);
    } else fill(millis()%i, 0, bufferSize-i);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}
