//: Playground - noun: a place where people can play

import Foundation

/**二叉树的最小深度
 给定一个二叉树，找出其最小深度。
 
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 给定二叉树 [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.
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

func minDepth(_ root: TreeNode?) -> Int {
    if root == nil{
        return 0
    }
    if root!.left == nil && root!.right == nil {
        return 1
    }
    var depth1 = minDepth(root!.left) + 1
    var depth2 = minDepth(root!.right) + 1
    
    if depth1 == 1 {
        depth1 = Int.max
    }
    if depth2 == 1 {
        depth2 = Int.max
    }
    if depth1 > depth2 {
        return depth2
    }
    return depth1
}

let tn = TreeNode(3)
let tn1 = TreeNode(9)
let tn2 = TreeNode(20)
let tn3 = TreeNode(15)
let tn4 = TreeNode(7)

tn.left = tn1
tn.right = tn2
tn2.left = tn3
tn2.right = tn4

minDepth(tn)
