# https://leetcode.com/problems/validate-binary-search-tree/
# Given the root of a binary tree, determine if it is a valid
# binary search tree (BST).

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
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  
  return dfs_pre_order(root, -Float::INFINITY, Float::INFINITY)
end

# @param {TreeNode} node
# @param {Integer} min
# @param {Integer} max
def dfs_pre_order(node, min, max)
  # Base case
  if not (node.val > min && node.val < max)  
    # Alternative: node.val <= min || node.val >= max
    return false
  end
  
  if node.left
    # Going down to the left, we maintain the minimum but
    # update the maximum to that of the previous node.
    if not dfs_pre_order(node.left, min, node.val)
      return false
    end
  end
  
  if node.right
    # Going down to the right, we update the mainimum to that
    # of the previous node but maintain the maximum.
    if not dfs_pre_order(node.right, node.val, max)
      return false
    end
  end
  
  return true
end
