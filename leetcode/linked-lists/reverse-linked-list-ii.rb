# https://leetcode.com/problems/reverse-linked-list-ii/
# Given the head of a singly linked list and two integers left and right
# where left <= right, reverse the nodes of the list from position left
# to position right, and return the reversed list.
# The number of nodes in the list is n.
# 1 <= n <= 500
# -500 <= Node.val <= 500
# 1 <= left <= right <= n

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

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
    rev_head = reverse_between(head, 2, 4)
    raise RuntimeError unless linked_list_to_array(rev_head) == [1, 4, 3, 2, 5]

    head = array_to_linked_list([1, 2, 3, 4, 5])
    rev_head = reverse_between(head, 1, 5)
    raise RuntimeError unless linked_list_to_array(rev_head) == [5, 4, 3, 2, 1]

    head = array_to_linked_list([5])
    rev_head = reverse_between(head, 1, 1)
    raise RuntimeError unless linked_list_to_array(rev_head) == [5]
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
