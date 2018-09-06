//The count-and-say sequence is the sequence of integers with the first five terms as following:
//
//1.     1
//2.     11
//3.     21
//4.     1211
//5.     111221
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//Given an integer n, generate the nth term of the count-and-say sequence.
//
//Note: Each term of the sequence of integers will be represented as a string.
//
//Example 1:
//
//Input: 1
//Output: "1"
//Example 2:
//
//Input: 4
//Output: "1211"

import UIKit

class Solution {
    func countAndSay(_ n: Int) -> String {

        var result: [Int] = []
        for _ in 0..<n {
            result = up(array: result)
        }
        return result.reduce("", { (r, number) -> String in
            return "\(r)\(number)"
        })
    }

    func up(array: [Int]) -> [Int] {
        guard !array.isEmpty else {
            return [1]
        }

        var result: [Int] = []
        var count = 0
        for i in 0..<array.count {
            let char = array[i]
            count += 1
            if i < array.count - 1 {
                let next = array[i+1]
                if next != char {
                    result.append(contentsOf: [count, char])
                    count = 0
                }
            } else {
                result.append(contentsOf: [count, char])
            }
        }
        return result
    }
}

assert(Solution().countAndSay(2) == "11")
Solution().countAndSay(3)
Solution().countAndSay(4)
Solution().countAndSay(5)
Solution().countAndSay(6)
