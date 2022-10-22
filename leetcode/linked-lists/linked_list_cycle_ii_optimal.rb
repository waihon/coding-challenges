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
  
  tortoise = hare = head
  
  while hare && hare.next
    tortoise = tortoise.next  # tortoise moves 1 step
    hare = hare.next&.next # hair moves steps
 
    if tortoise == hare # found a meeting point, i.e. cycle detected
      p1 = head
      p2 = tortoise
      while (p1 != p2)
        p1 = p1.next
        p2 = p2.next
      end
      return p1
    end
  end

  return nil
end
