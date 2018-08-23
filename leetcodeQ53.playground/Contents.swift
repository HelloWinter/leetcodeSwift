//: Playground - noun: a place where people can play

import Foundation

/**最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 */

func maxSubArray(_ nums: [Int]) -> Int {
    var maxCount = nums[0]
    for i in 0..<nums.count {
        for j in 0..<nums.count - i {
            if count(nums, j, j + i + 1) > maxCount {
                maxCount = count(nums, j, j + i + 1)
            }
        }
    }
    return maxCount
}

func count(_ nums: [Int],_ startIndex : Int,_ endIndex : Int) -> Int {
    guard startIndex < endIndex else {
        return 0
    }
    if startIndex == endIndex {
        return nums[startIndex]
    }
    var count = 0
    for i in startIndex..<endIndex {
        count += nums[i]
    }
    return count
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
