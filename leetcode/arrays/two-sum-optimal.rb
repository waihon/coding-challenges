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
  return nil
end

if __FILE__ == $0
  begin
    raise RuntimeError unless two_sum([1, 3, 7, 9, 2], 11) == [3, 4]
    raise RuntimeError unless two_sum([1, 3, 7, 9, 2], 25) == nil
    raise RuntimeError unless two_sum([], 1) == nil
    raise RuntimeError unless two_sum([5], 5) == nil
    raise RuntimeError unless two_sum([1, 6], 7) == [0, 1]
    raise RuntimeError unless two_sum([2, 7, 11, 15], 9) == [0, 1]
    raise RuntimeError unless two_sum([3, 2, 4], 6) == [1, 2]
    raise RuntimeError unless two_sum([3, 3], 6) == [0, 1]
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end