# https://leetcode.com/problems/two-sum
# Given an array of integers nums and an integer target,
# return indices of the two numbers such that they add
# up to target.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  for left in 0..(nums.length - 2)
    for right in (left + 1)..(nums.length - 1)
      if (nums[left] + nums[right]) == target
        return [left, right]
      end
    end
  end
end
