AEC aec;

int stage=1;
int timer=0;
int walk = 1;

boolean pastStairs = false;

void setup() {
  size(1200, 400);
  aec = new AEC();
  aec.init();

  frameRate(10);
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);

  switch (stage) {
    // fence and vines, blue background
  case 1:
    stage1Vines();
    break;
  case 2:
    frameRate(5);
    fill(252,30,10);
    if (walk>3) {
      walk=1;
    }
    createPerson(walk);
    shape(person, timer, 10);
    if (timer>45) {
      timer=0;
    } else {
      timer+=1;
    }
    walk+=1;
    break;
  case 3:
    //fill(145, 216, 247);
    break;
    // leaflets dropping, green background
  case 4:
    fill(36, 188, 27);
    break;
    // book, red background
  case 5:
    fill(229, 19, 19);
    break;
  default:
    fill(0);
    break;
  }
  //rect(0,0,1200,400);
  
  
  aec.endDraw();
  aec.drawSides();
}

void keyPressed() {
  aec.keyPressed(key);
}
