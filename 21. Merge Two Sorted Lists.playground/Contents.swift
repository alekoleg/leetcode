//Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
//Example:
//
//Input: 1->2->4, 1->3->4
//Output: 1->1->2->3->4->4


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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

//        guard l1 != nil, var varL2 = l2  else {
//            if l1 != nil {
//                return l1
//            } else {
//                return l2
//            }
//        }
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
