//: Playground - noun: a place where people can play

import Foundation

/**相同的树
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1:
 
 输入:       1         1
            / \       / \
            2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 输出: true
 示例 2:
 
 输入:      1          1
           /           \
          2             2
 
 [1,2],     [1,null,2]
 
 输出: false
 示例 3:
 
 输入:       1         1
            / \       / \
           2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 输出: false
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
//方法1
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    let arrp = preOrderTraverse(p)
    let arrq = preOrderTraverse(q)
    if arrp.count != arrq.count {
        return false
    }
    for i in 0..<arrp.count {
        if arrp[i] != arrq[i] {
            return false
        }
    }
    return true
}
//先序遍历
func preOrderTraverse(_ p: TreeNode?) -> [Int?]{
    var arr = [Int?]()
    if p != nil {
        arr.append(p!.val)
        arr += preOrderTraverse(p!.left)
        arr += preOrderTraverse(p!.right)
    }else{
        arr.append(nil)
    }
    return arr
}

//方法2
func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p != nil || q != nil{
        if p?.val != q?.val {
            return false
        }else{
            return isSameTree2(p?.left, q?.left) && isSameTree2(p?.right, q?.right)
        }
    }else{
        return true
    }
}

let treeNode1 = TreeNode(1)
let treeNode2 = TreeNode(2)
let treeNode3 = TreeNode(3)
let treeNode4 = TreeNode(4)
treeNode1.left = treeNode2
treeNode1.right = treeNode3
treeNode2.left = treeNode4

let treeNode11 = TreeNode(1)
let treeNode22 = TreeNode(2)
let treeNode33 = TreeNode(3)
let treeNode44 = TreeNode(4)
treeNode11.left = treeNode22
treeNode11.right = treeNode33
treeNode22.right = treeNode44

isSameTree(treeNode1, treeNode11)

print(preOrderTraverse(treeNode11))

