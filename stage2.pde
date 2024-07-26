ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Leaf> leaves = new ArrayList<Leaf>();

void stage2() {
  frameRate(25);
  flowers.add(new Flower(500, 0, 160));
  noStroke();
  strokeWeight(1);

  //Display flowers
  for (int i = 0; i < flowers.size(); i++) {
    //flowers[i].applyGravity();
    flowers.get(i).move();
    flowers.get(i).display();
  }

  // Display leaves
  for (int i = 0; i < leaves.size(); i++) {
    leaves.get(i).display();
  }
}

/*void mousePressed() {
  //Create a new Flower and add it to the flower array
  //Flower f = new Flower(mouseX/aec.getScaleX(), mouseY/aec.getScaleY(),16);
  //flowers = (Flower[]) append(flowers, f);

  // Create a new Leaf and add it to the leaves array
  Leaf l = new Leaf(mouseX / aec.getScaleX(), mouseY / aec.getScaleY(), 5);
  leaves = (Leaf[]) append(leaves, l);
}*/
