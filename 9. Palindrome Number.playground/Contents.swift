//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//
//Input: 121
//Output: true
//Example 2:
//
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//Follow up:
//
//Coud you solve it without converting the integer to a string?

import UIKit

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x != 0 && x % 10 == 0) {
            return false
        }

        var right = 0
        var left = x
        while left > right {
            let division = left % 10
            right *= 10
            right += division
            left /= 10
        }
        return left == right || left == right / 10
    }
}

assert(Solution().isPalindrome(0) == true)
assert(Solution().isPalindrome(-20) == false)
assert(Solution().isPalindrome(10) == false)
assert(Solution().isPalindrome(121) == true)
