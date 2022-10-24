# https://leetcode.com/problems/implement-queue-using-stacks
# Implement a first in first out (FIFO) queue using only two stacks.
# The implemented queue should support all the functions of a normal
# queue (push, peek, pop, and empty).
class MyQueue
  def initialize
    @in_queue = []
    @out_queue = []
  end

  # @param {Any} element
  def push(element)
    in_queue.push(element)
  end

  # @return {Any}
  def peek
    transfer_in_to_out
    out_queue.last
  end

  # @return {Any}
  def pop
    transfer_in_to_out
    out_queue.pop
  end

  # @return {Boolean}
  def empty
    in_queue.empty? && out_queue.empty?
  end

  private

  attr_accessor :in_queue, :out_queue

  def transfer_in_to_out
    return unless out_queue.empty?

    while in_queue.length > 0  
      element = in_queue.pop
      out_queue.push(element)
    end
  end
end

if __FILE__ == $0
  queue = MyQueue.new
  queue.push(1)
  queue.push(2)
  puts queue.peek
  puts queue.pop
  puts queue.empty
  puts queue.pop
  puts queue.empty
end
