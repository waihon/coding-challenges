# https://leetcode.com/problems/linked-list-cycle-ii/
# Given the head of a linked list, return the node where
# the cycle begins. If there is no cycle, return null.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def detectCycle(head)
  tortoise = head
  hare = head

  # while true
  while hare && hare.next
    tortoise = tortoise.next # 1 step
    hare = hare.next.next   # 2 steps
    if tortoise == hare
      meeting_point = tortoise
      return cycle_start_node(head, meeting_point)
    end
  end

  return nil
end

def cycle_start_node(head, tortoise)
  while head != tortoise
    tortoise = tortoise.next
    head = head.next
  end

  return tortoise
end

def array_to_linked_list(array)
  current = nil
  rev_start_val = nil
  rev_start_node = nil
  next_ = nil
  
  array.reverse_each.each_with_index do |e, rev_i|
    if rev_i == 0
      if e == nil
        rev_start_node = nil
      else
        rev_start_val = e
        rev_start_node = ListNode.new(e)
      end
      next_ = rev_start_node
    else
      if rev_start_node && e == rev_start_val
        current = rev_start_node
      else
        current = ListNode.new(e)
      end
      current.next = next_
      next_ = current
    end
  end

  return current
end

if __FILE__ == $0
  begin
    test_cases = [
      [1, [1, 2, 3, 4, 5, 6, 7, 8, 3], 3],
      [2, [1, 2, 3, 4, 5, 6, 7, 8, nil], nil],
      [3, [1, nil], nil]
    ]
    test_cases.each do |case_num, input, expected|
      head = array_to_linked_list(input)
      cycle_start_node = detectCycle(head)
      unless (result = cycle_start_node&.val) == expected
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
