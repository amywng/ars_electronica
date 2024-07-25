ArrayList<VineSegment> leftVines = new ArrayList<>();
ArrayList<VineSegment> rightVines = new ArrayList<>();

void stage1Vines() {
  fence();
  leftVine();
  //rightVine();
}

void leftVine() {
  if (leftVines.size()==0) {
    addVine(new Posn(58, 20), 2, 5, 3, true);
  }
  VineSegment prev = leftVines.get(leftVines.size()-1);
  
  int vineWidth = (int) random(2, 5);
  int vineHeight = (int) random(4, 8);
  int orientation = (int) random(1, 5);
  while (orientation==prev.orientation) {
    orientation = (int) random(1, 5);
  }
  
  switch (orientation) {
  case 1:
  case 3:
    if (prev.posn.x+prev.vineWidth>80) {
      prev.posn.x = 0-prev.vineWidth;
      pastStairs = true;
    } else if (prev.posn.x+prev.vineWidth>40&& pastStairs) {
      //stage = 2;
    } else {
      addVine(new Posn(prev.posn.x+prev.vineWidth, prev.posn.y), orientation, vineWidth, vineHeight, true);
    }
    break;
  case 2:
  case 4:
    if (prev.posn.x+prev.vineWidth>80) {
      prev.posn.x=(int)(0-.5*prev.vineWidth);
      pastStairs = true;
    } else if (prev.posn.x+prev.vineWidth>40 && pastStairs) {
      //stage = 2;
    } else {
      if (pastStairs) {
        addVine(new Posn((int)(prev.posn.x+.5*prev.vineWidth), (int)(prev.posn.y-.5*prev.vineHeight)), orientation, vineWidth, vineHeight, true);
      } else {
        addVine(new Posn((int)(prev.posn.x+.5*prev.vineWidth), (int)(prev.posn.y+.5*prev.vineHeight)), orientation, vineWidth, vineHeight, true);
      }
    }
    break;
  }
  
  for (int i=0; i<leftVines.size(); i+=1) {
    leftVines.get(i).display();
  }
}

void rightVine() {
  if (rightVines.size()==0) {
    addVine(new Posn(52,20), 3,5,3, false);
  }
  VineSegment prev = rightVines.get(rightVines.size()-1);
  
  int vineWidth = (int) random(2, 5);
  int vineHeight = (int) random(4, 8);
  int orientation = (int) random(1, 5);
  while (orientation==prev.orientation) {
    orientation = (int) random(1, 5);
  }
  
  switch (orientation) {
  case 1:
  case 3:
    if (prev.posn.x+prev.vineWidth<45 && !pastStairs) {
      pastStairs = true;
    } else if (prev.posn.x+prev.vineWidth<35&& pastStairs) {
      //stage = 2;
    } else {
      addVine(new Posn(prev.posn.x-prev.vineWidth, prev.posn.y), orientation, vineWidth, vineHeight, false);
    }
    break;
  case 2:
  case 4:
    if (prev.posn.x+prev.vineWidth<45 && !pastStairs) {
      pastStairs = true;
    } else if (prev.posn.x+prev.vineWidth<35 && pastStairs) {
      //stage = 2;
    } else {
      if (pastStairs) {
        addVine(new Posn((int)(prev.posn.x-.5*prev.vineWidth), (int)(prev.posn.y-.5*prev.vineHeight)), orientation, vineWidth, vineHeight, false);
      } else {
        addVine(new Posn((int)(prev.posn.x-.5*prev.vineWidth), (int)(prev.posn.y+.5*prev.vineHeight)), orientation, vineWidth, vineHeight, false);
      }
    }
    break;
  }
  
  for (int i=0; i<rightVines.size(); i+=1) {
    rightVines.get(i).display();
  }
}

void fence() {
  fill(255);
  noStroke();
  rect(0, 9, 50, 1);
  rect(0, 16, 50, 1);
  for (int i=0; i<42; i+=2) {
    rect(i, 6, 1, 23);
  }
}

void addVine(Posn startPos, int orientation, int w, int h, boolean left) {
  VineSegment vine = new VineSegment(orientation, startPos, w, h);
  if (left) {
    leftVines.add(vine);
  } else {
    rightVines.add(vine);
  }
}
