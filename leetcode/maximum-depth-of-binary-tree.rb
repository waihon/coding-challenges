# https://leetcode.com/problems/maximum-depth-of-binary-tree/
# Given the root of a binary tree, return its maximum depth.
# A binary tree's maximum depth is the number of nodes
# along the longest path from the root node down to the
# farthest leaf node.

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
# @return {Integer}
def max_depth(root)
  depth = 0
  
  recursive(root, 0)
end

def recursive(node, current_depth)
  if node.nil?
    return current_depth
  end
  
  current_depth += 1
  return [recursive(node.left, current_depth),
          recursive(node.right, current_depth)].max
end
