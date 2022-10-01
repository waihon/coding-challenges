# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_area = 0
  for p1 in 0..(height.length - 2)
    for p2 in (p1 + 1)..(height.length - 1)
      area = [height[p1], height[p2]].min * (p2 - 1)
      max_area = [max_area, area].max
    end
  end
  
  return max_area
end
