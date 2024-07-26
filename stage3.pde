Flower code;
float flowerGravity = 0.2;
int flowerCount = 0;
Ball[] balls = new Ball[1];
float gravity = 0.1;
int timerS3=0;

void stage3() {
  if (timerS3>70) {
    stage=4;
  } else {
    int xpos = 20;
    int ypos= 0;
    // A new ball object
    ypos = (int) random(0, 10);
    Ball b = new Ball(xpos, ypos, 3);
    // Append to array
    balls = (Ball[]) append(balls, b);
    xpos = xpos + 5;
  }
  timerS3+=1;

  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].gravity();
    balls[i].move();
  }
}
