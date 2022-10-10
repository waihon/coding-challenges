# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
# Given an array of integers nums sorted in non-decreasing order,
# find the starting and ending position of a given target value.
# If target is not found in the array, return [-1, -1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  first_pos = binary_search(nums, 0, nums.length - 1, target)
  
  if first_pos < 0
    return [first_pos, first_pos]
  elsif first_pos == 0 && nums.length == 1
    return [0, 0]
  end
  
  start_pos = first_pos # in case no target value on the left
  while start_pos != -1 
    temp_left = start_pos
    # Search towards left-most element to find the smallest index
    # with the target value.
    start_pos = binary_search(nums, 0, start_pos - 1, target)
  end
  start_pos = temp_left
  
  end_pos = first_pos # in case no target value on the right
  while end_pos != -1
    temp_right = end_pos 
    # Search towards right-most element to find the largest index
    # with the target value.
    end_pos = binary_search(nums, end_pos + 1, nums.length - 1, target)
  end
  end_pos = temp_right
  
  [start_pos, end_pos]
end

# @param {Integer[]} nums
# @param {Integer} left 
# @param {Integer} right 
# @param {Integer} target
# @return {Integer[]}
def binary_search(nums, left, right, target)
  return -1 if nums.length == 0
  
  while left <= right
    mid = ((left + right) / 2).floor
    found_value = nums[mid]
    if found_value == target
      return mid
    elsif found_value > target
      right = mid - 1
    else # found_value < target
      left = mid + 1
    end
  end
  
  # not found
  return -1
end
