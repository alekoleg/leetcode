//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
//
//A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//
//
//Example:
//
//Input: "23"
//Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//Note:
//
//Although the above answer is in lexicographical order, your answer could be in any order you want.

import UIKit

class Solution {

    let map: [String: [String]] = [
        "2" : ["a", "b", "c"],
        "3" : ["d", "e", "f"],
        "4" : ["g", "h", "i"],
        "5" : ["j", "k", "l"],
        "6" : ["m", "n", "o"],
        "7" : ["p", "q", "r", "s"],
        "8" : ["t", "u", "v"],
        "9" : ["w", "x", "y", "z"],
    ]


    func letterCombinations(_ digits: String) -> [String] {
        var result: [String] = []
        for i in 0..<digits.count {
            let digit = substring(s: digits, start: i)
            print("digit - \(digit)")
            if let chars = map[digit] {
                let previous = result
                result = []
                for j in 0..<chars.count {
                    let char = chars[j]
                    print("char - \(char)")
                    if previous.count > 0 {
                        previous.forEach { (prev) in
                            result.append(prev + char)
                        }
                    } else {
                        result.append(char)
                    }
                }
            }
        }

        print("result - \(result)")

        return result
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

assert(Solution().letterCombinations("23") == ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])

