//: Playground - noun: a place where people can play

import UIKit

/**对称二叉树
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
 1
 / \
 2   2
 \   \
 3    3
 说明:
 
 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
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
//方法1，递归中序遍历
func isSymmetric(_ root: TreeNode?) -> Bool {
    let arr = inOrderTraverse(root)
    for i in 0..<arr.count/2 {
        if arr[i] != arr[arr.count-1-i] {
            return false
        }
    }
    return true
}

//中序遍历
func inOrderTraverse(_ p: TreeNode?) -> [Int?]{
    var arr = [Int?]()
    if p != nil {
        arr += inOrderTraverse(p!.left)
        arr.append(p!.val)
        arr += inOrderTraverse(p!.right)
    }else{
        arr.append(nil)
    }
    return arr
}

//方法2，迭代层次遍历
func isSymmetric2(_ root: TreeNode?) -> Bool {
    let array = levelOrder(root)
    for arr in array {
        for i in 0..<arr.count/2 {
            let item1 = arr[i]
            let item2 = arr[arr.count-1-i]
            if item1?.val != item2?.val {
                return false
            }
        }
    }
    return true
}

//层次遍历
func levelOrder(_ p: TreeNode?) -> [[TreeNode?]] {
    var result = [[TreeNode?]]()
    var level = [TreeNode?]()
    level.append(p)
    while level.count != 0 {
        result.append(level)
        var nextLevel = [TreeNode?]()
        for node in level {
            if node != nil {
                nextLevel.append(node!.left)
                nextLevel.append(node!.right)
            }
        }
        level = nextLevel
    }
    return result
}

////////////////////////////

let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(2)
let treeNode4 = TreeNode(3)
let treeNode5 = TreeNode(3)
let treeNode6 = TreeNode(4)
let treeNode7 = TreeNode(4)

treeNode1.left = treeNode2
treeNode1.right = treeNode3

treeNode2.left = treeNode4
treeNode2.right = treeNode6

treeNode3.left = treeNode7
treeNode3.right = treeNode5

////////////////////////////

let tn1 = TreeNode(1)
let tn2 = TreeNode(2)
let tn3 = TreeNode(2)
let tn4 = TreeNode(3)
let tn5 = TreeNode(3)
tn1.left = tn2
tn1.right = tn3
tn2.right = tn4
tn3.right = tn5

/*
print(inOrderTraverse(treeNode1))
isSymmetric(treeNode1)
 */

isSymmetric2(treeNode1)
