//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

import UIKit

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var result:[[Int]] = []
        let map: [Int:Int] = buildMap(sorted)

        for i in 0..<sorted.count {
            let number = sorted[i]
            if (i > 0 && sorted[i - 1] == number) || number > 0 {
                continue
            }

            for j in i+1..<sorted.count {
                let nextNumber = sorted[j]
                let missingNumber = 0 - nextNumber - number
                if (j > i+1 && sorted[j - 1] == nextNumber) || missingNumber < nextNumber {
                    continue
                }

                if let index = map[missingNumber], index > j {
                    result.append([number, nextNumber, missingNumber])
                }
            }
        }
        print("result \(result)")
        return result
    }

    func buildMap(_ nums:[Int]) -> [Int : Int] {
        var result: [Int : Int] = [:]
        for i in 0..<nums.count {
            result[nums[i]] = i
        }
        return result
    }
}

assert(Solution().threeSum([0, 0, 0, 0]) == [[0, 0, 0]])
assert(Solution().threeSum([-1, 0, 1, 2, -1, -4]) == [[-1, -1, 2],[-1, 0, 1]])
