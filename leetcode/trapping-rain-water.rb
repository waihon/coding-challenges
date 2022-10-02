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
