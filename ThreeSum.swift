//A solution to https://leetcode.com/problems/3sum/description/
//
//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note: The solution set must not contain duplicate triplets.
//
//For example, given array S = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var returnable = [[Int]]()
        let arr = nums.sorted()
        
        if nums.count < 3 {
            return returnable
        }
        
        for index in 0...(arr.count - 1) {
            
            if index > 0 {
                
                if arr[index] == arr[index-1] {
                    
                    continue
                }
            }
            
            var left = index + 1
            var right = arr.count - 1
            
            while left < right {
                
                let result = arr[index] + arr[left] + arr[right]
                
                if result < 0 {
                    left += 1
                } else if result > 0 {
                    right += -1
                } else if result == 0 {
                    
                    returnable.append([arr[index], arr[left], arr[right]])
                    
                    while left < right && arr[left] == arr[left + 1] {
                        left += 1
                    }
                    
                    while left < right && arr[right] == arr[right - 1] {
                        right += -1
                    }
                    left += 1
                    right += -1
                }
            }
        }
        return returnable
    }
}
