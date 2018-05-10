//Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
//
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
//The matching should cover the entire input string (not partial).
//
//Note:
//
//s could be empty and contains only lowercase letters a-z.
//p could be empty and contains only lowercase letters a-z, and characters like . or *.
//Example 1:
//
//Input:
//s = "aa"
//p = "a"
//Output: false
//Explanation: "a" does not match the entire string "aa".
//Example 2:
//
//Input:
//s = "aa"
//p = "a*"
//Output: true
//Explanation: '*' means zero or more of the precedeng element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
//Example 3:
//
//Input:
//s = "ab"
//p = ".*"
//Output: true
//Explanation: ".*" means "zero or more (*) of any character (.)".
//Example 4:
//
//Input:
//s = "aab"
//p = "c*a*b"
//Output: true
//Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore it matches "aab".
//Example 5:
//
//Input:
//s = "mississippi"
//p = "mis*is*p*."
//Output: false
import UIKit

class Solution {

    struct Regexp {
        let value: String
        var infinit: Bool = false

        func match(_ s: String) -> Bool {
            return value == "." || value == s
        }
    }

    func isMatch(_ s: String, _ p: String) -> Bool {
        guard !s.isEmpty, !p.isEmpty else {
            return true
        }
        var regexp: [Regexp] = []

        for i in 0..<p.count {
            let s = substring(s: p, start: i)

            if s == "*" {
                if var regex = regexp.last {
                    regex.infinit = true
                    regexp.remove(at: regexp.count - 1)
                    regexp.append(regex)
                }
            } else {
                let reg = Regexp(value: s, infinit: false)
                regexp.append(reg)
            }
        }

        print("regexp - \(regexp)")


        var i = 0
        var j = 0
        while i < s.count {
            print("s.count - \(s.count)")
            print("i - \(i)")
            print("j - \(j)")
            guard j < regexp.count else {
                return false
            }

            let char = substring(s: s, start: i)
            let regex = regexp[j]
            print("char - \(char)")
            print("regex - \(regex)")



            if regex.match(char) && !regex.infinit {
                j += 1
            } else if !regex.match(char) && regex.infinit {
                j += 1
                continue
            }

            if !regex.match(char) {
                return false
            }

            i += 1
        }

        print("i - \(i)")
        print("j - \(j)")

        if i == s.count  {
            if j < regexp.count {
                for p in j..<regexp.count {
                    let r = regexp[p]
                    if !r.infinit {
                        return false
                    }
                }
                return true
            }
        }

        return (regexp.count - 1 == j && s.count == i) || regexp.count == j
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

//print("\(Solution().isMatch("ab", "c*a*b"))")

assert(Solution().isMatch("mississippi", "mis") == false)
assert(Solution().isMatch("ab", ".*") == true)
assert(Solution().isMatch("aab", "c*a*b") == true)
assert(Solution().isMatch("aa", "a") == false)
assert(Solution().isMatch("aaa", "aaaa") == false)
assert(Solution().isMatch("aaa", "a*a") == true)
assert(Solution().isMatch("mississippi", "mis*is*p*.") == false)
assert(Solution().isMatch("mississippi", "mis*is*ip*.") == true)

