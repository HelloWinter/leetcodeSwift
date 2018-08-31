//: Playground - noun: a place where people can play

import Foundation

/**二叉树最大深度
 给定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
 3
 / \
 9  20
    /  \
    15   7
 返回它的最大深度 3 。
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

//层次遍历
func maxDepth(_ root: TreeNode?) -> Int {
    var result = [[TreeNode?]]()
    var level = [TreeNode?]()
    level.append(root)
    while level.count != 0 {
        result.append(level)
        var nextLevel = [TreeNode?]()
        for node in level {
            if node != nil {
                if node!.left != nil{
                    nextLevel.append(node!.left)
                }
                if node!.right != nil {
                    nextLevel.append(node!.right)
                }
            }
        }
        level = nextLevel
    }
    return result.count
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

maxDepth(tn)
