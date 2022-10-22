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
  current = head
  while current
    result.push(current.val)
    current = current.next
  end

  return result
end

if __FILE__ == $0
  begin
    test_cases = [
      [1, [1, 2, 3, 4, 5], [5, 4, 3, 2, 1]],
      [2, [1, 2], [2, 1]],
      [3, [3], [3]],
      [4, [], []]
    ]
    test_cases.each do |case_num, input, expected|
      head = array_to_linked_list(input)
      rev_head = reverse_list(head)
      unless (result = linked_list_to_array(rev_head)) == expected
        puts "Test Case: #{case_num}, Input: #{input}, Actual Result: #{result}, Expected: #{expected}"
        raise RuntimeError
      end
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end    
end
