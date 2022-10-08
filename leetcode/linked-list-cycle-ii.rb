# https://leetcode.com/problems/linked-list-cycle-ii/
# Given the head of a linked list, return the node where
# the cycle begins. If there is no cycle, return null.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
  return nil if head.nil?

  seen_nodes = Set.new    
  current_node = head
  while not seen_nodes.include?(current_node)
    if current_node.next.nil?
      return nil
    end
    seen_nodes.add(current_node)
    current_node = current_node.next
  end
  
  return current_node
end
