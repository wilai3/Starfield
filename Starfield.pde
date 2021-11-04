Face [] mood;

void setup() {
  size(500, 500);
  mood = new Face[100];
  for (int i = 0; i < 10; i++){
    mood[i] = new madFace();
  }
  for (int i = 10; i < mood.length; i++) {
    mood[i] = new Face();
  }
}

void draw()
{
  background(255);
  for (int i = 0; i < mood.length; i++) {
    mood[i].move();
    mood[i].show();
  }
}

class Face
{
  float myX, myY;
  double mySpeed, myAngle;
  boolean happy;
  Face() {
    myX = 250;
    myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    happy = true;
  }
  void move() {
    myX = myX + (float)Math.cos(myAngle) * (float)mySpeed;
    myY = myY + (float)Math.sin(myAngle) * (float)mySpeed;
  }
  void show() {
    //happy face
    if (happy == true) {
      fill(255, 222, 52);
      ellipse(myX, myY, 75, 75);
      bezier(myX-20, myY+20, myX-20, myY+30, myX+20, myY+30, myX+20, myY+20);
      fill(0);
      ellipse(myX-13, myY-10, 10, 10);
      ellipse(myX+13, myY-10, 10, 10);
    }
    //mad face
    if (happy == false) {
      fill(#F53711);
      ellipse(myX, myY, 75, 75);
      bezier(myX-20, myY+20, myX-20, myY+10, myX+20, myY+10, myX+20, myY+20);
      fill(0);
      ellipse(myX-13, myY-10, 10, 10);
      ellipse(myX+13, myY-10, 10, 10);
    }
  }
}

class madFace extends Face {
  madFace() {
    myX = 250;
    myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5;
    happy = false;
  }
}
