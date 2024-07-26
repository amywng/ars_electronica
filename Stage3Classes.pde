class Flower {
  float x;
  float y;
  float speed;
  float w; // Width or size of the flower
  color petalColor;
  color centerColor;

  Flower(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    // Assign random colors petals
    petalColor = color(random(255), random(255), random(255));
    centerColor = color(#FFF703);
  }

  void applyGravity() {
    speed += gravity;
  }

  void move() {
    y += speed;
    if (y > height - w/2) {  // Adjust for the flower height
      speed = 0;
      y = height - w/2;  // Keep the flower within the window
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);

    float petalSize = w / 5; // Adjust petal size relative to flower width
    float centerSize = w / 8; // Adjust center size relative to flower width

    fill(petalColor);
    ellipse(-w/2 + petalSize, -w/2 + petalSize, petalSize, petalSize);
    ellipse(-w/2 + petalSize, -w/2 + 3*petalSize, petalSize, petalSize);
    ellipse(-w/2 + 3*petalSize, -w/2 + 3*petalSize, petalSize, petalSize);
    ellipse(-w/2 + 3*petalSize, -w/2 + petalSize, petalSize, petalSize);
    fill(255);
    ellipse(-w/2 + 3*petalSize, -w/2 + 2*petalSize, petalSize, petalSize);
    ellipse(-w/2 + 2*petalSize, -w/2 + 3*petalSize, petalSize, petalSize);
    ellipse(-w/2 + petalSize, -w/2 + 2*petalSize, petalSize, petalSize);
    ellipse(-w/2 + 2*petalSize, -w/2 + petalSize, petalSize, petalSize);
    fill(centerColor);
    ellipse(-w/2 + 2*petalSize, -w/2 + 2*petalSize, centerSize, centerSize);

    popMatrix();
  }
}

class Leaf {
  float lX;
  float lY;
  //float speed;
  float lW; // Width or size of the leaf
  color leafColor;

  Leaf(float tempLx, float tempLy, float tempLw) {
    lX = tempLx;
    lY = tempLy;
    lW = tempLw;
    //speed = 0;
    // Assign random colors petals
    leafColor = color(random(150), random(150,255), random(150));
  }

  void display() {
    pushMatrix();
    translate(lX, lY);

    float leafSize = lW / 5; // Adjust leaf size relative to its width
    float d = leafSize; // Distance between centers of ellipses

    fill(leafColor);
    
    if (lW < 6) { // Threshold for small leaf size
      // Draw a single ellipse for small leaves
      ellipse(0, 0, leafSize, leafSize);
    } else {
      // Draw three ellipses in a triangular formation for larger leaves
      float x1 = 0;
      float y1 = -d / sqrt(3); // Top vertex of the equilateral triangle

      float x2 = -d / 2;
      float y2 = d / (2 * sqrt(3)); // Bottom-left vertex of the equilateral triangle

      float x3 = d / 2;
      float y3 = d / (2 * sqrt(3)); // Bottom-right vertex of the equilateral triangle

      ellipse(x1, y1, leafSize, leafSize); // Top ellipse
      ellipse(x2, y2, leafSize, leafSize); // Bottom-left ellipse
      ellipse(x3, y3, leafSize, leafSize); // Bottom-right ellipse
    }

    popMatrix();
  }
}

class Ball {
  float x;
  float y;
  float speed;
  float w;

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }

  void gravity() {
    // Add gravity to speed
    speed = speed + gravity;
  }

  void move() {
    // Add speed to y location
    int changex = (int) random(-5,5);  
    y = y + speed;
    x = x + changex; 
    
    // If square reaches the bottom
    // Stop the square
    if (y > height - w / 2) {
      speed = 0;
      y = height - w / 2;
    }
  }

  void display() {
    // Draw the square
    int circleH = (int)random(0,4); ; 
    int circleW = (int) random(0,4); 
    
    
    noStroke(); 
    fill(255);
    rect(x, y, circleH, circleW);
    //fill(255);
    //rect(x-w,y,w,w);
    //rect(x+w,y+w,w,w);
    //rect(x-w,y+w,w,w);
    //rect(x,y+w,w,w);
  }
}
