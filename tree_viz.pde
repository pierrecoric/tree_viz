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

class Tree {
  TreeNode root;
  
  //Insert Function
  void insert(int n, TreeNode node) {
    int currentDepth = 0;
    //If the root is null.
    if(node == null) {
      node = new TreeNode(n);
      return;
    }
    if(n < node.val) {
      insert(n, node.left);
    }
    else if(n > node.val) {
      insert(n, node.right);
    }
    else {
      node.occurence ++;
    }
  }
  //////////End of insert function.
  
  //InOrderTraversal
  void inOrderTraversal(TreeNode node) {
    if(node != null) {
      print(node.val);
    }
    if(node.left != null) {
      inOrderTraversal(node.left);
    }
    if(node.right != null) {
      inOrderTraversal(node.right);
    }
    
  }
  //////////End of inOrderTraversal.
}



void setup() {
  Tree tree = new Tree();
  tree.insert(90, tree.root);
  tree.insert(92, tree.root);
  tree.inOrderTraversal(tree.root);
  size(500,500);
}
