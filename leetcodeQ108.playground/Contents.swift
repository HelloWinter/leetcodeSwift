//: Playground - noun: a place where people can play

import Foundation

/**将有序数组转换为二叉搜索树
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:
 
 给定有序数组: [-10,-3,0,5,9],
 
 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
 
     0
    / \
  -3   9
  /   /
 -10  5
 */

/**
 思路:使用二分查找法以中间数字为根结点，依次递归以数字之前的数字为左子树节点，以这个数字之后的数字为右子树节点构建
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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 1 {
        return TreeNode(nums[0])
    }
    let rootNode = TreeNode(nums[nums.count/2])
    let leftTree = Array<Int>(nums.prefix(nums.count/2))
    let rightTree = Array<Int>(nums.suffix(from: nums.count/2 + 1))
    if leftTree.count != 0 {
        rootNode.left = sortedArrayToBST(leftTree)
    }
    if rightTree.count != 0 {
        rootNode.right = sortedArrayToBST(rightTree)
    }
    return rootNode
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

print(preOrderTraverse(sortedArrayToBST([-10,-3,0,5,9])))

