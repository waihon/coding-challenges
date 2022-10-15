# https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map
# where the width of each bar is 1, compute how much water
# it can trap after raining.

# @param {Integer[]} heights
# @return {Integer}
def trap(heights)
  total_water = 0
 
  max_left = 0
  max_right = 0
  p_left = 0
  p_right = heights.length - 1
  
  while p_left < p_right
    if heights[p_left] <= heights[p_right]
      current_height = heights[p_left]
      if current_height >= max_left
        max_left = current_height
      else current_height < max_left
        current_water = max_left - current_height
        total_water += current_water
      end
      p_left += 1
    else
      current_height = heights[p_right]
      if current_height >= max_right
        max_right = current_height
      else 
        current_water = max_right - current_height
        total_water += current_water
      end
      p_right -= 1
    end
  end
  
  return total_water
end

if __FILE__ == $0
  begin
    raise RuntimeError unless trap([0, 1, 0, 2, 1, 0, 3, 1, 0, 1, 2]) == 8
    raise RuntimeError unless trap([]) == 0
    raise RuntimeError unless trap([3]) == 0
    raise RuntimeError unless trap([3, 4, 3]) == 0
    raise RuntimeError unless trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6
    raise RuntimeError unless trap([4, 2, 0, 3, 2, 5]) == 9
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
