//Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
//For example, given n = 3, a solution set is:
//
//[
//"((()))",
//"(()())",
//"(())()",
//"()(())",
//"()()()"
//]


import UIKit

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }

        var result: [String] = []
        for _ in 0..<n {
            if result.count == 0 {
                result = generate(income: "")
            } else {
                var tmp = result
                result = []
                for i in 0..<tmp.count {
                    let inc = tmp[i]
                    result.append(contentsOf: generate(income: inc))
                }
            }
        }
        return result
    }

    func generate(income: String) -> [String] {
        guard income.count > 0 else {
            return ["()"]
        }

        var result: [String] = []
        result.append("(\(income))")
        result.append("()\(income)")
        let second = "\(income)()"
        if !result.contains(second) {
            result.append(second)
        }

        return result
    }
}

assert(Solution().generateParenthesis(3).count == 5)
assert(Solution().generateParenthesis(4).count == 14)

["(((())))",
 "((()()))",
 "((())())",
 "((()))()",
 "(()(()))",
 "(()()())",
 "(()())()",
 "(())(())",
 "(())()()",
 "()((()))",
 "()(()())",
 "()(())()",
 "()()(())",
 "()()()()"]
