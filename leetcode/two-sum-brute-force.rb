# https://leetcode.com/problems/two-sum

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
