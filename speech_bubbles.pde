PShape topBubble;
PShape bottomBubble;

void createBubbles() {
  // Create top bubble shape
  topBubble = createShape(GROUP);
  fill(255);
  PShape topRect1 = createShape(RECT, 20, 20, 60, 60);
  PShape topRect2 = createShape(RECT, 30, 80, 20, 20);
  PShape topRect3 = createShape(RECT, 20, 90, 10, 10);
  topBubble.addChild(topRect1);
  topBubble.addChild(topRect2);
  topBubble.addChild(topRect3);
  
  // Create bottom bubble shape
  bottomBubble = createShape(GROUP);
  PShape bottomRect1 = createShape(RECT, 100, 100, 60, 60);
  PShape bottomRect2 = createShape(RECT, 150, 160, 20, 10);
  PShape bottomRect3 = createShape(RECT, 170, 170, 10, 10);
  bottomBubble.addChild(bottomRect1);
  bottomBubble.addChild(bottomRect2);
  bottomBubble.addChild(bottomRect3);
}
