//There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
//Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
//Example 1:
//  nums1 = [1, 3]
//  nums2 = [2]
//
//  The median is 2.0
//Example 2:
//  nums1 = [1, 2]
//  nums2 = [3, 4]
//
//  The median is (2 + 3)/2 = 2.5

import UIKit

let num1 = [1, 2, 6]
let num2 = [3, 4, 7]

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {

        let merged = merge(nums1: nums1, nums2: nums2)

        if merged.count % 2 == 0 {
            let valueFrom = merged[merged.count / 2 - 1]
            let valueIndexTo = merged[merged.count / 2]
            return (Double(valueFrom) + Double(valueIndexTo)) / 2.0

        } else {
            let value = Int((Double(merged.count) / 2.0).rounded(.down))
            return Double(merged[value])
        }

        return 0
    }

    func merge(nums1:[Int], nums2:[Int]) -> [Int] {
        var merged:[Int] = []

        var j = 0
        var i = 0

        while i < nums1.count, j < nums2.count {
            let inum = nums1[i]
            let jnum = nums2[j]

            if inum < jnum {
                merged.append(inum)
                i += 1
            } else {
                merged.append(jnum)
                j += 1
            }
        }

        if i != (nums1.count) {
            merged.append(contentsOf: Array(nums1.suffix(from: i)))
        }

        if j != (nums2.count) {
            merged.append(contentsOf: Array(nums2.suffix(from: j)))
        }

        return merged
    }
}

Solution().findMedianSortedArrays(num1, num2)
