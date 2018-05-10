//Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//
//Note: You may not slant the container and n is at least 2.

import UIKit

class Solution {

    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }
        var leftIndex = 0
        var rightIndex = height.count - 1
        var maximum = min(height[leftIndex],height[rightIndex]) * (height.count - 1)
        while leftIndex < rightIndex {
            let leftValue = height[leftIndex]
            let rightValue = height[rightIndex]
            let localMax = min(leftValue, rightValue) * (rightIndex - leftIndex)
            maximum = max(localMax, maximum)
            if leftValue < rightValue {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }
        return maximum
    }
}

assert(Solution().maxArea([2,3,10,5,7,8,9]) == 36)
assert(Solution().maxArea([1,1]) == 1)
assert(Solution().maxArea([10,14,10,4,10,2,6,1,6,12]) == 96)

