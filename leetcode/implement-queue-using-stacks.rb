# https://leetcode.com/problems/implement-queue-using-stacks
# Implement a first in first out (FIFO) queue using only two stacks.
# The implemented queue should support all the functions of a normal
# queue (push, peek, pop, and empty).
class MyQueue
  def initialize()
    @stack1 = []
    @stack2 = []
  end

  # @param {Integer}
  # @return {Void}
  def push(x)
    @stack1.push(x)    
  end


  # @return {Integer}
  def pop()
    transfer

    @stack2.pop
  end


  # @return {Integer}
  def peek()
    transfer

    @stack2[-1]
  end


  # @return {Boolean}
  def empty()
    @stack1.size.zero? && @stack2.size.zero?    
  end

  private
  
  def transfer
    if @stack2.size.zero?
      for i in 0..(@stack1.length - 1)
        item = @stack1.pop
        @stack2.push(item)
      end
    end
  end
end
