PShape book;

void bookAnimation(String scale) {
  shapeMode(CENTER);
  switch (scale) {
    case "small":
      scale(.2);
      book();
      shape(book, 140, 30);
      break;
    case "medium":
      scale(.4);
      book();
      shape(book, 55,10);
      break;
    case "large":
      scale(.8);
      book();
      shape(book, 10,1);
  }
}


void book() {
  PShape col2, col3, col4, col5, col6, col7, col8, col9, col10;
  PShape stroke1, stroke2;
  color red = color(245, 46, 15);
  book = createShape(GROUP);

  fill(245, 229, 173);
  col2 = createShape(RECT, 29, 8, 1, 10);
  col3 = createShape(RECT, 30, 8, 1, 10);
  col4 = createShape(RECT, 31, 8, 1, 10);
  col6 = createShape(RECT, 33, 8, 1, 10);
  col7 = createShape(RECT, 34, 8, 1, 10);
  col8 = createShape(RECT, 35, 8, 1, 10);

  // big columns
  col9 = createShape(RECT, 36, 7, 1, 12);
  col10 = createShape(RECT, 28, 7, 1, 12);
  //stroke1 = createShape(RECT, 28,7,.5,12);

  //red stroke
  fill(red);
  col5 = createShape(RECT, 32, 8, 1, 10);
  stroke1 = createShape(RECT, 27.7, 7, .3, 12);
  stroke2 = createShape(RECT, 37, 7, .3, 12);

  book.addChild(col2);
  book.addChild(col3);
  book.addChild(col4);
  book.addChild(col5);
  book.addChild(col6);
  book.addChild(col7);
  book.addChild(col8);
  book.addChild(col9);
  book.addChild(col10);
  book.addChild(stroke1);
  book.addChild(stroke2);
}
