//The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//And then read line by line: "PAHNAPLSIIGYIR"
//
//Write the code that will take a string and make this conversion given a number of rows:
//
//string convert(string s, int numRows);
//Example 1:
//
//Input: s = "PAYPALISHIRING", numRows = 3
//Output: "PAHNAPLSIIGYIR"
//Example 2:
//
//Input: s = "PAYPALISHIRING", numRows = 4
//Output: "PINALSIGYAHRPI"
//Explanation:
//
//P     I    N
//A   L S  I G
//Y A   H R
//P     I

import UIKit

var str = "PAYPALISHIRING"

class Solution {

    class Zigzag {
        let minumum = 1
        let maximum: Int
        private(set) var value = 1
        private var direction = 1
        init(max: Int) {
            self.maximum = max
        }

        func next() {
            var next = value + direction
            if next > maximum {
                direction = -1
                next = max(maximum - 1, minumum)
            }
            if next < minumum {
                direction = 1
                next = min(2, maximum)
            }
            value = next
        }
    }

    func convert(_ s: String, _ numRows: Int) -> String {
        var rows: [Int: String] = [:]
        let zig = Zigzag(max: numRows)
        var rowIndex = zig.value
        for i in 0..<s.count {
            let char = substring(s: s, start: i, length: 1)

            var current = rows[rowIndex] ?? ""
            current += char
            rows[rowIndex] = current
            zig.next()
            rowIndex = zig.value


            print("\(rowIndex)")
        }
        var result = ""
        for i in zig.minumum...zig.maximum {
            result += (rows[i] ?? "")
        }
//        print("\(rows)")
        return result
    }

    func substring(s: String, start: Int, length:Int = 1) -> String {
        let rande: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[rande]
        return String(sub)
    }
}


let result = Solution().convert(str, 4)
print("result - \(result)")
