//Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
//
//Symbol       Value
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
//
//Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
//
//I can be placed before V (5) and X (10) to make 4 and 9.
//X can be placed before L (50) and C (100) to make 40 and 90.
//C can be placed before D (500) and M (1000) to make 400 and 900.
//Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.


import UIKit

class Solution {

    let map: [String: Int] = [
        "I" : 1, "V" : 5, "X" : 10,
        "L" : 50, "C" : 100, "D" : 500, "M" : 1000
    ]

    func romanToInt(_ s: String) -> Int {

        var result = 0
        var previous = Int.max
        for i in 0..<s.count {
            let char = substring(s: s, start: i)
            let value = map[char]!

//            print("value - \(value)")
            if value <= previous {
                result += value
            } else {
                result += (value - 2 * previous)
            }

            previous = value
        }

        return result
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}

assert(Solution().romanToInt("III") == 3)
assert(Solution().romanToInt("IV") == 4)
assert(Solution().romanToInt("V") == 5)
assert(Solution().romanToInt("IX") == 9)
assert(Solution().romanToInt("LVIII") == 58)
assert(Solution().romanToInt("L") == 50)
assert(Solution().romanToInt("MCMXCIV") == 1994)
assert(Solution().romanToInt("MM") == 2000)
