//Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//
//Example 1:
//
//Input: "(()"
//Output: 2
//Explanation: The longest valid parentheses substring is "()"
//Example 2:
//
//Input: ")()())"
//Output: 4
//Explanation: The longest valid parentheses substring is "()()"

import UIKit

class Solution {

    struct Value {
        let pair: String
        let index: Int

        var isOpened: Bool {
            return pair == "("
        }
    }

    func longestValidParentheses(_ s: String) -> Int {

        guard s.count > 0 else {
            return 0
        }

        var stack: [Value] = []

        for i in 0..<s.count {
            let sub = substring(s: s, start: i, length: 1)
            let value = Value(pair: sub, index: i + 1)
            if stack.last?.isOpened == true && !value.isOpened {
                stack.removeLast()
            } else {
                stack.append(value)
            }
        }

        var indexes = stack.map({ $0.index })
        indexes.insert(0, at: 0)
        indexes.append(s.count + 1)

        var maximum = 0
        for i in 1..<indexes.count {
            let current = indexes[i]
            let pre = indexes[i - 1]
            maximum = max(current - pre - 1, maximum)
        }

        return maximum
    }

    func substring(s: String, start: Int, length: Int) -> String {
        let rande: Range<String.Index> = Range.init(NSMakeRange(start, length), in: s)!
        let sub = s[rande.lowerBound]
        return String(sub)
    }
}

assert(Solution().longestValidParentheses("(())") == 4)
assert(Solution().longestValidParentheses(")()()(") == 4)
assert(Solution().longestValidParentheses("(()") == 2)
