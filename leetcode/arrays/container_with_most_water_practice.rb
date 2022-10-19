# https://leetcode.com/problems/container-with-most-water/
# You are given an integer array heights of length n. There are n vertical
# lines drawn such that the two endpoints of the ith line are (i, 0) and
# (i, heights[i]).
# Find two lines that together with the x-axis form a container, such that
# the container contains the most water.
# Return the maximum amount of water a container can store.
  
# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  max_area = 0
  left = 0
  right = heights.length - 1

  while left < right
    width = right - left
    height = [heights[left], heights[right]].min
    area = width * height
    max_area = [max_area, area].max

    if heights[left] <= heights[right]
      left += 1
    else
      right -= 1
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
