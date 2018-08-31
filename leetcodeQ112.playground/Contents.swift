//: Playground - noun: a place where people can play

import Foundation

/**路径总和
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定如下二叉树，以及目标和 sum = 22，
 
         5
        / \
       4   8
      /   / \
     11  13  4
    /  \      \
   7    2      1
 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
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

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    var tempSum = sum
    return dfs(root, &tempSum)
}

func dfs(_ root : TreeNode?,_ sum : inout Int) -> Bool {
    if root == nil {
        return false
    }
    sum -= root!.val;
    if root!.left == nil && root!.right == nil {
        return sum == 0
    }
    return dfs(root!.left, &sum) || dfs(root!.right, &sum)
}

let tn = TreeNode(5)
let tn1 = TreeNode(4)
let tn2 = TreeNode(8)
let tn3 = TreeNode(11)
let tn4 = TreeNode(13)
let tn5 = TreeNode(4)
let tn6 = TreeNode(7)
let tn7 = TreeNode(2)
let tn8 = TreeNode(1)

tn.left = tn1
tn.right = tn2
tn1.left = tn3
tn2.left = tn4
tn2.right = tn5
tn3.left = tn6
tn3.right = tn7
tn5.right = tn8

print(hasPathSum(tn, 22))

