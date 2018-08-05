//Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
//
//Example:
//
//Input:
//[
//1->4->5,
//1->3->4,
//2->6
//]
//Output: 1->1->2->3->4->4->5->6

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

        guard lists.count > 1 else {
            return lists.first ?? nil
        }

        var tmp: ListNode? = mergeTwoLists(lists[0], lists[1])
        for i in 2..<lists.count {
            let list = lists[i]
            tmp = mergeTwoLists(tmp, list)
        }

        return tmp
    }

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var varL1 = l1
        var varL2 = l2
        let result: ListNode? = ListNode(-1)
        var current = result
        while varL1 != nil || varL2 != nil {
            if varL1 != nil && varL2 != nil {
                if varL1!.val < varL2!.val {
                    current!.next = varL1
                    varL1 = varL1?.next
                } else {
                    current!.next = varL2
                    varL2 = varL2?.next
                }
            } else if varL1 != nil {
                current!.next = varL1
                varL1 = varL1?.next
            } else if varL2 != nil {
                current!.next = varL2
                varL2 = varL2?.next
            }

            current = current?.next
            current?.next = nil
        }

        return result?.next
    }
}
