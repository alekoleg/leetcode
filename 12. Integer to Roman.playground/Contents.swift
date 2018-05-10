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
//Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
import UIKit

class Solution {

    let romNumbers: [RomNumber] = [
        RomNumber(single: "I", middle: "V", highest: "X", range: 1...10),
        RomNumber(single: "X", middle: "L", highest: "C", range: 11...100),
        RomNumber(single: "C", middle: "D", highest: "M", range: 101...1000),
        RomNumber(single: "M", middle: "V", highest: "X", range: 1001...10000),
    ]

    struct RomNumber {
        let single: String
        let middle: String
        let highest: String
        let range: CountableClosedRange<Int>

        func romeNumber(from number: Int) -> String {
            guard range.contains(number) else {
                fatalError()
            }

            let first = firstDigit(from: number)
            if first <= 3 {
                return String(repeating: single, count: first)
            } else if first == 4 {
                return "\(single)\(middle)"
            } else if first >= 5 && first < 9 {
                let repeats = String(repeating: single, count: first - 5)
                return "\(middle)\(repeats)"
            } else if first == 9 {
                return "\(single)\(highest)"
            }
            return highest
        }

        private func firstDigit(from number: Int) -> Int {
            var result = number
            while result > 10 {
                result /= 10
            }
            return result
        }
    }

    func intToRoman(_ num: Int) -> String {
        var result = ""
        var index = 0
        var numVar = num
        while numVar > 0 {
            var division = numVar % 10
            division *= Int(pow(10.0, Double(index)))
            index += 1
            numVar /= 10

            print("division - \(division)")

            if division > 0 {
                let romNumber = romNumbers.first(where: { (romNumber) -> Bool in
                    romNumber.range.contains(division)
                })!

                let sting = romNumber.romeNumber(from: division)
                result = sting + result
            }
        }

        return result
    }
}

assert(Solution().intToRoman(3) == "III")
assert(Solution().intToRoman(4) == "IV")
assert(Solution().intToRoman(5) == "V")
assert(Solution().intToRoman(9) == "IX")
assert(Solution().intToRoman(58) == "LVIII")
assert(Solution().intToRoman(50) == "L")
assert(Solution().intToRoman(1994) == "MCMXCIV")
assert(Solution().intToRoman(2000) == "MM")
