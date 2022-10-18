# https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map
# where the width of each bar is 1, compute how much water
# it can trap after raining.

# @param {Integer[]} heights
# @return {Integer}
def trap(heights)
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
