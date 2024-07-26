AEC aec;

int stage=1;
int timer=0;
int walk = 1;
PShape book;
PShape flower1;

boolean pastStairsR = false;
boolean pastStairsL = false;

void setup() {
  size(1200, 400);
  aec = new AEC();
  aec.init();

  frameRate(5);
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);

  switch (stage) {
    // fence and vines, blue background
  case 1:
    //fill(130,192,252);
    //rect(0,0,1200,400);
    stage1Vines();
    break;
  case 2:
    frameRate(5);
    fill(252,30,10);
    if (walk>3) {
      walk=1;
    }
    createPerson(walk);
    shape(person, timer, 20);
    if (timer>45) {
      timer=0;
    } else {
      timer+=1;
    }
    walk+=1;
    break;
  case 3:
    //fill(145, 216, 247);
    fill(252,30,10); 
    book(); 
    shape(book, (mouseX/aec.getScaleX())-29, (mouseY/aec.getScaleY())-8);
    break;
    // leaflets dropping, green background
  case 4:
    //fill(36, 188, 27);
    fill(245,0,49);
    rect(0,0,1200,400);
    scale(0.1);
    createBubbles();
    shape(topBubble, (mouseX/aec.getScaleX())*10, (mouseY/aec.getScaleY())*10);
    shape(bottomBubble, (mouseX/aec.getScaleX())*10, (mouseY/aec.getScaleY())*10);
    break;
    // book, red background
  case 5:
    //fill(229, 19, 19);
    scale(.5, .8);
    Flowers();
    shape(flower1, ((mouseX/aec.getScaleX())-29)*5/4, ((mouseY/aec.getScaleY())-8)*5/4);
    break;
  default:
    fill(0);
    break;
  }
  //re ct(0,0,1200,400);
  
  
  aec.endDraw();
  aec.drawSides();
}

void keyPressed() {
  aec.keyPressed(key);
}

void mousePressed() {
  stage +=1;
  if (stage>5) {
    stage=0;
  }
  if (stage==1) {
    leftVines.clear();
    rightVines.clear();
    pastStairsR = false;
    pastStairsL = false;
  }
}

void book(){
  
  PShape col2, col3, col4, col5, col6, col7, col8, col9, col10; 
  
  
  book = createShape(GROUP);
  book.setStroke(color(0));
  fill(245, 229, 173);
  
  col2 = createShape(RECT,29,8,1,10);
  col3 = createShape(RECT,30,9,1,8);
  col4 = createShape(RECT,31,9,1,8); 
  col6 = createShape(RECT,33,9,1,8); 
  col7 = createShape(RECT,34,9,1,8); 
  col8 = createShape(RECT,35,8,1,10); 
  
  col9 = createShape(RECT, 36,7,1,12); 
  col10 = createShape(RECT, 28,7,1,12); 
  
  fill(9,129,64); 
  col5 = createShape(RECT,32,9,1,8); 
  
  book.addChild(col2);
  book.addChild(col3); 
  book.addChild(col4); 
  book.addChild(col5);
  book.addChild(col6);
  book.addChild(col7); 
  book.addChild(col8);
  book.addChild(col9);
  book.addChild(col10); 
  
} 

void Flowers()
{
  PShape center, petal1, petal2, petal3, petal4, petal5, petal6, stem;

  flower1 = createShape(GROUP);
  
  stroke(8,111,48); 
  stem = createShape(LINE, 30.5,12 , 30.5,20); 

  noStroke();
  fill(231, 247, 7);
  center = createShape(RECT, 29, 12, 4, 4);
  fill(255);
  petal1 = createShape(RECT, 26, 10, 3, 4);
  //fill(7, 33, 247);
  petal2 = createShape(RECT, 32, 10, 3, 4);
  //petal3 = createShape(RECT,32,14,3,4);
  //fill(219, 7, 247);
  petal4 = createShape(RECT, 30.5, 14, 3, 4);
  //fill(7, 247, 213);
  petal5 = createShape(RECT, 27, 14, 3, 4);
  
  //red
  //fill(247, 7, 80);
  petal6 = createShape(RECT, 29, 8, 3, 4);
  
  flower1.addChild(center);
  flower1.addChild(stem);
  //flower1.addChild(center);
  //fill(255);
  flower1.addChild(petal1);
  flower1.addChild(petal2);
  //flower1.addChild(petal3);
  flower1.addChild(petal4);
  flower1.addChild(petal5);
  flower1.addChild(petal6);
 
  
}
