//Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//
//Input: 123
//Output: 321
//Example 2:
//
//Input: -123
//Output: -321
//Example 3:
//
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
//


import UIKit

class Solution {
    func reverse(_ x: Int) -> Int {

        var result = 0
        var input: Int = abs(x)
        let sign = x >= 0 ? 1 : -1
        while input > 0 {
            let division = input % 10
            result = result + division
            input = Int(CGFloat(input) / 10.0)
            if input > 0 {
                result *= 10
            }
        }

        if abs(result) > Int32.max {
            return 0
        }

        result *= sign
        print("\(result)")

        return result
    }
}

assert(Solution().reverse(123) == 321)
assert(Solution().reverse(-123) == -321)
assert(Solution().reverse(120) == 21)
assert(Solution().reverse(0) == 0)
assert(Solution().reverse(-999999) == -999999)
assert(Solution().reverse(1534236469) == 0)

