# https://leetcode.com/problems/implement-queue-using-stacks
# Implement a first in first out (FIFO) queue using only two stacks.
# The implemented queue should support all the functions of a normal
# queue (push, peek, pop, and empty).
class MyQueue
  def initialize()
    @in_stack = []
    @out_stack = []
  end

  # @param {Integer}
  # @return {Void}
  def push(x)
    in_stack.push(x)    
  end


  # @return {Integer}
  def pop()
    move_in_to_out

    out_stack.pop
  end


  # @return {Integer}
  def peek()
    move_in_to_out 

    out_stack[-1] # short hand for out_stack[out_stack.length - 1]
  end


  # @return {Boolean}
  def empty()
    in_stack.size.zero? && out_stack.size.zero?    
  end

  private
  
  attr_accessor :in_stack, :out_stack
  
  def move_in_to_out 
    if out_stack.size.zero?
      for i in 0..(in_stack.length - 1)
        item = in_stack.pop
        out_stack.push(item)
      end
    end
  end
end
