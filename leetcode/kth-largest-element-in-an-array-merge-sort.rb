# https://leetcode.com/problems/kth-largest-element-in-an-array/
# Given an integer array nums and an integer k, return the
# kth largest element in the array.

# @param {Integer[]} array
# @return {Integer[]}
def merge_sort(array)
  return array if array.length == 1
  
  # Split array into left and right
  middle = array.length / 2
  left_length = middle
  left = array.slice(0, left_length)
  right_length = array.length - left_length
  right = array.slice(middle, right_length)
  
  return merge(merge_sort(left), merge_sort(right))
end

# @param {Integer[]} left
# @param {Integer[]} right
# @return {Integer[]}
def merge(left, right)
  result = []
  left_index = 0
  right_index = 0
  while left_index < left.length && right_index < right.length
    if left[left_index] <= right[right_index]
      result.push(left[left_index])
      left_index += 1
    else
      result.push(right[right_index])
      right_index += 1
    end
  end
  
  # Merge remaining elements of left and right arrays if any.
  # left: [2, 4], right: [1, 6]
  # left_index: 2, right_index: 1
  # result: [1, 2, 4]
  # return: [1, 2, 4] + [] + [6]
  result.concat(left.slice(left_index, left.length - left_index)). 
    concat(right.slice(right_index, right.length - right_index))
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  index_to_find = nums.length - k
  merge_sort(nums)[index_to_find]
end
