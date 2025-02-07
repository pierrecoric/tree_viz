Tree tree;

int marginTop = 50;
int marginBottom = 50 ;
int marginLeft = 50;
int marginRight = marginLeft;
int actualWidth, actualHeight;

int maxItem = 1000;

void setup() {
  //size(1000,1000);
  fullScreen();
  actualWidth = width - marginLeft - marginRight;;
  actualHeight = height - marginTop - marginBottom;
  background(0);
  tree = new Tree();
  
  for(int i = 0; i < 500; i ++) {
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
}


void draw() {
  tree.insert(int(random(0, maxItem)));
  background(0);
  tree.drawTree(tree.root, 3);
  //delay(10);
}
