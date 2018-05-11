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
        var used: Set<Int> = Set<Int>()
        var result:[[Int]] = []

        print("sorted - \(sorted)")
        for i in 0..<sorted.count {
            let number = sorted[i]
            if used.contains(number) {
                continue
            }
            used.insert(number)

            if number <= 0 {
                var localUsed = Set<Int>()
                for j in i+1..<sorted.count {
                    let nextNumber = sorted[j]
                    if !localUsed.contains(nextNumber) {
                        let missingNumber = 0 - nextNumber - number
                        for g in j+1..<sorted.count {
                            if sorted[g] == missingNumber {
                                result.append([number, nextNumber, missingNumber])
                                break
                            }
                        }
                    }
                    localUsed.insert(nextNumber)
                }
            } else {
                break
            }
        }
        print("result \(result)")
        return result
    }

    private func notPositive(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        nums.forEach { (num) in
            if num <= 0 {
                result.append(num)
            }
        }
        return result
    }
}

assert(Solution().threeSum([0, 0, 0, 0]) == [[0, 0, 0]])
assert(Solution().threeSum([-1, 0, 1, 2, -1, -4]) == [[-1, 0, 1],[-1, -1, 2]])
