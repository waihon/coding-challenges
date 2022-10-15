# https://leetcode.com/problems/container-with-most-water/
# You are given an integer array height of length n. There are n vertical
# lines drawn such that the two endpoints of the ith line are (i, 0) and
# (i, height[i]).
# Find two lines that together with the x-axis form a container, such that
# the container contains the most water.
# Return the maximum amount of water a container can store.
  
# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  max_area = 0
  p1 = 0
  p2 = heights.length - 1
  while p1 < p2
    height = [heights[p1], heights[p2]].min
    width = p2 - p1
    area = height * width
    max_area = [max_area, area].max
    if heights[p1] <= heights[p2]
      p1 += 1
    else
      p2 -= 1
    end
  end
  
  return max_area
end

if __FILE__ == $0
  begin
    raise RuntimeError unless max_area([7, 1, 2, 3, 9]) == 28
    raise RuntimeError unless max_area([7]) == 0
    raise RuntimeError unless max_area([]) == 0
    raise RuntimeError unless max_area([6, 9, 3, 4, 5, 8]) == 32 
    raise RuntimeError unless max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) == 49
    raise RuntimeError unless max_area([1, 1]) == 1
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end
end
