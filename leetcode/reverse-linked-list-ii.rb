# https://leetcode.com/problems/reverse-linked-list-ii/
# Given the head of a singly linked list and two integers left and right
# where left <= right, reverse the nodes of the list from position left
# to position right, and return the reversed list.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  current_pos = 1
  current_node = head
  start = head # This should eventually points to m-1
  
  # Make start -> left-1, and current_node -> left
  while current_pos < left
    start = current_node
    current_node = current_node.next
    current_pos += 1
  end
  
  new_list = nil
  tail = current_node # -> left
  
  while current_pos >= left && current_pos <= right
    _next = current_node.next
    current_node.next = new_list
    new_list = current_node
    current_node = _next
    current_pos += 1
  end
  
  start.next = new_list
  tail.next = current_node
  
  if left > 1
    head
  else
    new_list
  end
end
