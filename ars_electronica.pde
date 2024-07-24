PShape person;
color personC = color(229,19,19);
PShape head, body, arms, legR, legL;
void person() {
  person = createShape(GROUP);
  head = createShape(RECT,0,0,1,1);
  //head.setFill(personC);
  head.noStroke();
  
  body = createShape(RECT,0,1,1,4);
  //body.setFill(personC);
  body.noStroke();
  
  arms = createShape(RECT, -1,1,3,1);
  
  legR = createShape(RECT, -1,5,1,2);
  legL = createShape(RECT, 1,5,1,2);
  
  person.addChild(head);
  person.addChild(body);
  person.addChild(arms);
  person.addChild(legR);
  person.addChild(legL);
}
