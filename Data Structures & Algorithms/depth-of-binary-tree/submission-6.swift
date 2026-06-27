/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    // The max depth at a given node n depends on: 1 + max(maxDepth(n.left),maxDepth(n.right))
    // Base case: If n is a leaf node -> 1
    // Time complexity is O(n) where n equals number of nodes in the tree
    // Spatial is also O(n) as we traverse through every node (which adds to the call stack)
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0; }
        return 1 + max(maxDepth(root.left),maxDepth(root.right));
    }
}
