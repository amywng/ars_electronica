Flower code;
float flowerGravity = 0.2;
int lastTime = 0;
int flowerCount = 0;
Ball[] balls = new Ball[1];
float gravity = 0.1;

void stage3() {
  //create flower at top to drop every 1 second
  int[] flowerPlacements = {35, 14, 25, 5, 30, 21, 14, 37};
  if (millis() - lastTime >= 400) {
    if (flowerPlacements.length > flowerCount) {
      flowers.add(new Flower(flowerPlacements[flowerCount], 0, 8));
      lastTime = millis();
      flowerCount ++;
    } else if (millis() - lastTime > 5000) {
      
      //else {
      int xpos = 20;
      int ypos= 0;
      ;
      // A new ball object
      ypos = (int) random(0, 10);
      Ball b = new Ball(xpos, ypos, 3);
      // Append to array
      balls = (Ball[]) append(balls, b);
      xpos = xpos + 5;
    }
  }


  for (int i = 0; i < flowers.size(); i++) {
    flowers.get(i).applyGravity();
    flowers.get(i).move();
    flowers.get(i).display();
  }

  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].gravity();
    balls[i].move();
  }
}
