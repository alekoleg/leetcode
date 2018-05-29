//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

import UIKit

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var result:Int = 0
        var currentDistance = Int.max
        let sorted = nums.sorted()
        let index = nearestIndex(nums: sorted, target: target)
        let closesValue = sorted[index]

        print("closesValue \(closesValue)")
        if let first = sorted.first, first >= closesValue {
            print("pef \(sorted.prefix(3))")
            return sorted.prefix(3).reduce(0, +)
        }

        if let last = sorted.last, last <= closesValue {
            print("suf \(sorted.suffix(3))")
            return sorted.suffix(3).reduce(0, +)
        }

        var left = 0
        var right = sorted.count - 1
        print("sorted \(sorted)")
        print("nearest  \(index)")
        while left < index && right > index {
            let first = sorted[left]
            let second = sorted[index]
            let third = sorted[right]

            print("left \(left)")
            print("index \(index)")
            print("right \(right)")
            let distance = abs(target - (first + second + third))
            if distance <= currentDistance {
                currentDistance = distance
                result = first + second + third
            }
            if abs(second - first) > abs(second - third) {
                left += 1
            } else {
                right -= 1
            }
        }

        return result
    }

    func nearestIndex(nums: [Int], target: Int) -> Int {
        var result = 0
        var distance = Int.max
        for i in 0..<nums.count {
            let num = nums[i]
            let current = abs(num - target)
            if distance > current {
                distance = current
                result = i
            }

            if distance == 0 {
                break
            }
        }
        return result
    }
}


assert(Solution().threeSumClosest([-1, 2, 1, -4], 1) == 2)
assert(Solution().threeSumClosest([0, 2, 1, -3], 1) == 0)
assert(Solution().threeSumClosest([1, 1, -1], 0) == 1)
assert(Solution().threeSumClosest([1, 1, -1, -1, 3], -1) == -1)
assert(Solution().threeSumClosest([1, 1, -1, -1, 3], 3) == -1)
[1,1,-1,-1,3]
