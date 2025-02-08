Tree tree;



int marginTop = 50;
int marginBottom = 50 ;
int marginLeft = 50;
int marginRight = marginLeft;
int actualWidth, actualHeight;

int maxItem = 3000;

PImage source;

void setup() {
  size(10000,5000);
  //source = loadImage("src3.jpg");
  //fullScreen();
  actualWidth = width - marginLeft - marginRight;;
  actualHeight = height - marginTop - marginBottom;
  background(0);
  tree = new Tree();
  
  
  for(int i = 0; i < 3000; i ++) {
    tree.insert(int(random(0, maxItem)));
  }
  tree.drawTree(tree.root, 10);
  //Some infos
  //tree.inOrderTraversal(tree.root);
  //println(tree.treeHeight);
  //println(tree.maxOccurrence);
  
  
  //imageTrees(source, 10);
  
  save("out5.jpg");
  exit();
}

/*
void draw() {
  tree.insert(int(random(0, maxItem)));
  background(0);
  tree.drawTree(tree.root, 3);
  //delay(10);
}
*/
