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
  balls[0] = new Ball(50, 0, 10);
  createBubbles();
  frameRate(5);
  leafPosns.add(new Posn(5,25));
  leafPosns.add(new Posn(13,27));
  leafPosns.add(new Posn(18,15));
  leafPosns.add(new Posn(40,15));
  leafPosns.add(new Posn(25,8));
  leafPosns.add(new Posn(36,7));
  leafPosns.add(new Posn(23,20));
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);

  switch (stage) {
    // fence and vines, no background
  case 1:
    stage1();
    if (s1Done) {
      stage2();
      if (s2Done) {
        if (timerS3>32 && timerS3<70) {
          stage=3;
        } else {
          for (int i = 0; i < flowers.size(); i++) {
            flowers.get(i).applyGravity();
            flowers.get(i).move();
            flowers.get(i).display();
          }
        }
        timerS3+=1;
      }
    }
    break;
    // flowers grow/pop up, no background
  case 2:
    
    break;
    // flowers fall, leaflets drop
  case 3:
    stage3();
    break;
    // leaflets dropping, green background
  case 4:
    stage4();
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
        fill(209, 135, 70);
        createPerson(1, 2);
        fill(227,183,144);
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
        fill(209, 135, 70);
        createPerson(1, 2);
        fill(227,183,144);
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
    } else if (s6Done && timerS6<40) {
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
      fill(209, 135, 70);
      createPerson(walk2, 2);
      fill(227,183,144);
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
    scale(0.1);
    if (timerS7 < 20) {
      stage7(true);
    } else if (timerS7 >=20 && timerS7<30) {
      stage7(false);
    } else {
      stage=1;
      loop+=1;
      leftVines.clear();
      rightVines.clear();
      pastStairsR = false;
      pastStairsL = false;
      s1Done = false;
      s2Done = false;
      s3Done = false;
      s4Done = false;
      s5Done = false;
      s6Done = false;
      s7Done = false;
      frameRate(5);
      timerS2 = 0;
      timerS3 = 0;
      timerS4 = 0;
      timerS7 = 0;
      flowers.clear();
      leaves.clear();
      leafletW=3;
      leafletH=3;
    }
    timerS7+=1;
    break;
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
