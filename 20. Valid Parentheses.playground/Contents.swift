//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Note that an empty string is also considered valid.

import UIKit

class Solution {

    let pairs = ["}" : "{", "]" : "[", ")" : "("]
    let opened: Set<String> = Set(arrayLiteral: "{", "[", "(")
    var unpaired: Array<String> = []

    func isValid(_ s: String) -> Bool {

        for i in 0..<s.count {
            let char = substring(s: s, start: i)

            if opened.contains(char) {
                unpaired.append(char)
            } else if let last = unpaired.last,
                let pair = pairs[char],
                last == pair {
                unpaired.removeLast()
            } else {
                return false
            }
        }

        return unpaired.count == 0
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

assert(Solution().isValid("{[]}") == true)
assert(Solution().isValid("([)]") == false)
assert(Solution().isValid("()[]{}") == true)

