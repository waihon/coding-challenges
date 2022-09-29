# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#     @val = val
#     @next = _next
#   end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def list_node_count(first_node)
  node = first_node
  count = 0
  while node
    count += 1
    node = node.next
  end
  return count
end

def longer_shorter_list(l1, l2)
  count1 = list_node_count(l1)
  count2 = list_node_count(l2)
  
  if count1 >= count2
    return l1, l2
  else
    return l2, l1
  end
end

def add_two_numbers(l1, l2)
  longer_list, shorter_list = longer_shorter_list(l1, l2)

  longer_list_node = longer_list
  shorter_list_node = shorter_list
  results_list = nil
  carry = 0
  
  while longer_list_node
    num1 = longer_list_node.val
    num2 = shorter_list_node ? shorter_list_node.val : 0
    sum = num1 + num2 + carry
    if sum < 10
      num3 = sum
      carry = 0
    else
      num3 = sum - 10
      carry = 1
    end
   
    new_results_node = ListNode.new(num3)
    
    if not results_list
      results_list = current_results_node = new_results_node
    else
      current_results_node.next = new_results_node
      current_results_node = new_results_node
    end

    longer_list_node = longer_list_node.next
    shorter_list_node = shorter_list_node&.next
  end
  
  if carry > 0
    new_results_node = ListNode.new(carry)

    if not results_list
      results_list = current_results_node = new_results_node
    else
      current_results_node.next = new_results_node
      current_results_node = new_results_node
    end
  end       

  return results_list
end
