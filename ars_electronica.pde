AEC aec;

int stage=1;
int timer=0;
int timerS6=0;
int walk1 = 1;
int walk2 = 2;
int walk3 = 3;

PShape flower1;
int p1Y = 0;
int p3Y = 13;
int p3X = 40;
String bookScale = "large";
int scale;
int loop=1;

boolean s1Done, s2Done, s3Done, s4Done, s5Done, s6Done, s7Done = false;

void setup() {
  size(1200, 400);
  aec = new AEC();
  aec.init();
  balls[0] = new Ball(50,0,10);

  frameRate(5);
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);

  switch (stage) {
    // fence and vines, no background
  case 1:
    if (loop==1) {
      stage1();
    } else {
    }
    break;
  // flowers grow/pop up, no background
  case 2:
    break;
  // flowers fall
  case 3:
    stage3();
    break;
  // leaflets dropping, green background
  case 4:
    break;
  // book, red background
  case 5:
    if (bookScale=="large") {
      bookAnimation(bookScale);
      if (timer>10) {
        bookScale="medium";
        timer=0;
      }
      timer+=1;
    } else if (bookScale=="medium") {
      bookAnimation(bookScale);
      if (timer>10) {
        bookScale="small";
        timer=0;
      }
      timer+=1;
    } else if (bookScale=="small") {
      bookAnimation(bookScale);
      if (timer>10) {
        bookScale="done";
        timer=0;
      }
      timer+=1;
    } else {
      stage=6;
    }
    scale*=2;
    break;
  // people walking
  case 6:
    frameRate(2);
    if (timer < 4 && !s6Done) {
      if (timer==3) {
        fill(224, 199, 158);
        createPerson(walk1, 1);
        fill(75, 51, 29);
        createPerson(1, 2);
        fill(142, 99, 59);
        createPerson(walk3, 3);
        shape(person1, 27, 8);
        shape(person2, 33, 8);
        shape(person3, 39, 8);
        timer+=1;
        s6Done = true;
      } else {
        if (walk1>3) {
          walk1=1;
        }
        if (walk3>3) {
          walk3=1;
        }
        fill(224, 199, 158);
        createPerson(walk1, 1);
        fill(75, 51, 29);
        createPerson(1, 2);
        fill(142, 99, 59);
        createPerson(walk3, 3);
        shape(person1, timer+25, p1Y);
        shape(person2, 33, 8);
        shape(person3, p3X, p3Y);
        if (timer>45) {
          timer=0;
        } else {
          timer+=1;
        }
        p3X-=1;
        p1Y+=2;
        p3Y-=1;
        walk1+=1;
        walk3+=1;
      }
    } else if (s6Done && timerS6<30) {
      timerS6+=1;
      frameRate(5);
      if (walk1>3) {
        walk1=1;
      }
      if (walk2>3) {
        walk2=1;
      }
      if (walk3>3) {
        walk3=1;
      }
      fill(224, 199, 158);
      createPerson(walk1, 1);
      fill(75, 51, 29);
      createPerson(walk2, 2);
      fill(142, 99, 59);
      createPerson(walk3, 3);
      shape(person1, timer+23, 8);
      shape(person2, timer+29, 8);
      shape(person3, timer+35, 8);
      if (timer>18) {
        timer=-35;
      } else {
        timer+=1;
      }
      walk1+=1;
      walk2+=1;
      walk3+=1;
    } else {
      stage = 7;
    }
    break;
  // speech bubbles
  case 7:
    createBubbles();
    shape(topBubble);
    shape(bottomBubble);
  }

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
