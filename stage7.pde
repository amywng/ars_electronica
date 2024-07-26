PShape topBubble;
PShape bottomBubble;

float topBubbleX = 250; // Initial x position for the top bubble (off-screen to the left)
float bottomBubbleX = 400; // Initial x position for the bottom bubble (off-screen to the right)

int timerS7;
void stage7(boolean positive) {  
  if (positive) {
    // Update positions
    topBubbleX = min(topBubbleX + 5, 310); // Move the top bubble to the right
    bottomBubbleX = max(bottomBubbleX - 5, 340); // Move the bottom bubble to the left
  } else {
    // Update positions
    topBubbleX = min(topBubbleX - 5, 310); // Move the top bubble to the right
    bottomBubbleX = max(bottomBubbleX + 5, 340); // Move the bottom bubble to the left
  }

  // Update the positions of the bubbles
  updateBubbles(topBubbleX, bottomBubbleX);
  
  // Draw the bubbles
  shape(topBubble,0,10);
  shape(bottomBubble, 0, 10);
}

void createBubbles() {
  // Create initial top bubble shape
  topBubble = createShape(GROUP);
  fill(255);
  PShape topRect1 = createShape(RECT, 20, 20, 50, 50);
  PShape topRect2 = createShape(RECT, 30, 70, 10, 10);
  PShape topRect3 = createShape(RECT, 20, 80, 10, 10);
  topBubble.addChild(topRect1);
  topBubble.addChild(topRect2);
  topBubble.addChild(topRect3);
  
  // Create initial bottom bubble shape
  bottomBubble = createShape(GROUP);
  PShape bottomRect1 = createShape(RECT, 50, 110, 50, 50);
  PShape bottomRect2 = createShape(RECT, 80, 160, 10, 10);
  PShape bottomRect3 = createShape(RECT, 90, 170, 10, 10);
  bottomBubble.addChild(bottomRect1);
  bottomBubble.addChild(bottomRect2);
  bottomBubble.addChild(bottomRect3);
}

void updateBubbles(float topX, float bottomX) {
  // Update top bubble shape
  topBubble = createShape(GROUP);
  fill(255);
  PShape topRect1 = createShape(RECT, topX, 20, 50, 50);
  PShape topRect2 = createShape(RECT, topX + 10, 70, 10, 10);
  PShape topRect3 = createShape(RECT, topX, 80, 10, 10);
  topBubble.addChild(topRect1);
  topBubble.addChild(topRect2);
  topBubble.addChild(topRect3);
  
  // Update bottom bubble shape
  bottomBubble = createShape(GROUP);
  fill(255);
  PShape bottomRect1 = createShape(RECT, bottomX, 110, 50, 50);
  PShape bottomRect2 = createShape(RECT, bottomX + 30, 160, 10, 10);
  PShape bottomRect3 = createShape(RECT, bottomX + 40, 170, 10, 10);
  bottomBubble.addChild(bottomRect1);
  bottomBubble.addChild(bottomRect2);
  bottomBubble.addChild(bottomRect3);
}
