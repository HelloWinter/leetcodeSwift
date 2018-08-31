//: Playground - noun: a place where people can play

import Foundation

/**二叉树的层次遍历 II
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
    /  \
    15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
 ]
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

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var levelArr = [[TreeNode]]()
    var level = [TreeNode]()
    level.append(root!)
    
    var result = [[Int]]()
    var levelNum = [Int]()
    levelNum.append(root!.val)
    while level.count != 0 {
        levelArr.insert(level, at: 0)
        result.insert(levelNum, at: 0)
        var nextLevel = [TreeNode]()
        var nextLevelNum = [Int]()
        for node in level {
            if node.left != nil {
                nextLevel.append(node.left!)
                nextLevelNum.append(node.left!.val)
            }
            if node.right != nil {
                nextLevel.append(node.right!)
                nextLevelNum.append(node.right!.val)
            }
        }
        level = nextLevel
        levelNum = nextLevelNum
    }
    return result
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
print(levelOrderBottom(tn))
