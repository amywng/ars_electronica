AEC aec;
PFont font1;

// some parameters that turned out to work best for the font we're using
float FONT_SIZE = 6;
float FONT_OFFSET_Y = 0.12;
float FONT_SCALE_X = 2.669;
float FONT_SCALE_Y = 2.67;

String stringWithSpecialCharacters = "REFLECTION";

Table data;
String[] names;

boolean horizontal;
boolean nameFinished = false;

int randIndex;

void setup() {
  frameRate(25);
  size(1200, 400);
  
  horizontal = true;
  data = loadTable("names.csv", "header");
  names = new String[data.getRowCount()];
  int r=0;
  for (TableRow row: data.rows()) {
    names[r] = row.getString("Names");
    r+=1;
  }

  // NOTE: This font needs to be in the data folder.
  // and it's available for free at http://www.dafont.com
  // You COULD use a different font, but you'd have to tune the above parameters. Monospaced bitmap fonts work best.
  font1 = createFont("FreePixel.ttf", 9, false);

  // font1 = createFont("CourierNewPSMT", 9, false, charactersToInclude);
  // font1 = loadFont("CourierNewPS-BoldMT-20.vlw");

  aec = new AEC();
  aec.init();

  frameRate(30);
}

void draw() {
  aec.beginDraw();
  background(0, 0, 0);
  //fill(255);
  rect(0,0, 1200,400);
  noStroke();

  //fill(132,186,242);
  fill(80,179,227);

  person();
  shape(person, mouseX/aec.getScaleX(), mouseY/aec.getScaleY());
  // determines the speed (number of frames between text movements)
  int frameInterval = 3;
  /*
  //fill(229,19,19);
  //fill(36,188,27);
  fill(255);
  // min and max grid positions at which the text origin should be
  int minPos;
  int maxPos;
  int loopFrames;
  if (horizontal) {
    minPos = -150;
    maxPos = 50;
    int yPos = 15;
    loopFrames = (maxPos-minPos) * frameInterval;
    displayTextH(max(minPos, maxPos - (frameCount%loopFrames) / frameInterval), yPos);
  } else {
    minPos = -100;
    maxPos = 35;
    // main deck 
    int xPos = 30;
    loopFrames = (maxPos-minPos) * frameInterval;
    displayTextV(xPos, max(minPos, maxPos - (frameCount%loopFrames) / frameInterval));
  }
  
  */
  aec.endDraw();
  aec.drawSides();
}

void displayTextH(int x, int y) {
  // push & translate to the text origin
  pushMatrix();
  translate(x, y+FONT_OFFSET_Y);

  // scale the font up by fixed paramteres so it fits our grid
  scale(FONT_SCALE_X, FONT_SCALE_Y);
  textFont(font1);
  textSize(FONT_SIZE);

  if (nameFinished) {
    randIndex = (int) random(0,names.length);
    nameFinished = false;
  }
  
  // draw the font glyph by glyph, because the default kerning doesn't align with our grid
  for (int i = 0; i < names[randIndex].length(); i++)
  {
    text(names[randIndex].charAt(i), (float)i*3, 0);
    if (i==names[randIndex].length()) {
      nameFinished=true;
    }
  }

  popMatrix();
}

void displayTextV(int x, int y) {
  // push & translate to the text origin
  pushMatrix();
  translate(x, y);

  // scale the font up by fixed paramteres so it fits our grid
  scale(FONT_SCALE_X, FONT_SCALE_Y);
  textFont(font1);
  textSize(FONT_SIZE);

  if (nameFinished) {
    randIndex = (int) random(0,names.length);
    nameFinished = false;
  }
  
  // draw the font glyph by glyph, because the default kerning doesn't align with our grid
  for (int i = 0; i < names[randIndex].length(); i++)
  {
    text(names[randIndex].charAt(i), 0, (float)i*4);
    if (i==names[randIndex].length()) {
      nameFinished=true;
    }
  }

  popMatrix();
}

void keyPressed() {
  aec.keyPressed(key);
}
