# https://leetcode.com/problems/two-sum
# Given an array of integers nums and an integer target,
# return indices of the two numbers such that they add up
# to target.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums_size = nums.size
  nums_map = Hash.new(false)
  
  for i in 0..(nums_size - 1)
    # To cater for repeating numbers, e.g. test case "[3, 3], 6",
    # we add to the map only if the number doesn't exist yet.
    # Otherwise, { 3 => 0 } will be updated to { 3 => 1 } for the 2nd "3".
    if not nums_map[nums[i]]
      nums_map[nums[i]] = i
    end
    diff = target - nums[i]
   
    if nums_map[diff]
      first_index = nums_map[diff]
      second_index = i
      # To cater for the number and the difference are the same,
      # e.g. in test case "[3, 2, 4], 6", the first number is 3 and
      # the first difference is also 3. Both have a corresponding
      # index of 0, and [0, 0] is not an acceptable answer.
      if second_index > first_index
        return [first_index, second_index]
      end
    end
  end
end
