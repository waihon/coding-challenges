# https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map
# where the width of each bar is 1, compute how much water
# it can trap after raining.

# @param {Integer[]} heights
# @return {Integer}
def trap(heights)
  total_water = 0
  
  for p in 0..(heights.length - 1)
    max_right = max_left = 0
    
    p_left = p - 1
    while p_left >= 0
      max_left = [max_left, heights[p_left]].max
      p_left -= 1
    end
    
    p_right = p + 1
    while p_right <= (heights.length - 1)
      max_right = [max_right, heights[p_right]].max
      p_right += 1
    end
    
    current_water = [max_left, max_right].min - heights[p]
    total_water += current_water if current_water > 0
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
