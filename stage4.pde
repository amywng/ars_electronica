int leafletW=3;
int leafletH=3;
int timerS4;

void stage4() {
  Ball lastBall = balls[balls.length-1];
  while (lastBall.x < 30) {
    lastBall.x+=1;
  }
  while (lastBall.y <8) {
    lastBall.y+=1;
  }
  lastBall.display();
  rect(lastBall.x, lastBall.y, leafletW, leafletH);
  if (leafletW < 6) {
    leafletW+=2;
    leafletH+=1;
  } else {
    if (timerS4>6) {
      stage = 5;
    }
    timerS4+=1;
    println(timerS4);
  }
  
}
