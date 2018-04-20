//: Playground - noun: a place where people can play

//You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
//You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
//Example
//
//  Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//  Output: 7 -> 0 -> 8
//  Explanation: 342 + 465 = 807.
import UIKit

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

func formList(digits: [Int]) -> ListNode? {
    guard digits.count > 0 else {
        return nil
    }

    let head = ListNode(-1)
    var tail = head
    digits.forEach { (digit) in
        let digitNode = ListNode(digit)
        tail.next = digitNode
        tail = digitNode
    }
    return head.next
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var currentL1 = l1
        var currentL2 = l2
        let result = ListNode(-1)
        var resultTail = result
        while let node = currentL1  {

            let currentL2Value = currentL2?.val ?? 0
            let sum = node.val + currentL2Value
            let digit = sum % 10

            let digitNode = ListNode(digit)
            resultTail.next = digitNode
            resultTail = digitNode

            if sum >= 10 {
                let nextValue = (currentL2?.next?.val ?? 0) + 1
                let newNode = ListNode(nextValue)
                newNode.next = currentL2?.next?.next
                currentL2?.next = newNode
            }

            currentL2 = currentL2?.next
            currentL1 = node.next
        }


        while let node = currentL2 {
            let digit = node.val % 10
            resultTail.next = ListNode(digit)
            resultTail = resultTail.next!

            if node.val >= 10 {
                let nextValue = (currentL2?.next?.val ?? 0) + 1
                let newNode = ListNode(nextValue)
                newNode.next = currentL2?.next?.next
                currentL2?.next = newNode
            }

            currentL2 = currentL2?.next
        }

        return result.next
    }
}

var node = Solution().addTwoNumbers(formList(digits: [1]), formList(digits: [9,9]))

print(node?.val)
print(node?.next?.val)
print(node?.next?.next?.val)

