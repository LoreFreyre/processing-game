float posX[];
float posY[];

int status [];


float dist = 0;
int score = 0;
int time;

PFont font;
PImage bg ;
PImage sweet;
PImage home;

int scene = 0;


void setup ()
{
  size (1024, 653);

  font = loadFont("Lato-Regular-70.vlw");
  textFont(font);
  bg = loadImage("0.jpg");
  sweet = loadImage("1.png");
  home = loadImage("2.jpg");

  posX = new float [100];
  posY = new float [100];
  status = new int [100];

  for (int i=0; i<100; i++)
  {
    posX [i] = random (1694);
    posY [i] = random (500);

    status [i] = 1;
  }
}

void draw ()
{
  if (mousePressed==true) {
    if (scene==0) {
      scene=1;
    }
  }
  switch(scene)
  {

  case 0:
    println("zero");
    background(255);
    fill(#E3DD20);
    image(home, 0, 0, 1024, 653);
    text ("START!!", 30, 90);

    break;

  case 1:
    image(bg, 0, 0, 1024, 653);

    for (int i=0; i<100; i++)
    {
      posY[i] = posY[i] + random(1, 1);
    }

    for (int i=0; i<100; i++)
    {
      if (status [i] == 1)
      {
        image (sweet, posX[i], posY[i], 30, 30);
      }
    }

    for (int i=0; i<100; i++)
    {
      if (mousePressed)
      {
        dist = dist(mouseX, mouseY, posX[i], posY[i]);
        if (dist <=30)
        {
          status [i] = 0;
        }
      }
    }
    fill (250, 250, 250);
    text ("SCORE: " + score, 30, 80);
    score = 0;
    for (int i=0; i<100; i++)
    {
      if (status[i] == 0)
      {
        score = score +1;
      }
    }

    print (score);

    time = millis ()/1000;
    text("TIME: "+time, 740, 80);
  }
}
