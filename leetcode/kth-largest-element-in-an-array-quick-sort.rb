# https://leetcode.com/problems/kth-largest-element-in-an-array/
# Given an integer array nums and an integer k, return the
# kth largest element in the array.

# @param {Integer[]} array
# @param {Integer} i
# @param {Integer} j
def swap(array, i, j)
  temp = array[i]
  array[i] = array[j]
  array[j] = temp
end

# @param {Integer[]} nums
# @param {Integer} lelft
# @param {Integer} right
# @return {Integer}
def partition(nums, left, right)
  pivot_element = nums[right]
  partition_index = left
  
  for j in left..(right - 1)
    if nums[j] < pivot_element
      swap(nums, partition_index, j)
      partition_index += 1
    end
  end
  
  swap(nums, partition_index, right) 
  
  return partition_index
end

# @param {Integer[]} nums
# @param {Integer} lelft
# @param {Integer} right 
def quick_sort(nums, left, right)
  if left < right
    partition_index = partition(nums, left, right)
    
    quick_sort(nums, left, partition_index - 1)
    quick_sort(nums, partition_index + 1, right)
  end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  quick_sort(nums, 0, nums.length - 1) 
  nums[-k]
end
