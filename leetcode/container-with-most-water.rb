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
