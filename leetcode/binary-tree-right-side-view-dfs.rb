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
  dfs_pre_order(root, 0, result)
  return result
end

# @param {TreeNode} node
# @param {Integer} current_level
# @param {Integer[]} result
# Depth First Search with Pre-Order traversal prioritizing right side:
#   Node -> Right -> Left
def dfs_pre_order(node, current_level, result)
  return if node.nil? 
  
  # Use the length of array to keep track level of nodes
  if current_level >= result.length
    result.push(node.val)
  end
  
  next_level = current_level + 1
  # Priortize right side
  dfs_pre_order(node.right, next_level, result) if node.right
  dfs_pre_order(node.left, next_level, result) if node.left
end
