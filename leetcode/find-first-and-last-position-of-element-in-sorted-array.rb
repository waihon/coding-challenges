# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
# Given an array of integers nums sorted in non-decreasing order,
# find the starting and ending position of a given target value.
# If target is not found in the array, return [-1, -1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  mid = binary_search(nums, target)
  
  if mid == -1
    return [mid, mid]
  else
    return build_array(nums, target, mid)
  end
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def binary_search(nums, target)
  return -1 if nums.length == 0
  
  if nums.length == 1
    if nums[0] == target
      return 0
    else
      return -1
    end
  end
    
  left = 0; right = nums.length - 1
  
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

# @param {Integer[]} nums
# @param {Integer} target
# @param {Integer} mid
# return {Integer[]}
def build_array(nums, target, mid)
  # Search for any elements to the left and with the
  # same target value.
  p1 = mid - 1
  left = nil
  while p1 >= 0
    if nums[p1] == target
      left = p1
      p1 -= 1
    else
      break
    end
  end
  
  # Search for any elements to the right and with the
  # same target value.
  p2 = mid + 1
  right = nil
  while p2 <= nums.length - 1
    if nums[p2] == target
      right = p2
      p2 += 1
    else
      break
    end
  end
  
  if left && right
    return [left, right]
  elsif left
    return [left, mid]
  elsif right
    return [mid, right]
  else
    return [mid, mid]
  end
end
