# https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
# Given the head of the first level of the list, flatten
# the list so that all the nodes appear in a single-level,
# doubly linked list. 

# Definition for a Node.
class Node
  attr_accessor :val, :prev, :next, :child
  def initialize(val=nil, prev=nil, next_=nil, child=nil)
    @val = val
    @prev = prev
    @next = next_
    @child = child
  end
end

# @param {Node} root
# @return {Node}
def flatten(root)
  current = root

  while current
   if current.child
     tail = find_tail(current.child)
     tail.next = current.next
     tail.next.prev = tail if tail.next
     current.next = current.child
     current.next.prev = current
     current.child = nil
    end
    current = current.next
  end

  return root
end

# @param {Node} head
# @return {Node}
def find_tail(head)
  current = head
  prev = nil
  while current
    prev = current
    current = current.next
  end
  return prev
end

# @param {Node} head
# @return {Integer[]}
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

def test_case_01
  one =      Node.new( 1, nil, nil, nil); two =      Node.new( 2, nil, nil, nil)
  three =    Node.new( 3, nil, nil, nil); four =     Node.new( 4, nil, nil, nil)
  five =     Node.new( 5, nil, nil, nil); six =      Node.new( 6, nil, nil, nil)
  seven =    Node.new( 7, nil, nil, nil); eight =    Node.new( 8, nil, nil, nil)
  nine =     Node.new( 9, nil, nil, nil); ten =      Node.new(10, nil, nil, nil)
  eleven =   Node.new(11, nil, nil, nil); twelve =   Node.new(12, nil, nil, nil)
  thirteen = Node.new(13, nil, nil, nil)

  one.next = two; one.next.prev = one
  two.next = three; two.next.prev = two; two.child = seven
  three.next = four; three.next.prev = three
  four.next = five; four.next.prev = four
  five.next = six; five.next.prev = five; five.child = twelve
  six.next = nil
  seven.next = eight; seven.next.prev = seven
  eight.next = nine; eight.next.prev = eight; eight.child = ten
  nine.next = nil
  ten.next = eleven; ten.next.prev = ten
  eleven.next = nil
  twelve.next = thirteen; twelve.next.prev = twelve
  thirteen.next = nil

  return one
end

def test_case_02
  one =   Node.new( 1, nil, nil, nil); two =  Node.new( 2, nil, nil, nil)
  three = Node.new( 3, nil, nil, nil); four = Node.new( 4, nil, nil, nil)
  five =  Node.new( 5, nil, nil, nil)

  one.next = two; one.next.prev = one
  two.next = three; two.next.prev = two
  three.next = nil; three.child = four
  four.next = five; four.next.prev = four
  five.next = nil

  return one
end

def test_case_03
  one =   Node.new( 1, nil, nil, nil); two =  Node.new( 2, nil, nil, nil)
  three = Node.new( 3, nil, nil, nil); four = Node.new( 4, nil, nil, nil)

  one.next = nil; one.child = two
  two.next = three; two.next.prev = two
  three.next = four; three.next.prev = three
  four.next = nil

  return one
end

if __FILE__ == $0
  begin
    test_cases = [
      [1, test_case_01, [1, 2, 7, 8, 10, 11, 9, 3, 4, 5, 12, 13, 6]],
      [2, test_case_02, [1, 2, 3, 4, 5]],
      [3, test_case_03, [1, 2, 3, 4]]
    ]
    test_cases.each do |case_num, input, expected|
      result = linked_list_to_array(flatten(input))
      p result
      unless result == expected
        puts "Test Case: #{case_num}, Actual Result: #{result}, Expected: #{expected}"
        raise RuntimeError
      end
    end
  rescue RuntimeError => e
    puts e.message + ": " + e.backtrace.inspect
  else
    puts "All test cases passed!"
  end
end
