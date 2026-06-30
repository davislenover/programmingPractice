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
    // Approach is to binary search through the tree until reaching the appropriate leaf node, then inserting that element
    // O(logn) time O(1) space
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        let newNode : TreeNode = TreeNode(val);
        // There can be zero nodes thus check if root is valid
        guard var rootCpy : TreeNode = root else {
            return newNode;
        }
        // Binary search the tree
        while (true) {
            if val < rootCpy.val {
                guard var newLeft : TreeNode = rootCpy.left else {
                    rootCpy.left = newNode;
                    break;
                }
                rootCpy = newLeft;
            } else if val > rootCpy.val {
                guard var newRight : TreeNode = rootCpy.right else {
                    rootCpy.right = newNode;
                    break;
                }
                rootCpy = newRight;
            }
        }
        return root;
    }
}
