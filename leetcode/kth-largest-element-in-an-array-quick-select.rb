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

def quick_select(array, left, right, index_to_find)
  if left <= right # cater for single element array where left = right
    partition_index = partition(array, left, right)
    if partition_index == index_to_find
      return array[partition_index]
    elsif index_to_find < partition_index
      return quick_select(array, left, partition_index - 1, index_to_find)
    else
      return quick_select(array, partition_index + 1, right, index_to_find)
    end
  end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  index_to_find = nums.length - k
  quick_select(nums, 0, nums.length - 1, index_to_find)
end
