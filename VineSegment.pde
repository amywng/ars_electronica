class VineSegment {
  int orientation;
  Posn posn;
  int vineWidth;
  int vineHeight;
  
  VineSegment(int orientation, Posn posn, int w, int h) {
    this.orientation = orientation;
    this.posn = posn;
    this.vineWidth = w;
    this.vineHeight = h;
  }
  
  void display(boolean left) {
    noFill();
    strokeWeight(.8);
    if (left) {
      //stroke(101,245,0);
      stroke(0,144,18);
    } else {
      //stroke(5,121,0);
      stroke(86,160,34);
    }
    //stroke(101,245,0);
    switch (this.orientation) {
      // cave facing down
      case 1:
        arc(this.posn.x, this.posn.y, this.vineWidth, this.vineHeight, PI, TWO_PI);
        break;
      // cave facing left
      case 2:
        arc(this.posn.x, this.posn.y, this.vineWidth, this.vineHeight,PI+HALF_PI, TWO_PI+HALF_PI);
        break;
      // cave facing up
      case 3:
        arc(this.posn.x, this.posn.y, this.vineWidth, this.vineHeight,0, PI);
        break;
      // cave facing right
      case 4:
        arc(this.posn.x, this.posn.y, this.vineWidth, this.vineHeight, HALF_PI, PI+HALF_PI);
        break;
    }
  }
  
  Posn move(int x, int y) {
    this.posn = new Posn(this.posn.x+x, this.posn.y+y);
    return this.posn;
  }
}
