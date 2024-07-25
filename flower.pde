PShape flowerAndVines;
PShape flower;
PShape topVine;
PShape bottomVine;

void createFlowerAndVines() {
  // Create flower and vines
  createFlower();
  createTopVine();
  createBottomVine();
  
  // Combine them into a single group
  flowerAndVines = createShape(GROUP);
  flowerAndVines.addChild(topVine);
  flowerAndVines.addChild(bottomVine);
  flowerAndVines.addChild(flower);
}

void createTopVine() {
  topVine = createShape();
  topVine.beginShape();
  topVine.noStroke();
  topVine.fill(#1BAF48);
  topVine.vertex(100, 0);
  topVine.vertex(100, 20);
  topVine.vertex(90, 20);
  topVine.vertex(70, 30);
  topVine.vertex(50, 40); // Top
  topVine.vertex(50, 50);
  topVine.vertex(70, 40);
  topVine.vertex(90, 30);
  topVine.vertex(100, 30);
  topVine.vertex(100, 10);
  topVine.endShape(CLOSE);
}

void createBottomVine() {
  bottomVine = createShape();
  bottomVine.beginShape();
  bottomVine.noStroke();
  bottomVine.fill(#1BAF48);
  bottomVine.vertex(0, 100);
  bottomVine.vertex(0, 80);
  bottomVine.vertex(10, 80);
  bottomVine.vertex(30, 70);
  bottomVine.vertex(50, 60); // Top
  bottomVine.vertex(50, 50);
  bottomVine.vertex(30, 60);
  bottomVine.vertex(10, 70);
  bottomVine.vertex(0, 80);
  bottomVine.vertex(0, 100);
  bottomVine.endShape(CLOSE);
}

void createFlower() {
  flower = createShape(GROUP);

  // Petals
  for (int i = 0; i < 6; i++) {
    int r = (int) random(235, 255);
    int g = (int) random(235, 255);
    int b = (int) random(235, 255);
    PShape petal = createShape(RECT, 20 + (i % 3) * 30, 20 + (i / 3) * 30, 30, 20);
    petal.setFill(color(r, g, b));
    flower.addChild(petal);
  }

  // Center of flower
  PShape center = createShape(RECT, 40, 40, 20, 20);
  center.setFill(#EFF007);
  flower.addChild(center);
}
