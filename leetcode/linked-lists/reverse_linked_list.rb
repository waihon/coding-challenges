# https://leetcode.com/problems/reverse-linked-list/
# Given the head of a singly linked list, reverse the list,
# and return the reversed list.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

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

def array_to_linked_list(array)
  return nil if array.nil?

  prev = nil
  (array.length - 1).downto(0) do |i|
    node = ListNode.new(array[i], prev)
    prev = node
  end

  return prev 
end

def linked_list_to_array(head)
  return [] if head.nil?

  result = []
  current_node = head
  while current_node
    result.push(current_node.val)
    current_node = current_node.next
  end

  return result
end

if __FILE__ == $0
  begin
    head = array_to_linked_list([1, 2, 3, 4, 5])
    rev_head = reverse_list(head)
    raise RuntimeError unless linked_list_to_array(rev_head) == [5, 4, 3, 2, 1]

    head = array_to_linked_list([1, 2])
    rev_head = reverse_list(head)
    raise RuntimeError unless linked_list_to_array(rev_head) == [2, 1]

    head = array_to_linked_list([3])
    rev_head = reverse_list(head)
    raise RuntimeError unless linked_list_to_array(rev_head) == [3]
    
    head = array_to_linked_list([])
    rev_head = reverse_list(head)
    raise RuntimeError unless linked_list_to_array(rev_head) == []
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
