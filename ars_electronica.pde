AEC aec;

PShape person;
color personC = color(229,19,19);
PShape head, body, arms, legR, legL;

void setup() {
  size(1200, 400);
  
  aec = new AEC();
  aec.init();

  frameRate(30);
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);
  
  aec.endDraw();
  aec.drawSides();
}

void keyPressed() {
  aec.keyPressed(key);
}


void person() {
  person = createShape(GROUP);
  head = createShape(RECT,0,0,1,1);  
  body = createShape(RECT,0,1,1,4);
  arms = createShape(RECT, -1,1,3,1);
  legR = createShape(RECT, -1,5,1,2);
  legL = createShape(RECT, 1,5,1,2);
  
  person.addChild(head);
  person.addChild(body);
  person.addChild(arms);
  person.addChild(legR);
  person.addChild(legL);
}
