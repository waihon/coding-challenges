# https://leetcode.com/problems/count-complete-tree-nodes
# Given the root of a complete binary tree, return the number
# of the nodes in the tree.

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
def count_nodes(root)
  return 0 if root.nil?
  
  height = tree_height(root)
  return height if height == 1 # root is at a height of 1
  
  upper_count = 2**(height - 1) - 1
  
  left = 0; right = upper_count
  while left < right
    index_to_find = ((left + right) / 2) + 1 # round up
    # Alternative: ((left.to_f + right.to_f) / 2.0).ceil
    if node_exists(index_to_find, height, root)
      left = index_to_find
    else
      right = index_to_find - 1
    end
  end
  
  # left + 1 as left is zero-based
  # right could be used as well as it should have the same value as left
  return upper_count + left + 1   
end

# @param {TreeNode} root
# @return {Integer}
def tree_height(root)
  height = 1
  while root.left != nil
    height += 1
    root = root.left
  end
  
  return height
end

# @param {Integer} index_to_find
# @param {Integer} height
# @param {TreeNode} node
# @return {Boolean}
def node_exists(index_to_find, height, node)
  left = 0; right = 2**(height - 1) - 1; count = 0
  while count < (height - 1)
    mid_of_node = ((left + right) / 2) + 1
    if index_to_find >= mid_of_node
      node = node.right
      left = mid_of_node
    else
      node = node.left
      right = mid_of_node - 1
    end
    count += 1
  end
  
  return node != nil
end
