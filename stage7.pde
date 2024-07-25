PShape person;
PShape head, body, arms, legR, legL;

void createPerson(int walk) {
  person = createShape(GROUP);

  head();
  body();
  arms();
  legs(walk);
  
  person.addChild(head);
  person.addChild(body);
  person.addChild(arms);
  person.addChild(legR);
  person.addChild(legL);
}

void head() {
  head = createShape(RECT, 0, 0, 1, 1);
  head.setStroke(false);
}

void body() {
  body = createShape(RECT, 0, 1, 1, 2);
  body.setStroke(false);
}

void arms() {
  arms = createShape(RECT, -1, 1, 3, 1);
  arms.setStroke(false);
}

void legs(int walk) {
  switch (walk) {
  case 1:
    legR = createShape(RECT, 1, 3, 1, 1);
    legL = createShape(RECT, -1, 3, 1, 1);
    break;
  case 2:
    legR = createShape(RECT, 0, 3, 1, 1);
    legL = createShape(RECT, -1, 3, 1, 1);
    break;
  case 3:
    legR = createShape(RECT, 2, 3, 1, 1);
    legL = createShape(RECT, 0, 3, 1, 1);
    break;
  }
  legR.setStroke(false);
  legL.setStroke(false);
}
