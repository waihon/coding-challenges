# https://leetcode.com/problems/binary-tree-level-order-traversal/
# Given the root of a binary tree, return the level order
# traversal of its nodes' values. (i.e., from left to
# right, level by level).

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
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  
  result = []
  queue = [root]
  length = queue.length
  
  while queue.length > 0
    # Beginning of a new level
    length = queue.length
    count = 0 
    current_level_values = []
    
    while count < length
      current_node = queue.shift # remove the first item
      current_level_values.push(current_node.val)
      queue.push(current_node.left) if current_node.left
      queue.push(current_node.right) if current_node.right
      count += 1
    end
    
    # End of level
    result.push(current_level_values)
  end
  
  return result
end
