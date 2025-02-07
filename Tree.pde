//Tree ideas.
/*
Root following the cursor can be very satisfying
*/

/*
Implement notions of margin and centering
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
       fill(map(node.occurrence, 1, maxOccurrence, 50, 255));
       stroke(map(node.occurrence, 1, maxOccurrence, 100, 255));
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
}
//////////End of tree
