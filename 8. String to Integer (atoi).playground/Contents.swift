//Implement atoi which converts a string to an integer.
//
//The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
//
//The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
//
//If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
//
//If no valid conversion could be performed, a zero value is returned.
//
//Note:
//
//Only the space character ' ' is considered as whitespace character.
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
//Example 1:
//
//Input: "42"
//Output: 42
//Example 2:
//
//Input: "   -42"
//Output: -42
//Explanation: The first non-whitespace character is '-', which is the minus sign.
//Then take as many numerical digits as possible, which gets 42.
//Example 3:
//
//Input: "4193 with words"
//Output: 4193
//Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
//Example 4:
//
//Input: "words and 987"
//Output: 0
//Explanation: The first non-whitespace character is 'w', which is not a numerical
//digit or a +/- sign. Therefore no valid conversion could be performed.
//Example 5:
//
//Input: "-91283472332"
//Output: -2147483648
//Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
//Thefore INT_MIN (−231) is returned.

import UIKit

class Solution {
    func myAtoi(_ str: String) -> Int {
        let set = Set(arrayLiteral: "0","1","2","3","4","5","6","7","8","9")
        var allPosibleSet = Set(arrayLiteral: "0","1","2","3","4","5","6","7","8","9", " ", "-", "+")
        let sigsSet = Set(arrayLiteral: "-", "+")
        var stop = false
        var index = 0
        var result = 0
        var sign = 1

        while !stop, index < str.count {
            let char = substring(s: str, start: index)
            if !allPosibleSet.contains(char) {
                stop = true
                break
            }

            if sigsSet.contains(char) {
                allPosibleSet.remove(" ")
                allPosibleSet.subtract(sigsSet)
                sign = char == "-" ? -1 : 1
            }

            if set.contains(char) {
                allPosibleSet.subtract(sigsSet)
                allPosibleSet.remove(" ")
                let digit = Int(char)!
                result *= 10
                result = abs(result) + digit
                result = result * sign
                result = max(Int(Int32.min), result)
                result = min(Int(Int32.max), result)
            }

            index += 1
        }

        return result
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

print("\(Solution().myAtoi(""))")
print("\(Solution().myAtoi("   -42"))")
print("\(Solution().myAtoi("4193 with words"))")
print("\(Solution().myAtoi("words and 987"))")
print("\(Solution().myAtoi("-91283472332"))")
print("\(Solution().myAtoi("20000000000000000000"))")
print("\(Solution().myAtoi("   +5 123"))")

assert(Solution().myAtoi("") == 0)
assert(Solution().myAtoi("+1") == 1)
assert(Solution().myAtoi("+-1") == 0)
assert(Solution().myAtoi("- 14") == 0)
assert(Solution().myAtoi("   +0 123") == 0)
assert(Solution().myAtoi("   +5 123") == 5)
assert(Solution().myAtoi("   -42") == -42)
assert(Solution().myAtoi("4193 with words") == 4193)
assert(Solution().myAtoi("words and 987") == 0)
assert(Solution().myAtoi("-91283472332") == Int(Int32.min))
assert(Solution().myAtoi("20000000000000000000") == Int(Int32.max))
