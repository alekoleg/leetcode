//Implement strStr().
//
//Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Example 1:
//
//Input: haystack = "hello", needle = "ll"
//Output: 2
//Example 2:
//
//Input: haystack = "aaaaa", needle = "bba"
//Output: -1
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

import UIKit

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if needle.count > haystack.count { return -1 }
        if needle.count == haystack.count {
            return needle == haystack ? 0 : -1
        }

        for i in 0...(haystack.count - needle.count) {
            let sub = substring(s: haystack, start: i, length: needle.count)
            if sub == needle {
                return i
            }
        }

        return -1
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

assert(Solution().strStr("hello", "ll") == 2)
assert(Solution().strStr("aaa", "aaaa") == -1)
assert(Solution().strStr("a", "a") == 0)
assert(Solution().strStr("mississippi", "pi") == 9)
