//: Playground - noun: a place where people can play

import Foundation

/**平衡二叉树(AVL树)
 给定一个二叉树，判断它是否是高度平衡的二叉树。
 
 本题中，一棵高度平衡二叉树定义为：
 
 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 示例 1:
 
 给定二叉树 [3,9,20,null,null,15,7]
 
    3
   / \
  9   20
     /  \
    15   7
 返回 true 。
 
 示例 2:
 
 给定二叉树 [1,2,2,3,3,null,null,4,4]
 
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 返回 false 。
        1
       / \
      2   2
     / \   \
    3   3   3
   / \       \
  4   4       4
 /             \
5               5
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    return countDifference(root) >= 0 ? true : false;
}

func countDifference(_ node : TreeNode?) -> Int{
    if node != nil {
        let leftDepth = countDifference(node!.left)
        let rightDepth = countDifference(node!.right)
        if leftDepth < 0 || rightDepth < 0 || abs(leftDepth - rightDepth) > 1 {
            return -1
        }
        return max(leftDepth, rightDepth) + 1
    }else{
        return 0
    }
}

/*
let tn = TreeNode(3)
let tn1 = TreeNode(9)
let tn2 = TreeNode(20)
let tn3 = TreeNode(15)
let tn4 = TreeNode(7)

tn.left = tn1
tn.right = tn2
tn2.left = tn3
tn2.right = tn4
*/
let tn = TreeNode(1)
let tn1 = TreeNode(2)
let tn2 = TreeNode(2)
let tn3 = TreeNode(3)
let tn4 = TreeNode(3)
let tn5 = TreeNode(4)
let tn6 = TreeNode(4)

tn.left = tn1
tn.right = tn2
tn1.left = tn3
tn1.right = tn4
tn3.left = tn5
tn3.right = tn6

isBalanced(tn)
