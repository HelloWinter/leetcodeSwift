//: Playground - noun: a place where people can play

import Foundation

/**合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(val)" }
        return "\(val) -> \(String(describing: next)) "
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node1 = l1
    var node2 = l2
    while node1 != nil,node2 != nil {
        if node2!.val >= node1!.val && (node1!.next == nil || node2!.val < node1!.next!.val) {
            let node = ListNode(node2!.val)
            node.next = node1!.next
            node1!.next = node
            node2 = node2!.next
        }
        node1 = node1!.next
    }
    return l1
}



let l1 = ListNode(1)
let l2 = ListNode(2)
let l4 = ListNode(4)
l1.next = l2
l2.next = l4
l4.next = nil

let n1 = ListNode(1)
let n2 = ListNode(3)
let n4 = ListNode(4)
n1.next = n2
n2.next = n4
n4.next = nil

print(mergeTwoLists(l1, n1)!)

