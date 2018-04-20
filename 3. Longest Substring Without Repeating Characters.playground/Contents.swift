//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

import UIKit

let string =  "c"

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0
        var i = 0
        var j = 0
        var dic: [String: Int] = [:]
        while j < s.count {
            let c = substring(s: s, start: j, length: 1)
            if let index = dic[c] {
                if index > i {
                    i = index
                }
            }
            if j - i + 1 > length {
                length = j - i + 1
            }
            dic[c] = j + 1
            j = j + 1
        }

        return length
    }

    func substring(s: String, start: Int, length: Int) -> String {
        let rande: Range<String.Index> = Range.init(NSMakeRange(start, length), in: s)!
        let sub = s[rande.lowerBound]
        return String(sub)
    }
}

Solution().lengthOfLongestSubstring(string)
