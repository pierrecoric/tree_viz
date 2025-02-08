//Tree ideas.
/*
Root following the cursor can be very satisfying
*/

/*
Populate the tree with the data of an image
*/


//Tree
class Tree {
  TreeNode root;
  int treeHeight;
  int maxOccurrence;
  //Constructor.
  Tree() {
    treeHeight = 0;
    maxOccurrence = 0;
  }
  //Insert driver function
  void insert(int n) {
    root = recursiveInsert(n, root, 0);
  }
  
  //Insert recursive Function
  TreeNode recursiveInsert(int n, TreeNode node, int d) {
    //If the root is null.
    if(node == null) {
      TreeNode newNode = new TreeNode(n);
      newNode.depth = d;
      if (d > treeHeight) {
        treeHeight = d;
      }
      return newNode;
    }
    if(n < node.val) {
      node.left = recursiveInsert(n, node.left, d + 1);
    }
    else if(n > node.val) {
      node.right = recursiveInsert(n, node.right, d + 1);
    }
    else {
      node.occurrence ++;
      if (node.occurrence > maxOccurrence) {
        maxOccurrence = node.occurrence;
      }
    }
    return node;
  }
  //////////End of insert function.
  
  void insertImage(PImage src, boolean r, boolean g, boolean b) {
    for(int y = 0; y < src.height; y ++) {
      for(int x = 0; x < src.width; x++) {
        PImage zone = src.get(x,y,1,1);
        int value = getValue(zone, r, g, b);
        root = recursiveInsert(value, root, 0);
      }
    }
  }
  
  
  //InOrderTraversal
  void inOrderTraversal(TreeNode node) {
     if(node != null) {
       inOrderTraversal(node.left);
       println(node.val + " at depth " + node.depth);
       inOrderTraversal(node.right);
      }
    }
  //////////End of inOrderTraversal.
  
  //Function to draw the tree.
  void drawTree(TreeNode node, int nodeSize) {
    float gapX = float(actualWidth) / float(maxItem);
    float gapY = float(actualHeight) / float(treeHeight);
     if(node != null) {
       drawTree(node.left, nodeSize);
       float posX = (gapX * node.val) + marginLeft;
       float posY = (gapY * node.depth) + marginTop;
       //fill(map(node.occurrence, 1, maxOccurrence, 50, 255));
       //stroke(map(node.occurrence, 1, maxOccurrence, 100, 255));
       fill(255);
       stroke(255);
       //Draw left node line.
       if(node.left != null) {
         line(posX, 
              posY, 
              float(node.left.val) * gapX + marginRight, 
              float(node.left.depth) * gapY + marginTop);
       }
       //Draw right node line
       if(node.right != null) {
         line(posX, 
              posY, 
              float(node.right.val) * gapX + marginRight, 
              float(node.right.depth) * gapY + marginTop);
       }
       circle(posX, 
              posY, 
              nodeSize);
              
       drawTree(node.right, nodeSize);
      }
    }
  //////////End of the function to draw the tree.
  
  //Function to draw the tree.
  void drawPixelTree(TreeNode node, int nodeSize, boolean r, boolean g, boolean b) {
    float gapX = float(actualWidth) / float(maxItem);
    float gapY = float(actualHeight) / float(treeHeight);
     if(node != null) {
       drawPixelTree(node.left, nodeSize, r, b, b);
       float posX = (gapX * node.val) + marginLeft;
       float posY = (gapY * node.depth) + marginTop;
       //fill(map(node.occurrence, 1, maxOccurrence, 50, 255));
       //stroke(map(node.occurrence, 1, maxOccurrence, 100, 255));
       if(r && g && b) {
         fill(node.val);
         stroke(node.val);
       }
       else if (r) {
         fill(node.val, 0, 0);
         stroke(node.val, 0, 0);
       }
       else if (g) {
         fill(0, node.val, 0);
         stroke(0, node.val, 0);
       }
       else if (b) {
         fill(0, 0, node.val);
         stroke(0, 0, node.val);
       }
       //Draw left node line.
       if(node.left != null) {
         line(posX, 
              posY, 
              float(node.left.val) * gapX + marginRight, 
              float(node.left.depth) * gapY + marginTop);
       }
       //Draw right node line
       if(node.right != null) {
         line(posX, 
              posY, 
              float(node.right.val) * gapX + marginRight, 
              float(node.right.depth) * gapY + marginTop);
       }
       int circleSize = int(map(node.occurrence, 1, maxOccurrence, 1, nodeSize));
       circle(posX, 
              posY, 
              circleSize);
       println(circleSize);
       drawPixelTree(node.right, nodeSize, r, g, b);
      }
    }
  //////////End of the function to draw the tree.
  
  
}
//////////End of tree
