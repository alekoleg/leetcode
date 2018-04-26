//Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
//Example 1:
//
//  Input: "babad"
//  Output: "bab"
//  Note: "aba" is also a valid answer.
//Example 2:
//
//  Input: "cbbd"
//  Output: "bb"

//let input = "cbbd"
//let input = "babad"
//let input = "bdfkgjsdgh"
//let input = "caba"
let input = "abcda"

import UIKit

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }

        var result = substring(s: s, start: 0, length: 1)
        print("begin")
        for i in 0..<(s.count - 1) {
            for j in i+1..<s.count {
                let sub = substring(s: s, start: i, length: j - i + 1)
                print("sub - \(sub)")
                if let r = polindromInside(sub) {
                    print("polindrom \(r)")
                    if r.count > result.count {
                        result = r
                    }
                }
            }
        }

        return result
    }

    func polindromInside(_ s: String) -> String? {
        guard s.count > 1 else {
            return nil
        }

        let leftSide = substring(s: s, start: 0, length: (s.count / 2))
        let rightStart = (s.count % 2) != 0 ? s.count / 2 + 1 : s.count / 2
        let rightSide = substring(s: s, start: rightStart, length: s.count - rightStart)

        print("sides")
        print("\(leftSide)")
        print("\(rightSide)")
        assert(leftSide.count == rightSide.count)

        var i = 0
        var j = 0
        while i < leftSide.count, substring(s: leftSide, start: leftSide.count - i - 1) == substring(s: rightSide, start: j) {
            i = i + 1
            j = j + 1
        }
        if i == 0, j == 0 {
//            if s.count % 2 == 1 {
//                let middle = substring(s: s, start: s.count / 2, length: 1)
//                let rightFirst = substring(s: rightSide, start: i, length: 1)
//                if middle == rightFirst {
//                    return middle + rightFirst
//                }
//            }

            return nil
        }

        print("indexes")
        print("i - \(i), j - \(j)")
        let resultStart = leftSide.count - i
        let lenght = (rightStart + j) - resultStart
        let resutl = substring(s: s, start: resultStart, length: lenght)

        return resutl
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

let result = Solution().longestPalindrome(input)
print("result - \(result)")
