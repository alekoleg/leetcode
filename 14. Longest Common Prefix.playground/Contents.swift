//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//Example 1:
//
//Input: ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.
//Note:
//
//All given inputs are in lowercase letters a-z.
//
//Seen this question in a real interview before?  YesNo

import UIKit

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        var result = strs[0]
        for i in 1..<strs.count {
            result = common(first: result, second: strs[i])
            if result.isEmpty {
                return result
            }
        }


        return result
    }

    func common(first: String, second: String) -> String {
        var result = ""
        let lenght = min(first.count, second.count)
        for i in 0..<lenght {
            let firstChat = substring(s: first, start: i)
            let secondChat = substring(s: second, start: i)
            if firstChat == secondChat {
                result += firstChat
            } else {
                return result
            }
        }
        return result
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

assert(Solution().longestCommonPrefix(["flower","flow","flight"]) == "fl")
assert(Solution().longestCommonPrefix(["dog","racecar","car"]) == "")
assert(Solution().longestCommonPrefix(["a",]) == "a")
