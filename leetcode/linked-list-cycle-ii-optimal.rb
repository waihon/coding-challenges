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
  
  slow = fast = head
  
  while fast && fast.next
    slow = slow.next  # toitoise takes 1 step
    fast = fast.next&.next # hair takes 2 steps
 
    if slow == fast # found a meeting point, i.e. cycle detected
      left = head
      right = fast
      while (left != right)
        left = left.next
        right = right.next
      end
      cycle_begins = left
      return cycle_begins
    end
  end

  return nil
end
