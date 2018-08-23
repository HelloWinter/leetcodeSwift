//: Playground - noun: a place where people can play

import UIKit

/**删除排序链表中的重复元素
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
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

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var cursor = head?.next
    var compareNode = head;
    while cursor != nil,compareNode != nil {
        if cursor!.val == compareNode!.val {
            compareNode!.next  = cursor!.next
            cursor = cursor!.next
            if compareNode!.next == nil {
                compareNode = compareNode!.next
            }
        }else{
            compareNode = compareNode!.next
        }
    }
    return head
}

let l1 = ListNode(1)
let l2 = ListNode(1)
let l3 = ListNode(2)
let l4 = ListNode(3)
let l5 = ListNode(3)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
l5.next = nil

print(deleteDuplicates(l1)!)
