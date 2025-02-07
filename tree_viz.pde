Tree tree;

int marginTop = 50;
int marginBottom = 50 ;
int marginLeft = 50;
int marginRight = marginLeft;
int actualWidth, actualHeight;

int maxItem = 1000;

void setup() {
  size(3000,6000);
  //fullScreen();
  actualWidth = width - marginLeft - marginRight;;
  actualHeight = height - marginTop - marginBottom;
  background(0);
  tree = new Tree();
  
  for(int i = 0; i < 50000; i ++) {
    tree.insert(int(random(0, maxItem)));
  }
  tree.drawTree(tree.root, 3);
  //drawmargins();
  
  /*
  //Some infos
  tree.inOrderTraversal(tree.root);
  println(tree.treeHeight);
  println(tree.maxOccurrence);
  */
  save("out.jpg");
}

/*
void draw() {
  tree.insert(int(random(0, maxItem)));
  background(0);
  tree.drawTree(tree.root, 3);
  //delay(10);
}
*/
