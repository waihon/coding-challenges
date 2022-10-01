/**
 * @param {number[]} height
 * @return {number}
 */
const maxArea = function(height) {
  let maxArea = 0;
  for (let p1 = 0; p1 < height.length - 1; p1++) {
    for (let p2 = p1 + 1; p2 < height.length; p2++) {
      area = Math.min(height[p1], height[p2]) * (p2 - p1);
      maxArea = Math.max(maxArea, area);
    }
  }
  
  return maxArea;
};
