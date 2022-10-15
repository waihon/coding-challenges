// https://leetcode.com/problems/container-with-most-water/
// You are given an integer array height of length n. There are n vertical
// lines drawn such that the two endpoints of the ith line are (i, 0) and
// (i, height[i]).
// Find two lines that together with the x-axis form a container, such that
// the container contains the most water.
// Return the maximum amount of water a container can store.

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
