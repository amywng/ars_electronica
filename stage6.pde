PShape person1, person2, person3;
PShape head, body, arms, armR, armL, legs, legC, legR, legL;
PShape botR, botL, topR, topL;
PShape smallBook;
PShape spine;
PShape pages;

color shirt;
color pants;

void createPerson(int walk, int person) {
  switch (person) {
    case 1:
      // blue grey
      shirt = color(179,191,203);
      // blue
      pants = color(76,148,234);
      person1 = createShape(GROUP);
      break;
    case 2:
      // orange
      shirt = color(219);
      // red
      pants = color(176,158,209);
      person2 = createShape(GROUP);
      break;
    case 3:
      // 
      shirt = color(152,222,130);
      // grey
      pants = color(150);
      person3 = createShape(GROUP);
      break;
  }

  head();
  body();
  arms(walk);
  legs(walk);
  
  switch (person) {
    case 1:
      person1.addChild(head);
      person1.addChild(body);
      person1.addChild(arms);
      person1.addChild(legs);
      break;
    case 2:
      smallBook();
      person2.addChild(head);
      person2.addChild(body);
      person2.addChild(arms);
      person2.addChild(legs);
      person2.addChild(smallBook);
      break;
    case 3:
      person3.addChild(head);
      person3.addChild(body);
      person3.addChild(arms);
      person3.addChild(legs);
      break;
  } 
}

void head() {
  head = createShape(RECT, 0, -1, 1, 1);
  head.setStroke(false);
}

void body() {
  body = createShape(RECT, 0, 0, 1, 2);
  body.setStroke(false);
  body.setFill(shirt);
}

void arms(int walk) {  
  switch (walk) {
    case 1:
    case 2:
      armL = createShape(GROUP);
      botL = createShape(RECT, -2, 1, 1, 1);
      topL = createShape(RECT, -1, 0, 1, 1);
      
      topL.setFill(shirt);
      botL.setFill(shirt);
      botL.setStroke(false);
      topL.setStroke(false);
      
      armL.addChild(botL);
      armL.addChild(topL);
      break;
    case 3:
      armL = createShape(RECT, -2,0,2,1);
      armL.setFill(shirt);
      break;
  }
  
  switch (walk) {
    case 1:
    case 3:
      armR = createShape(GROUP);
      topR = createShape(RECT, 1, 0, 1, 1);
      botR = createShape(RECT, 2, 1, 1, 1);
      topR.setFill(shirt);
      botR.setFill(shirt);
      topR.setStroke(false);
      botR.setStroke(false);
      armR.addChild(topR);
      armR.addChild(botR);
      break;
    case 2:
      armR = createShape(RECT, 1,0,2,1);
      armR.setFill(shirt);
      break;
  }
  
  armL.setStroke(false);
  armR.setStroke(false);
  
  arms = createShape(GROUP);
  arms.addChild(armR);
  arms.addChild(armL);
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
  legC = createShape(RECT, 0, 2, 1, 1);
  legR.setStroke(false);
  legL.setStroke(false);
  legC.setStroke(false);
  legR.setFill(pants);
  legL.setFill(pants);
  legC.setFill(pants);
  
  legs = createShape(GROUP);
  legs.addChild(legR);
  legs.addChild(legL);
  legs.addChild(legC); 
}

void smallBook() {
  smallBook = createShape(GROUP);
  spine = createShape(RECT, 2,1,1,1);
  pages = createShape(RECT, 2,0,1,2);
  spine.setFill(color(245,229,173));
  pages.setFill(color(245,46,15));
  spine.setStroke(false);
  pages.setStroke(false);
  
  smallBook.addChild(pages);
  smallBook.addChild(spine);
}
