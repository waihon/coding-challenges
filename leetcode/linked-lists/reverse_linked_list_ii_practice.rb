# https://leetcode.com/problems/reverse-linked-list-ii/
# Given the head of a singly linked list and two integers left and right
# where left <= right, reverse the nodes of the list from current_pos left
# to current_pos right, and return the reversed list.
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
  rev_list = nil
  current_pos = 1
  current = head
  while current
    next_ = current.next
    if current_pos == left - 1
      left_minus_1 = current
    elsif current_pos >= left && current_pos <= right
      if current_pos == left
        tail = current
      end
      current.next = rev_list
      rev_list = current
    elsif current_pos == right + 1
      tail.next = current
    end
    current = next_
    current_pos += 1
  end

  left_minus_1&.next = rev_list
  
  if left == 1
    return rev_list
  else
    return head
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
    test_cases = [
      [1, [1, 2, 3, 4, 5], 2, 4, [1, 4, 3, 2, 5]],
      [2, [1, 2, 3, 4, 5], 1, 5, [5, 4, 3, 2, 1]],
      [3, [5], 1, 1, [5]]
    ]
    test_cases.each do |case_num, input, left, right, expected|
      head = array_to_linked_list(input)
      rev_head = reverse_between(head, left, right)
      unless (result = linked_list_to_array(rev_head)) == expected
        puts "Test Case: #{case_num}, Input: #{input}, Left: #{left}, Right: #{right}, Actual Result: #{result}, Expected: #{expected}"
        raise RuntimeError
      end
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
