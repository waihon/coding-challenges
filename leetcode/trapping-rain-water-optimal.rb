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
