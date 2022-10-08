# https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
# Given the head of the first level of the list, flatten
# the list so that all the nodes appear in a single-level,
# doubly linked list. 

# Definition for a Node.
# class Node
#     attr_accessor :val, :prev, :next, :child
#     def initialize(val=nil, prev=nil, next_=nil, child=nil)
#         @val = val
#         @prev = prev
#         @next = next_
#         @child = child
#     end
# end

# @param {Node} root
# @return {Node}
def flatten(root)
  return root if not root
  
  current_node = root
  while current_node
    if not current_node.child
      current_node = current_node.next
    else
      tail = current_node.child
      while tail.next
        tail = tail.next
      end
      tail.next = current_node.next
      tail.next.prev = tail if tail.next
      # Alternative: tail.next&.prev = tail
      current_node.next = current_node.child
      current_node.next.prev = current_node
      current_node.child = nil
    end
  end
  
  return root
end
