# https://leetcode.com/problems/binary-tree-right-side-view/
# Given the root of a binary tree, imagine yourself standing
# on the right side of it, return the values of the nodes you
# can see ordered from top to bottom.
# Best case test cae: [1,2,3,4,5,null,6,null,7,null,null,null,null,8]
# Expected result: [1,3,6,7,8]

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?
  
  result = []
  queue = [root]
  
  while queue.length > 0
    # Beginning of a new level
    length = queue.length
    count = 0
    
    while count < length
      current_node = queue.shift # remove the first item
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
      count += 1
    end

    # Push the last note of each level
    result.push(current_node.val)
  end
  
  return result
end
