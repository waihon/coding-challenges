# https://leetcode.com/problems/two-sum
# Given an array of integers nums and an integer target,
# return indices of the two numbers such that they add up
# to target.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  number_index_map = Hash.new()
  for i in 0..(nums.length - 1)
    number_to_find = target - nums[i]
    if index = number_index_map[nums[i]]
      return [index, i]
    else
      number_index_map[number_to_find] = i
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
