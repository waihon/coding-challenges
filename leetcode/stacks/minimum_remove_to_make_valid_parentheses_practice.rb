# https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
# Given a string s of '(' , ')' and lowercase English characters.
# Your task is to remove the minimum number of parentheses ( '(' or ')',
# in any positions ) so that the resulting parentheses string is valid
# and return any valid string.
# Formally, a parentheses string is valid if and only if:
# - It is the empty string, contains only lowercase characters, or
# - It can be written as AB (A concatenated with B), where A and B are valid strings, or
# - It can be written as (A), where A is a valid string.


# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  sa = s.split("")
  parentheses = []

  sa.each_with_index do |char, idx|
    if char == "("
      parentheses.push(idx)
    elsif char == ")"
      if parentheses.length.zero?
          # This effectively remove the element from the final string
         sa[idx] = ""
      else
        parentheses.pop
      end
    else
      # skip a-z
    end
  end

  # Remove any unmatched parentheses
  parentheses.each do |i|
    sa[i] = ""
  end

  return sa.join
end

if __FILE__ == $0
  begin
    test_cases = [[1, "lee(t(c)o)de)", "lee(t(c)o)de"],
                  [2, "a)b(c)d", "ab(c)d"],
                  [3, "))((", ""]
                 ]
    test_cases.each do |case_num, input, expected|
      unless (result = min_remove_to_make_valid(input)) == expected 
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
