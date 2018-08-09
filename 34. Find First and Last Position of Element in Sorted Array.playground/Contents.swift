//Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]

import UIKit

class Solution {

    enum SearchPolicy {
        case left
        case right
    }

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else {
            return [-1, -1]
        }

        guard nums.count > 1 else {
            let result = nums[0] == target ? 0 : -1
            return [result, result]
        }

        guard nums[0] <= target, nums[nums.count - 1] >= target else {
            return [-1, -1]
        }

        let startIndex = binaryIndex(left: 0, right: nums.count - 1 ,
                                         nums: nums, target: target, policy: .left)
        let endIndex = binaryIndex(left: 0, right: nums.count - 1 ,
                                        nums: nums, target: target, policy: .right)

        return [startIndex, endIndex]

    }

    private func binaryIndex(left:Int, right:Int, nums:[Int], target:Int, policy: SearchPolicy) -> Int {
        if left == right {
            return nums[left] == target ? left : -1
        }

        let middle = left + (right - left) / 2
        if nums[middle] == target {

            let result: Int
            switch policy {
            case .left:
                result = binaryIndex(left:left, right: max(left, middle - 1),
                                         nums:nums, target:target, policy: policy)
            case .right:
                result = binaryIndex(left:min(middle + 1, right), right: right,
                                         nums:nums, target:target, policy: policy)
            }

            return result != -1 ? result : middle
        }

        let newLeft = nums[middle] > target ? left : min(middle + 1, right)
        let newRight = nums[middle] > target ? max(left, middle - 1) : right
        return binaryIndex(left: newLeft, right: newRight, nums: nums, target: target, policy: policy)
    }
}

print("\(Solution().searchRange([5,7,7,8,8,10], 8))")
print("\(Solution().searchRange([8,8], 8))")
print("\(Solution().searchRange([8], 8))")
print("\(Solution().searchRange([8], 9))")
