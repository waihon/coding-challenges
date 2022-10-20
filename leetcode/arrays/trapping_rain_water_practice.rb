# https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map
# where the width of each bar is 1, compute how much water
# it can trap after raining.

# @param {Integer[]} heights
# @return {Integer}
def trap(heights, verbose=false)
  total_water = 0
  left = 0
  right = heights.length - 1
  max_left = 0
  max_right = 0

  if verbose
    puts "heights: #{heights}"
    puts "max_left: #{max_left}"
    puts "max_right: #{max_right}"
  end

  while left < right
    if heights[left] <= heights[right]
      current_height = heights[left]
      if current_height <= max_left
        # When we are here, we know the true value of max_left but not
        # that of max_right. We also know that that max_left is definitely
        # less then max_right. So, instead of getting the min value between
        # max_left and max_right, we should just use max_left.
        current_water = max_left - current_height
        puts "left water: #{current_water}" if verbose
        total_water += current_water if current_water > 0
      else
        max_left = current_height 
        puts "max_left: #{max_left}" if verbose
      end
      left += 1
    else
      current_height = heights[right]
      if current_height <= max_right
        # When we are here, we know the true value of max_right but not
        # that of max_left. We also know that that max_right is definitely
        # less then max_left. So, instead of getting the min value between
        # max_left and max_right, we should just use max_right.
        current_water = max_right - current_height 
        puts "right water: #{current_water}" if verbose
        total_water += current_water if current_water > 0
      else
        max_right = current_height
        puts "max_right: #{max_right}" if verbose
      end
      right -= 1
    end
  end

  return total_water
end

if __FILE__ == $0
  begin
    unless (result = trap([0, 1, 0, 2, 1, 0, 3, 1, 0, 1, 2])) == 8
      puts result
      raise RuntimeError
    end
    raise RuntimeError unless trap([]) == 0
    raise RuntimeError unless trap([3]) == 0
    raise RuntimeError unless trap([3, 4, 3]) == 0
    unless (result = trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])) == 6
      puts result
      raise RuntimeError
    end
    unless (result = trap([4, 2, 0, 3, 2, 5])) == 9
      puts result
      raise RuntimeError
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
