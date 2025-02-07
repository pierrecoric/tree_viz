int maxWidth;
int maxHeight;

//TreeNode
class TreeNode {
  int val;
  int occurence;
  int depth;
  TreeNode left;
  TreeNode right;
  //Constructor.
  TreeNode(int v) {
    val = v;
    occurence = 1;
    depth = 0;
  }
}
//////////End of treeNode


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
      node.occurence ++;
      if (node.occurence > maxOccurrence) {
        maxOccurrence = node.occurence;
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
    int truc1 = width / width;
    int truc2 = height / treeHeight;
     if(node != null) {
       drawTree(node.left, nodeSize);
       if(node.left != null) {
         fill(map(node.occurence, 1, maxOccurrence, 50, 255));
         stroke(map(node.occurence, 1, maxOccurrence, 100, 255));
         line(node.val / 2 * truc1, node.depth * truc2, node.left.val / 2 * truc1, node.left.depth * truc2);
       }
       if(node.right != null) {
         line(node.val / 2 * truc1, node.depth * truc2, node.right.val / 2 * truc1, node.right.depth * truc2);
       }
       circle(node.val / 2 * truc1, node.depth * truc2, nodeSize);
       drawTree(node.right, nodeSize);
      }
    }
  //////////End of the function to draw the tree.
}
//////////End of tree




Tree tree;
void setup() {
  //size(1200,800);
  background(0);
  fullScreen();
  tree = new Tree();
  
  for(int i = 0; i < 3; i ++) {
    tree.insert(int(random(0, width*2)));
  }
  
  tree.inOrderTraversal(tree.root);
  println(tree.treeHeight);
  println(tree.maxOccurrence);
  tree.drawTree(tree.root, 2);
}

void draw() {
  tree.insert(int(random(0, width*2)));
  background(0);
  tree.drawTree(tree.root, 2);
  //delay(10);
}
