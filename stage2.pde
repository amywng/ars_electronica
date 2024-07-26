ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Leaf> leaves = new ArrayList<Leaf>();
ArrayList<Posn> leafPosns = new ArrayList<Posn>();
int timerS2=0;

void stage2() {
  timerS2+=1;
  noStroke();
  if (timerS2<8) {
    for (int i=0;i<leafPosns.size();i+=1) {
      leaves.add(new Leaf(leafPosns.get(i).x, leafPosns.get(i).y, 5));
    }
    for (int i = 0; i < leaves.size(); i++) {
      leaves.get(i).display();
    }
  } else if (timerS2>=8 && timerS2<14) {
    leaves.clear();
    for (int i=0;i<leafPosns.size();i+=1) {
      leaves.add(new Leaf(leafPosns.get(i).x, leafPosns.get(i).y, 7));
    }
    for (int i = 0; i < leaves.size(); i++) {
      leaves.get(i).display();
    }
  } else if (timerS2>=14 && timerS2<30) {
    for (int i=0;i<leafPosns.size();i+=1) {
      flowers.add(new Flower(leafPosns.get(i).x, leafPosns.get(i).y, 8));
    }
    for (int i = 0; i < flowers.size(); i++) {
      flowers.get(i).display();
    }
  } else {
    s2Done=true;
  }
  
}
