# https://leetcode.com/problems/valid-parentheses/
# Given a string s containing just the characters '(', ')', '{', '}',
# '[' and ']', determine if the input string is valid.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  parentheses_hash = { "(" => ")", "{" => "}",  "[" => "]" }
  parentheses_stack = [] 

  s.split("").each do |parenthesis|
    if parentheses_hash[parenthesis]
      parentheses_stack.push(parenthesis)
    else
      opening_parenthesis = parentheses_stack.pop
      correct_parenthesis = parentheses_hash[opening_parenthesis]
      if parenthesis != correct_parenthesis
        return false
      end
    end
  end

  return parentheses_stack.length.zero?
end

if __FILE__ == $0
  begin
    test_cases = [[1, "{([])}", true],
                  [2, "{[]()}", true],
                  [3, "{([])]", false],
                  [4, "{([)]}", false],
                  [5, "{([]", false]
                 ]
    test_cases.each do |case_num, input, expected|
      unless (result = is_valid(input)) == expected 
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
