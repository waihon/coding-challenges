# https://leetcode.com/problems/reverse-linked-list/ 
# Given the head of a singly linked list, reverse the list,
# and return the reversed list.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil? || head.next.nil?
  
  prev = nil
  current = head
  
  while current
    _next = current.next
    current.next = prev
    prev = current
    current = _next
  end
  
  return prev 
end
