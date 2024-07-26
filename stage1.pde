ArrayList<VineSegment> leftVines = new ArrayList<>();
ArrayList<VineSegment> rightVines = new ArrayList<>();
boolean pastStairsR = false;
boolean pastStairsL = false;

void stage1() {
  ground();
  rightVine();
  fence();
  leftVine();
}

void leftVine() {
  if (leftVines.size()==0) {
    addVine(new Posn(58, 20), 2, 5, 3, true);
  }
  VineSegment prev = leftVines.get(leftVines.size()-1);
  
  int vineWidth = (int) random(2, 6);
  int vineHeight = (int) random(3, 5);
  int orientation = (int) random(1, 5);
  while (orientation==prev.orientation) {
    orientation = (int) random(1, 5);
  }
  if (prev.posn.x+prev.vineWidth>30 && pastStairsL) {
    orientation = (int)random(1,3)*2;
  }
  
  switch (orientation) {
  case 1:
  case 3:
    if (prev.posn.x+prev.vineWidth>80) {
      prev.posn.x = 0-prev.vineWidth;
      pastStairsL = true;
    } else if (prev.posn.y-prev.vineHeight<0) {
      //stage = 2;
    } else {
      addVine(new Posn(prev.posn.x+prev.vineWidth, prev.posn.y), orientation, vineWidth, vineHeight, true);
    }
    break;
  case 2:
  case 4:
    if (prev.posn.x+prev.vineWidth>80) {
      prev.posn.x=(int)(0-.5*prev.vineWidth);
      pastStairsL = true;
    } else {
      if (pastStairsL) {
        addVine(new Posn((int)(prev.posn.x+.5*prev.vineWidth), (int)(prev.posn.y-.5*prev.vineHeight)), orientation, vineWidth, vineHeight, true);
      } else {
        addVine(new Posn((int)(prev.posn.x+.5*prev.vineWidth), (int)(prev.posn.y+.5*prev.vineHeight)), orientation, vineWidth, vineHeight, true);
      }
    }
    break;
  }
  
  for (int i=0; i<leftVines.size(); i+=1) {
    leftVines.get(i).display(true);
  }
}

void rightVine() {
  if (rightVines.size()==0) {
    addVine(new Posn(54,20), 3,5,3, false);
  }
  VineSegment prev = rightVines.get(rightVines.size()-1);
  
  int vineWidth = (int) random(1, 3);
  int vineHeight = (int) random(4, 8);
  int orientation = (int) random(1, 5);
  while (orientation==prev.orientation) {
    orientation = (int) random(1, 5);
  }
  if (prev.posn.x+prev.vineWidth<43 && pastStairsR) {
    orientation = (int)random(1,3)*2;
  }
  switch (orientation) {
  case 1:
  case 3:
    if (prev.posn.x+prev.vineWidth<45 && !pastStairsR) {
      pastStairsR = true;
    } /*else if (prev.posn.x+prev.vineWidth<35&& pastStairs) {
      //stage = 2;
    } */else {
      addVine(new Posn(prev.posn.x-prev.vineWidth, prev.posn.y), orientation, vineWidth, vineHeight, false);
    }
    break;
  case 2:
  case 4:
    if (prev.posn.x+prev.vineWidth<45 && !pastStairsR) {
      pastStairsR = true;
    } /*else if (prev.posn.x+prev.vineWidth<35 && pastStairs) {
      //stage = 2;
    }*/ else {
      if (pastStairsR) {
        vineHeight = (int) random(8,12);
        //vineWidth = (int) random(1,2);
        addVine(new Posn((int)(prev.posn.x-.5*prev.vineWidth), (int)(prev.posn.y-.5*prev.vineHeight)), orientation, vineWidth, vineHeight, false);
      } else {
        addVine(new Posn((int)(prev.posn.x-.5*prev.vineWidth), (int)(prev.posn.y+.5*prev.vineHeight)), orientation, vineWidth, vineHeight, false);
      }
    }
    break;
  }
  
  for (int i=0; i<rightVines.size(); i+=1) {
    rightVines.get(i).display(false);
  }
}

void fence() {
  noStroke();
  fill(215,219,164);
  rect(0, 9, 45, 2);
  rect(0, 16, 45, 2);
  for (int i=0; i<42; i+=4) {
    rect(i, 6, 1, 23);
  }
}

void ground() {
  noStroke();
  // brown
  fill(95,61,16);
  rect(0, 23, 40,5);
}

void addVine(Posn startPos, int orientation, int w, int h, boolean left) {
  VineSegment vine = new VineSegment(orientation, startPos, w, h);
  if (left) {
    leftVines.add(vine);
  } else {
    rightVines.add(vine);
  }
}
