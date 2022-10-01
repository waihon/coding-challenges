# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_area = 0
  p1 = 0
  p2 = height.length - 1
  while p1 < p2
    area = [height[p1], height[p2]].min * (p2 - p1)
    max_area = [max_area, area].max
    if height[p1] <= height[p2]
      p1 += 1
    else
      p2 -= 1
    end
  end
  
  return max_area
end
